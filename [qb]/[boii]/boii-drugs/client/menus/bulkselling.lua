----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Menus
-- Main menu 
local MainMenu = {
    {
        header = Language.Stores.BulkSelling['bulkbuyerheader'],
        txt = Language.Stores.BulkSelling['bulkbuyerheadertext'],
        icon = Language.Stores.BulkSelling['bulkbuyerheadericon'],
        isMenuHeader = true,
    },
    {
        header = Language.Stores.BulkSelling['bulkbuyerbagsheader'],
        txt = Language.Stores.BulkSelling['bulkbuyerbagsheadertext'],
        icon = Language.Stores.BulkSelling['bulkbuyerbagsheadericon'],
        params = {
            event = 'boii-drugs:cl:BulkSellMenus',
            args = 1,
        }
    },
    {
        header = Language.Stores.BulkSelling['bulkbuyerouncesheader'],
        txt = Language.Stores.BulkSelling['bulkbuyerouncesheadertext'],
        icon = Language.Stores.BulkSelling['bulkbuyerouncesheadericon'],
        params = {
            event = 'boii-drugs:cl:BulkSellMenus',
            args = 2,
        }
    },
    {
        header = Language.Stores.BulkSelling.BlackMarket['blackmarketheader'],
        txt = Language.Stores.BulkSelling.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.BulkSelling.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 9
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-drugs:cl:StopMenu'
        }
    }
}

-- Bags
local Bags = {
    {
        header = Language.Stores.BulkSelling['bulkbuyerheader'],
        txt = Language.Stores.BulkSelling['bulkbuyerheadertext'],
        icon = Language.Stores.BulkSelling['bulkbuyerheadericon'],
        isMenuHeader = true,
    },
    {
        header = 'Ketamine: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['ketamine']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 1
        }
    },
    {
        header = 'Morphine: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['morphinebaggy']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 2
        }
    },
    {
        header = 'Heroin: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['heroinbaggy']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 3
        }
    },
    {
        header = 'Morphine Vial',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['morphine']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 4
        }
    },
    {
        header = 'Liquid Heroin',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['liquidheroin']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 5
        }
    },
    {
        header = 'Crack: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['crack_baggy']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 6
        }
    },
    {
        header = 'Meth: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['meth']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 7
        }
    },
    {
        header = 'Cocaine: 1g',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Bags['cokebaggy']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellBags',
            isServer = true,
            args = 8
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-drugs:cl:BulkSellingMenu'
        }
    }
}

-- Ounce menu
local Ounces = {
    {
        header = Language.Stores.BulkSelling['bulkbuyerheader'],
        txt = Language.Stores.BulkSelling['bulkbuyerheadertext'],
        icon = Language.Stores.BulkSelling['bulkbuyerheadericon'],
        isMenuHeader = true,
    },
    {
        header = 'Ketamine: 1oz',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Ounces['ketamine_1oz']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellOunces',
            isServer = true,
            args = 1
        }
    },
    {
        header = 'Heroin: 1oz',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Ounces['heroin_1oz']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellOunces',
            isServer = true,
            args = 1
        }
    },
    {
        header = 'Crack: 1oz',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Ounces['crack_1oz']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellOunces',
            isServer = true,
            args = 2
        }
    },
    {
        header = 'Meth: 1oz',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Ounces['meth_1oz']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellOunces',
            isServer = true,
            args = 3
        }
    },
    {
        header = 'Cocaine: 1oz',
        txt = 'Price: $'..Config.Stores.BulkSelling.Drugs.Ounces['coke_1oz']..' each',
        icon = 'fa-solid fa-cannabis',
        params = {
            event = 'boii-drugs:sv:BulkSellOunces',
            isServer = true,
            args = 4
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-drugs:cl:BulkSellingMenu'
        }
    }
}

-- Events
RegisterNetEvent('boii-drugs:cl:BulkSellingMenu', function()
    if Config.Stores.BulkSelling.Times.Use then
        if GetClockHours() >= Config.Stores.BulkSelling.Times.Start and GetClockHours() <= Config.Stores.BulkSelling.Times.End then 
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-drugs:notify', Language.Stores.BulkSelling['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)


RegisterNetEvent('boii-drugs:cl:BulkSellMenus', function(args)
    local args = tonumber(args)
    if args == 1 then
        exports[MenuName]:openMenu(Bags)
    elseif args == 2 then
        exports[MenuName]:openMenu(Ounces)
    end 
end)
