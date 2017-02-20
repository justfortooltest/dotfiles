-- auto lock screen
hs.hotkey.bind(hyperShift, "c", function()
  hs.caffeinate.lockScreen()
end)

-- console
hs.hotkey.bind(hyperShift, ';', hs.openConsole)

