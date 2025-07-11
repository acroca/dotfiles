hs.window.animationDuration = 0

local pushWindow = function(win, x, y, w, h)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * x)
  f.y = max.y + (max.h * y)
  f.w = max.w * w
  f.h = max.h * h
  win:setFrame(f)

  -- Hack: https://github.com/Hammerspoon/hammerspoon/issues/3224#issuecomment-1294359070
  local axApp = hs.axuielement.applicationElement(win:application())
  local wasEnhanced = axApp.AXEnhancedUserInterface
  if wasEnhanced then
    axApp.AXEnhancedUserInterface = false
  end
  win:setFrame(f) -- or win:moveToScreen(someScreen), etc.
  if wasEnhanced then
    axApp.AXEnhancedUserInterface = true
  end
end

local push = function(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
    pushWindow(win, x, y, w, h)
  end
end

local pushAll = function(app, x, y, w, h)
  local windows = hs.application.get(app):allWindows()
  for key, win in pairs(windows) do
    pushWindow(win, x,y,w,h)
  end
end

local normalLayout = function()
  if hs.screen.mainScreen():currentMode()["w"] < 2000 then
    -- TODO: Laptop screen
  else
    pushAll("Cursor", 1/3, 0, 2/3, 1)
    pushAll("Firefox", 1/3, 0, 2/3, 1)
    pushAll("Slack", 1/3, 0, 2/3, 1)
    pushAll("iTerm", 0, 0, 1/3, 1)
    pushAll("Obsidian", 3/10, 2/10, 4/10, 6/10)
  end
end

local callLayout = function()
  if hs.screen.mainScreen():currentMode()["w"] < 2000 then
    -- TODO: Laptop screen
  else
    pushAll("Cursor", 2/10, 0, 7/10, 1)
    pushAll("Firefox", 2/10, 0, 7/10, 1)
    pushAll("Slack", 2/10, 0, 7/10, 1)
    pushAll("iTerm", 0, 0, 2/10, 1)
    pushAll("Obsidian", 3/10, 2/10, 4/10, 6/10)
    pushAll("Google Meet", 9/10, 0, 1/10, 1/2)
  end
end

hs.hotkey.bind({"alt", "ctrl"}, "return", push(0, 0, 1, 1))
hs.hotkey.bind({"alt", "ctrl"}, "left", push(0, 0, 1/2, 1))
hs.hotkey.bind({"alt", "ctrl"}, "right", push(1/2, 0, 1/2, 1))
hs.hotkey.bind({"alt", "ctrl"}, "up", push(0, 0, 1, 1/2))
hs.hotkey.bind({"alt", "ctrl"}, "down", push(0, 1/2, 1, 1/2))

hs.hotkey.bind({"alt", "ctrl"}, "t", push(1/3, 0, 2/3, 1))
hs.hotkey.bind({"alt", "ctrl"}, "e", push(0, 0, 2/3, 1))

hs.hotkey.bind({"alt", "ctrl"}, "d", push(0, 0, 1/3, 1))
hs.hotkey.bind({"alt", "ctrl"}, "f", push(1/3, 0, 1/3, 1))
hs.hotkey.bind({"alt", "ctrl"}, "g", push(2/3, 0, 1/3, 1))

hs.hotkey.bind({"alt", "ctrl"}, "m", normalLayout)
hs.hotkey.bind({"alt", "ctrl"}, "n", callLayout)

hs.hotkey.bind({"cmd"}, "e", function()
  if hs.application.frontmostApplication():title() == "Obsidian" then
    hs.application.frontmostApplication():hide()
  else
    hs.application.launchOrFocus("Obsidian")
  end
end)
hs.hotkey.bind({"cmd"}, "1", function()
  hs.application.launchOrFocus("Cursor")
end)
hs.hotkey.bind({"cmd"}, "2", function()
  hs.application.launchOrFocus("iTerm")
end)
hs.hotkey.bind({"cmd"}, "3", function()
  hs.application.launchOrFocus("Firefox")
end)
hs.hotkey.bind({"cmd"}, "4", function()
  if hs.application.frontmostApplication():title() == "Slack" then
    hs.application.launchOrFocus("Discord")
  else
    hs.application.launchOrFocus("Slack")
  end
end)
