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

hs.hotkey.bind({"alt", "ctrl"}, "left", push(0, 0, 0.5, 1))
hs.hotkey.bind({"alt", "ctrl"}, "up", push(0, 0, 1, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "right", push(0.5, 0, 0.5, 1))
hs.hotkey.bind({"alt", "ctrl"}, "down", push(0, 0.5, 1, 0.5))

hs.hotkey.bind({"alt", "ctrl"}, "u", push(0, 0, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "i", push(0.5, 0, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "k", push(0.5, 0.5, 0.5, 0.5))
hs.hotkey.bind({"alt", "ctrl"}, "j", push(0, 0.5, 0.5, 0.5))

hs.hotkey.bind({"alt", "ctrl"}, "m", push(0, 0, 1, 1))
hs.hotkey.bind({"alt", "ctrl"}, "n", push(0.2, 0.1, 0.6, 0.8))


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

