require "modules/hotkey"
require "modules/windows"
require "modules/caffeine"
require "modules/app-switcher"
require "modules/system"
require "modules/utils"

-- standalone_modifiers by karabiner ( fn => f18 )
setupApplicationLauncherModalHotkey({}, "f18")
registerApplicationHotkey("f", "finder")
registerApplicationHotkey("w", "微信")
registerApplicationHotkey("g", "google chrome")
registerApplicationHotkey("q", "qq")
registerApplicationHotkey("e", "evernote")
registerApplicationHotkey("s", "safari")
registerApplicationHotkey("t", "终端")

function applicationWatcher(appName, eventType, appObject)
  print(appName)
end

local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

-- reload
hs.hotkey.bind(hyper, 'escape', function()
  hs.reload()
end)
