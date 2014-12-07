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

local minimize_window = function()
  return function()
    local win = window.focusedwindow()

    if win then
      window.minimize(win)
      -- application.launchforfocus(grab_closest_window())
    else
      alert.show("No focused window.")
      return false
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

auxWin = nil
function save_focus()
  auxWin = window.focusedwindow()
  alert.show("Window '" .. auxWin:title() .. "' saved.")
end

function focus_saved()
  if auxWin then
    auxWin:focus()
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

local full_apps = {
  "Safari",
  "Xcode",
  "Google Chrome",
  "iTunes",
  "Emacs",
  "Dropbox",
  "Mailbox",
  "uTorrent",
  "VMware Fusion",
  "Firefox"
}

local layout2 = {
  Airmail = {1, gomiddle},
  Spotify = {1, gomiddle},
  Calendar = {1, gomiddle},
  Dash = {1, gomiddle},
  iTerm = {2, goright},
  MacRanger = {2, goleft},
}

fnutils.each(full_apps, function(app) layout2[app] = {1, gobig} end)

definitions = {
  [";"] = save_focus,
  a = focus_saved,

  h = gridset(goleft),
  j = minimize_window(),
  k = gridset(gobig),
  l = gridset(goright),

  m = minimize_window(),

  g = apply_layout(layout2),

  d = grid.pushwindow_nextscreen,
  r = mjolnir.reload,
  q = function() appfinder.app_from_name("Mjolnir"):kill() end,
  i = function() hints.appHints(window.focusedwindow():application()) end,

  e = hints.windowHints
}

-- launch and focus applications
fnutils.each({
  { key = "f", app = "FirefoxDeveloperEdition" },
  { key = "e", app = "Emacs" },
  { key = "i", app = "iTerm" },
  { key = "m", app = "Mjolnir" },
  { key = "d", app = "Dash" },
}, function(object)
    definitions[object.key] = function() application.launchorfocus(object.app) end
end)

init()
