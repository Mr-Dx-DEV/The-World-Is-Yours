local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local TargetType = Config.CoreSettings.Target.Type
local PhoneType = Config.CoreSettings.Phone.Type
local PoliceType = Config.CoreSettings.Police.Type
local EvidenceEvent = Config.CoreSettings.EventNames.Evidence
local StressAmount = Config.DrugSettings.Effects.StressReduced
local ArmourAmount = Config.DrugSettings.Effects.ArmourGained
local rockBlips, spawnedRocks = {}, {}
local ketamineTableProp = nil
local vehicleSpawned, busy, ketamineTablePlaced, hasSearched, hasRequested = false, false, false, false, false

--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Ketamine: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Ketamine" end
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

--supplies ped and blip
CreateThread(function()
    for k, v in pairs(Config.SupplyPeds) do
        if v.useped then
            lib.RequestModel(v.model, 5000)
            ketPeds = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
            FreezeEntityPosition(ketPeds, true)
            SetEntityInvincible(ketPeds, true)
            SetBlockingOfNonTemporaryEvents(ketPeds, true)
			if v.playanim then
            	TaskStartScenarioInPlace(ketPeds, v.scenario, 0, v.playanim)
			end
			if TargetType == 'qb' then
				exports['qb-target']:AddTargetEntity(ketPeds, { options = { { type = "client", event = "lusty94_ketamine:client:openSuppliesShop", icon = v.icon, label = v.label, },{ event = 'lusty94_ketamine:client:missionEmail', type = 'client', icon = 'fa-solid fa-bars', label = 'Chemical Supplies Run', }, }, distance = v.distance })
			elseif TargetType == 'ox' then
				exports.ox_target:addLocalEntity(ketPeds, { { name = 'ketPeds', icon = v.icon, label = v.label, event = 'lusty94_ketamine:client:openSuppliesShop', distance = v.distance}, { name = 'ketaminePed', label = 'Chemical Supplies Run', icon = 'fa-solid fa-bars', event = 'lusty94_ketamine:client:missionEmail', distance = v.distance, } })
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


--target props
CreateThread(function()
	for k,v in pairs(Config.CoreSettings.Props.TargetModels) do
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetModel(v.model, { item = v.item, options = { { event = v.event, type = 'client', icon = v.icon, label = v.label, }, }, distance = v.distance, })
		elseif TargetType == 'ox' then
			exports.ox_target:addModel(v.model, ({ items = v.item, name = v.model, label = v.label, icon = v.icon, event = v.event, distance = v.distance, }))
		end
	end
end)


--new method to spawn multiple rocks anywhere via config location
function spawnQuartz()
	for k,v in pairs(Config.InteractionLocations.Rocks) do
		lib.requestModel(v.model, 5000)
		quartz = CreateObject(v.model, v.coords.x, v.coords.y, v.coords.z-1.325, true, false, false)
		SetEntityHeading(v.model, v.coords.w)
		FreezeEntityPosition(quartz, true)
		spawnedRocks[#spawnedRocks+1] = quartz
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(quartz, { options = { { item = v.item,type = "client", event = 'lusty94_ketamine:client:MineQuartzRock', icon = v.icon, label = v.label, }, }, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(quartz, ({ name = 'quartz', items = v.item, label = v.label, icon = v.icon, event = 'lusty94_ketamine:client:MineQuartzRock', distance = v.distance, }))
		end
        local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite(blip, 66)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Quartz Rock")
        EndTextCommandSetBlipName(blip)
        rockBlips[quartz] = blip
	end
end

--respawns rocks every 30 mins
CreateThread(function()
    while true do
        Wait(Config.CoreSettings.Timers.RespawnObjects) -- waits 30 mins before deleting rocks and respawning them
        for _, v in pairs(spawnedRocks) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
		spawnedRocks = {}
		spawnQuartz()
    end
end)

-- Function to remove all blips from a table
function clearBlips(blipTable)
    for _, blip in pairs(blipTable) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    for k, _ in pairs(blipTable) do
        blipTable[k] = nil
    end
end

--search timer function
function SearchTimer()
    local timer =  Config.CoreSettings.Timers.SearchCooldown
    if hasSearched then
        return
    end
    hasSearched = true
    SetTimeout(timer, function()
        hasSearched = false
    end)
end


--mine quartz rocks
RegisterNetEvent("lusty94_ketamine:client:MineQuartzRock", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID    
	for i=1, #spawnedRocks, 1 do
		if #(coords - GetEntityCoords(spawnedRocks[i])) < 3 then
			nearbyObject, nearbyID = spawnedRocks[i], i
		end
	end   
	if nearbyObject and IsPedOnFoot(playerPed) then
		if busy then
			SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
		else
			local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
			if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.MineQuartz,
					label = Config.Language.ProgressBar.MineQuartz, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = true, },  
					anim = { dict = Config.Animations.MineQuartz.AnimDict, clip = Config.Animations.MineQuartz.Anim, flag = Config.Animations.MineQuartz.Flags,}, 
					prop = { model = Config.Animations.MineQuartz.Prop, bone = Config.Animations.MineQuartz.Bone, pos = Config.Animations.MineQuartz.Pos, rot = Config.Animations.MineQuartz.Rot, }, 
				}) then
					local chance2 = Config.CoreSettings.Chances.MineQuartz
					if chance2 >= math.random(1,100) then
						TriggerServerEvent('lusty94_ketamine:server:MineQuartzRock')
						if rockBlips[nearbyObject] then
                            RemoveBlip(rockBlips[nearbyObject])
                            rockBlips[nearbyObject] = nil
                        end
					else
						SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
					end
					SetEntityAsMissionEntity(nearbyObject, false, true)
					DeleteObject(nearbyObject)
					spawnedRocks[nearbyID] = nil
					busy = false
					LockInventory(false)
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
				end
			else
				SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
			end
		end 
	end
end)

--siphon ether
RegisterNetEvent('lusty94_ketamine:client:SiphonEther', function()
    if hasSearched then
        SendNotify(Config.Language.Notifications.Cooldown, 'error', 2000)
        return
    else
        QBCore.Functions.TriggerCallback('lusty94_ketamine:get:PlasticJerryCan', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.CollectEther,
                            label = Config.Language.ProgressBar.CollectEther,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.CollectEther.AnimDict, clip = Config.Animations.CollectEther.Anim, flag = Config.Animations.CollectEther.Flags,},
                            prop = { model = Config.Animations.CollectEther.Prop, bone = Config.Animations.CollectEther.Bone, pos = Config.Animations.CollectEther.Pos, rot = Config.Animations.CollectEther.Rot, },
                        }) then
                            SearchTimer()
                            local chance = Config.CoreSettings.Chances.CollectEther
                            if chance >= math.random(1,100) then
                                TriggerServerEvent('lusty94_ketamine:server:SiphonEther')
                            else
								alertPoliceChance()
                                SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
                            end
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    end
end)


--siphon hydrochloric acid
RegisterNetEvent('lusty94_ketamine:client:SiphonHydroAcid', function()
    if hasSearched then
        SendNotify(Config.Language.Notifications.Cooldown, 'error', 2000)
        return
    else
        QBCore.Functions.TriggerCallback('lusty94_ketamine:get:PlasticJerryCan', function(HasItems)  
            if HasItems then
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.CollectHydro,
                            label = Config.Language.ProgressBar.CollectHydro,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = { car = true, move = true, },
                            anim = { dict = Config.Animations.CollectHydro.AnimDict, clip = Config.Animations.CollectHydro.Anim, flag = Config.Animations.CollectHydro.Flags,},
                            prop = { model = Config.Animations.CollectHydro.Prop, bone = Config.Animations.CollectHydro.Bone, pos = Config.Animations.CollectHydro.Pos, rot = Config.Animations.CollectHydro.Rot, },
                        }) then
                            SearchTimer()
                            local chance = Config.CoreSettings.Chances.CollectHydro
                            if chance >= math.random(1,100) then
                                TriggerServerEvent('lusty94_ketamine:server:SiphonHydro')
                            else
								alertPoliceChance()
                                SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
                            end
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
            end
        end)
    end
end)

---------------------------------< PROCESSING TABLE >--------------------------------



--place processing table
RegisterNetEvent('lusty94_ketamine:client:openProcessingTable', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward)
    local tableModel = Config.CoreSettings.Props.ProcessingTable.model
	if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
		if ketamineTablePlaced then
            SendNotify(Config.Language.Notifications.PropError, 'error', 2000)
			return
		end
		busy = true
        LockInventory(true)
		if lib.progressCircle({ 
			duration = 5000, 
			label = Config.Language.ProgressBar.PlaceProcessingTable, 
			position = 'bottom', 
			useWhileDead = false, 
			canCancel = true,
			disable = { car = true, move = true, }, 
			anim = { dict = Config.Animations.PlaceProcessingTable.AnimDict, clip = Config.Animations.PlaceProcessingTable.Anim, flag = Config.Animations.PlaceProcessingTable.Flags, }, 
		}) then
            lib.requestModel(tableModel, 5000)
            ketamineTableProp = CreateObject(tableModel, x, y, z, true, false, true)
            PlaceObjectOnGroundProperly(ketamineTableProp)
            SetEntityAsMissionEntity(ketamineTableProp)
            FreezeEntityPosition(ketamineTableProp, true)
			SetEntityHeading(ketamineTableProp, GetEntityHeading(playerPed) - 180)
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(ketamineTableProp, {  options = { { event = 'lusty94_ketamine:client:openMainMenu', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.icon, label =  Config.CoreSettings.Props.ProcessingTable.label, }, { event = 'lusty94_ketamine:client:DeleteProcessingTable', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.closeicon, label = Config.CoreSettings.Props.ProcessingTable.closelabel, },}, distance = Config.CoreSettings.Props.ProcessingTable.distance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(ketamineTableProp, { { name = 'ketamineTableProp', icon = Config.CoreSettings.Props.ProcessingTable.icon, label =  Config.CoreSettings.Props.ProcessingTable.label, event = 'lusty94_ketamine:client:openMainMenu', distance = Config.CoreSettings.Props.ProcessingTable.distance}, { name = 'ketamineTableProp', icon = Config.CoreSettings.Props.ProcessingTable.closeicon, label = Config.CoreSettings.Props.ProcessingTable.closelabel, event = 'lusty94_ketamine:client:DeleteProcessingTable', distance = Config.CoreSettings.Props.ProcessingTable.distance}  })
            end
            ketamineTablePlaced = true
            busy = false
            LockInventory(false)
        else
            busy = false                                
            ClearPedTasks(playerPed)
            SendNotify(Config.Language.Notifications.Cancelled, 'error', 3000)
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
RegisterNetEvent('lusty94_ketamine:client:DeleteProcessingTable', function()
    if ketamineTableProp then
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketamineTableProp, 'ketamineTableProp') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketamineTableProp, 'ketamineTableProp') end
        delete_prop(ketamineTableProp)
        ketamineTableProp = nil
        ketamineTablePlaced = false
    end
end)



------------------< MISSION >-----------------

 --search timer function
function missionTimer()
    local timer =  Config.CoreSettings.Timers.RequestMission
    if hasRequested then
        return
    end
    hasRequested = true
    SetTimeout(timer, function()
        hasRequested = false
    end)
end

--police call chance function
function alertPoliceChance()
	local chance = Config.CoreSettings.Chances.AlertPolice
	if chance >= math.random(1,100) then
		if PoliceType == 'qb' then
			TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity')
		elseif PoliceType == 'ps' then
			exports['ps-dispatch']:SuspiciousActivity()
		elseif PoliceType == 'custom' then
			--insert your own police notification system here
		end
	end
end


--check if vehicle has arrived at destination
local function hasKetVehicleArrived(vehicle, destinationCoords, arrivalDistance)
    if DoesEntityExist(vehicle) then
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(vehicleCoords - destinationCoords)
        return IsVehicleStopped(vehicle) and distance <= arrivalDistance
    end
    return false
end

--search driver
local function searchKetDriver()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local success = lib.skillCheck({'easy', 'easy', 'easy',}, {'e'})
        if success then
            busy = true
            LockInventory(true)
            if lib.progressCircle({ 
				duration = Config.CoreSettings.Timers.SearchBody, 
				label = Config.Language.ProgressBar.SearchBody,
				position = 'bottom', 
				useWhileDead = false, 
				canCancel = true, 
				disable = { car = true, move = true, }, 
				anim = { dict = 'mini@repair', clip = 'fixing_a_ped',},
			}) then
                if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketDriver) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketDriver, 'ketDriver') end
                TriggerServerEvent('lusty94_ketamine:server:SearchBody')
                busy = false
                vehicleSpawned = false
                LockInventory(false)
                alertPoliceChance()
            else 
                busy = false
                LockInventory(false)
                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
            end
        else
            busy = false
            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
        end
    end
end

--search passenger
local function searchKetPassenger()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local success = lib.skillCheck({'easy', 'easy', 'easy',}, {'e'})
        if success then
            busy = true
            LockInventory(true)
            if lib.progressCircle({ 
				duration = Config.CoreSettings.Timers.SearchBody, 
				label = Config.Language.ProgressBar.SearchBody,
				position = 'bottom', 
				useWhileDead = false, 
				canCancel = true, 
				disable = { car = true, move = true, }, 
				anim = { dict = 'mini@repair', clip = 'fixing_a_ped',},
			}) then
                if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketPassenger) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketPassenger, 'ketPassenger') end
                TriggerServerEvent('lusty94_ketamine:server:SearchBody')
                busy = false
                vehicleSpawned = false
                LockInventory(false)
				alertPoliceChance()		
            else 
                busy = false
                LockInventory(false)
                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
            end
        else
            busy = false
            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
        end
    end
end

--spawn delivery vehicle
local function spawnKetVehicle()
    for k, v in pairs(Config.Processing.Mission.Vehicle) do
        if vehicleSpawned then
            SendNotify(Config.Language.Notifications.AlreadySpawned, 'error', 2000)
        else
            lib.requestModel(v.model, 5000)					
			local location = Config.Processing.Mission.Spawns[math.random(1, #Config.Processing.Mission.Spawns)]
			local car = CreateVehicle(v.model, location.x, location.y, location.z, location.w, true, true)
            vehicleSpawned = true
			SendNotify('Check your GPS for a marked vehicle.', 'success', 2000)
			local ketVehBlip = AddBlipForEntity(car)
            SetBlipSprite(ketVehBlip, 477)
            SetBlipColour(ketVehBlip, 5)
			SetBlipScale(ketVehBlip, 0.8)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Marked Vehicle")
            lib.requestModel(v.drivermodel, 5000)		
            lib.requestModel(v.passengermodel, 5000)		
            ketDriver = CreatePed(26, v.drivermodel, location.x, location.y, location.z, location.w, true, false)
            ketPassenger = CreatePed(26, v.passengermodel, location.x, location.y, location.z, location.w, true, false)
			SetVehicleDoorsLocked(car, 1)
            SetPedIntoVehicle(ketDriver, car, -1)
            SetPedIntoVehicle(ketPassenger, car, 0)
            SetPedFleeAttributes(ketDriver, 0, 0)
            SetPedFleeAttributes(ketPassenger, 0, 0)
            SetPedCombatAttributes(ketDriver, 46, 1)
            SetPedCombatAttributes(ketPassenger, 46, 1)
            SetPedCombatAbility(ketDriver, 100)
            SetPedCombatAbility(passneger, 100)
            SetPedCombatMovement(ketDriver, 2)
            SetPedCombatMovement(ketPassenger, 2)
            SetPedCombatRange(ketDriver, 2)
            SetPedCombatRange(ketPassenger, 2)
            GiveWeaponToPed(ketDriver, GetHashKey(v.driverweapon), 250, false, true)
            GiveWeaponToPed(ketPassenger, GetHashKey(v.passengerweapon), 250, false, true)
            SetPedRelationshipGroupHash(ketDriver, GetHashKey("HATES_PLAYER"))
            SetPedRelationshipGroupHash(ketPassenger, GetHashKey("HATES_PLAYER"))
            TaskCombatPed(ketDriver, PlayerPedId(), 0, 16)
            TaskCombatPed(ketPassenger, PlayerPedId(), 0, 16)
			SetPedDropsWeaponsWhenDead(ketDriver, false)
			SetPedDropsWeaponsWhenDead(ketPassenger, false)
			local destination = Config.Processing.Mission.Destinations[math.random(#Config.Processing.Mission.Destinations)]
            TaskVehicleDriveToCoordLongrange(ketDriver, car, destination.x, destination.y, destination.z, 35.0, 524340, 10.0)
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(ketDriver, { options = { { type = "client", action = function() searchKetDriver() end, icon = v.targeticon, label = v.targetlabel, } }, distance = v.targetdistance })
                exports['qb-target']:AddTargetEntity(ketPassenger, { options = { { type = "client", action = function() searchKetPassenger() end, icon = v.targeticon, label = v.targetlabel, } }, distance = v.targetdistance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(ketDriver, { { name = 'ketDriver', icon = v.targeticon, label = v.targetlabel, onSelect = function() searchKetDriver() end, distance = v.targetdistance} })
                exports.ox_target:addLocalEntity(ketPassenger, { { name = 'ketPassenger', icon = v.targeticon, label = v.targetlabel, onSelect = function() searchKetPassenger() end, distance = v.targetdistance} })
            end
			local destinationCoords = vector3(destination.x, destination.y, destination.z)
			local arrivalDistance = 50.0
			CreateThread(function()
				while true do
					Wait(1000) -- updates every second			
					-- Check if the ketDriver and ketPassenger are dead
					if DoesEntityExist(ketDriver, ketPassenger) and IsEntityDead(ketDriver, ketPassenger) then
						RemoveBlip(ketVehBlip)
						SetPedKeepTask(ketDriver, false)
						SetPedDropsWeaponsWhenDead(ketDriver, false)
						SetPedDropsWeaponsWhenDead(ketPassenger, false)
						SetPedKeepTask(ketPassenger, false)
						SetModelAsNoLongerNeeded(ketDriver)
						SetModelAsNoLongerNeeded(ketPassenger)
						vehicleSpawned = false
						break
					end			
					-- Check if the vehicle has arrived at its destination
					if hasKetVehicleArrived(car, destinationCoords, arrivalDistance) then
						RemoveBlip(ketVehBlip)
						DeleteVehicle(car)
						SetPedKeepTask(ketDriver, false)
						SetPedKeepTask(ketPassenger, false)
						SetModelAsNoLongerNeeded(ketDriver)
						SetModelAsNoLongerNeeded(ketPassenger)
						DeletePed(ketDriver)
						DeletePed(ketPassenger)
                        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketDriver) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketDriver, 'ketDriver') end
                        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketPassenger) elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketPassenger, 'ketPassenger') end						
						vehicleSpawned = false
						break
					end
				end
			end)
        end
    end
end


--accept supply mission
RegisterNetEvent('lusty94_ketamine:client:AcceptMission', function()
	if hasRequested then		
        SendNotify('You must wait a while before doing that.', 'error', 2000)
		return
	else
		hasRequested = true
		spawnKetVehicle()
		missionTimer()
	end
end)


--generate mission email
RegisterNetEvent('lusty94_ketamine:client:missionEmail', function()
    QBCore.Functions.TriggerCallback('lusty94_ketamine:server:StartMission', function(canStart)
        if canStart then
            if hasRequested then		
				SendNotify('You must wait a while before doing that.', 'error', 2000)
				return
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
                    SendNotify(Config.Language.Notifications.SendMessage, 'success', 2000)

                    --Wait(1000 * 30) -- 30 seconds
                    if PhoneType == 'qb' then
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = 'Unknown Sender ',
                            subject = 'Supplies Mission',
                            message = 'Hey <br><br> I Overheard some useless gangsters talking shit about moving a shipment of supplies <br><br> I think they have something you might want.. <br><br> Check your GPS for a location <br><br> CAREFUL THEY MIGHT BE ARMED!!',
                            button = {
                                enabled = true,
                                buttonEvent = 'lusty94_ketamine:client:AcceptMission'
                            }
                        })
                    elseif PhoneType == 'qs' then
                        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
                            sender = 'Unknown Sender',
                            subject = 'Supplies Mission',
                            message = 'Hey <br><br> I Overheard some useless gangsters talking shit about moving a shipment of supplies <br><br> I think they have something you might want.. <br><br> Check your GPS for a location <br><br> CAREFUL THEY MIGHT BE ARMED!!',
                            button = {
                                enabled = true,
                                buttonEvent = 'lusty94_ketamine:client:AcceptMission'
                            }
                        })
                    elseif PhoneType == 'custom' then
                        --INSERT YOUR OWN METHODS OF EMAIL FOR YOUR PHONE RESOURCE HERE
                    end
                else
                    SendNotify(Config.Language.Notifications.WrongPhone, 'error', 2000)
                end
            end
        end
    end)
end)



------------------------< PROCESSING >------------------------
--process silica
RegisterNetEvent('lusty94_ketamine:client:ProcessSilica', function()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local input = lib.inputDialog('Ketamine Processing', {
			{
				type = 'slider',
				required = true,
				default = 1,
				min = 1,
				max = 10, -- edit maximum allowed amount to process at once here
			},
            {
                type = 'input',
                placeholder = 'How much do you want to process?',
                disabled = true,
                icon = 'arrow-right',
            },
        })
        if input then
            if input and tonumber(input[1]) > 0 then
                local amount = tonumber(input[1])
                QBCore.Functions.TriggerCallback('lusty94_ketamine:get:ProcessSilica', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessItems * amount,
                                label = Config.Language.ProgressBar.ProcessItems,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.ProcessItems.AnimDict, clip = Config.Animations.ProcessItems.Anim, flag = Config.Animations.ProcessItems.Flags,},
                            }) then
                                local chance = Config.CoreSettings.Chances.ProcessItems
                                if chance >= math.random(1,100) then
                                    TriggerServerEvent('lusty94_ketamine:server:ProcessSilica', amount)
                                else
                                    SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                                end
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
        end
	end
end)

--process liquid ketamine
RegisterNetEvent('lusty94_ketamine:client:ProcessLiquidKetamine', function()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local input = lib.inputDialog('Ketamine Processing', {
			{
				type = 'slider',
				required = true,
				default = 1,
				min = 1,
				max = 10, -- edit maximum allowed amount to process at once here
			},
            {
                type = 'input',
                placeholder = 'How much do you want to process?',
                disabled = true,
                icon = 'arrow-right',
            },
        })
        if input then
            if input and tonumber(input[1]) > 0 then
                local amount = tonumber(input[1])
                QBCore.Functions.TriggerCallback('lusty94_ketamine:get:ProcessLiquidKetamine', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessItems * amount,
                                label = Config.Language.ProgressBar.ProcessItems,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.ProcessItems.AnimDict, clip = Config.Animations.ProcessItems.Anim, flag = Config.Animations.ProcessItems.Flags,},
                            }) then
                                local chance = Config.CoreSettings.Chances.ProcessItems
                                if chance >= math.random(1,100) then
                                    TriggerServerEvent('lusty94_ketamine:server:ProcessLiquidKetamine', amount)
                                else
                                    SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                                end
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
        end
	end
end)

--process ketamine
RegisterNetEvent('lusty94_ketamine:client:ProcessKetamine', function()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local input = lib.inputDialog('Ketamine Processing', {
			{
				type = 'slider',
				required = true,
				default = 1,
				min = 1,
				max = 10, -- edit maximum allowed amount to process at once here
			},
            {
                type = 'input',
                placeholder = 'How much do you want to process?',
                disabled = true,
                icon = 'arrow-right',
            },
        })
        if input then
            if input and tonumber(input[1]) > 0 then
                local amount = tonumber(input[1])
                QBCore.Functions.TriggerCallback('lusty94_ketamine:get:ProcessKetamine', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessItems * amount,
                                label = Config.Language.ProgressBar.ProcessItems,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.ProcessItems.AnimDict, clip = Config.Animations.ProcessItems.Anim, flag = Config.Animations.ProcessItems.Flags,},
                            }) then
                                local chance = Config.CoreSettings.Chances.ProcessItems
                                if chance >= math.random(1,100) then
                                    TriggerServerEvent('lusty94_ketamine:server:ProcessKetamine', amount)
                                else
                                    SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                                end
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
        end
	end
end)

--process overdose cure
RegisterNetEvent('lusty94_ketamine:client:CreateOverDoseCure', function()
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        local input = lib.inputDialog('Ketamine Processing', {
			{
				type = 'slider',
				required = true,
				default = 1,
				min = 1,
				max = 10, -- edit maximum allowed amount to process at once here
			},
            {
                type = 'input',
                placeholder = 'How much do you want to process?',
                disabled = true,
                icon = 'arrow-right',
            },
        })
        if input then
            if input and tonumber(input[1]) > 0 then
                local amount = tonumber(input[1])
                QBCore.Functions.TriggerCallback('lusty94_ketamine:get:CreateOverDoseCure', function(HasItems)  
                    if HasItems then
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.ProcessItems * amount,
                                label = Config.Language.ProgressBar.ProcessItems,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.ProcessItems.AnimDict, clip = Config.Animations.ProcessItems.Anim, flag = Config.Animations.ProcessItems.Flags,},
                            }) then
                                local chance = Config.CoreSettings.Chances.ProcessItems
                                if chance >= math.random(1,100) then
                                    TriggerServerEvent('lusty94_ketamine:server:CreateOverDoseCure', amount)
                                else
                                    SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                                end
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.NotEnough, 'error', 2000)
                    end
                end, amount)
            else
                SendNotify(Config.Language.Notifications.InvalidAmount, 'error', 2000)
            end
        else
            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
        end
	end
end)



----------------------< TAKE DRUGS >----------------------------
 
-- Function to take ketamine
local function TakeKetamine()
	local playerPed = PlayerPedId()
	local timer = Config.DrugSettings.Effects.EffectsTimer
	local StressEvent = Config.CoreSettings.EventNames.Stress
	Wait(2500) 
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000) 
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true) 
    if IsPedRunning(playerPed) then
        SetPedToRagdoll(playerPed, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
	TriggerEvent(EvidenceEvent, "widepupils", 300)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(timer)
	Wait(2000)
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    StopGameplayCamShaking(playerPed, true)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	SetEntityInvincible(playerPed, false)
	ClearPedTasks(playerPed)
	AddArmourToPed(playerPed, Config.DrugSettings.Effects.ArmourGained)
	TriggerServerEvent(StressEvent, Config.DrugSettings.Effects.StressReduced)
	if Config.DrugSettings.Effects.OverDose then
		SendNotify(Config.Language.Notifications.OverDoseWarning, 'error', 2000)
		TriggerServerEvent('lusty94_ketamine:server:OverDose')
	end
end


-- Take Ketamine
RegisterNetEvent('lusty94_ketamine:client:TakeKetamine', function()
	QBCore.Functions.TriggerCallback('lusty94_ketamine:get:TakeKetamine', function(HasItems)  
        if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
			else
				busy = true
                LockInventory(true)
                if lib.progressCircle({ 
                    duration = Config.CoreSettings.Timers.Consume, 
                    label = Config.Language.ProgressBar.TakeKetamine, 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = false, move = false, },  
                    anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags}, 
                }) then
					TriggerServerEvent('lusty94_ketamine:server:TakeKetamine')
                    busy = false
                    LockInventory(false)
                    if Config.DrugSettings.Effects.Enabled then
						TakeKetamine()
					end
                else 
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                end
			end
		else
			SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
		end
	end)
end)


-------------------< OVERDOSE & CURE >--------------------

-- overdose
RegisterNetEvent('lusty94_ketamine:client:OverDose', function()
	local playerPed = PlayerPedId()
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	DoScreenFadeOut(2000)
	Wait(2000)
	SetEntityHealth(playerPed, GetEntityHealth(playerPed) - Config.DrugSettings.Effects.HealthRemoved)
	Wait(2000)
	DoScreenFadeIn(2000)
	SendNotify(Config.Language.Notifications.Overdosed, 'error', 2000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	SetFlash(0, 0, 500, 7000, 500)
	StopGameplayCamShaking(playerPed, true)
end)

-- Take overdose cure
RegisterNetEvent('lusty94_ketamine:client:TakeOverDoseCure', function()
	QBCore.Functions.TriggerCallback('lusty94_ketamine:get:TakeOverDoseCure', function(HasItems)  
        if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
			else
				busy = true
                LockInventory(true)
                if lib.progressCircle({ 
                    duration = Config.CoreSettings.Timers.Consume, 
                    label = Config.Language.ProgressBar.TakeOverdoseCure, 
                    position = 'bottom', 
                    useWhileDead = false, 
                    canCancel = true, 
                    disable = { car = false, move = false, },  
                    anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags}, 
                }) then
					TriggerServerEvent('lusty94_ketamine:server:CureOverDose')
                    busy = false
                    LockInventory(false)
                else 
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                end
			end
		else
			SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
		end
	end)
end)


--------------< SUPPLIES SHOP >--------------------

-- open supplies shop
AddEventHandler("lusty94_ketamine:client:openSuppliesShop", function()
	local ketItems = {
        label = "Ketamine Supplies", 
        slots = 10,
        items = {
            [1] = {name = "jackhammer",             price = 200,    amount = 1000, info = {}, type = "item", slot = 1,},
            [2] = {name = "painkillers",            price = 200,    amount = 1000, info = {}, type = "item", slot = 2,},
            [3] = {name = "citricacid",             price = 250,    amount = 1000, info = {}, type = "item", slot = 3,},
            [4] = {name = "steviapowder",           price = 250,    amount = 1000, info = {}, type = "item", slot = 4,},
            [5] = {name = "plasticjerrycan",        price = 100,    amount = 1000, info = {}, type = "item", slot = 5,},
            [6] = {name = "pressurecooker",         price = 100,    amount = 1000, info = {}, type = "item", slot = 6,},
            [7] = {name = "ketprocessingtable",     price = 1000,   amount = 1000, info = {}, type = "item", slot = 7,},
            [8] = {name = "mortarpestle",           price = 100,    amount = 1000, info = {}, type = "item", slot = 8,},
            [9] = {name = "butane_gas",             price = 100,    amount = 1000, info = {}, type = "item", slot = 9,},
            [10] ={name = "polyethyleneglycol",     price = 100,    amount = 1000, info = {}, type = "item", slot = 10,},
        },
    }
	if InvType == 'qb'then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "Ketamine Supplies", ketItems)
	elseif InvType == 'ox' then
		exports.ox_inventory:openInventory('shop',{ type = 'ketItems' })
	end
end)




----------------< DONT TOUCH >--------------------

--dont touch
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
        spawnQuartz()
    end
end)

--dont touch
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- on player load delete objects that are already spawned, empty the tables and then respawn them to prevent duplications
    for _, v in pairs(spawnedRocks) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
    spawnedRocks = {}
    spawnQuartz()
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

--function to display item images for ox_lib menu
function ItemImage(img)
	if InvType == 'ox' then
		return "nui://ox_inventory/web/images/".. img.. '.png'
	elseif InvType == 'qb' then
		return "nui://qb-inventory/html/images/".. QBCore.Shared.Items[img].image
	end
end



AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(spawnedRocks) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
    	spawnedRocks = {}
        if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketamineTableProp, 'ketamineTableProp') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketamineTableProp, 'ketamineTableProp') end
        delete_prop(ketamineTableProp)
        ketamineTableProp = nil
        ketamineTablePlaced = false
		vehicleSpawned = false
		hasRequested = false
		hasSearched = false
		DeletePed(ketPeds)
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(ketPeds, 'ketPeds') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(ketPeds, 'ketPeds') end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(quartz, 'quartz') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(quartz, 'quartz') end
		for k,v in pairs(Config.CoreSettings.Props.TargetModels) do if TargetType == 'qb' then exports['qb-target']:RemoveTargetModel(v.model) elseif TargetType == 'ox' then exports.ox_target:removeModel(v.model) end end
	end
    print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Ketamine V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
end)




