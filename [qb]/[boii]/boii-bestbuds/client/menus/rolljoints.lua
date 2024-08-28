----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Joint rolling menu
RegisterNetEvent('boii-bestbuds:client:RollJointsMenu', function()
    exports[MenuName]:openMenu({
        {
            header = Language.Locations.Rolling['jointsmenuheader'],
            txt = Language.Locations.Rolling['jointsmenuheadertext'],
            icon = Language.Locations.Rolling['jointsmenuheadericon'],
            isMenuHeader = true
        },
        {
            header = Language.Locations.Rolling['strain1menuheader'],
            txt = Language.Locations.Rolling['strain1menuheadertext'],
            icon = Language.Locations.Rolling['strain1menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:RollJoints',
                isServer = true,
                args = 1
            }
        },
        {
            header = Language.Locations.Rolling['strain2menuheader'],
            txt = Language.Locations.Rolling['strain2menuheadertext'],
            icon = Language.Locations.Rolling['strain2menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:RollJoints',
                isServer = true,
                args = 2
            }
        },
        { 
            header = Language.Locations.Rolling['strain3menuheader'],
            txt = Language.Locations.Rolling['strain3menuheadertext'],
            icon = Language.Locations.Rolling['strain3menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:RollJoints',
                isServer = true,
                args = 3
            }
        },
        { 
            header = Language.Locations.Rolling['strain4menuheader'],
            txt = Language.Locations.Rolling['strain4menuheadertext'],
            icon = Language.Locations.Rolling['strain4menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:RollJoints',
                isServer = true,
                args = 4
            }
        },
        { 
            header = Language.Locations.Rolling['strain5menuheader'],
            txt = Language.Locations.Rolling['strain5menuheadertext'],
            icon = Language.Locations.Rolling['strain5menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:RollJoints',
                isServer = true,
                args = 5
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = {
                event = 'boii-bestbuds:client:StopMenu'
            }
        }
    })
end)