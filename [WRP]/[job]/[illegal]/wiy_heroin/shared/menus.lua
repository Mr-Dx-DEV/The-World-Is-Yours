
--main menu
lib.registerContext({
    id = 'MainMenuHeroin',
    title = 'Heroin Processing',
    options = {
      {
        title = 'Process ' .. Config.Processing.HeroinBase.ProcessedItemLabel .. ' & ' .. Config.Processing.PureHeroin.ProcessedItemLabel,
        event = 'lusty94_heroin:client:openProcessingMenu',
        arrow = true,
      },
      {
        title = 'Make A ' .. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        event = 'lusty94_heroin:client:openBaggingMenu',
        arrow = true,
      },     
      {
        title = 'Create An ' .. Config.Processing.Curing.ProcessedItemLabel,
        event = 'lusty94_heroin:client:openCuringMenu',
        arrow = true,
      },     
    }
})


--processing
lib.registerContext({
    id = 'ProcessingMenuHeroin',
    title = 'Heroin Processing',
    options = {
      {
        title = 'Process ' ..Config.Processing.HeroinBase.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.HeroinBase.RequiredItemAmount..' x '.. Config.Processing.HeroinBase.RequiredItemLabel .. '\n' .. Config.Processing.HeroinBase.RequiredItem2Amount .. ' x '.. Config.Processing.HeroinBase.RequiredItem2Label .. '\n' .. Config.Processing.HeroinBase.RequiredItem3Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem3Label .. '\n' .. Config.Processing.HeroinBase.RequiredItem4Amount .. ' x ' .. Config.Processing.HeroinBase.RequiredItem4Label,
        event = 'lusty94_heroin:client:ProcessHeroinBase',
        arrow = true,
        icon = ItemImage(Config.Processing.HeroinBase.ProcessedItemName),
        image = ItemImage(Config.Processing.HeroinBase.ProcessedItemName),
      },
      {
        title = 'Process ' ..Config.Processing.PureHeroin.ProcessedItemLabel,
        description = 'Required Items: \n' ..Config.Processing.PureHeroin.RequiredItemAmount..' x '.. Config.Processing.PureHeroin.RequiredItemLabel .. '\n' .. Config.Processing.PureHeroin.RequiredItem2Amount .. ' x '.. Config.Processing.PureHeroin.RequiredItem2Label .. '\n' .. Config.Processing.PureHeroin.RequiredItem3Amount .. ' x ' .. Config.Processing.PureHeroin.RequiredItem3Label,
        event = 'lusty94_heroin:client:ProcessPureHeroin',
        arrow = true,
        icon = ItemImage(Config.Processing.PureHeroin.ProcessedItemName),
        image = ItemImage(Config.Processing.PureHeroin.ProcessedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuHeroin',
        arrow = true,
      },
     
    }
})


--bagging
lib.registerContext({
    id = 'BaggingMenuHeroin',
    title = 'Heroin Processing',
    options = {
      {
        title = 'Bottle '..Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..' Into '.. Config.Processing.Bagging.HeroinVial.BaggedItemLabel,
        description = 'Required Items: \n'.. Config.Processing.Bagging.HeroinVial.RequiredItem2Label .. '\n' .. Config.Processing.Bagging.HeroinVial.RequiredItemAmount ..' x '.. Config.Processing.Bagging.HeroinVial.RequiredItemLabel ..'\n' ..  Config.Processing.Bagging.HeroinVial.RequiredItem3Amount .. ' x ' .. Config.Processing.Bagging.HeroinVial.RequiredItem3Label,
        event = 'lusty94_heroin:client:ProcessHeroinVial',
        arrow = true,
        icon = ItemImage(Config.Processing.Bagging.HeroinVial.BaggedItemName),
        image = ItemImage(Config.Processing.Bagging.HeroinVial.BaggedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuHeroin',
        arrow = true,
      },
     
    }
})


--overdose cure
lib.registerContext({
    id = 'CuringMenuHeroin',
    title = 'Heroin Processing',
    options = {
      {
        title = 'Process An ' .. Config.Processing.Curing.ProcessedItemLabel,
        description = 'Required Items: \n' .. Config.Processing.Curing.RequiredItem2Amount .. ' x ' .. Config.Processing.Curing.RequiredItem2Label .. '\n' .. Config.Processing.Curing.RequiredItemAmount .. ' x ' .. Config.Processing.Curing.RequiredItemLabel .. '\n' .. Config.Processing.Curing.RequiredItem3Amount .. ' x ' .. Config.Processing.Curing.RequiredItem3Label ,
        event = 'lusty94_heroin:client:CreateOverDoseCure',
        arrow = true,
        icon = ItemImage(Config.Processing.Curing.ProcessedItemName),
        image = ItemImage(Config.Processing.Curing.ProcessedItemName),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        menu = 'MainMenuHeroin',
        arrow = true,
      },
     
    }
})





-----------< EVENTS >-------------

RegisterNetEvent('lusty94_heroin:client:openMainMenu', function() 
    lib.showContext('MainMenuHeroin')
end)

RegisterNetEvent('lusty94_heroin:client:openProcessingMenu', function() 
    lib.showContext('ProcessingMenuHeroin')
end)

RegisterNetEvent('lusty94_heroin:client:openBaggingMenu', function() 
    lib.showContext('BaggingMenuHeroin')
end)

RegisterNetEvent('lusty94_heroin:client:openCuringMenu', function() 
    lib.showContext('CuringMenuHeroin')
end)