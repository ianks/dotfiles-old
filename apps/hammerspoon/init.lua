--== Global Configuration ==--
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.grid.GRIDWIDTH  = 1
hs.grid.GRIDHEIGHT = 1

hs.window.animationDuration = 0


--== Applications ==--
local function launchOrFocus(app)
  return hs.application.launchOrFocus(app)
end

k = hs.hotkey.modal.new({"ctrl"}, "space")

k:bind({}, 'i', function() launchOrFocus('iTerm') end, function() k:exit() end)
k:bind({}, 'f', function() launchOrFocus('FirefoxDeveloperEdition') end, function() k:exit() end)

k:bind({}, 'r', function() hs.reload() end, function() k:exit() end)
k:bind({}, 'd', function() hs.window.focusedWindow():close() end, function() k:exit() end)


--== Multi-monitor ==--
k:bind({}, 'left', function() hs.grid.pushWindowNextScreen() end, function() k:exit() end)
k:bind({}, 'right', function() hs.grid.pushWindowPrevScreen() end, function() k:exit() end)


--== Grid snapping ==--
local function snapFocusedWindow(layout)
  hs.grid.set(hs.window.focusedWindow(), layout, hs.screen.mainScreen())
end

k:bind({}, 'h', function() snapFocusedWindow(hs.layout.left50) end, function() k:exit() end)
k:bind({}, 'l', function() snapFocusedWindow(hs.layout.right50) end, function() k:exit() end)
k:bind({}, 'k', function() snapFocusedWindow(hs.layout.maximized) end, function() k:exit() end)


--== Hints ==--
-- k:bind({}, ';', function() hs.hints.windowHints() end, function() k:exit() end)


--== Welcome ==--
hs.alert.show('Hammerspoon, at your service.')
