--== Global Configuration ==--
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.grid.GRIDWIDTH  = 1
hs.grid.GRIDHEIGHT = 1

hs.window.animationDuration = 0


--== Mashing ==--
local mashWin = { 'ctrl', 'alt' }
local mashApp = { 'ctrl',  'alt',  'cmd' }


--== Applications ==--
local function launchOrFocus(app)
  return hs.application.launchOrFocus(app)
end

hs.hotkey.bind(mashApp, 'i', function () launchOrFocus('iTerm') end)
hs.hotkey.bind(mashApp, 'f', function () launchOrFocus('FirefoxDeveloperEdition') end)
hs.hotkey.bind(mashApp, 'r', function () hs.reload() end)


--== Windowing ==--
hs.hotkey.bind(mashApp, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mashApp, 'l', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(mashApp, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mashApp, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(mashApp, 'd', function() hs.window.focusedWindow():close() end)


--== Multi-monitor ==--
hs.hotkey.bind(mashWin, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mashWin, 'P', hs.grid.pushWindowPrevScreen)


--== Grid snapping ==--
local function snapFocusedWindow(layout)
  hs.grid.set(hs.window.focusedWindow(), layout, hs.screen.mainScreen())
end

hs.hotkey.bind(mashWin, 'h', function() snapFocusedWindow(hs.layout.left50) end)
hs.hotkey.bind(mashWin, 'l', function() snapFocusedWindow(hs.layout.right50) end)
hs.hotkey.bind(mashWin, 'k', function() snapFocusedWindow(hs.layout.maximized) end)


--== Hints ==--
hs.hotkey.bind(mashWin, '.', hs.hints.windowHints)


--== Welcome ==--
hs.alert.show('Hammerspoon, at your service.')
