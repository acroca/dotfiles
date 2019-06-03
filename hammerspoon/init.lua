hs.window.animationDuration = 0

local push = function(x, y, w, h)
  return function()
    local win = hs.window.focusedWindow()
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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", push(0, 0, 0.5, 1))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", push(0, 0, 1, 0.5))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", push(0.5, 0, 0.5, 1))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", push(0, 0.5, 1, 0.5))

-- Shift to use corners, weird but I like it
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", push(0, 0, 0.5, 0.5))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "up", push(0.5, 0, 0.5, 0.5))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", push(0.5, 0.5, 0.5, 0.5))
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "down", push(0, 0.5, 0.5, 0.5))

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", push(0, 0, 1, 1))
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", push(0.1, 0.1, 0.8, 0.8))


hs.hotkey.bind({"cmd"}, "1", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)
hs.hotkey.bind({"cmd"}, "2", function()
  hs.application.launchOrFocus("Terminal")
end)
hs.hotkey.bind({"cmd"}, "3", function()
  hs.application.launchOrFocus("Google Chrome")
end)
hs.hotkey.bind({"cmd"}, "4", function()
  if hs.application.frontmostApplication():title() == "Slack" then
    hs.application.launchOrFocus("WhatsApp")
  else
    hs.application.launchOrFocus("Slack")
  end
end)
