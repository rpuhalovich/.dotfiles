hs.loadSpoon("SpoonInstall")
hs.loadSpoon("ReloadConfiguration")

hs.console.darkMode(true)
spoon.ReloadConfiguration:start()

wfTerminal = hs.window.filter.new{'Terminal', 'iTerm2'}
wfTerminal:subscribe(hs.window.filter.windowCreated, function(window, applicationName)
  if applicationName == "iTerm2" then
    window:maximize()
  end
end)

hs.hotkey.bind({"cmd"}, "return", function()
  hs.application.launchOrFocus("iTerm")
end)
