require 'hs.application'
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local hints = require 'hs.hints'
local grid = require 'hs.grid'
local mouse = require 'hs.mouse'

window.animationDuration = 0

-- hyper [ for left one half window
hotkey.bind(hyper, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)

-- hyper ] for left one half window
hotkey.bind(hyper, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)

-- hyper f for full one window
hotkey.bind(hyper, 'f', function() toggle_window_maximized() end)

-- Defines for window maximize toggler
local frameCache = {}
-- Toggle a window between its normal size, and being maximized
function toggle_window_maximized()
    local win = window.focusedWindow()
    if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()])
        frameCache[win:id()] = nil
    else
        -- 键值储存当前window的rect
        frameCache[win:id()] = win:frame()
        win:maximize()
    end
end

-- 鼠标随着窗口移动
function hintMoveMouse()
  -- frame {height width point-x point-y }
  local wf = window.focusedWindow():frame()
  local sc = window.focusedWindow():screen()
  local mp = {x = wf.x + wf.w/2, y = wf.y + wf.h/2}
  mouse.setRelativePosition(mp, sc)
end

-- hyper h to show window hints
hotkey.bind(hyper, 'h', function()
  -- 选择应用后移动鼠标到应用的中心
  hints.windowHints(nil, hintMoveMouse, true)
end)

-- hyperShift h to show currently foucsed application window hints
hotkey.bind(hyperShift, 'h', function()
  -- 选择应用后移动鼠标到应用的中心
  hints.windowHints(window.focusedWindow():application():allWindows(), hintMoveMouse, true)
end)

---- Hyper hjkl to switch window focus
-- hotkey.bind(hyper, 'h', function() window.focusedWindow():focusWindowWest() end)
-- hotkey.bind(hyper, 'l', function() window.focusedWindow():focusWindowEast() end)
-- hotkey.bind(hyper, 'k', function() window.focusedWindow():focusWindowNorth() end)
-- hotkey.bind(hyper, 'j', function() window.focusedWindow():focusWindowSouth() end)

-- hotkeys to interact with the window grid
hotkey.bind(hyper, ',', grid.show)
