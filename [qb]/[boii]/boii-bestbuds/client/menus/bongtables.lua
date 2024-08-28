----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Menu
RegisterNetEvent('boii-bestbuds:client:BongMenu', function()
    exports[MenuName]:openMenu({
        {
            header = Language.Locations.BongTable['bongmenuheader'],
            txt = Language.Locations.BongTable['bongmenuheadertext'],
            icon = Language.Locations.BongTable['bongmenuheadericon'],
            isMenuHeader = true
        },
        {
            header = Language.Locations.BongTable['strain1menuheader'],
            txt = Language.Locations.BongTable['strain1menuheadertext'],
            icon = Language.Locations.BongTable['strain1menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:UseBong',
                isServer = true,
                args = 1
            }
        },
        {
            header = Language.Locations.BongTable['strain2menuheader'],
            txt = Language.Locations.BongTable['strain2menuheadertext'],
            icon = Language.Locations.BongTable['strain2menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:UseBong',
                isServer = true,
                args = 2
            }
        },
        {
            header = Language.Locations.BongTable['strain3menuheader'],
            txt = Language.Locations.BongTable['strain3menuheadertext'],
            icon = Language.Locations.BongTable['strain3menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:UseBong',
                isServer = true,
                args = 3
            }
        },
        {
            header = Language.Locations.BongTable['strain4menuheader'],
            txt = Language.Locations.BongTable['strain4menuheadertext'],
            icon = Language.Locations.BongTable['strain4menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:UseBong',
                isServer = true,
                args = 4
            }
        },
        {
            header = Language.Locations.BongTable['strain5menuheader'],
            txt = Language.Locations.BongTable['strain5menuheadertext'],
            icon = Language.Locations.BongTable['strain5menuheadericon'],
            params = {
                event = 'boii-bestbuds:server:UseBong',
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