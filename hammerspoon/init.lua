hs.window.animationDuration = 0
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w/2
  f.h = max.h
  win:setFrame(f)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x+(max.w/2)
  f.y = max.y
  f.w = max.w/2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h/2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y+(max.h/2)
  f.w = max.w
  f.h = max.h/2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "n", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.1)
  f.y = max.y + (max.h * 0.1)
  f.w = max.w * 0.8
  f.h = max.h * 0.8
  win:setFrame(f)
end)

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
  if hs.application.frontmostApplication():title() == "WhatsApp" then
    hs.application.launchOrFocus("Slack")
  else
    hs.application.launchOrFocus("WhatsApp")
  end
end)
