local MenuType = Config.CoreSettings.Menu.Type


local MainMenuMushroom = {

    {
        header = 'Processing Main Menu',
        isMenuHeader = true
    },
    {
        header = '💨 Process Mushrooms',
        params = {
            event = 'lusty94_mushrooms:client:openProcessingMenu',
            args = {}
        }
    },
    {
        header = '🍾 Create Overdose Cure',
        params = {
            event = 'lusty94_mushrooms:client:openCuringMenu',
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
    id = 'MainMenuMushroom',
    title = 'Processing Main Menu',
    options = {
      {
        title = '💨 Process Mushrooms',
        event = 'lusty94_mushrooms:client:openProcessingMenu',
        arrow = true,
      },
      {
        title = '🍾 Create Overdose Cure',
        event = 'lusty94_mushrooms:client:openCuringMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_mushrooms:client:openMainMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(MainMenuMushroom)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(MainMenuMushroom)
    elseif MenuType == 'ox' then
        lib.showContext('MainMenuMushroom')
    end
end)

local ProcessingMenuMushroom = {

    {
        header = 'Process Mushroom Products',
        isMenuHeader = true
    },
    {
        header = '💨 Dry ' ..Config.Processing.Drying.RequiredItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.Drying.RequiredItemAmount..' x '.. Config.Processing.Drying.RequiredItemLabel .. ' <br> ' .. Config.Processing.Drying.RequiredItem2Label,
        params = {
            event = 'lusty94_mushrooms:client:DryMushroom',
            args = {}
        }
    },
    {
        header = '🍄 Make ' ..Config.Processing.Processing.ProcessedItemLabel,
        txt = 'Required Items: <br>' ..Config.Processing.Processing.RequiredItemAmount..' x '.. Config.Processing.Processing.RequiredItemLabel .. ' <br> ' ..Config.Processing.Processing.RequiredItem2Amount..' x '.. Config.Processing.Processing.RequiredItem2Label,
        params = {
            event = 'lusty94_mushrooms:client:MakeMagicMushrooms',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',

        params = {
            event = 'lusty94_mushrooms:client:openMainMenu',
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
    id = 'ProcessingMenuMushroom',
    title = 'Process Mushroom Products',
    options = {
      {
        title = '💨 Dry ' ..Config.Processing.Drying.RequiredItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Drying.RequiredItemAmount..' x '.. Config.Processing.Drying.RequiredItemLabel .. ' \n ' .. Config.Processing.Drying.RequiredItem2Label,
        event = 'lusty94_mushrooms:client:DryMushroom',
        arrow = true,
      },
      {
        title = '🍄 Make ' ..Config.Processing.Processing.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.Processing.RequiredItemAmount..' x '.. Config.Processing.Processing.RequiredItemLabel .. ' \n ' ..Config.Processing.Processing.RequiredItem2Amount..' x '.. Config.Processing.Processing.RequiredItem2Label ,
        event = 'lusty94_mushrooms:client:MakeMagicMushrooms',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',

        event = 'lusty94_mushrooms:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_mushrooms:client:openProcessingMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(ProcessingMenuMushroom)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(ProcessingMenuMushroom)
    elseif MenuType == 'ox' then
        lib.showContext('ProcessingMenuMushroom')
    end
end)



local CuringMenuMushroom = {

    {
        header = 'Create Overdose Cure',
        isMenuHeader = true
    },
    {
        header = '🍾 Process Overdose Cure',
        txt = 'Required Items: <br>' ..Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. ' <br> ' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label,
        params = {
            event = 'lusty94_mushrooms:client:MakeOverDoseCure',
            args = {}
        }
    },
    {
        header = 'Main Menu',
        txt = 'Return To The Main Menu',
        params = {
            event = 'lusty94_mushrooms:client:openMainMenu',
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
    id = 'CuringMenuMushroom',
    title = 'Create Overdose Cure',
    options = {
      {
        title = '🍾 Process Overdose Cure',
        description = 'Required Items: \n' .. Config.Processing.Curing.RequiredItemAmount .. ' ' .. Config.Processing.Curing.RequiredItemLabel .. ' \n ' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label,
        event = 'lusty94_mushrooms:client:MakeOverDoseCure',
        arrow = true,
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_mushrooms:client:openMainMenu',
        arrow = true,
      },
     
    }
})



RegisterNetEvent('lusty94_mushrooms:client:openCuringMenu', function() 
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(CuringMenuMushroom)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(CuringMenuMushroom)
    elseif MenuType == 'ox' then
        lib.showContext('CuringMenuMushroom')
    end
end)


