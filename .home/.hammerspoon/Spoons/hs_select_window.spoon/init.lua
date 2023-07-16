local obj = {}
obj.__index = obj

obj.name = "selectWindow"
obj.rowsToDisplay = 14

theWindows = hs.window.filter.new()
theWindows:setDefaultFilter{}
theWindows:setSortOrder(hs.window.filter.sortByFocusedLast)
obj.currentWindows = {}
obj.previousSelection = nil

for i,v in ipairs(theWindows:getWindows()) do
   table.insert(obj.currentWindows, v)
end

function obj:find_window_by_title(t)
   -- find a window by title.
   for i,v in ipairs(obj.currentWindows) do
      if string.find(v:title(), t) then
         return v
      end
   end
   return nil
end

function obj:focus_by_title(t)
   -- focus the window with given title
   if not t then
      hs.alert.show("No string provided to focus_by_title")
      return nil
   end
   w = obj:find_window_by_title(t)
   if w then
      w:focus()
      w:unminimize()
   end
   return w
end

function obj:focus_by_app(appName)
   for i,v in ipairs(obj.currentWindows) do
      if string.find(v:application():name(), appName) then
         v:focus()
         v:unminimize()
         return v
      end
   end
   return nil
end

-- the hammerspoon tracking of windows seems to be broken
-- we do it ourselves

local function callback_window_created(w, appName, event)
   if event == "windowDestroyed" then
      for i,v in ipairs(obj.currentWindows) do
         if v == w then
            table.remove(obj.currentWindows, i)
            return
         end
      end
      return
   end
   if event == "windowCreated" then
      table.insert(obj.currentWindows, 1, w)
      return
   end
   if event == "windowFocused" then
      callback_window_created(w, appName, "windowDestroyed")
      callback_window_created(w, appName, "windowCreated")
   end
end

theWindows:subscribe(hs.window.filter.windowCreated, callback_window_created)
theWindows:subscribe(hs.window.filter.windowDestroyed, callback_window_created)
theWindows:subscribe(hs.window.filter.windowFocused, callback_window_created)

function obj:count_app_windows(currentApp)
   local count = 0
   for i,w in ipairs(obj.currentWindows) do
      local app = w:application()
      if  (app == currentApp) then
          count = count + 1
      end
   end
   return count
end

function obj:list_window_choices(onlyCurrentApp, currentWin)
   local windowChoices = {}
   local currentApp = currentWin:application()
   for i,w in ipairs(obj.currentWindows) do
      if w ~= currentWin then
         local app = w:application()
         local appImage = nil
         local appName  = '(none)'
         if app then
            appName = app:name()
            appImage = hs.image.imageFromAppBundle(w:application():bundleID())
         end
         if (not onlyCurrentApp) or (app == currentApp) then
            table.insert(windowChoices, {
               text = "[" .. appName .. "] " .. w:title(),
               -- text = w:title(),
               -- subText = appName,
               uuid = i,
               image = appImage,
               win = w
            })
         end
      end
   end
   return windowChoices;
end

function obj:windowActivate(w)
  if w then
    w:focus()
    w:unminimize()
    w:application():activate()
  else
    hs.alert.show("unable fo focus " .. name)
  end
end

function obj:selectWindow(onlyCurrentApp, moveToCurrent)
   local currentWin = hs.window.focusedWindow()

   local windowChooser = hs.chooser.new(function(choice)
       local v = choice["win"]
       if v then
         print(v)
         if moveToCurrent then
           hs.alert.show("move to current")
           if v:isFullScreen() then
             v:toggleFullScreen()
           end
           hs.spaces.moveWindowToSpace(v,
                hs.spaces.activeSpaceOnScreen(hs.screen.mainScreen())
           )
           v:moveToScreen(mainScreen)
         end
         v:focus()
         v:unminimize()
         v:application():activate()
       end
   end)

   -- check if we have other windows
   if onlyCurrentApp then
      local nWindows = obj:count_app_windows(currentWin:application())
      if nWindows == 0 then
         hs.alert.show("no other window for this application ")
         return
      end
   end
   if #obj.currentWindows == 0 then
      hs.alert.show("no other window available ")
      return
   end

   -- show it, so we start catching keyboard events
   windowChooser:show()

   -- then fill fill it and let it do its thing
   local windowChoices = obj:list_window_choices(onlyCurrentApp, currentWin)
   windowChooser:choices(windowChoices)
   windowChooser:rows(obj.rowsToDisplay)
   windowChooser:query(nil)
end

function obj:previousWindow()
   return obj.currentWindows[2]
end

function obj:choosePreviousWindow()
  if obj.currentWindows[2] then
    obj.currentWindows[2]:focus()
    obj.currentWindows[2]:unminimize()
  end
end

function obj:bindHotkeys(mapping)
   local def = {
      all_windows         = function() self:selectWindow(false,false) end,
      all_windows_current = function() self:selectWindow(false,true) end,
      app_windows         = function() self:selectWindow(true, false) end
   }
   hs.spoons.bindHotkeysToSpec(def, mapping)
end

return obj
