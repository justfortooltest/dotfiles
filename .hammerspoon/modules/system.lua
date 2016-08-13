local hotkey = require 'hs.hotkey'
local caffeinate = require 'hs.caffeinate'

-- auto lock screen
hotkey.bind(hyperShift, "c", function()
  caffeinate.lockScreen()
end)

-- console
hs.hotkey.bind(hyperShift, ';', hs.openConsole)
