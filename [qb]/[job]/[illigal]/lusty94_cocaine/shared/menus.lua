local MenuType = Config.CoreSettings.Menu.Type


local MainMenuCocaine = {

    {
        header = 'Processing Main Menu',
        isMenuHeader = true
    },
    {
        header = '❄️ Process ' .. Config.Processing.Cocaine.ProcessedItemLabel .. ' & ' .. Config.Processing.Crack.ProcessedItemLabel,
        params = {
            event = 'lusty94_cocaine:client:openProcessingMenu',
            args = {}
        }
    },
    {
        header = '👜 Make A ' .. Config.Processing.Bagging.Cocaine.BaggedItemLabel .. ' Or A ' .. Config.Processing.Bagging.Crack.BaggedItemLabel,
        params = {
            event = 'lusty94_cocaine:client:openBaggingMenu',
            args = {}
        }
    },
    {
        header = '🍾 Create An ' .. Config.Processing.Curing.ProcessedItemLabel,
        params = {
            event = 'lusty94_cocaine:client:openCuringMenu',
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
    id = 'MainMenuCocaine',
    title = 'Processing Main Menu',
    options = {
      {
        title = '❄️ Process ' .. Config.Processing.Cocaine.ProcessedItemLabel .. ' & ' .. Config.Processing.Crack.ProcessedItemLabel,
        event = 'lusty94_cocaine:client:openProcessingMenu',
        arrow = true,
      },
      {
        title = '👜 Make A ' .. Config.Processing.Bagging.Cocaine.BaggedItemLabel .. ' Or A ' .. Config.Processing.Bagging.Crack.BaggedItemLabel,
        event = 'lusty94_cocaine:client:openBaggingMenu',
        arrow = true,
      },     
      {
        title = '🍾 Create An ' .. Config.Processing.Curing.ProcessedItemLabel,
        event = 'lusty94_cocaine:client:openCuringMenu',
        arrow = true,
      },     
    }
})



RegisterNetEvent('lusty94_cocaine:client:openMainMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(MainMenuCocaine)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(MainMenuCocaine)
    elseif MenuType == 'ox' then
        lib.showContext('MainMenuCocaine')
    end
end)

local ProcessingMenuCocaine = {

    {
        header = 'Process Cocaine And Crack',
        isMenuHeader = true
    },
    {
        header = '💨 Process ' ..Config.Processing.Cocaine.ProcessedItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Cocaine.RequiredItemLabel .. '<br>' .. Config.Processing.Cocaine.RequiredItem2Amount .. ' x '.. Config.Processing.Cocaine.RequiredItem2Label .. '<br>' .. Config.Processing.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem3Label .. '<br>' .. Config.Processing.Cocaine.RequiredItem4Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem4Label,
        params = {
            event = 'lusty94_cocaine:client:ProcessPureCocaine',
            args = {}
        }
    },
    {
        header = '💨 Process ' ..Config.Processing.Crack.ProcessedItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.Crack.RequiredItemAmount..' x '.. Config.Processing.Crack.RequiredItemLabel .. '<br>' .. Config.Processing.Crack.RequiredItem2Amount .. ' x '.. Config.Processing.Crack.RequiredItem2Label .. '<br>' .. Config.Processing.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Crack.RequiredItem3Label,
        params = {
            event = 'lusty94_cocaine:client:ProcessPureCrack',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',

        params = {
            event = 'lusty94_cocaine:client:openMainMenu',
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
    id = 'ProcessingMenuCocaine',
    title = 'Process Cocaine And Crack',
    options = {
      {
        title = '💨 Process ' ..Config.Processing.Cocaine.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Cocaine.RequiredItemLabel .. '\n' .. Config.Processing.Cocaine.RequiredItem2Amount .. ' x '.. Config.Processing.Cocaine.RequiredItem2Label .. '\n' .. Config.Processing.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem3Label .. '\n' .. Config.Processing.Cocaine.RequiredItem4Amount .. ' x ' .. Config.Processing.Cocaine.RequiredItem4Label,
        event = 'lusty94_cocaine:client:ProcessPureCocaine',
        arrow = true,
      },
      {
        title = '💨 Process ' ..Config.Processing.Crack.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Crack.RequiredItemAmount..' x '.. Config.Processing.Crack.RequiredItemLabel .. '\n' .. Config.Processing.Crack.RequiredItem2Amount .. ' x '.. Config.Processing.Crack.RequiredItem2Label .. '\n' .. Config.Processing.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Crack.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessPureCrack',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',

        event = 'lusty94_cocaine:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_cocaine:client:openProcessingMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(ProcessingMenuCocaine)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(ProcessingMenuCocaine)
    elseif MenuType == 'ox' then
        lib.showContext('ProcessingMenuCocaine')
    end
end)





local BaggingMenuCocaine = {

    {
        header = 'Bag Cocaine & Crack',
        isMenuHeader = true
    },
    {
        header = '⚖️ Bag '..Config.Processing.Bagging.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Cocaine.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.BaggedItemLabel,
        txt = 'Required Items: <br>'.. Config.Processing.Bagging.Cocaine.RequiredItem2Label .. '<br>' .. Config.Processing.Bagging.Cocaine.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..'<br>' ..  Config.Processing.Bagging.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Cocaine.RequiredItem3Label,
        params = {
            event = 'lusty94_cocaine:client:ProcessCokeBaggy',
            args = {}
        }
    },
    {
        header = '⚖️ Bag '..Config.Processing.Bagging.Crack.RequiredItemAmount..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Crack.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Crack.BaggedItemLabel,
        txt = 'Required Items: <br>'.. Config.Processing.Bagging.Crack.RequiredItem2Label .. '<br>' .. Config.Processing.Bagging.Crack.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..'<br>' ..  Config.Processing.Bagging.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Crack.RequiredItem3Label,
        params = {
            event = 'lusty94_cocaine:client:ProcessCrackBaggy',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',
        params = {
            event = 'lusty94_cocaine:client:openMainMenu',
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
    id = 'BaggingMenuCocaine',
    title = 'Bag Cocaine & Crack',
    options = {
      {
        title = '⚖️ Bag '..Config.Processing.Bagging.Cocaine.RequiredItemAmount..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Cocaine.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.Cocaine.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.Cocaine.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Cocaine.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.Cocaine.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Cocaine.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessCokeBaggy',
        arrow = true,
      },
      {
        title = '⚖️ Bag '..Config.Processing.Bagging.Crack.RequiredItemAmount..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..' Into '..Config.Processing.Bagging.Crack.BaggedItemAmount ..' x '.. Config.Processing.Bagging.Crack.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.Crack.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.Crack.RequiredItemAmount ..' x '.. Config.Processing.Bagging.Crack.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.Crack.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.Crack.RequiredItem3Label,
        event = 'lusty94_cocaine:client:ProcessCrackBaggy',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_cocaine:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_cocaine:client:openBaggingMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(BaggingMenuCocaine)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(BaggingMenuCocaine)
    elseif MenuType == 'ox' then
        lib.showContext('BaggingMenuCocaine')
    end
end)




local CuringMenuCocaine = {

    {
        header = 'Create Overdose Cure',
        isMenuHeader = true
    },
    {
        header = '🍾 Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        txt = 'Required Items: <br>' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '<br>' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '<br>' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        params = {
            event = 'lusty94_cocaine:client:CreateOverDoseCure',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',
        params = {
            event = 'lusty94_cocaine:client:openMainMenu',
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
    id = 'CuringMenuCocaine',
    title = 'Create Overdose Cure',
    options = {
      {
        title = '🍾 Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        description = 'Required Items: \n' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '\n' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '\n' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        event = 'lusty94_cocaine:client:CreateOverDoseCure',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_cocaine:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_cocaine:client:openCuringMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(CuringMenuCocaine)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(CuringMenuCocaine)
    elseif MenuType == 'ox' then
        lib.showContext('CuringMenuCocaine')
    end
end)


