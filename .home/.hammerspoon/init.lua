-- maximize on new window
local wfTerminal = hs.window.filter.new()
wfTerminal:subscribe(hs.window.filter.windowCreated, function(window, applicationName)
  for _,a in pairs({"Finder", "Preview", "Alacritty", "MacVim"}) do
    if a == applicationName then window:maximize() end
  end
end)

-- paste as keystrokes
hs.hotkey.bind({"cmd", "shift"}, "v", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- app shortcuts
hs.hotkey.bind({"cmd"}, "1", function() hs.application.launchOrFocus("Firefox") end)
hs.hotkey.bind({"cmd"}, "2", function() hs.application.launchOrFocus("Firefox Developer Edition") end)
hs.hotkey.bind({"cmd"}, "3", function() hs.application.launchOrFocus("MacVim") end)
hs.hotkey.bind({"cmd"}, "4", function() hs.application.launchOrFocus("Xcode") end)
