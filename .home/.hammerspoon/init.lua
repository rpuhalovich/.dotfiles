hs.loadSpoon("SpoonInstall")
hs.loadSpoon("ReloadConfiguration")
hs.loadSpoon("hs_select_window")
hs.console.darkMode(true)
spoon.ReloadConfiguration:start()

-- edit this config file
hs.hotkey.bind({"cmd", "ctrl", "option"}, "h", function()
  hs.execute("/opt/homebrew/bin/code /Users/rp/.dotfiles/.home/.hammerspoon/init.lua")
end)

-- maximize on new window
local wfTerminal = hs.window.filter.new()
wfTerminal:subscribe(hs.window.filter.windowCreated, function(window, applicationName)
  local function hasValue (table, val)
    for index, value in ipairs(table) do
        if value == val then return true end
    end
    return false
  end

  local apps = {"Preview", "Alacritty", "Finder", "Notion", "Code"}
  if hasValue(apps, applicationName) then
    window:maximize()
  end
end)

-- caps enabling
hs.hotkey.bind({"cmd"}, "escape", function() hs.hid.capslock.toggle() end)

-- maximize all windows
hs.hotkey.bind({"cmd", "ctrl", "option"}, "up", function()
  windows = hs.window.allWindows()
  for i, window in ipairs(windows) do window:maximize() end
end)

-- app shortcuts
launch = hs.application.launchOrFocus
hs.hotkey.bind({"cmd"}, "1", function() launch("Firefox") end)
hs.hotkey.bind({"cmd"}, "2", function() launch("Firefox Developer Edition") end)
hs.hotkey.bind({"cmd"}, "3", function() launch("Alacritty") end)
hs.hotkey.bind({"cmd"}, "4", function() launch("Visual Studio Code") end)
hs.hotkey.bind({"cmd"}, "5", function() launch("Joplin") end)
hs.hotkey.bind({"cmd"}, "9", function() launch("1Password 7") end)
hs.hotkey.bind({"cmd"}, "0", function() launch("Bitwarden") end)

-- window switcher
-- local SWbindings = {
--   all_windows = {{"ctrl"}, "space"},
--   app_windows = {{"ctrl", "shift"}, "space"}
-- }
-- spoon.hs_select_window:bindHotkeys(SWbindings)
