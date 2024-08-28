----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Event to open menu
RegisterNetEvent('boii-billiards:cl:AccessGarage', function(data)
    local player = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(player)
    if inVehicle then
        ReturnVehicle()
    else
        VehicleRentMenu()
    end
end)
function VehicleRentMenu()
    exports[MenuName]:openMenu({
        {
            header = Language.Garage['rentheader'],
            icon = Language.Garage['rentheadericon'],
            isMenuHeader = true
        },
        {
            header = Language.Garage['rentmenuheader'],
            txt = Language.Garage['rentmenutext'],
            icon = Language.Garage['rentmenuicon'],
            params = {
                event = 'boii-billiards:cl:RentVehicle',
				args = 1
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = {
                event = 'boii-billiards:cl:StopMenu'
            }
        },
    })
end 
function ReturnVehicle()
    exports[MenuName]:openMenu({
		{
            header = Language.Garage['rentheader'],
            icon = Language.Garage['rentheadericon'],
            isMenuHeader = true
        },
		{
            header = Language.Garage['returnmenuheader'],
            txt = Language.Garage['returnmenutext'],
            icon = Language.Garage['returnmenuicon'],
            params = {
                event = 'boii-billiards:cl:ReturnVehicle',
				args = 1
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = {
                event = 'boii-billiards:cl:StopMenu'
            }
        },
    })
end