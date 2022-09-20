hs.loadSpoon("SpoonInstall")
hs.loadSpoon("ReloadConfiguration")

hs.console.darkMode(true)
spoon.ReloadConfiguration:start()

local wfTerminal = hs.window.filter.new()
wfTerminal:subscribe(hs.window.filter.windowCreated, function(window, applicationName)
  if applicationName == "iTerm2" or applicationName == "Preview" or applicationName == "Finder" then
    window:maximize()
  end
end)

hs.hotkey.bind({"cmd", "shift"}, "return", function()
  hs.application.launchOrFocus("iTerm")
end)
