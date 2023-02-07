hs.loadSpoon("SpoonInstall")
hs.loadSpoon("ReloadConfiguration")
hs.console.darkMode(true)
spoon.ReloadConfiguration:start()

-- edit this config file
hs.hotkey.bind({"cmd", "ctrl", "option"}, "h", function()
  hs.execute("/opt/homebrew/bin/code /Users/rp/.dotfiles/.home/.hammerspoon/init.lua")
end)

-- maximize on new window
local wfTerminal = hs.window.filter.new()
wfTerminal:subscribe(hs.window.filter.windowCreated, function(window, applicationName)
  if
    applicationName == "Preview" or
    applicationName == "iTerm2" or
    applicationName == "Finder" or
    applicationName == "Notion"
  then
    window:maximize()
  end

  -- if opening image or vid in messenger maximize immediately
  if applicationName == "Messenger" then
    local appcount = 0
    for i, win in ipairs(hs.window.allWindows()) do
      if win:application():title() == "Messenger" then appcount = appcount + 1 end
    end
    local time = 2
    if appcount > 1 then time = 0 end
    hs.timer.doAfter(time, function() window:maximize() end)
  end
end)

-- put the system to sleep
hs.hotkey.bind({"cmd"}, "escape", function() hs.caffeinate.systemSleep() end)

-- caps and escape swap
hs.hotkey.bind({"shift"}, "escape", function() hs.hid.capslock.toggle() end)

-- maximize all windows
hs.hotkey.bind({"cmd", "ctrl", "option"}, "up", function()
  windows = hs.window.allWindows()
  for i, window in ipairs(windows) do window:maximize() end
end)

-- app shortcuts
launch = hs.application.launchOrFocus
hs.hotkey.bind({"cmd"}, "1", function() launch("Finder") end)
hs.hotkey.bind({"cmd"}, "2", function() launch("Firefox Developer Edition") end)
hs.hotkey.bind({"cmd"}, "3", function() launch("iTerm") end)
hs.hotkey.bind({"cmd"}, "4", function() launch("Visual Studio Code") end)
