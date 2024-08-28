----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Pints menu
local PintMenu = {
    { 
        header = Language.Bar['pintheader'],
        txt = Language.Bar['pintheadertext'],
        icon = Language.Bar['pintheadericon'],
        isMenuHeader = true
    },
    { 
        header = Language.Bar['amheader'],
        txt = Language.Bar['amheadertext'],
        icon = Language.Bar['amheadericon'],
        params = {
            event = 'boii-billiards:cl:PullPint',
            args = 1
        }
    },
    { 
        header = Language.Bar['pisheader'],
        txt = Language.Bar['pisheadertext'],
        icon = Language.Bar['pisheadericon'],
        params = {
            event = 'boii-billiards:cl:PullPint',
            args = 2
        }
    },
    { 
        header = Language.Bar['loggerheader'],
        txt = Language.Bar['loggerheadertext'],
        icon = Language.Bar['loggerheadericon'],
        params = {
            event = 'boii-billiards:cl:PullPint',
            args = 3
        }
    },
    { 
        header = Language.Bar['duscheheader'],
        txt = Language.Bar['duscheheadertext'],
        icon = Language.Bar['duscheheadericon'],
        params = {
            event = 'boii-billiards:cl:PullPint',
            args = 4
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = { 
            event = 'boii-billiards:cl:StopMenu'
        }
    },
}

local PintMenu2 = {
    { 
        header = Language.Bar['pintheader'],
        txt = Language.Bar['pintheadertext'],
        icon = Language.Bar['pintheadericon'],
        isMenuHeader = true
    },
    { 
        header = Language.Bar['loggerheader'],
        txt = Language.Bar['loggerheadertext'],
        icon = Language.Bar['loggerheadericon'],
        params = {
            event = 'boii-billiards:cl:PullPint',
            args = 3
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = { 
            event = 'boii-billiards:cl:StopMenu'
        }
    },
}

-- Event to open menu
RegisterNetEvent('boii-billiards:cl:PumpMenu', function()
    exports[MenuName]:openMenu(PintMenu)
end)

-- Event to open menu 2
RegisterNetEvent('boii-billiards:cl:PumpMenu2', function()
    exports[MenuName]:openMenu(PintMenu2)
end)

