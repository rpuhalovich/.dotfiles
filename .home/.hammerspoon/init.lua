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
    applicationName == "Messenger" or
    applicationName == "Preview" or
    applicationName == "iTerm2" or
    applicationName == "Finder" or
    applicationName == "Notion" then
    window:maximize()
  end
end)

-- toggle bluetooth
hs.hotkey.bind({"cmd", "ctrl", "option"}, "b", function()
  hs.execute("/opt/homebrew/bin/blueutil -p toggle")
end)

-- maximize all windows
hs.hotkey.bind({"cmd", "ctrl", "option"}, "up", function()
  windows = hs.window.allWindows()
  for i, window in ipairs(windows) do window:maximize() end
end)

-- app shortcuts
launch = hs.application.launchOrFocus
hs.hotkey.bind({"cmd"}, "1", function() launch("Finder") end)
hs.hotkey.bind({"cmd"}, "2", function() launch("Firefox") end)
hs.hotkey.bind({"cmd"}, "3", function() launch("Visual Studio Code") end)
hs.hotkey.bind({"cmd"}, "4", function() launch("iTerm") end)
hs.hotkey.bind({"cmd"}, "5", function() launch("Notion") end)
hs.hotkey.bind({"cmd"}, "0", function() launch("Spotify") end)
