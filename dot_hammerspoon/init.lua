hs.window.animationDuration = 0

local ends_with = function(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

local pushWindow = function(win, x, y, w, h)
  return function()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w * x)
    f.y = max.y + (max.h * y)
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f)
  end
end

local push = function(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    pushWindow(win, x, y, w, h)()
  end
end

local pushAll = function(app, x, y, w, h)
  local windows = hs.application.get(app):allWindows()
  for key, win in pairs(windows) do
    pushWindow(win, x,y,w,h)()
  end
end

local normalLayout = function()
  if hs.screen.mainScreen():currentMode()["w"] < 2000 then
    -- Laptop screen
    pushAll("Code", 0, 0, 1, 1)
    pushAll("Terminal", 0, 0, 1, 1)
    pushAll("Firefox", 0, 0, 1, 1)
    pushAll("Slack", 0, 0, 1, 1)
    pushAll("WhatsApp", 0, 0, 1, 1)
    pushAll("Notion", 0, 0, 1, 1)
  else
    -- Wide screen
    pushAll("Code", 0, 0, 0.7, 1)
    pushAll("Terminal", 0.7, 0, 0.3, 1)
    pushAll("Firefox", 0, 0, 0.5, 1)
    pushAll("Slack", 0.5, 0, 0.5, 1)
    pushAll("WhatsApp", 0.5, 0, 0.5, 1)
    pushAll("Notion", 0.5, 0.1, 0.5, 0.8)
  end
end

local callLayout = function()
  if hs.screen.mainScreen():currentMode()["w"] < 2000 then
    pushAll("Google Meet", 0, 0, 1, 0.4)
    pushAll("Code", 0, 0.4, 1, 0.6)
    pushAll("Terminal", 0, 0.4, 1, 0.6)
    pushAll("Firefox", 0, 0.4, 1, 0.6)
    pushAll("Slack", 0, 0.4, 1, 0.6)
    pushAll("WhatsApp", 0, 0.4, 1, 0.6)
    pushAll("Notion", 0, 0.4, 1, 0.6)
  else
    -- Wide screen
    pushAll("Google Meet", 0, 0, 0.5, 0.4)
    pushAll("Code", 0, 0.4, 0.5, 0.6)
    pushAll("Terminal", 0.5, 0, 0.5, 1)
    pushAll("Firefox", 0, 0.4, 0.5, 0.6)
    pushAll("Slack", 0.5, 0, 0.5, 1)
    pushAll("WhatsApp", 0.5, 0, 0.5, 1)
    pushAll("Notion", 0.5, 0.1, 0.5, 0.8)
  end
end

hs.hotkey.bind({"alt", "ctrl"}, "left", push(0, 0, 0.5, 1))
hs.hotkey.bind({"alt", "ctrl", "cmd"}, "left", push(0, 0, 0.7, 1))
hs.hotkey.bind({"alt", "ctrl"}, "up", push(0, 0, 1, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "right", push(0.5, 0, 0.5, 1))
hs.hotkey.bind({"alt", "ctrl", "cmd"}, "right", push(0.7, 0, 0.3, 1))
hs.hotkey.bind({"alt", "ctrl"}, "down", push(0, 0.5, 1, 0.5))

hs.hotkey.bind({"alt", "ctrl"}, "u", push(0, 0, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "i", push(0.5, 0, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "k", push(0.5, 0.5, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "j", push(0, 0.5, 0.5, 0.5))

hs.hotkey.bind({"alt", "ctrl", "cmd"}, "m", normalLayout)
hs.hotkey.bind({"alt", "ctrl", "cmd"}, "n", callLayout)

-- Fullscreen
hs.hotkey.bind({"alt", "ctrl"}, "m", push(0, 0, 1, 1))
-- Center of the screen with border both ways
hs.hotkey.bind({"alt", "ctrl"}, "n", push(0.2, 0.1, 0.6, 0.8))
-- Center of the screen, full height
hs.hotkey.bind({"alt", "ctrl", "shift"}, "n", push(0.2, 0, 0.6, 1))
-- Bottom left corner, good size for sized-screenshare (in the external screen)
hs.hotkey.bind({"alt", "ctrl"}, "p", push(0, 0.3, 0.5, 0.7))


hs.hotkey.bind({"cmd"}, "e", function()
  if hs.application.frontmostApplication():title() == "Notion" then
    hs.application.frontmostApplication():hide()
  else
    hs.application.launchOrFocus("Notion")
  end
end)
hs.hotkey.bind({"cmd"}, "1", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)
hs.hotkey.bind({"cmd"}, "2", function()
  hs.application.launchOrFocus("Terminal")
end)
hs.hotkey.bind({"cmd"}, "3", function()
  hs.application.launchOrFocus("Firefox")
end)
hs.hotkey.bind({"cmd"}, "4", function()
  if hs.application.frontmostApplication():title() == "Slack" then
    hs.application.launchOrFocus("WhatsApp")
  else
    hs.application.launchOrFocus("Slack")
  end
end)
