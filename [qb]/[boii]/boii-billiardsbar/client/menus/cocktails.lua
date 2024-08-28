----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

local MainMenu = {
    {
        header = Language.Cocktails['cocktailsmenuheader'],
        txt = Language.Cocktails['cocktailsmenuheadertext'],
        icon = Language.Cocktails['cocktailsmenuheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Cocktails['cocktailswhiskeyheader'],
        txt = Language.Cocktails['cocktailswhiskeyheadertext'],
        icon = Language.Cocktails['drinksheadericon'],
        params = {
            event = 'boii-billiards:cl:CocktailMenus',
            args = 1
        }
    },
    {
        header = Language.Cocktails['cocktailsrumheader'],
        txt = Language.Cocktails['cocktailsrumheadertext'],
        icon = Language.Cocktails['drinksheadericon'],
        params = {
            event = 'boii-billiards:cl:CocktailMenus',
            args = 2
        }
    },
    {
        header = Language.Cocktails['cocktailsvodkaheader'],
        txt = Language.Cocktails['cocktailsvodkaheadertext'],
        icon = Language.Cocktails['drinksheadericon'],
        params = {
            event = 'boii-billiards:cl:CocktailMenus',
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

local Whiskey = {
    {
        header = Language.Cocktails['cocktailsmenuheader'],
        txt = Language.Cocktails['cocktailsmenuheadertext'],
        icon = Language.Cocktails['cocktailsmenuheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Cocktails['whiskeysourheader'],
        txt = Language.Cocktails['whiskeysourheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:WhiskeySour',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['whiskeysmashheader'],
        txt = Language.Cocktails['whiskeysmashheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:WhiskeySmash',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['bloodsandheader'],
        txt = Language.Cocktails['bloodsandheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:BloodSand',
            isServer = true
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-billiards:cl:CocktailsMainMenu'
        }
    },
}

local Rum = {
    {
        header = Language.Cocktails['cocktailsrumheader'],
        txt = Language.Cocktails['cocktailsrumheadertext'],
        icon = Language.Cocktails['drinksheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Cocktails['pinacoladaheader'],
        txt = Language.Cocktails['pinacoladaheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:PinaColada',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['zombieheader'],
        txt = Language.Cocktails['zombieheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:Zombie',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['maitaiheader'],
        txt = Language.Cocktails['maitaiheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:MaiTai',
            isServer = true
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-billiards:cl:CocktailsMainMenu'
        }
    },
}

local Vodka = {
    {
        header = Language.Cocktails['cocktailsvodkaheader'],
        txt = Language.Cocktails['cocktailsvodkaheadertext'],
        icon = Language.Cocktails['drinksheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Cocktails['appletiniheader'],
        txt = Language.Cocktails['appletiniheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:Appletini',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['cosmopolitanheader'],
        txt = Language.Cocktails['cosmopolitanheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:Cosmopolitan',
            isServer = true
        }
    },
    {
        header = Language.Cocktails['bloodymaryheader'],
        txt = Language.Cocktails['bloodymaryheadertext'],
        icon = Language.Cocktails['cocktailsicon'],
        params = {
            event = 'boii-billiards:sv:BloodyMary',
            isServer = true
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-billiards:cl:CocktailsMainMenu'
        }
    },
}

-- Events
RegisterNetEvent('boii-billiards:cl:CocktailsMainMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)

RegisterNetEvent('boii-billiards:cl:CocktailMenus', function(args)
    local args = tonumber(args)
    if args == 1 then
        exports[MenuName]:openMenu(Whiskey)
    elseif args == 2 then
        exports[MenuName]:openMenu(Rum)
    elseif args == 3 then
        exports[MenuName]:openMenu(Vodka)
    end
end)