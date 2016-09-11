require "modules/hotkey"
-- require "modules/launch"
require "modules/windows"
require "modules/space"
-- require "modules/screen"
require "modules/system"
require "modules/utils"

hs.hotkey.bind(hyper, '/', function()
  hs.alert('Hello World')
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- reload
hs.hotkey.bind(hyper, 'escape', function()
  hs.reload()
end)
