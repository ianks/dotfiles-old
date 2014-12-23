-- Extensions
local application = require "mjolnir.application"
local window = require "mjolnir.window"
local hotkey = require "mjolnir.hotkey"
local keycodes = require "mjolnir.keycodes"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local screen = require "mjolnir.screen"

-- User packages
local grid = require "mjolnir.bg.grid"
local hints = require "mjolnir.th.hints"
local appfinder = require "mjolnir.cmsj.appfinder"

local definitions = {}
local hyper = {}
auxWin = nil

local grab_closest_window = function()
  local windows = window.visiblewindows()

  if windows then
    return true
    -- return window.application(windows[1])
  else
    alert.show("Clean as a whistle.")
    return false
  end
end

local maximize_window = function()
  return function()
    local win = window.focusedwindow()

    if win then
      save_focus()
      window.maximize(win)
    else
      focus_saved()
    end
  end
end

local focusify = function()
  return function()
    local win = window.focusedwindow()

    if win then
      save_focus()
      window.minimize(win)
    else
      focus_saved()
    end
  end
end

local gridset = function(frame)
  return function()
    local win = window.focusedwindow()

    if win then
      grid.set(win, frame, win:screen())
    else
      alert.show("No focused window.")
    end
  end
end

function save_focus()
  auxWin = window.focusedwindow()
end

function focus_saved()
  if auxWin then
    if window.focusedwindow() == auxWin then
      auxWin:minimize()
    else
      if auxWin:isminimized() then
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
  local scrs = screen:allscreens()
  local scr = scrs[place[1]]
  grid.set(win, place[2], scr)
end

function apply_layout(layout)
  return function()
    for app_name, place in pairs(layout) do
      local app = appfinder.app_from_name(app_name)
      if app then
        for i, win in ipairs(app:allwindows()) do
          apply_place(win, place)
        end
      end
    end
  end
end

function init()
  create_hotkeys()
  keycodes.inputsourcechanged(rebind_hotkeys)
  alert.show("Mjolnir, at your service.")
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
  a = save_focus,
  [";"] = focus_saved,

  h = gridset(goleft),
  j = focusify(),
  k = gridset(gobig),
  l = gridset(goright),

  g = apply_layout(layout2),

  d = grid.pushwindow_nextscreen,
  r = mjolnir.reload,
  q = function() appfinder.app_from_name("Mjolnir"):kill() end,
  i = function() hints.appHints(window.focusedwindow():application()) end,

  e = hints.windowHints
}

mapped_apps = {
  { key = "c", name = "Google Chrome" },
  { key = "i", name = "iTerm" },
  { key = "d", name = "Dash" }
}

-- Launch our apps.
fnutils.each(mapped_apps, function(object)
  application.launchorfocus(object.name)
end)

-- Give us an app attr to use.
fnutils.each(mapped_apps, function(object)
  object.app = appfinder.app_from_name(object.name)
end)

-- Hide the apps.
fnutils.each(mapped_apps, function(object)
  object.app:hide()
end)

-- Map keys for opening/closing.
fnutils.each(mapped_apps, function(object)
    -- This is buggy because I cannot check if an application is currently
    -- running. application.runningapplications() induces a bug in Firefox.
    definitions[object.key] = function()
      if object.app:ishidden() then
        application.launchorfocus(object.name)
      else
        object.app:hide()
      end
    end
end)

init()
