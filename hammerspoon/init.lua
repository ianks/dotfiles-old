-- Extensions
local application = require "hs.application"
local window      = require "hs.window"
local hotkey      = require "hs.hotkey"
local keycodes    = require "hs.keycodes"
local fnutils     = require "hs.fnutils"
local alert       = require "hs.alert"
local screen      = require "hs.screen"
local hints       = require "hs.hints"
local grid        = require "hs.grid"
local appfinder   = require "hs.appfinder"

local definitions = {}
local hyper       = {}
auxWin            = nil

-- Minimize window, but save as focused
local focusify = function()
  return function()
    local win = window.focusedWindow()

    if win then
      saveFocus()
      window.minimize(win)
    else
      focusSaved()
    end
  end
end

local setGrid = function(frame)
  return function()
    local win = window.focusedWindow()

    if win then
      grid.set(win, frame, win:screen())
    else
      alert.show("No focused window.")
    end
  end
end

function saveFocus()
  auxWin = window.focusedWindow()
end

function focusSaved()
  if auxWin then
    if window.focusedWindow() == auxWin then
      auxWin:minimize()
    else
      if auxWin:isMinimized() then
        auxWin:unminimize()
      end

      auxWin:focus()
    end
  end
end

local hotkeys = {}

function create_hotkeys()
  for key, fun in pairs(definitions) do
    local mod = hyper
    if string.len(key) == 2 and string.sub(key,2,2) == "c" then
      mod = {"cmd"}
    end

    local hk = hotkey.new(mod, string.sub(key,1,1), fun)
    table.insert(hotkeys, hk)
    hk:enable()
  end
end

function rebind_hotkeys()
  for i, hk in ipairs(hotkeys) do
    hk:disable()
  end
  hotkeys = {}
  create_hotkeys()
  alert.show("Rebound hotkeys.")
end

function apply_place(win, place)
  local scrs = screen:allScreens()
  local scr = scrs[place[1]]
  grid.set(win, place[2], scr)
end

function apply_layout(layout)
  return function()
    for app_name, place in pairs(layout) do
      local app = appfinder.appFromName(app_name)
      if app then
        for i, win in ipairs(app:allWindows()) do
          apply_place(win, place)
        end
      end
    end
  end
end

function init()
  create_hotkeys()
  keycodes.inputSourceChanged(rebind_hotkeys)
  alert.show("Hammerspoon, at your service.")
end

-- Actual config =================================

hyper = { "cmd", "alt", "ctrl" }

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local gobig = {x = 0, y = 0, w = gw, h = gh}

definitions = {
  a = saveFocus,
  [";"] = focusSaved,

  h = setGrid(goleft),
  j = focusify(),
  k = setGrid(gobig),
  l = setGrid(goright),

  g = apply_layout(layout2),

  d = grid.pushWindowNextScreen,
  r = hs.reload,
  q = function() appfinder.appFromName("hs"):kill() end,
  e = hints.windowHints
}

mapped_apps = {
  { key = "c", name = "Google Chrome" },
  { key = "i", name = "iTerm" },
  { key = "d", name = "Dash" }
}

-- Launch our apps.
fnutils.each(mapped_apps, function(object)
  application.launchOrFocus(object.name)
end)

-- Give us an app attr to use.
fnutils.each(mapped_apps, function(object)
  object.app = appfinder.appFromName(object.name)
end)
--
-- Hide the apps.
fnutils.each(mapped_apps, function(object)
  object.app:hide()
end)

-- Map keys for opening/closing.
fnutils.each(mapped_apps, function(object)
    -- This is buggy because I cannot check if an application is currently
    -- running. application.runningapplications() induces a bug in Firefox.
    definitions[object.key] = function()
      if object.app:isHidden() then
        application.launchOrFocus(object.name)
      else
        object.app:hide()
      end
    end
end)

-- Auto-reload config
function reloadConfig(files) hs.reload() end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

init()
