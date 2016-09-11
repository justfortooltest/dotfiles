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
hotkey.bind(hyper, 'f', function() window.focusedWindow():moveToUnit(layout.maximized) end)

-- hyper + shift + left move the current window to the left monitor
hotkey.bind(hyperShift, 'left', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

-- hyper + shift + right move the current window to the right monitor
hotkey.bind(hyperShift, 'right', function()
    local w = hs.window.focusedWindow()
    if not w then
        return
    end
    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

--If there are less than or equal to this many windows on screen their titles will be shown in the hints.The default is 4. Setting to 0 will disable this feature.
hs.hints.showTitleThresh=0

-- It will be slowly when hs.hints.style='vimperator'

-- 鼠标随着窗口移动
function hintMoveMouse()
  -- frame {height width point-x point-y }
  local wf = window.focusedWindow():frame()
  local sc = window.focusedWindow():screen()
  local mp = {x = wf.x + wf.w/2, y = wf.y + wf.h/2}
  mouse.setAbsolutePosition(mp)
end

-- hyper h to show window hints
hotkey.bind(hyper, 'h', function()
  -- 选择应用后移动鼠标到应用的中心
  hints.windowHints(nil, hintMoveMouse, false)
end)

-- hyperShift h to show currently foucsed application window hints
hotkey.bind(hyperShift, 'h', function()
  -- 选择应用后移动鼠标到应用的中心
  hints.windowHints(window.focusedWindow():application():allWindows(), hintMoveMouse, true)
end)

-- hotkeys to interact with the window grid
hotkey.bind(hyper, ',', grid.show)
