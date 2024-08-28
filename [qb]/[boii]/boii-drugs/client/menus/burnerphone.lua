----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

local MainMenu = {
    {
        header = Language.DrugSales.Menus['phoneheader'],
        txt = Language.DrugSales.Menus['phoneheadertext'],
        icon = Language.DrugSales.Menus['phoneheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.DrugSales.Menus['streetsellingheader'],
        icon = Language.DrugSales.Menus['streetsellingheadericon'],
        params = {
            event = 'boii-drugs:cl:ToggleStreet', -- Do not edit this
        }
    },
    {
        header = Language.DrugSales.Menus['deliveriesheader'],
        icon = Language.DrugSales.Menus['deliveriesheadericon'],
        params = {
            event = 'boii-drugs:cl:ToggleDeliveries', -- Do not edit this
        }
    }, -- Add more choices here
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-drugs:cl:StopMenu'
        }
    }
}

--<!>-- BURNER PHONE MENU START --<!>--
RegisterNetEvent('boii-drugs:cl:ToggleSellingMenu', function()
    local player = PlayerPedId()
    if not IsPedOnFoot(player) then 
        TriggerEvent('boii-drugs:notify', Language.DrugSales.Shared['novehicle'], 'error')
        ClearPedTasks(player)
        return 
    end
    TaskStartScenarioInPlace(player, "WORLD_HUMAN_STAND_MOBILE", 0, true)
    exports[MenuName]:openMenu(MainMenu)
end)
--<!>-- BURNER PHONE MENU END --<!>--