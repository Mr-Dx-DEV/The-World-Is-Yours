----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Menus
-- Morphine
local Morphine = {
    {
        header = Language.Processing.Heroin.Morphine['processormorphineheader'],
        txt = Language.Processing.Heroin.Morphine['processormoprphineheadertext'],
        icon = Language.Processing.Heroin.Morphine['processormorphineheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Heroin.Morphine['processingmorphineheader'],
        txt = Language.Processing.Heroin.Morphine['processingmorphineheadertext'],
        icon = Language.Processing.Heroin.Morphine['processingmorphineheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessMorphine',
            isServer = true
        }
    },
    {
        header = Language.Stores.Heroin.Morphine.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Heroin.Morphine.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Heroin.Morphine.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 3
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-heroin:client:StopMenu'
        }
    }
}

-- Heroin base
local HeroinBase = {
    {
        header = Language.Processing.Heroin.HeroinBase['processorheroinbaseheader'],
        txt = Language.Processing.Heroin.HeroinBase['processorheroinbaseheadertext'],
        icon = Language.Processing.Heroin.HeroinBase['processorheroinbaseheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Heroin.HeroinBase['processingheroinbaseheader'],
        txt = Language.Processing.Heroin.HeroinBase['processingheroinbaseheadertext'],
        icon = Language.Processing.Heroin.HeroinBase['processingheroinbaseheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessHeroinBase',
            isServer = true
        }
    },
    {
        header = Language.Stores.Heroin.HeroinBase.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Heroin.HeroinBase.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Heroin.HeroinBase.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 4
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-heroin:client:StopMenu'
        }
    }
}

-- Heroin
local Heroin = {
    {
        header = Language.Processing.Heroin.Heroin['processorheroinheader'],
        txt = Language.Processing.Heroin.Heroin['processorheroinheadertext'],
        icon = Language.Processing.Heroin.Heroin['processorheroinheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Heroin.Heroin['processingheroinheader'],
        txt = Language.Processing.Heroin.Heroin['processingheroinheadertext'],
        icon = Language.Processing.Heroin.Heroin['processingheroinheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessHeroin',
            isServer = true
        }
    },
    {
        header = Language.Stores.Heroin.Heroin.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Heroin.Heroin.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Heroin.Heroin.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 5
        }
    }, -- Add more choices here
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-heroin:client:StopMenu'
        }
    }
}

-- Crack
local Crack = {
    {
        header = Language.Processing.Cocaine.Crack['processorcrackheader'],
        txt = Language.Processing.Cocaine.Crack['processorcrackheadertext'],
        icon = Language.Processing.Cocaine.Crack['processorcrackheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Cocaine.Crack['processingcrackheader'],
        txt = Language.Processing.Cocaine.Crack['processingcrackheadertext'],
        icon = Language.Processing.Cocaine.Crack['processingcrackheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessCrack',
            isServer = true
        }
    },
    {
        header = Language.Stores.Cocaine.Crack.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Cocaine.Crack.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Cocaine.Crack.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 6
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-cocaine:client:StopMenu'
        }
    }
}

-- Meth menu
local Meth = {
    {
        header = Language.Processing.Meth.Meth['processormethheader'],
        txt = Language.Processing.Meth.Meth['processormethheadertext'],
        icon = Language.Processing.Meth.Meth['processormethheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Meth.Meth['processingmethheader'],
        txt = Language.Processing.Meth.Meth['processingmethheadertext'],
        icon = Language.Processing.Meth.Meth['processingmethheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessMeth',
            isServer = true
        }
    },
    {
        header = Language.Stores.Meth.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Meth.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Meth.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 7
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

-- Cocaine
local Cocaine = {
    {
        header = Language.Processing.Cocaine.Cocaine['processorcocaineheader'],
        txt = Language.Processing.Cocaine.Cocaine['processorcocaineheadertext'],
        icon = Language.Processing.Cocaine.Cocaine['processorcocaineheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Processing.Cocaine.Cocaine['processingcocaineheader'],
        txt = Language.Processing.Cocaine.Cocaine['processingcocaineheadertext'],
        icon = Language.Processing.Cocaine.Cocaine['processingcocaineheadericon'],
        params = {
            event = 'boii-drugs:sv:ProcessCocaine',
            isServer = true
        }
    },
    {
        header = Language.Stores.Cocaine.Cocaine.BlackMarket['blackmarketheader'],
        txt = Language.Stores.Cocaine.Cocaine.BlackMarket['blackmarketheadertext'],
        icon = Language.Stores.Cocaine.Cocaine.BlackMarket['blackmarketheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 8
        }
    }, -- Add more choices here
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-cocaine:client:StopMenu'
        }
    }
}

-- Events
-- Morphine
RegisterNetEvent('boii-drugs:cl:MorphineProcessor', function()
    if Config.Processing.Heroin.Morphine.Times.Use then
        if GetClockHours() >= Config.Processing.Heroin.Morphine.Times.Start and GetClockHours() <= Config.Processing.Heroin.Morphine.Times.End then
            exports[MenuName]:openMenu(Morphine)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Heroin.Morphine['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(Morphine)
	end
end)

-- Heroin base
RegisterNetEvent('boii-drugs:cl:HeroinBaseProcessor', function()
    if Config.Processing.Heroin.HeroinBase.Times.Use then
        if GetClockHours() >= Config.Processing.Heroin.HeroinBase.Times.Start and GetClockHours() <= Config.Processing.Heroin.HeroinBase.Times.End then
            exports[MenuName]:openMenu(HeroinBase)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Heroin.HeroinBase['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(HeroinBase)
	end
end)

-- Heroin
RegisterNetEvent('boii-drugs:cl:HeroinProcessor', function()
    if Config.Processing.Heroin.Heroin.Times.Use then
        if GetClockHours() >= Config.Processing.Heroin.HeroinBase.Times.Start and GetClockHours() <= Config.Processing.Heroin.Heroin.Times.End then
            exports[MenuName]:openMenu(Heroin)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Heroin.Heroin['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(Heroin)
	end
end)

-- Crack
RegisterNetEvent('boii-drugs:cl:CrackProcessor', function()
    if Config.Processing.Cocaine.Crack.Times.Use then
        if GetClockHours() >= Config.Processing.Cocaine.Crack.Times.Start and GetClockHours() <= Config.Processing.Cocaine.Crack.Times.End then
            exports[MenuName]:openMenu(Crack)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Cocaine.Crack['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(Crack)
	end
end)

-- Meth
RegisterNetEvent('boii-drugs:cl:MethProcessor', function()
    if Config.Processing.Meth.Meth.Times.Use then
        if GetClockHours() >= Config.Processing.Meth.Meth.Times.Start and GetClockHours() <= Config.Processing.Meth.Meth.Times.End then
            exports[MenuName]:openMenu(Meth)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Meth.Meth['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(Meth)
	end
end)

-- Cocaine
RegisterNetEvent('boii-drugs:cl:CocaineProcessor', function()
    if Config.Processing.Cocaine.Cocaine.Times.Use then
        if GetClockHours() >= Config.Processing.Cocaine.Cocaine.Times.Start and GetClockHours() <= Config.Processing.Cocaine.Cocaine.Times.End then
            exports[MenuName]:openMenu(Cocaine)
        else
            TriggerEvent('boii-drugs:notify', Language.Processing.Cocaine.Cocaine['processorclosed'], 'error')
        end
    else
		exports[MenuName]:openMenu(Cocaine)
	end
end)
--<!>-- METH PROCESSING MENU END --<!>--
