----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- MENUS START --<!>--
-- Main menu
local MainMenu = {
    {
        header = Language.Stores.Weed.SmokeShop['smokeshopheader'],
        txt = Language.Stores.Weed.SmokeShop['smokeshopheadertext'],
        icon = Language.Stores.Weed.SmokeShop['smokeshopheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Stores.Weed.SmokeShop['smokeshopsellheader'],
        txt = Language.Stores.Weed.SmokeShop['smokeshopsellheadertext'],
        icon = Language.Stores.Weed.SmokeShop['smokeshopsellheadericon'],
        params = {
            event = 'boii-drugs:cl:WeedSellingMenu',
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['smokeshopbrowseheader'],
        txt = Language.Stores.Weed.SmokeShop['smokeshopbrowseheadertext'],
        icon = Language.Stores.Weed.SmokeShop['smokeshopbrowseheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 1
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-drugs:cl:StopMenu'
        }
    },
}

-- Selling menu
local SellingMenu = {
    {
        header = Language.Stores.Weed.SmokeShop['smokeshopsellheader'],
        txt = Language.Stores.Weed.SmokeShop['smokeshopsellheadertext'],
        icon = Language.Stores.Weed.SmokeShop['smokeshopsellheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain1header'],
        txt = Language.Stores.Weed.SmokeShop['strain1headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 1
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain2header'],
        txt = Language.Stores.Weed.SmokeShop['strain2headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 2
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain3header'],
        txt = Language.Stores.Weed.SmokeShop['strain3headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 3
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain4header'],
        txt = Language.Stores.Weed.SmokeShop['strain4headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 4
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain5header'],
        txt = Language.Stores.Weed.SmokeShop['strain5headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 5
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain6header'],
        txt = Language.Stores.Weed.SmokeShop['strain6headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 6
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain7header'],
        txt = Language.Stores.Weed.SmokeShop['strain7headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 7
        }
    },
    {
        header = Language.Stores.Weed.SmokeShop['strain8header'],
        txt = Language.Stores.Weed.SmokeShop['strain8headertext'],
        icon = Language.Stores.Weed.SmokeShop['strainheadericon'],
        params = {
            event = 'boii-drugs:sv:SellBags',
            isServer = true,
            args = 8
        }
    }, -- Add more options here
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-drugs:cl:SmokeShopMenu'
        }
    },
}
--<!>-- MENUS END --<!>--

--<!>-- EVENTS START --<!>--
-- Mainmenu event
RegisterNetEvent('boii-drugs:cl:SmokeShopMenu', function()
    if Config.Stores.Weed.SmokeShop.Times.Use then
        if GetClockHours() >= Config.Stores.Weed.SmokeShop.Times.Start and GetClockHours() <= Config.Stores.Weed.SmokeShop.Times.End then 
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-drugs:notify', Language.Stores.Weed.SmokeShop['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)

-- Selling menu event
RegisterNetEvent('boii-drugs:cl:WeedSellingMenu', function()
    exports[MenuName]:openMenu(SellingMenu)
end)
--<!>-- EVENTS END --<!>--