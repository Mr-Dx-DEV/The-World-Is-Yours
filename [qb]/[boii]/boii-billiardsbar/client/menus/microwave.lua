----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Main menu
local MainMenu = {
    {
        header = Language.Microwave['microwavemenuheader'],
        txt = Language.Microwave['microwavemenuheadertext'],
        icon = Language.Microwave['microwavemenuheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Microwave['cheesepieheader'],
        txt = Language.Microwave['cheesepieheadertext'],
        icon = Language.Microwave['pieicon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 1
        }
    },
    {
        header = Language.Microwave['meatpieheader'],
        txt = Language.Microwave['meatpieheadertext'],
        icon = Language.Microwave['pieicon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 2
        }
    },
    {
        header = Language.Microwave['steakpieheader'],
        txt = Language.Microwave['steakpieheadertext'],
        icon = Language.Microwave['pieicon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 3
        }
    },
    {
        header = Language.Microwave['chickenpieheader'],
        txt = Language.Microwave['chickenpieheadertext'],
        icon = Language.Microwave['pieicon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 4
        }
    },
    {
        header = Language.Microwave['mwburgerheader'],
        txt = Language.Microwave['mwburgerheadertext'],
        icon = Language.Microwave['burgericon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 5
        }
    },
    {
        header = Language.Microwave['mwcburgerheader'],
        txt = Language.Microwave['mwcburgerheadertext'],
        icon = Language.Microwave['burgericon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 6
        }
    },
    {
        header = Language.Microwave['mwbcburgerheader'],
        txt = Language.Microwave['mwbcburgerheadertext'],
        icon = Language.Microwave['burgericon'],
        params = {
            event = 'boii-billiards:cl:Microwave',
            args = 7
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exiticon'],
        params = {
            event = 'boii-billiardsjob:cl:StopMenu'
        }
    },
}


-- Event
RegisterNetEvent('boii-billiards:cl:MicrowaveMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)