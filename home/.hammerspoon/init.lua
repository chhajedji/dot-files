-- Toggle main display between two monitors
local function swapDisplays()
    local screens = hs.screen.allScreens()
    if #screens ~= 2 then
        hs.alert.show("Need exactly 2 displays")
        return
    end

    -- Identify screens
    local s1 = screens[1]
    local s2 = screens[2]

    -- Save mouse position relative to its screen
    local mousePos = hs.mouse.absolutePosition()
    local currentScreen = hs.mouse.getCurrentScreen()
    local frame = currentScreen:frame()
    local relX = (mousePos.x - frame.x) / frame.w
    local relY = (mousePos.y - frame.y) / frame.h

    -- Swap the primary (main) display
    if s1 == hs.screen.primaryScreen() then
        s2:setPrimary()
    else
        s1:setPrimary()
    end

    -- Restore mouse relative position on new primary screen
    hs.timer.doAfter(0.3, function()
        local newScreen = hs.screen.primaryScreen()
        local f = newScreen:frame()
        hs.mouse.setAbsolutePosition({
            x = f.x + relX * f.w,
            y = f.y + relY * f.h
        })
    end)

    hs.alert.show("Displays Swapped")
end

-- Hotkey: Ctrl + Option + Command + D
hs.hotkey.bind({"ctrl", "cmd"}, "D", swapDisplays)
