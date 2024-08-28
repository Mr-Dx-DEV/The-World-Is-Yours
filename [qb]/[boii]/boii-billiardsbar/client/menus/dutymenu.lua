----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Menu
local MainMenu = {
    { 
        header = Language.Duty['dutymenuheader'],
        txt = Language.Duty['dutymenuheadertext'],
        icon = Language.Duty['dutymenuheadericon'],
        isMenuHeader = true
    },
    { 
        header = Language.Duty['dutytoggle'],
        icon = Language.Duty['dutytoggleicon'],
        params = {
            event = 'boii-billiards:cl:ToggleDuty',
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
RegisterNetEvent('boii-billiards:cl:DutyMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)