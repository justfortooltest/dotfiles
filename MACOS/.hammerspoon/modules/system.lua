-- auto lock screen
hs.hotkey.bind(hyperShift, "c", function()
  hs.caffeinate.lockScreen()
end)

-- console
hs.hotkey.bind(hyperShift, ';', hs.openConsole)

-- Input Source
-- input_source = {"ABC", "Squirrel"}
--
-- hs.hotkey.bind('shift', function()
--   hs.keycodes.setMethod('ABC')
-- )
--
-- local input_source = false
-- function toggle_input_source()
--   if input_source then
--     hs.keycodes.setLayout(input_source[0])
--     input_source = false
--   else
--     hs.keycodes.setMethod(input_source[1])
--     input_source = true
--   end
-- end

