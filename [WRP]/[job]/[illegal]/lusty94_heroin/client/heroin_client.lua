local QBCore = exports['qb-core']:GetCoreObject()
local inZone, busy, heroinTablePlaced, isLimeOnCooldown = false, false, false, false
local isEtherOnCooldown, isHydrochloricAcidOnCooldown, vehiclespawned, HeroinMissionCooldown = false, false, false, false
local lastLimeUsage, lastEtherUsage, lastHydrochloricAcidUsage, lastMissionUsage = 0, 0, 0, 0
local heroinTableProp = nil
local opiumPlants = {}
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local ShopType = Config.CoreSettings.Shop.Type
local PhoneType = Config.CoreSettings.Phone.Type
local PoliceType = Config.CoreSettings.Police.Type
local EvidenceEvent = Config.CoreSettings.EventNames.Evidence
local opiumModel = Config.CoreSettings.Props.OpiumPlants.Name
local LimeModel = Config.CoreSettings.Props.Lime.Name
local EtherModel = Config.CoreSettings.Props.Ether.Name
local HydrochloricAcidModel = Config.CoreSettings.Props.HydrochloricAcid.Name
local cooldownTimeLime = Config.CoreSettings.CoolDownTimers.Lime 
local cooldownTimeEther = Config.CoreSettings.CoolDownTimers.Ether 
local cooldownTimeHydrochloricAcid = Config.CoreSettings.CoolDownTimers.HydrochloricAcid 
local cooldownTimeMission = Config.CoreSettings.CoolDownTimers.Mission


--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Heroin: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Heroin" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message.") return end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(msg,type,time)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(title, msg, time, type, true)
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(title, msg, type, time)
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    elseif NotifyType == 'custom' then
        --insert your custom notification function here
    end
end


-------------------------------------< THREADS >------------------------------
--blip for interaction sites
CreateThread(function()
	for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)


--supplies ped and blip
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        if v.useped then
            lib.requestModel(v.model, 5000)
            heroinPed = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
            FreezeEntityPosition(heroinPed, true)
            SetEntityInvincible(heroinPed, true)
            SetBlockingOfNonTemporaryEvents(heroinPed, true)
			if v.playanim then
            	TaskStartScenarioInPlace(heroinPed, v.scenario, 0, true)
			end
			if TargetType == 'qb' then
				exports['qb-target']:AddTargetEntity(heroinPed, { options = { { type = "client", event = "lusty94_heroin:client:openSuppliesShop", icon = v.targeticon, label = v.targetlabel, },{ event = 'lusty94_heroin:client:missionEmail', type = 'client', icon = 'fa-solid fa-bars', label = 'Chemical Supplies Run', }, }, distance = v.targetdistance })
			elseif TargetType == 'ox' then
				exports.ox_target:addLocalEntity(heroinPed, { { name = 'heroinPed', icon = v.targeticon, label = v.targetlabel, event = 'lusty94_heroin:client:openSuppliesShop', distance = v.targetdistance}, { name = 'heroinPed', label = 'Chemical Supplies Run', icon = 'fa-solid fa-bars', event = 'lusty94_heroin:client:missionEmail', distance = v.targetdistance, } })
			end
			if v.useblip then
				v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
				SetBlipSprite(v.blip, v.id)
				SetBlipDisplay(v.blip, 4)
				SetBlipScale(v.blip, v.scale)
				SetBlipColour(v.blip, v.colour)
				SetBlipAsShortRange(v.blip, true)
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentString(v.title)
				EndTextCommandSetBlipName(v.blip)
			end
        end
    end
end)




--Ether prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(EtherModel, { options = { { item = Config.CoreSettings.Props.Ether.RequiredItem, event = 'lusty94_heroin:client:GetEther', type = 'client', icon = Config.CoreSettings.Props.Ether.TargetIcon, label = Config.CoreSettings.Props.Ether.TargetLabel, }, }, distance = Config.CoreSettings.Props.Ether.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(EtherModel, ({ items = Config.CoreSettings.Props.Ether.RequiredItem, name = 'Ether', label = Config.CoreSettings.Props.Ether.TargetLabel, icon = Config.CoreSettings.Props.Ether.TargetIcon, event = 'lusty94_heroin:client:GetEther', distance = Config.CoreSettings.Props.Ether.TargetDistance, }))
	end
end)

--Lime prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(LimeModel, { item = Config.CoreSettings.Props.Lime.RequiredItem, options = { { event = 'lusty94_heroin:client:GetLime', type = 'client', icon = Config.CoreSettings.Props.Lime.TargetIcon, label = Config.CoreSettings.Props.Lime.TargetLabel, }, }, distance = Config.CoreSettings.Props.Lime.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(LimeModel, ({ items = Config.CoreSettings.Props.Lime.RequiredItem, name = 'Lime', label = Config.CoreSettings.Props.Lime.TargetLabel, icon = Config.CoreSettings.Props.Lime.TargetIcon, event = 'lusty94_heroin:client:GetLime', distance = Config.CoreSettings.Props.Lime.TargetDistance, }))
	end
end)

--HydrochloricAcid prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(HydrochloricAcidModel, { item = Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, options = { { event = 'lusty94_heroin:client:GetHydrochloricAcid', type = 'client', icon = Config.CoreSettings.Props.HydrochloricAcid.TargetIcon, label = Config.CoreSettings.Props.HydrochloricAcid.TargetLabel, }, }, distance = Config.CoreSettings.Props.HydrochloricAcid.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(HydrochloricAcidModel, ({ items = Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, name = 'HydrochloricAcid', label = Config.CoreSettings.Props.HydrochloricAcid.TargetLabel, icon = Config.CoreSettings.Props.HydrochloricAcid.TargetIcon, event = 'lusty94_heroin:client:GetHydrochloricAcid', distance = Config.CoreSettings.Props.HydrochloricAcid.TargetDistance, }))
	end
end)




----------------------------< OPIUM PLANTS >----------------------------------
local opiumPlants = {}

--respawns leaves every 30 mins
CreateThread(function()
    while true do
        Wait(Config.CoreSettings.CoolDownTimers.RespawnPlants) -- waits 30 minutes DONT TOUCH THIS EDIT THE TIMER CONFIG SIDE
        for _, v in pairs(opiumPlants) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
        opiumPlants = {}
        Wait(2500) -- wait 2.5 seconds before spawning new leaves
        spawnOpium() -- spawns new leaves
    end
end)


--new method to spawn multiple leaves anywhere via config location
function spawnOpium()
	for k,v in pairs(Config.OpiumPlants) do
		local opiumModel = Config.CoreSettings.Props.OpiumPlants.Name
		lib.requestModel(Config.CoreSettings.Props.OpiumPlants.Name, 5000)
		opiumPlant = CreateObject(Config.CoreSettings.Props.OpiumPlants.Name, v.coords.x, v.coords.y, v.coords.z-1.325, false, true, false) -- if opiumPlants floating or too low edit the -1 value on the Z axis
		FreezeEntityPosition(opiumPlant, true)
		opiumPlants[#opiumPlants+1] = opiumPlant
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(opiumPlant, { options = { { item = v.item,type = "client", event = "lusty94_heroin:client:PickOpiumPlants", icon = v.icon, label = v.label, }, }, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(opiumPlant, ({ name = 'opiumPlant', items = v.item, label = v.label, icon = v.icon, event = 'lusty94_heroin:client:PickOpiumPlants', distance = v.distance, }))
		end
	end
end



-- Pick Opium Plants
RegisterNetEvent("lusty94_heroin:client:PickOpiumPlants", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID    
	for i=1, #opiumPlants, 1 do
		if #(coords - GetEntityCoords(opiumPlants[i])) < 3 then
			nearbyObject, nearbyID = opiumPlants[i], i
		end
	end   
	if nearbyObject and IsPedOnFoot(playerPed) then
		if busy then
			SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
		else
			local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
			if success then
				busy = true
				LockInventory(true)
				FreezeEntityPosition(PlayerPed, true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.PickOpiumPlants, label = Config.Language.ProgressBar.PickOpiumPlants, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.PickOpiumPlants.AnimDict, clip = Config.Animations.PickOpiumPlants.Anim, flag = Config.Animations.PickOpiumPlants.Flags,}, prop = { model = 'prop_cs_trowel', bone = 18905, pos = vec3(0.12, 0.0, 0.02), rot = vec3(76.0, 188.0, 34.0), }, }) then
					local chance2 = Config.CoreSettings.Chances.GetOpium
					if chance2 >= math.random(1,100) then
						TriggerServerEvent('lusty94_heroin:server:PickOpiumPlants')
					else
						SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
					end
					SetEntityAsMissionEntity(nearbyObject, false, true)
					DeleteObject(nearbyObject)
					opiumPlants[nearbyID] = nil
					busy = false
					LockInventory(false)
					FreezeEntityPosition(PlayerPed, false)
					ClearPedTasks(PlayerPedId())
				else 
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					FreezeEntityPosition(PlayerPed, true)
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			else
				SendNotify("Action failed.", 'error', 2000)
			end
		end 
	end
end)


---------------------------------< PROCESSING TABLE >--------------------------------

--place processing table
RegisterNetEvent('lusty94_heroin:client:openProcessingTable', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward)
    local tableModel = Config.CoreSettings.Props.ProcessingTable.Name
	if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
		if heroinTablePlaced then
            SendNotify(Config.Language.Notifications.PropErrorName, 'error', 2000)
			return
		end
		busy = true
        LockInventory(true)
		if lib.progressCircle({ duration = 5000, label = Config.Language.ProgressBar.PlaceProcessingTable, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags, }, }) 
        then
            lib.requestModel(tableModel, 5000)
            heroinTableProp = CreateObject(tableModel, x, y, z, true, false, true)
            PlaceObjectOnGroundProperly(heroinTableProp)
            SetEntityAsMissionEntity(heroinTableProp)
            FreezeEntityPosition(heroinTableProp, true)
			SetEntityHeading(heroinTableProp, GetEntityHeading(playerPed))
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(heroinTableProp, {  options = { { event = 'lusty94_heroin:client:openMainMenu', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconOpen, label =  Config.CoreSettings.Props.ProcessingTable.TargetLabelOpen, }, { event = 'lusty94_heroin:client:DeleteProcessingTable', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconRemove, label = Config.CoreSettings.Props.ProcessingTable.TargetLabelRemove, },}, distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(heroinTableProp, { { name = 'heroinTableProp', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconOpen, label =  Config.CoreSettings.Props.ProcessingTable.TargetLabelOpen, event = 'lusty94_heroin:client:openMainMenu', distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance}, { name = 'heroinTableProp', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconRemove, label = Config.CoreSettings.Props.ProcessingTable.TargetLabelRemove, event = 'lusty94_heroin:client:DeleteProcessingTable', distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance}  })
            end
            ClearPedTasks(playerPed)
            heroinTablePlaced = true
            busy = false
            LockInventory(false)
        else
            busy = false                                
            ClearPedTasks(playerPed)
            SendNotify("Action cancelled.", 'error', 3000)
        end
	end
end)

--delete processing table prop
function delete_prop(model)
    if DoesEntityExist(model) then
        DeleteEntity(model)
    end
end


-- delete processing table
RegisterNetEvent('lusty94_heroin:client:DeleteProcessingTable', function()
    if heroinTableProp then
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinTableProp, 'heroinTableProp') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinTableProp, 'heroinTableProp') end
        delete_prop(heroinTableProp)
        heroinTableProp = nil
        heroinTablePlaced = false
    end
end)



-- Function to display a notification with the remaining cooldown time
local function ShowCooldownNotification(remainingTime)
    local notificationMessage = Config.Language.Notifications.SearchTimerName .. remainingTime / 1000 .. " seconds before doing that."
	SendNotify(notificationMessage, 'error', 3000)
end


------------------------------< PROP EVENTS >---------------------------------
--chance to call police
local function PoliceCallChance()
	local chance = Config.CoreSettings.Chances.CallPolice
	if chance >= math.random(1,100) then
		if PoliceType == 'qb' then
			TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity')
		elseif PoliceType == 'ps' then
			exports['ps-dispatch']:SuspiciousActivity()
		end				
		--SendNotify(Config.Language.Notifications.PoliceNotifiedName, 'error', 2000) --uncomment this line if you want the player to be notified that police have been called
	end
end


--get Ether
RegisterNetEvent('lusty94_heroin:client:GetEther', function()
	QBCore.Functions.TriggerCallback('lusty94_heroin:get:JerryCan', function(HasItems)  
		if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
			else
				if isEtherOnCooldown then
					local remainingTime = math.ceil((lastEtherUsage + cooldownTimeEther))
					ShowCooldownNotification(remainingTime)
				else
					local success = lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'easy'}, {'e'})
					if success then
						busy = true
						LockInventory(true)
						if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.GetEther, label = Config.Language.ProgressBar.GetEther, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.GetEther.AnimDict, clip = Config.Animations.GetEther.Anim, flag = Config.Animations.GetEther.Flags,}, prop = { model = 'prop_ld_jerrycan_01', bone = 60309, pos = vec3(0.06, 0.04, 0.02), rot = vec3(194.0, 0.0, 0.0), }, }) then
							busy = false
							LockInventory(false)
							ClearPedTasks(PlayerPedId())
							isEtherOnCooldown = true
							SetTimeout(cooldownTimeEther, function() isEtherOnCooldown = false end)
							local chance = math.random(1,100)
							local chance2 = Config.CoreSettings.Chances.GetEther
							if chance <= chance2 then
								TriggerServerEvent('lusty94_heroin:server:GetEther')
							else
								SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
								PoliceCallChance()
							end
						else 
							busy = false
							LockInventory(false)
							ClearPedTasks(PlayerPedId())
							SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
						end
					else
						SendNotify("Action failed.", 'error', 2000)
					end
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
		end
	end)
end)


--get Lime
RegisterNetEvent('lusty94_heroin:client:GetLime', function()
	if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
		if isLimeOnCooldown then
			local remainingTime = math.ceil((lastLimeUsage + cooldownTimeLime))
			ShowCooldownNotification(remainingTime)
		else
			local success = lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'easy'}, {'e'})
			if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.GetLime, label = Config.Language.ProgressBar.GetLime, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.GetLime.AnimDict, clip = Config.Animations.GetLime.Anim, flag = Config.Animations.GetLime.Flags,}, prop = { model = 'prop_cs_trowel', bone = 18905, pos = vec3(0.12, 0.0, 0.02), rot = vec3(76.0, 188.0, 34.0), }, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					isLimeOnCooldown = true
					SetTimeout(cooldownTimeLime, function() isLimeOnCooldown = false end)
					local chance = math.random(1,100)
					local chance2 = Config.CoreSettings.Chances.GetLime
					if chance <= chance2 then
						TriggerServerEvent('lusty94_heroin:server:GetLime')
					else
						SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
						PoliceCallChance()
					end
				else 
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			else
				SendNotify("Action failed.", 'error', 2000)
			end
		end
	end
end)


--get HydrochloricAcid
RegisterNetEvent('lusty94_heroin:client:GetHydrochloricAcid', function()
	QBCore.Functions.TriggerCallback('lusty94_heroin:get:HydroCan', function(HasItems)  
		if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
			else
				if isHydrochloricAcidOnCooldown then
					local remainingTime = math.ceil((lastHydrochloricAcidUsage + cooldownTimeHydrochloricAcid))
					ShowCooldownNotification(remainingTime)
				else
					local success = lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'easy'}, {'e'})
					if success then
						busy = true
						LockInventory(true)
						if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.GetHydrochloricAcid, label = Config.Language.ProgressBar.GetHydrochloricAcid, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.GetHydrochloricAcid.AnimDict, clip = Config.Animations.GetHydrochloricAcid.Anim, flag = Config.Animations.GetHydrochloricAcid.Flags,}, prop = { model = 'prop_ld_jerrycan_01', bone = 60309, pos = vec3(0.06, 0.04, 0.02), rot = vec3(194.0, 0.0, 0.0), }, }) then
							busy = false
							LockInventory(false)
							ClearPedTasks(PlayerPedId())
							isHydrochloricAcidOnCooldown = true
							SetTimeout(cooldownTimeHydrochloricAcid, function() isHydrochloricAcidOnCooldown = false end)
							local chance = math.random(1,100)
							local chance2 = Config.CoreSettings.Chances.GetHydro
							if chance <= chance2 then
								TriggerServerEvent('lusty94_heroin:server:GetHydrochloricAcid')
							else
								SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
								PoliceCallChance()
							end
						else 
							busy = false
							LockInventory(false)
							ClearPedTasks(PlayerPedId())
							SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
						end
					else
						SendNotify("Action failed.", 'error', 2000)
					end
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
		end
	end)
end)



-----------------------< CHEMICALS MISSION >--------------------


------------------< MISSION >-----------------
--check if vehicle has arrived at destination
local function HasHeroinVehicleArrived(vehicle, destinationCoords, arrivalDistance)
    if DoesEntityExist(vehicle) then
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(vehicleCoords - destinationCoords)
        return IsVehicleStopped(vehicle) and distance <= arrivalDistance
    end
    return false
end

--search driver
local function SearchHeroinDriver()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
        local success = lib.skillCheck({'easy', 'easy', 'easy',}, {'e'})
        if success then
            busy = true
            LockInventory(true)
            if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.SearchGuards, label = 'Searching body...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = 'mini@repair', clip = 'fixing_a_ped',},}) then
                if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinDriver) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinDriver, 'heroinDriver') end
                busy = false
                vehiclespawned = false
                LockInventory(false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('lusty94_heroin:server:SearchGuards')
                PoliceCallChance()
            else 
                busy = false
                LockInventory(false)
                ClearPedTasks(PlayerPedId())
                SendNotify('Action cancelled.', 'error', 2000)
            end
        else
            busy = false
            SendNotify('Failed!', 'error', 2000)
        end
    end
end

--search passenger
local function SearchHeroinPassenger()
    if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
        local success = lib.skillCheck({'easy', 'easy', 'easy',}, {'e'})
        if success then
            busy = true
            LockInventory(true)
            if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.SearchGuards, label = 'Searching body...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = 'mini@repair', clip = 'fixing_a_ped',},}) then
                if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinPassenger) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinPassenger, 'heroinPassenger') end
                busy = false
                vehiclespawned = false
                LockInventory(false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('lusty94_heroin:server:SearchGuards')
				PoliceCallChance()		
            else 
                busy = false
                LockInventory(false)
                ClearPedTasks(PlayerPedId())
                SendNotify('Action cancelled.', 'error', 2000)
            end
        else
            busy = false
            SendNotify('Failed!', 'error', 2000)
        end
    end
end

--spawn delivery vehicle
local function SpawnHeroinVehicle()
    for k, v in pairs(Config.Processing.Mission.Vehicle) do
        if vehiclespawned then
            SendNotify(Config.Language.Notifications.AlreadySpawnedName, 'error', 2000)
        else
            lib.requestModel(v.model, 5000)					
			local location = Config.Processing.Mission.StartLocations[math.random(1, #Config.Processing.Mission.StartLocations)]
			local car = CreateVehicle(v.model, location.x, location.y, location.z, location.w, true, true)
            vehiclespawned = true
			SendNotify('Check your GPS for a marked vehicle.', 'success', 2000)
			local vehicleBlip = AddBlipForEntity(car)
            SetBlipSprite(vehicleBlip, 477)
            SetBlipColour(vehicleBlip, 5)
			SetBlipScale(vehicleBlip, 0.8)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Marked Vehicle")
            lib.requestModel(v.drivermodel, 5000)		
            lib.requestModel(v.passengermodel, 5000)		
            heroinDriver = CreatePed(26, v.drivermodel, location.x, location.y, location.z, location.w, true, false)
            heroinPassenger = CreatePed(26, v.passengermodel, location.x, location.y, location.z, location.w, true, false)
			SetVehicleDoorsLocked(car, 1)
            SetPedIntoVehicle(heroinDriver, car, -1)
            SetPedIntoVehicle(heroinPassenger, car, 0)
            SetPedFleeAttributes(heroinDriver, 0, 0)
            SetPedFleeAttributes(heroinPassenger, 0, 0)
            SetPedCombatAttributes(heroinDriver, 46, 1)
            SetPedCombatAttributes(heroinPassenger, 46, 1)
            SetPedCombatAbility(heroinDriver, 100)
            SetPedCombatAbility(passneger, 100)
            SetPedCombatMovement(heroinDriver, 2)
            SetPedCombatMovement(heroinPassenger, 2)
            SetPedCombatRange(heroinDriver, 2)
            SetPedCombatRange(heroinPassenger, 2)
            GiveWeaponToPed(heroinDriver, GetHashKey(v.driverweapon), 250, false, true)
            GiveWeaponToPed(heroinPassenger, GetHashKey(v.passengerweapon), 250, false, true)
            SetPedRelationshipGroupHash(heroinDriver, GetHashKey("HATES_PLAYER"))
            SetPedRelationshipGroupHash(heroinPassenger, GetHashKey("HATES_PLAYER"))
            TaskCombatPed(heroinDriver, PlayerPedId(), 0, 16)
            TaskCombatPed(heroinPassenger, PlayerPedId(), 0, 16)
			SetPedDropsWeaponsWhenDead(heroinDriver, false)
			SetPedDropsWeaponsWhenDead(heroinPassenger, false)
			local destination = Config.Processing.Mission.DestinationLocations[math.random(#Config.Processing.Mission.DestinationLocations)]
            TaskVehicleDriveToCoordLongrange(heroinDriver, car, destination.x, destination.y, destination.z, 35.0, 524340, 10.0)
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(heroinDriver, { options = { { type = "client", action = function() SearchHeroinDriver() end, icon = v.targeticon, label = v.targetlabel, } }, distance = v.targetdistance })
                exports['qb-target']:AddTargetEntity(heroinPassenger, { options = { { type = "client", action = function() SearchHeroinPassenger() end, icon = v.targeticon, label = v.targetlabel, } }, distance = v.targetdistance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(heroinDriver, { { name = 'heroinDriver', icon = v.targeticon, label = v.targetlabel, onSelect = function() SearchHeroinDriver() end, distance = v.targetdistance} })
                exports.ox_target:addLocalEntity(heroinPassenger, { { name = 'heroinPassenger', icon = v.targeticon, label = v.targetlabel, onSelect = function() SearchHeroinPassenger() end, distance = v.targetdistance} })
            end
			local destinationCoords = vector3(destination.x, destination.y, destination.z)
			local arrivalDistance = 50.0
			CreateThread(function()
				while true do
					Wait(1000) -- updates every second			
					-- Check if the heroinDriver and heroinPassenger are dead
					if DoesEntityExist(heroinDriver, heroinPassenger) and IsEntityDead(heroinDriver, heroinPassenger) then
						RemoveBlip(vehicleBlip)
						SetPedKeepTask(heroinDriver, false)
						SetPedDropsWeaponsWhenDead(heroinDriver, false)
						SetPedDropsWeaponsWhenDead(heroinPassenger, false)
						SetPedKeepTask(heroinPassenger, false)
						SetModelAsNoLongerNeeded(heroinDriver)
						SetModelAsNoLongerNeeded(heroinPassenger)
						vehiclespawned = false
						break
					end			
					-- Check if the vehicle has arrived at its destination
					if HasHeroinVehicleArrived(car, destinationCoords, arrivalDistance) then
						RemoveBlip(vehicleBlip)
						DeleteVehicle(car)
						SetPedKeepTask(heroinDriver, false)
						SetPedKeepTask(heroinPassenger, false)
						SetModelAsNoLongerNeeded(heroinDriver)
						SetModelAsNoLongerNeeded(heroinPassenger)
						DeletePed(heroinDriver)
						DeletePed(heroinPassenger)
                        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinDriver) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinDriver, 'heroinDriver') end
                        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinPassenger) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinPassenger, 'heroinPassenger') end						
						vehiclespawned = false
						break
					end
				end
			end)
        end
    end
end







--accept supply mission
RegisterNetEvent('lusty94_heroin:client:AcceptMission', function()
	HeroinMissionCooldown = false
	if HeroinMissionCooldown then		
        local remainingTime = math.ceil((lastMissionUsage + cooldownTimeMission))
        SendNotify('You must wait ' .. remainingTime / 1000 / 60 .. ' minutes before doing that.', 'error', 2000)
		HeroinMissionCooldown = false
	else
		SpawnHeroinVehicle()
		HeroinMissionCooldown = true
		SetTimeout(cooldownTimeMission, function() HeroinMissionCooldown = false end)
	end
end)


--generate mission email
RegisterNetEvent('lusty94_heroin:client:missionEmail', function()
    QBCore.Functions.TriggerCallback('lusty94_heroin:server:StartMission', function(canStart)
        if canStart then
            if HeroinMissionCooldown then
                local remainingTime = math.ceil((lastMissionUsage + cooldownTimeMission))
                SendNotify('You must wait ' .. remainingTime / 1000 / 60 .. ' minutes before doing that.', 'error', 2000)
            else
                local phoneItems = {
                    "phone", -- qb-phone
                    "black_phone", -- qs-smartphone
                    "blue_phone", -- qs-smartphone
                    "gold_phone", -- qs-smartphone
                    "red_phone", -- qs-smartphone
                    "green_phone", -- qs-smartphone
                    "greenlight_phone", -- qs-smartphone
                    "pink_phone", -- qs-smartphone
                    "white_phone", -- qs-smartphone
                    -- Add more phone items to the list if needed
                }                
                local hasCompatiblePhone = false                
                for _, phoneItemName in pairs(phoneItems) do
                    if QBCore.Functions.HasItem(phoneItemName) then
                        hasCompatiblePhone = true
                        break
                    end
                end    
                if hasCompatiblePhone then
                    SendNotify(Config.Language.Notifications.EmailWaitName, 'success', 2000)
                    Wait(1000 * 30) -- 30 seconds
                    if PhoneType == 'qb' then
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = 'Unknown Sender ',
                            subject = 'Supplies Mission',
                            message = 'Hey <br><br> I Overheard some bozo gangsters talking shit about moving a shipment of supplies <br><br> I think they have something you might want.. <br><br> Check your GPS for a location <br><br> CAREFUL THEY MIGHT BE ARMED!!',
                            button = {
                                enabled = true,
                                buttonEvent = 'lusty94_heroin:client:AcceptMission'
                            }
                        })
                    elseif PhoneType == 'qs' then
                        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                            sender = 'Unknown Sender',
                            subject = 'Supplies Mission',
                            message = 'Hey <br><br> I Overheard some bozo gangsters talking shit about moving a shipment of supplies <br><br> I think they have something you might want.. <br><br> Check your GPS for a location <br><br> CAREFUL THEY MIGHT BE ARMED!!',
                            button = {
                                enabled = true,
                                buttonEvent = 'lusty94_heroin:client:AcceptMission'
                            }
                        })
                    elseif PhoneType == 'custom' then
                        --INSERT YOUR OWN METHODS OF EMAIL FOR YOUR PHONE RESOURCE HERE
                    end
                    HeroinMissionCooldown = true                
                    SetTimeout(cooldownTimeMission, function() HeroinMissionCooldown = false end) 
                else
                    SendNotify(Config.Language.Notifications.WrongPhoneName, 'error', 2000)
                end
            end
        end
    end)
end)




------------------------< PROCESSING >------------------------

--process heroin base
RegisterNetEvent("lusty94_heroin:client:ProcessHeroinBase", function()
    QBCore.Functions.TriggerCallback('lusty94_heroin:get:ProcessHeroinBase', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessHeroinBase, label = Config.Language.ProgressBar.ProcessHeroinBase, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_heroin:server:ProcessHeroinBase')
						else
							SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
						end
                    else 
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                    end
                else
                    SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                end
            end
		else
			SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
        end
    end)
end)

--process pure heroin
RegisterNetEvent("lusty94_heroin:client:ProcessPureHeroin", function()
    QBCore.Functions.TriggerCallback('lusty94_heroin:get:ProcessPureHeroin', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessPureHeroin, label = Config.Language.ProgressBar.ProcessPureHeroin, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_heroin:server:ProcessPureHeroin')
						else
							SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
						end
                    else 
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                    end
                else
                    SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                end
            end
		else
			SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
        end
    end)
end)

--process heroin vial
RegisterNetEvent("lusty94_heroin:client:ProcessHeroinVial", function()
    QBCore.Functions.TriggerCallback('lusty94_heroin:get:ProcessHeroinVial', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessHeroinVial, label = Config.Language.ProgressBar.ProcessHeroinVial, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_heroin:server:ProcessHeroinVial')
						else
							SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
						end
                    else 
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                    end
                else
                    SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
                end
            end
		else
			SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
        end
    end)
end)

-- process overdose cure
RegisterNetEvent('lusty94_heroin:client:CreateOverDoseCure', function()
	QBCore.Functions.TriggerCallback('lusty94_heroin:get:OverDoseCureItems', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.CreateOverDoseCure, label = Config.Language.ProgressBar.CreateOverDoseCure, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_heroin:server:CreateOverDoseCure')
						else
							SendNotify(Config.Language.Notifications.FailedName, 'error', 2000)
						end
                    else 
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
                    end
                else
                    SendNotify("Action failed.", 'error', 2000)
                end
            end
		else
			SendNotify(Config.Language.Notifications.NotEnoughName, 'error', 2000)
        end
	end)
end)









----------------------< TAKE DRUGS >----------------------------

-- Function to take heroin
local function TakeHeroin()
	local player = PlayerPedId()
	local timer = Config.DrugSettings.Effects.EffectsTimer
	local StressEvent = Config.CoreSettings.EventNames.Stress
	Wait(2500) 
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000) 
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(player, true) 
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
	TriggerEvent(EvidenceEvent, "widepupils", 300)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
	DoScreenFadeOut(1000)
	Wait(2500)
	DoScreenFadeIn(1500)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(timer)
	SendNotify(Config.Language.Notifications.DrugEffectsName, 'success', 2000)
	Wait(2000)
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(player, 1.0)
    StopGameplayCamShaking(player, true)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
	SetEntityInvincible(PlayerPedId(), false)
	ClearPedTasks(player)
	AddArmourToPed(player, Config.DrugSettings.Effects.ArmourGained)
	TriggerServerEvent(StressEvent, Config.DrugSettings.Effects.StressReduced)
	SendNotify(Config.Language.Notifications.OverDoseWarningName, 'error', 2000)
	if Config.DrugSettings.Effects.OverDose then
		TriggerServerEvent('lusty94_heroin:server:OverDose')
	end
end




-- Take Heroin
RegisterNetEvent('lusty94_heroin:client:TakeHeroin', function()
	QBCore.Functions.TriggerCallback('lusty94_heroin:get:TakeHeroin', function(HasItems)  
        if HasItems then
			if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.TakeHeroin, label = Config.Language.ProgressBar.TakeHeroin, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,}, prop = { model = 'prop_syringe_01', bone = 28422, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), }, }) then
					TriggerServerEvent('lusty94_heroin:server:TakeHeroin')
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					if Config.DrugSettings.Effects.Enabled then
						TakeHeroin()
					end
				else 
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
		end
	end)
end)







---------------------< OVERDOSE & CURE >--------------------

-- overdose
RegisterNetEvent('lusty94_heroin:client:OverDose', function()
	local player = PlayerPedId()
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	DoScreenFadeOut(2000)
	Wait(2000)
	SetEntityHealth(player, GetEntityHealth(player) - Config.DrugSettings.Effects.HealthRemoved)
	Wait(2000)
	DoScreenFadeIn(2000)
	SendNotify(Config.Language.Notifications.OverDosedName, 'error', 2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	SetFlash(0, 0, 500, 7000, 500)
	StopGameplayCamShaking(player, true)
end)

-- Take overdose cure
RegisterNetEvent('lusty94_heroin:client:TakeOverDoseCure', function()
	QBCore.Functions.TriggerCallback('lusty94_heroin:get:TakeOverDoseCure', function(HasItems)  
        if HasItems then
			if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.TakeOverDoseCure, label = Config.Language.ProgressBar.TakeOverDoseCure, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,}, prop = { model = 'prop_syringe_01', bone = 28422, pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0), }, }) then
					TriggerServerEvent('lusty94_heroin:server:CureOverDose')
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
				else 
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
		end
	end)
end)





----------------< SUPPLIES SHOP >--------------------

-- open supplies shop
AddEventHandler("lusty94_heroin:client:openSuppliesShop", function()
	local heroinItems = {
        label = "Heroin Supplies", 
        slots = 5,
        items = {
            [1] = {name = "trowel",                 price = 5,      amount = 1000, info = {}, type = "item", slot = 1,},
            [2] = {name = "emptyvial",              price = 5,      amount = 1000, info = {}, type = "item", slot = 2,},
            [3] = {name = "scales",                 price = 500,    amount = 1000, info = {}, type = "item", slot = 3,},
            [4] = {name = "plasticjerrycan",        price = 100,    amount = 1000, info = {}, type = "item", slot = 4,},
            [5] = {name = "heroinprocessingtable",  price = 1000,   amount = 1000, info = {}, type = "item", slot = 5,},
        },
    }
	if ShopType == 'qb'then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "HeroinSupplyShop", heroinItems)
	elseif ShopType == 'jim' then
		TriggerServerEvent("jim-shops:ShopOpen", "shop", "HeroinSupplyShop", heroinItems)
	elseif ShopType == 'ox' then
		exports.ox_inventory:openInventory('shop',{ type = 'HeroinSupplyShop' })
	end
end)



-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true) -- used by qb, ps and ox
        --this is the old method below
        --[[         
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end         
        ]]
    else 
        LocalPlayer.state:set("inv_busy", false, true) -- used by qb, ps and ox
        --this is the old method below
        --[[        
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end        
        ]]
    end
end



AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        delete_prop(heroinTableProp)
        heroinTableProp = nil
        heroinTablePlaced = false
		vehiclespawned = false
		busy = false
		cooldownTimeMission = 0
		HeroinMissionCooldown = false
		LockInventory(false)
		for _, v in pairs(opiumPlants) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(opiumPlant, 'opiumPlant') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(opiumPlant, 'opiumPlant') end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(heroinPed, 'heroinPed') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(heroinPed, 'heroinPed') end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetModel(EtherModel) elseif TargetType == 'ox' then exports.ox_target:removeModel(EtherModel) end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetModel(LimeModel) elseif TargetType == 'ox' then exports.ox_target:removeModel(LimeModel) end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetModel(HydrochloricAcidModel) elseif TargetType == 'ox' then exports.ox_target:removeModel(HydrochloricAcidModel) end
		DeletePed(heroinPed)
		print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Heroin V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)

--dont touch
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		spawnOpium()
    end
end)