-- 比较懒的同学可以直接使用系统提供的方式切换Space
-- 系统默认提供了切换Space的快捷设置
-- Keyboard -> Shortcuts -> Mission Control -> Switch to Desktop (1|2|3...)
-- 如果新建了Space需要重新打开设置，才会出现快捷键设置选项
-- Hyper 1 to Space 1
-- Hyper 2 to Space 2
-- etc
--
--
--------------------------------------------------------------------------------
-- Unsupported Spaces extension. Uses private APIs but works okay.
-- (http://github.com/asmagill/hammerspoon_asm.undocumented)
spaces = require("hs._asm.undocumented.spaces")

local function setSpaceMenu()
  if statusMenu == nil then
    statusMenu = hs.menubar.new()
  end
  currentSpace = tostring(spaces.currentSpace())
  statusMenu:setTitle(currentSpace)
end


local menubar = hs.menubar.new()


-- there are total 9 spaces to change
for i = 1, 9 do
  hs.hotkey.bind(hyper, tostring(i), function()
    allSpaces = spaces.query()
    spaceCalu = #allSpaces + 1
    -- 防止crash
    if i > #allSpaces then hs.alert("Space "..i.." 不存在") return end
    if spaces.activeSpace() == allSpaces[spaceCalu - i] then return end

    spaces.changeToSpace(allSpaces[spaceCalu - i], false)
    setSpaceMenu()
  end)
end

-- 移动窗口至Space
for i = 1, 9 do
  hs.hotkey.bind(hyperShift, tostring(i), function()
    allSpaces = spaces.query()
    spaceCalu = #allSpaces + 1
    -- 检查Space是否存在
    if i > #allSpaces then hs.alert("Space "..i.." 不存在") return end

    local fwID = hs.window.focusedWindow():id()

    spaces.moveWindowToSpace(fwID, allSpaces[spaceCalu - i])
  end)
end

hs.hotkey.bind(hyper, 'c', function()
      allSpaces = spaces.query()
      spaceCalu = #allSpaces + 1
      spaces.createSpace(nil, true)
      hs.alert("Space "..spaceCalu.." 创建成功")
end)

-- init
setSpaceMenu()
