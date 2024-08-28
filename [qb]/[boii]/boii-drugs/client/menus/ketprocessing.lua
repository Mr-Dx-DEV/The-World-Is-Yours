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
        header = Language.Ketamine.Processing.Menus.Main['header'],
        txt = Language.Ketamine.Processing.Menus.Main['text'],
        icon = Language.Ketamine.Processing.Menus.Main['icon'],
        isMenuHeader = true
    },
    {
        header = Language.Ketamine.Processing.Menus.Ketamine['header'],
        txt = Language.Ketamine.Processing.Menus.Ketamine['text'],
        icon = Language.Ketamine.Processing.Menus.Ketamine['icon'],
        params = {
            event = 'boii-drugs:sv:ProcessingCheck',
            isServer = true
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
RegisterNetEvent('boii-drugs:cl:KetProcessingMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)