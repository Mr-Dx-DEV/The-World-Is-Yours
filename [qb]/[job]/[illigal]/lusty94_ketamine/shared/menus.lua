
lib.registerContext({
    id = 'MainMenuKetamine',
    title = 'Ketamine Processing',
    options = {
      {
        title = 'Process ' .. Config.Processing.Silica.GivenLabel,
        event = 'lusty94_ketamine:client:openSilicaMenu',
        arrow = true,
      },     
      {
        title = 'Process ' .. Config.Processing.LiquidKetamine.GivenLabel .. ' & ' .. Config.Processing.Ketamine.GivenLabel,
        event = 'lusty94_ketamine:client:openKetamineMenu',
        arrow = true,
      },     
      {
        title = 'Create A ' .. Config.Processing.Curing.GivenLabel,
        event = 'lusty94_ketamine:client:openCuringMenu',
        arrow = true,
      },     
    }
})




lib.registerContext({
    id = 'SilicaMenuKetamine',
    title = 'Ketamine Processing',
    options = {
      {
        title = 'Process ' ..Config.Processing.Silica.GivenLabel,
        description = 'Required Items: \n \n' ..Config.Processing.Silica.Item1Label.. '\n'..Config.Processing.Silica.Item2Label.. '\n' ..Config.Processing.Silica.Item3Label.. '\n' ..Config.Processing.Silica.Item4Label,
        event = 'lusty94_ketamine:client:ProcessSilica',
        arrow = true,
        icon = ItemImage('silica'),
        image = ItemImage('silica'),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',

        event = 'lusty94_ketamine:client:openMainMenu',
        arrow = true,
      },
     
    }
})






lib.registerContext({
    id = 'KetamineMenu',
    title = 'Ketamine Processing',
    options = {
      {
        title = 'Process ' ..Config.Processing.LiquidKetamine.GivenLabel,
        description = 'Required Items: \n \n' ..Config.Processing.LiquidKetamine.Item1Label.. '\n'..Config.Processing.LiquidKetamine.Item2Label.. '\n' ..Config.Processing.LiquidKetamine.Item3Label.. '\n' ..Config.Processing.LiquidKetamine.Item4Label.. '\n' ..Config.Processing.LiquidKetamine.Item5Label,
        event = 'lusty94_ketamine:client:ProcessLiquidKetamine',
        arrow = true,
        icon = ItemImage('liquidketamine'),
        image = ItemImage('liquidketamine'),
      },
      {
        title = 'Process ' ..Config.Processing.Ketamine.GivenLabel,
        description = 'Required Items: \n \n' ..Config.Processing.Ketamine.Item1Label.. '\n'..Config.Processing.Ketamine.Item2Label.. '\n' ..Config.Processing.Ketamine.Item3Label,
        event = 'lusty94_ketamine:client:ProcessKetamine',
        arrow = true,
        icon = ItemImage('ketamine'),
        image = ItemImage('ketamine'),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',

        event = 'lusty94_ketamine:client:openMainMenu',
        arrow = true,
      },
     
    }
})





lib.registerContext({
    id = 'CuringMenuKetamine',
    title = 'Ketamine Processing',
    options = {
      {
        title = 'Process An ' .. Config.Processing.Curing.GivenLabel,
        description = 'Required Items: \n \n' ..Config.Processing.Curing.Item1Label.. '\n'..Config.Processing.Curing.Item2Label.. '\n' ..Config.Processing.Curing.Item3Label,
        event = 'lusty94_ketamine:client:CreateOverDoseCure',
        arrow = true,
        icon = ItemImage('overdosecure'),
        image = ItemImage('overdosecure'),
      },
      {
        title = 'Main Menu',
        description = 'Return To The Main Menu',
        event = 'lusty94_ketamine:client:openMainMenu',
        arrow = true,
      },
     
    }
})




RegisterNetEvent('lusty94_ketamine:client:openMainMenu', function() 
    lib.showContext('MainMenuKetamine')
end)

RegisterNetEvent('lusty94_ketamine:client:openSilicaMenu', function() 
    lib.showContext('SilicaMenuKetamine')
end)

RegisterNetEvent('lusty94_ketamine:client:openKetamineMenu', function() 
    lib.showContext('KetamineMenu')
end)

RegisterNetEvent('lusty94_ketamine:client:openCuringMenu', function() 
    lib.showContext('CuringMenuKetamine')
end)