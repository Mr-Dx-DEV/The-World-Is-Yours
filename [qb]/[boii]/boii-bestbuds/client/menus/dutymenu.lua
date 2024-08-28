----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--


-- White widow duty menu
RegisterNetEvent('boii-bestbuds:client:BestBudsDutyMenu', function()
    exports[MenuName]:openMenu({
        { 
            header = Language.Locations.Duty['dutymenuheader'],
            txt = Language.Locations.Duty['dutymenuheadertext'],
            icon = Language.Locations.Duty['dutymenuheadericon'],
            isMenuHeader = true
        },
        { 
            header = Language.Locations.Duty['dutytoggle'],
            icon = Language.Locations.Duty['dutytoggleicon'],
            params = {
                event = 'boii-bestbuds:client:ToggleDuty',
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = { 
                event = 'boii-bestbuds:client:StopMenu'
            }
        },
    })
end)