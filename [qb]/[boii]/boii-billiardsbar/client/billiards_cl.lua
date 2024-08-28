----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local InputName = Config.CoreSettings.InputName
local DutyEvent = Config.CoreSettings.DutyEvent
local ClothingEvent = Config.CoreSettings.ClothingEvent
local FuelScript = Config.CoreSettings.FuelScript
local RemoveStress = Config.CoreSettings.RemoveStressEvent
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local PlayerLoad = Config.CoreSettings.PlayerLoad
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- NOTIFICATIONS START --<!>--
RegisterNetEvent('boii-billiards:notify')
AddEventHandler('boii-billiards:notify', function(msg, type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS END --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, v.id)
        SetBlipDisplay(v.blip, 4)
        SetBlipScale(v.blip, v.scale)
        SetBlipColour(v.blip, v.colour)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(v.title)
        EndTextCommandSetBlipName(v.blip)
    end
end)
--<!>-- BLIPS END --<!>--

--<!>-- TOGGLE DUTY START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Duty) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-billiards:cl:DutyMenu',
            icon = Language.Targeting['dutyicon'],
            label = Language.Targeting['dutylabel'],
            job = Config.JobSettings.Job
            },
        },
        distance = v.distance,
    })
end
--<!>-- TOGGLE DUTY END --<!>--

--<!>-- OUTFITS START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Clothing) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-billiards:cl:ChangeOutfit',
            icon = Language.Targeting['outfiticon'],
            label = Language.Targeting['outfitlabel'],
            job = Config.JobSettings.Job
            },
        },
        distance = v.distance,
    })
end
RegisterNetEvent('boii-billiards:cl:ChangeOutfit', function()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.5)
    TriggerEvent(ClothingEvent)
end)
--<!>-- OUTFITS END --<!>--

--<!>-- JOB MANAGEMENT START --<!>--
for k, v in pairs(Config.JobSettings.Locations.JobManagement) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = Config.CoreSettings.ManagementEvent,
            icon = Language.Targeting['bossicon'],
            label = Language.Targeting['bosslabel'],
            job = {[Config.JobSettings.Job] = 5,[Config.JobSettings.Job] = 6}
            },
        },
        distance = v.distance,
    })
end
--<!>-- JOB MANAGEMENT END --<!>--

--<!>-- EPOS START --<!>--
-- EPOS
for k, v in pairs(Config.JobSettings.Locations.EPOS) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:Pay',
                icon = Language.Targeting['eposicon'],
                label = Language.Targeting['eposlabel'],
                job = Config.JobSettings.Job
            },
        },
        distance = v.distance,
    })
end
--<!>-- EPOS START --<!>--

--<!>-- OBJECTS START --<!>--
RegisterNetEvent(PlayerLoad, function()
    CreateThread(function()
        RequestModel(`prop_cs_silver_tray`)
        while not HasModelLoaded(`prop_cs_silver_tray`) do 
            Wait(1)
        end
        RequestModel(`prop_bar_fridge_01`)
        while not HasModelLoaded(`prop_bar_fridge_01`) do 
            Wait(1) 
        end 
        RequestModel(`v_med_cor_minifridge`)
        while not HasModelLoaded(`v_med_cor_minifridge`) do 
            Wait(1) 
        end
        RequestModel(`v_res_tt_platepile`)
        while not HasModelLoaded(`v_res_tt_platepile`) do 
            Wait(1) 
        end
        RequestModel(`prop_mug_02`)
        while not HasModelLoaded(`prop_mug_02`) do 
            Wait(1) 
        end
        RequestModel(`prop_mug_01`)
        while not HasModelLoaded(`prop_mug_01`) do 
            Wait(1) 
        end
        Tray = CreateObject(`prop_cs_silver_tray`, -1586.79, -993.84, 13.17, false, false, false)
        Tray2 = CreateObject(`prop_cs_silver_tray`, -1586.78, -996.26, 13.17, false, false, false)
        Fridge = CreateObject(`prop_bar_fridge_01`, -1581.25, -990.68, 12.10, false, false, false)
        MiniFridge = CreateObject(`v_med_cor_minifridge`, -1585.9, -996.05, 12.10, false, false, false)
        Plates = CreateObject(`v_res_tt_platepile`, -1584.46, -994.55, 13.17, false, false, false)
        Cup = CreateObject(`prop_mug_02`, -1584.46, -994.55, 13.77, false, false, false)
        SetEntityHeading(Tray, 233.22)
        SetEntityHeading(Tray2, 319.00)
        SetEntityHeading(Fridge, 230.20)
        SetEntityHeading(MiniFridge, 230.20)
        SetEntityHeading(Plates, 230.20)
        SetEntityHeading(Cup, 140.20)
        FreezeEntityPosition(Tray, true)
        FreezeEntityPosition(Tray2, true)
        FreezeEntityPosition(Fridge, true)
        FreezeEntityPosition(MiniFridge, true)
        FreezeEntityPosition(Plates, true)
        FreezeEntityPosition(Cup, true)
    end)
end)

--<!>-- OBJECTS END --<!>--

--<!>-- VEHICLE RENTAL START --<!>--
CreateThread(function()
	for k ,v in pairs(Config.Garage.Ped) do
		RequestModel(GetHashKey(v.model))
		while not HasModelLoaded(GetHashKey(v.model)) do
			Wait(1)
		end
		garageped = CreatePed(4, v.hash,v.x,v.y,v.z-1, 3374176, false, true)
		SetEntityHeading(garageped, v.h)
		FreezeEntityPosition(garageped, true)
		SetEntityInvincible(garageped, true)
		SetBlockingOfNonTemporaryEvents(garageped, true)
		TaskStartScenarioInPlace(garageped, v.scenario, 0, true)
		-- qb-target ped export
		exports[TargetName]:AddTargetModel(v.model, {options = {{event = 'boii-billiards:cl:AccessGarage',icon = Language.Targeting['garageicon'],label = Language.Targeting['garagelabel'],job = Config.JobSettings.Job}},distance = 8.0})
	end
end)
RegisterNetEvent('boii-billiards:cl:RentVehicle', function()
	Core.Functions.TriggerCallback('boii-billiards:sv:MoneyCheck', function(price)
		if price then
            Core.Functions.SpawnVehicle(Config.Garage.Vehicle, function(van)
                SetVehicleNumberPlateText(van, 'BILLIARD')
                exports[FuelScript]:SetFuel(van, 100.0)
                SetEntityHeading(van, Config.Garage.Heading)
                TaskWarpPedIntoVehicle(PlayerPedId(), van, -1)
                TriggerEvent('vehiclekeys:client:SetOwner', Core.Functions.GetPlate(van))
                SetVehicleEngineOn(van, true, true)
            end, Config.Garage.Spawn, true)  
		end
	end)
end)
RegisterNetEvent('boii-billiards:cl:ReturnVehicle', function()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player) then
        local van = GetVehiclePedIsIn(player,true) 
        Core.Functions.DeleteVehicle(van)
        SetEntityCoords(player, Config.Garage.Spawn.x, Config.Garage.Spawn.y, Config.Garage.Spawn.z, 0, 0, 0, false) 
        SetEntityHeading(player, Config.Garage.Heading)
        TriggerServerEvent('boii-billiards:sv:ReturnDeposit')
	end
end)
--<!>-- VEHICLE RENTAL END --<!>--