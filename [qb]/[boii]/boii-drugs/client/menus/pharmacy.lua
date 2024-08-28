----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Main menu
local Pharmacy = {
    {
        header = Language.Stores.Heroin.Pharmacy['pharmacyheader'],
        txt = Language.Stores.Heroin.Pharmacy['pharmacyheadertext'],
        icon = Language.Stores.Heroin.Pharmacy['pharmacyheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Stores.Heroin.Pharmacy['pharmacystoreheader'],
        txt = Language.Stores.Heroin.Pharmacy['pharmacystoreheadertext'],
        icon = Language.Stores.Heroin.Pharmacy['pharmacystoreheadericon'],
        params = {
            event = 'boii-drugs:cl:OpenShop',
            args = 2
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
-- Event
RegisterNetEvent('boii-drugs:cl:PharmacyMainMenu', function()
    if Config.Stores.Heroin.Pharmacy.Times.Use then
        if GetClockHours() >= Config.Stores.Heroin.Pharmacy.Times.Start and GetClockHours() <= Config.Stores.Heroin.Pharmacy.Times.End then
            exports[MenuName]:openMenu(Pharmacy)
        else
            TriggerEvent('boii-drugs:notify', Language.Stores.Heroin.Pharmacy['timer'], 'error')
        end
    else
		exports[MenuName]:openMenu(Pharmacy)
	end
end)
--<!>-- PHARMACY MENU END --<!>--