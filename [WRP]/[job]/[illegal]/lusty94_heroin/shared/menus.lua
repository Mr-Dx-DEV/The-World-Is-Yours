local MenuType = Config.CoreSettings.Menu.Type


local MainMenuHeroin = {

    {
        header = 'Processing Main Menu',
        isMenuHeader = true
    },
    {
        header = '❄️ Process ' .. Config.Processing.HeroinBase.ProcessedItemLabel .. ' & ' .. Config.Processing.PureHeroin.ProcessedItemLabel,
        params = {
            event = 'lusty94_heroin:client:openProcessingMenu',
            args = {}
        }
    },
    {
        header = '👜 Make A ' .. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        params = {
            event = 'lusty94_heroin:client:openBaggingMenu',
            args = {}
        }
    },
    {
        header = '🍾 Create An ' .. Config.Processing.Curing.ProcessedItemLabel,
        params = {
            event = 'lusty94_heroin:client:openCuringMenu',
            args = {}
        }
    },
    {
        header = '< Close',
        params = {
            event = 'qb-menu:CloseMenu'
        }
    }
}

lib.registerContext({
    id = 'MainMenuHeroin',
    title = 'Processing Main Menu',
    options = {
      {
        title = '❄️ Process ' .. Config.Processing.HeroinBase.ProcessedItemLabel .. ' & ' .. Config.Processing.PureHeroin.ProcessedItemLabel,
        event = 'lusty94_heroin:client:openProcessingMenu',
        arrow = true,
      },
      {
        title = '👜 Make A ' .. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        event = 'lusty94_heroin:client:openBaggingMenu',
        arrow = true,
      },     
      {
        title = '🍾 Create An ' .. Config.Processing.Curing.ProcessedItemLabel,
        event = 'lusty94_heroin:client:openCuringMenu',
        arrow = true,
      },     
    }
})



RegisterNetEvent('lusty94_heroin:client:openMainMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(MainMenuHeroin)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(MainMenuHeroin)
    elseif MenuType == 'ox' then
        lib.showContext('MainMenuHeroin')
    end
end)

local ProcessingMenuHeroin = {

    {
        header = 'Process Heroin Base & Pure Heroin',
        isMenuHeader = true
    },
    {
        header = '💨 Process ' ..Config.Processing.HeroinBase.ProcessedItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.HeroinBase.RequiredItemAmount..' x '.. Config.Processing.HeroinBase.RequiredItemLabel .. '<br>' .. Config.Processing.HeroinBase.RequiredItem2Amount .. ' x '.. Config.Processing.HeroinBase.RequiredItem2Label .. '<br>' .. Config.Processing.HeroinBase.RequiredItem3Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem3Label .. '<br>' .. Config.Processing.HeroinBase.RequiredItem4Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem4Label,
        params = {
            event = 'lusty94_heroin:client:ProcessHeroinBase',
            args = {}
        }
    },
    {
        header = '💨 Process ' ..Config.Processing.PureHeroin.ProcessedItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.PureHeroin.RequiredItemAmount..' x '.. Config.Processing.PureHeroin.RequiredItemLabel .. '<br>' .. Config.Processing.PureHeroin.RequiredItem2Amount .. ' x '.. Config.Processing.PureHeroin.RequiredItem2Label .. '<br>' .. Config.Processing.PureHeroin.RequiredItem3Amount .. ' x ' .. Config.Processing.PureHeroin.RequiredItem3Label,
        params = {
            event = 'lusty94_heroin:client:ProcessPureHeroin',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',

        params = {
            event = 'lusty94_heroin:client:openMainMenu',
            args = {}
        }
    },
    {
        header = '< Close',
        params = {
            event = 'qb-menu:CloseMenu'
        }
    }
}

lib.registerContext({
    id = 'ProcessingMenuHeroin',
    title = 'Process Heroin Base & Pure Heroin',
    options = {
      {
        title = '💨 Process ' ..Config.Processing.HeroinBase.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.HeroinBase.RequiredItemAmount..' x '.. Config.Processing.HeroinBase.RequiredItemLabel .. '\n' .. Config.Processing.HeroinBase.RequiredItem2Amount .. ' x '.. Config.Processing.HeroinBase.RequiredItem2Label .. '\n' .. Config.Processing.HeroinBase.RequiredItem3Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem3Label .. '\n' .. Config.Processing.HeroinBase.RequiredItem4Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem4Label,
        event = 'lusty94_heroin:client:ProcessHeroinBase',
        arrow = true,
      },
      {
        title = '💨 Process ' ..Config.Processing.PureHeroin.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.PureHeroin.RequiredItemAmount..' x '.. Config.Processing.PureHeroin.RequiredItemLabel .. '\n' .. Config.Processing.PureHeroin.RequiredItem2Amount .. ' x '.. Config.Processing.PureHeroin.RequiredItem2Label .. '\n' .. Config.Processing.PureHeroin.RequiredItem3Amount .. ' x ' .. Config.Processing.PureHeroin.RequiredItem3Label,
        event = 'lusty94_heroin:client:ProcessPureHeroin',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',

        event = 'lusty94_heroin:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_heroin:client:openProcessingMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(ProcessingMenuHeroin)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(ProcessingMenuHeroin)
    elseif MenuType == 'ox' then
        lib.showContext('ProcessingMenuHeroin')
    end
end)





local BaggingMenuHeroin = {

    {
        header = 'Prepare Heroin Vials',
        isMenuHeader = true
    },
    {
        header = '⚖️ Bottle '..Config.Processing.Bagging.HeroinVial.RequiredItemAmount..' x '.. Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..' Into '..Config.Processing.Bagging.HeroinVial.BaggedItemAmount ..' x '.. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        txt = 'Required Items: <br>'.. Config.Processing.Bagging.HeroinVial.RequiredItem2Label .. '<br>' .. Config.Processing.Bagging.HeroinVial.RequiredItemAmount ..' x '.. Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..'<br>' ..  Config.Processing.Bagging.HeroinVial.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.HeroinVial.RequiredItem3Label,
        params = {
            event = 'lusty94_heroin:client:ProcessHeroinVial',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',
        params = {
            event = 'lusty94_heroin:client:openMainMenu',
            args = {}
        }
    },
    {
        header = '< Close',
        params = {
            event = 'qb-menu:CloseMenu'
        }
    }
}

lib.registerContext({
    id = 'BaggingMenuHeroin',
    title = 'Prepare Heroin Vials',
    options = {
      {
        title = '⚖️ Bottle '..Config.Processing.Bagging.HeroinVial.RequiredItemAmount..' x '.. Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..' Into '..Config.Processing.Bagging.HeroinVial.BaggedItemAmount ..' x '.. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.HeroinVial.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.HeroinVial.RequiredItemAmount ..' x '.. Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.HeroinVial.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.HeroinVial.RequiredItem3Label,
        event = 'lusty94_heroin:client:ProcessHeroinVial',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_heroin:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_heroin:client:openBaggingMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(BaggingMenuHeroin)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(BaggingMenuHeroin)
    elseif MenuType == 'ox' then
        lib.showContext('BaggingMenuHeroin')
    end
end)




local CuringMenuHeroin = {

    {
        header = 'Create Overdose Cure',
        isMenuHeader = true
    },
    {
        header = '🍾 Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        txt = 'Required Items: <br>' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '<br>' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '<br>' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        params = {
            event = 'lusty94_heroin:client:CreateOverDoseCure',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',
        params = {
            event = 'lusty94_heroin:client:openMainMenu',
            args = {}
        }
    },
    {
        header = '< Close',
        params = {
            event = 'qb-menu:CloseMenu'
        }
    }
}

lib.registerContext({
    id = 'CuringMenuHeroin',
    title = 'Create Overdose Cure',
    options = {
      {
        title = '🍾 Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        description = 'Required Items: \n' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '\n' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '\n' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        event = 'lusty94_heroin:client:CreateOverDoseCure',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_heroin:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_heroin:client:openCuringMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(CuringMenuHeroin)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(CuringMenuHeroin)
    elseif MenuType == 'ox' then
        lib.showContext('CuringMenuHeroin')
    end
end)


