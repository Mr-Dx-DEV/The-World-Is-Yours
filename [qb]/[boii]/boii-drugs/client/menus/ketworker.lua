----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Main menu
local MainMenu = {
    { 
        header = Language.Ketamine.Worker.Menus.Main['header'],
        txt = Language.Ketamine.Worker.Menus.Main['text'],
        icon = Language.Ketamine.Worker.Menus.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Ketamine.Worker.Menus.Info['header'],
        txt = Language.Ketamine.Worker.Menus.Info['text'],
        icon = Language.Ketamine.Worker.Menus.Info['icon'],
        params = {
            event = 'boii-drugs:cl:RequestInfo',
        }
    },
    {
        header = Language.Ketamine.Worker.Menus.Store['header'],
        txt = Language.Ketamine.Worker.Menus.Store['text'],
        icon = Language.Ketamine.Worker.Menus.Store['icon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 10
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

-- Event
RegisterNetEvent('boii-drugs:cl:KetaminePedMenu', function()
    if Config.Ketamine.Worker.Times.Use then
        if GetClockHours() >= Config.Ketamine.Worker.Times.Open and GetClockHours() <= Config.Ketamine.Worker.Times.Close then
            exports[MenuName]:openMenu(MainMenu)
        else
            TriggerEvent('boii-drugs:notify', Language.Ketamine.Worker['timer'], 'error')
        end
    else
		exports[MenuName]:openMenu(MainMenu)
	end
end)