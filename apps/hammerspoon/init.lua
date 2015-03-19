--== Global Configuration ==--
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.grid.GRIDWIDTH  = 1
hs.grid.GRIDHEIGHT = 1

hs.window.animationDuration = 0


--== mash ==--
local mash = { 'ctrl', 'alt' }

--== Applications ==--
local function launchOrFocus(app)
  return hs.application.launchOrFocus(app)
end

hs.hotkey.bind(mash, 'i', function () launchOrFocus('iTerm') end)
hs.hotkey.bind(mash, 'f', function () launchOrFocus('FirefoxDeveloperEdition') end)

hs.hotkey.bind(mash, 'r', function () hs.reload() end)
hs.hotkey.bind(mash, 'd', function() hs.window.focusedWindow():close() end)


--== Multi-monitor ==--
hs.hotkey.bind(mash, 'left',  hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'right', hs.grid.pushWindowPrevScreen)


--== Grid snapping ==--
local function snapFocusedWindow(layout)
  hs.grid.set(hs.window.focusedWindow(), layout, hs.screen.mainScreen())
end

hs.hotkey.bind(mash, 'h',  function() snapFocusedWindow(hs.layout.left50) end)
hs.hotkey.bind(mash, 'l', function() snapFocusedWindow(hs.layout.right50) end)
hs.hotkey.bind(mash, 'k',    function() snapFocusedWindow(hs.layout.maximized) end)


--== Hints ==--
hs.hotkey.bind(mash, ';', hs.hints.windowHints)


--== Welcome ==--
hs.alert.show('Hammerspoon, at your service.')
