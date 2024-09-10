local QBCore = exports['qb-core']:GetCoreObject()
local cocaLeaves = {}
local busy, isCokeTablePlaced  = false, false
local isCementOnCooldown, isGasolineOnCooldown, isHydrochloricAcidOnCooldown = false, false, false
local lastCementUsage, lastGasolineUsage, lastHydrochloricAcidUsage = 0, 0, 0
local cokeTableProp = nil
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local InvType = Config.CoreSettings.Inventory.Type
local ShopType = Config.CoreSettings.Shop.Type
local PoliceType = Config.CoreSettings.Police.Type
local EvidenceEvent = Config.CoreSettings.EventNames.Evidence
local CementModel = Config.CoreSettings.Props.Cement.Name
local GasolineModel = Config.CoreSettings.Props.Gasoline.Name
local HydrochloricAcidModel = Config.CoreSettings.Props.HydrochloricAcid.Name
local cooldownTimeCement = Config.CoreSettings.CoolDownTimers.Cement 
local cooldownTimeGasoline = Config.CoreSettings.CoolDownTimers.Gasoline 
local cooldownTimeHydrochloricAcid = Config.CoreSettings.CoolDownTimers.HydrochloricAcid 
local StressAmount = Config.DrugSettings.Effects.StressReduced
local ArmourAmount = Config.DrugSettings.Effects.ArmourGained



--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Cocaine: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Cocaine" end
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



--blip for  cocaine leaves
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
            RequestModel(GetHashKey(v.model))
            while not HasModelLoaded(GetHashKey(v.model)) do
                Wait(1000)
            end
            CokeSuppliesPed = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
            FreezeEntityPosition(CokeSuppliesPed, true)
            SetEntityInvincible(CokeSuppliesPed, true)
            SetBlockingOfNonTemporaryEvents(CokeSuppliesPed, true)
			if v.playanim then
            	TaskStartScenarioInPlace(CokeSuppliesPed, v.scenario, 0, v.playanim)
			end
			if TargetType == 'qb' then
				exports['qb-target']:AddTargetEntity(CokeSuppliesPed, { options = { { type = "client", event = "lusty94_cocaine:client:openSuppliesShop", icon = v.targeticon, label = v.targetlabel, }, }, distance = v.targetdistance })
			elseif TargetType == 'ox' then
				exports.ox_target:addLocalEntity(CokeSuppliesPed, { { name = 'CokeSuppliesPed', icon = v.targeticon, label = v.targetlabel, event = 'lusty94_cocaine:client:openSuppliesShop', distance = v.targetdistance} })
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



--Cement prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(CementModel, { options = { { event = 'lusty94_cocaine:client:GetCement', type = 'client', icon = Config.CoreSettings.Props.Cement.TargetIcon, label = Config.CoreSettings.Props.Cement.TargetLabel, }, }, distance = Config.CoreSettings.Props.Cement.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(CementModel, ({ name = 'cement', label = Config.CoreSettings.Props.Cement.TargetLabel, icon = Config.CoreSettings.Props.Cement.TargetIcon, event = 'lusty94_cocaine:client:GetCement', distance = Config.CoreSettings.Props.Cement.TargetDistance, }))
	end
end)

--Gasoline prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(GasolineModel, { options = { { item = Config.CoreSettings.Props.Gasoline.RequiredItem, event = 'lusty94_cocaine:client:GetGasoline', type = 'client', icon = Config.CoreSettings.Props.Gasoline.TargetIcon, label = Config.CoreSettings.Props.Gasoline.TargetLabel, }, }, distance = Config.CoreSettings.Props.Gasoline.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(GasolineModel, ({ items = Config.CoreSettings.Props.Gasoline.RequiredItem, name = 'Gasoline', label = Config.CoreSettings.Props.Gasoline.TargetLabel, icon = Config.CoreSettings.Props.Gasoline.TargetIcon, event = 'lusty94_cocaine:client:GetGasoline', distance = Config.CoreSettings.Props.Gasoline.TargetDistance, }))
	end
end)

--Hydrochloric Acid prop
CreateThread(function()
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetModel(HydrochloricAcidModel, { item = Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, options = { { event = 'lusty94_cocaine:client:GetHydrochloricAcid', type = 'client', icon = Config.CoreSettings.Props.HydrochloricAcid.TargetIcon, label = Config.CoreSettings.Props.HydrochloricAcid.TargetLabel, }, }, distance = Config.CoreSettings.Props.HydrochloricAcid.TargetDistance, })
	elseif TargetType == 'ox' then
		exports.ox_target:addModel(HydrochloricAcidModel, ({ items = Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, name = 'HydrochloricAcid', label = Config.CoreSettings.Props.HydrochloricAcid.TargetLabel, icon = Config.CoreSettings.Props.HydrochloricAcid.TargetIcon, event = 'lusty94_cocaine:client:GetHydrochloricAcid', distance = Config.CoreSettings.Props.HydrochloricAcid.TargetDistance, }))
	end
end)




----------------------------< COCA LEAVES >----------------------------------


--respawns leaves every 30 mins
CreateThread(function()
    while true do
        Wait(Config.CoreSettings.CoolDownTimers.RespawnLeaves) -- waits 30 minutes DONT TOUCH THIS EDIT THE TIMER CONFIG SIDE
        for _, plant in pairs(cocaLeaves) do SetEntityAsMissionEntity(plant, false, true) DeleteObject(plant) SetEntityAsNoLongerNeeded(plant) end
        cocaLeaves = {}
        Wait(2500) -- wait 2.5 seconds before spawning new leaves
        spawnLeaves() -- spawns new leaves
    end
end)

--new method to spawn multiple leaves anywhere via config location
function spawnLeaves()
	for k,v in pairs(Config.Plants) do
		local CokeModel = Config.CoreSettings.Props.CocaLeaves.Name
		RequestModel(CokeModel)
		while not HasModelLoaded(CokeModel) do
			Wait(1000)
		end
		plant = CreateObject(CokeModel, v.coords.x, v.coords.y, v.coords.z-1, false, true, false) -- if plants floating or too low edit the -1 value on the Z axis
		PlaceObjectOnGroundProperly(plant)
		FreezeEntityPosition(plant, true)
		cocaLeaves[#cocaLeaves+1] = plant
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(plant, { options = { { item = v.item,type = "client", event = "lusty94_cocaine:client:PickCocaLeaves", icon = v.icon, label = v.label, }, }, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(plant, ({ name = 'plant', items = v.item, label = v.label, icon = v.icon, event = 'lusty94_cocaine:client:PickCocaLeaves', distance = v.distance, }))
		end
	end
end


-- pick coca leaves
RegisterNetEvent("lusty94_cocaine:client:PickCocaLeaves", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID    
	for i=1, #cocaLeaves, 1 do
		if #(coords - GetEntityCoords(cocaLeaves[i])) < 3 then
			nearbyObject, nearbyID = cocaLeaves[i], i
		end
	end   
	if nearbyObject and IsPedOnFoot(playerPed) then
		if busy then
			SendNotify('You Are Already Doing Something!', 'error', 2000)
		else
			local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
			if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.PickCocaLeaves, label = Config.Language.ProgressBar.PickCocaLeaves, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.PickCocaLeaves.AnimDict, clip = Config.Animations.PickCocaLeaves.Anim, flag = Config.Animations.PickCocaLeaves.Flags,}, prop = { model = 'prop_cs_trowel', bone = 18905, pos = vec3(0.12, 0.0, 0.02), rot = vec3(76.0, 188.0, 34.0), }, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					SetEntityAsMissionEntity(nearbyObject, false, true)
					DeleteObject(nearbyObject)
					cocaLeaves[nearbyID] = nil
					local chance2 = Config.CoreSettings.Chances.GetLeaves
					if chance2 >= math.random(1,100) then
						TriggerServerEvent('lusty94_cocaine:server:PickCocaLeaves')
					else
						SendNotify(Config.Language.Notifications.NothingFoundName, 'error', 2000)
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


---------------------------------< PROCESSING TABLE >--------------------------------

--place processing table
RegisterNetEvent('lusty94_cocaine:client:openProcessingTable', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward)
    local tableModel = Config.CoreSettings.Props.ProcessingTable.Name
	if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
		if isCokeTablePlaced then
            SendNotify(Config.Language.Notifications.PropErrorName, 'error', 2000)
			return
		end
		busy = true
        LockInventory(true)
		if lib.progressCircle({ duration = 5000, label = 'Placing processing table...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PlaceProcessingTable.AnimDict, clip = Config.Animations.PlaceProcessingTable.Anim, flag = Config.Animations.PlaceProcessingTable.Flags, }, }) 
        then
            RequestModel(tableModel)
            while (not HasModelLoaded(tableModel)) do
                Wait(1000)
            end
            cokeTableProp = CreateObject(tableModel, x, y, z, true, false, true)
            PlaceObjectOnGroundProperly(cokeTableProp)
            SetEntityAsMissionEntity(cokeTableProp)
            FreezeEntityPosition(cokeTableProp, true)
            if TargetType == 'qb' then
                exports['qb-target']:AddTargetEntity(cokeTableProp, {  options = { { event = 'lusty94_cocaine:client:openMainMenu', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconOpen, label =  Config.CoreSettings.Props.ProcessingTable.TargetLabelOpen, }, { event = 'lusty94_cocaine:client:DeleteProcessingTable', type = 'client', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconRemove, label = Config.CoreSettings.Props.ProcessingTable.TargetLabelRemove, },}, distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance })
            elseif TargetType == 'ox' then
                exports.ox_target:addLocalEntity(cokeTableProp, { { name = 'cokeTableProp', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconOpen, label =  Config.CoreSettings.Props.ProcessingTable.TargetLabelOpen, event = 'lusty94_cocaine:client:openMainMenu', distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance}, { name = 'furnaceProp', icon = Config.CoreSettings.Props.ProcessingTable.TargetIconRemove, label = Config.CoreSettings.Props.ProcessingTable.TargetLabelRemove, event = 'lusty94_cocaine:client:DeleteProcessingTable', distance = Config.CoreSettings.Props.ProcessingTable.TargetDistance}  })
            end
            ClearPedTasks(playerPed)
            isCokeTablePlaced = true
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
local function delete_prop(model)
    if DoesEntityExist(model) then
        DeleteEntity(model)
    end
end


-- delete processing table
RegisterNetEvent('lusty94_cocaine:client:DeleteProcessingTable', function()
    if cokeTableProp then
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(cokeTableProp, 'cokeTableProp') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(cokeTableProp, 'cokeTableProp') end
        delete_prop(cokeTableProp)
        cokeTableProp = nil
        isCokeTablePlaced = false
    end
end)



-- Function to display a notification with the remaining cooldown time
function ShowCooldownNotification(remainingTime)
    local notificationMessage = Config.Language.Notifications.SearchTimerName .. remainingTime / 1000 .. " seconds before doing that."
	SendNotify(notificationMessage, 'error', 3000)
end


------------------------------< PROP EVENTS >---------------------------------
--chance to call police
function PoliceCallChance()
	local chance = math.random(1,100)
	local chance2 = Config.CoreSettings.Chances.CallPolice
	if chance <= chance2 then
		if PoliceType == 'qb' then
			TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity')
		elseif PoliceType == 'ps' then
			exports['ps-dispatch']:SuspiciousActivity()
		end				
		SendNotify(Config.Language.Notifications.PoliceNotifiedName, 'error', 2000)
	end
end

--get Cement
RegisterNetEvent('lusty94_cocaine:client:GetCement', function()
	if busy then
        SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
    else
		if isCementOnCooldown then
			local remainingTime = math.ceil((lastCementUsage + cooldownTimeCement))
			ShowCooldownNotification(remainingTime)
		else
			local success = lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'easy'}, {'e'})
			if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.GetCement, label = Config.Language.ProgressBar.GetCement, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.GetCement.AnimDict, clip = Config.Animations.GetCement.Anim, flag = Config.Animations.GetCement.Flags,}, prop = { model = 'prop_cs_trowel', bone = 18905, pos = vec3(0.12, 0.0, 0.02), rot = vec3(76.0, 188.0, 34.0), }, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					isCementOnCooldown = true
					SetTimeout(cooldownTimeCement, function() isCementOnCooldown = false end)
					local chance = math.random(1,100)
					local chance2 = Config.CoreSettings.Chances.GetCement
					if chance <= chance2 then
						TriggerServerEvent('lusty94_cocaine:server:GetCement')
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


--get Gasoline
RegisterNetEvent('lusty94_cocaine:client:GetGasoline', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:GasCan', function(HasItems)  
		if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
			else
				if isGasolineOnCooldown then
					local remainingTime = math.ceil((lastGasolineUsage + cooldownTimeGasoline))
					ShowCooldownNotification(remainingTime)
				else
					local success = lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'easy'}, {'e'})
					if success then
						busy = true
						LockInventory(true)
						if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.GetGasoline, label = Config.Language.ProgressBar.GetGasoline, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.GetGasoline.AnimDict, clip = Config.Animations.GetGasoline.Anim, flag = Config.Animations.GetGasoline.Flags,}, prop = { model = 'prop_ld_jerrycan_01', bone = 60309, pos = vec3(0.06, 0.04, 0.02), rot = vec3(194.0, 0.0, 0.0), }, }) then
							busy = false
							LockInventory(false)
							ClearPedTasks(PlayerPedId())
							isGasolineOnCooldown = true
							SetTimeout(cooldownTimeGasoline, function() isGasolineOnCooldown = false end)
							local chance = math.random(1,100)
							local chance2 = Config.CoreSettings.Chances.GetGas
							if chance <= chance2 then
								TriggerServerEvent('lusty94_cocaine:server:GetGasoline')
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


--get HydrochloricAcid
RegisterNetEvent('lusty94_cocaine:client:GetHydrochloricAcid', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:HydroCan', function(HasItems)  
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
								TriggerServerEvent('lusty94_cocaine:server:GetHydrochloricAcid')
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




------------------------< PROCESSING >------------------------



--process pure cocaine
RegisterNetEvent("lusty94_cocaine:client:ProcessPureCocaine", function()
    QBCore.Functions.TriggerCallback('lusty94_cocaine:get:ProcessPureCocaine', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessCocaine, label = Config.Language.ProgressBar.ProcessCocaine, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_cocaine:server:ProcessPureCocaine')
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
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
        end
    end)
end)





-- process PureCrack
RegisterNetEvent('lusty94_cocaine:client:ProcessPureCrack', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:ProcessPureCrack', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessCrack, label = Config.Language.ProgressBar.ProcessCrack, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_cocaine:server:ProcessPureCrack')
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
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
        end
	end)
end)


-- process CokeBaggy
RegisterNetEvent('lusty94_cocaine:client:ProcessCokeBaggy', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:CokeBaggyItems', function(HasItems)  
        if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessCokeBaggy, label = Config.Language.ProgressBar.ProcessCokeBaggy, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_cocaine:server:ProcessCokeBaggy')
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
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
        end
	end)
end)


-- process CrackBaggy
RegisterNetEvent('lusty94_cocaine:client:ProcessCrackBaggy', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:CrackBaggyItems', function(HasItems)  
		if HasItems then
            if busy then
                SendNotify(Config.Language.Notifications.BusyName, 'error', 2000)
            else
                local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                if success then
                    busy = true
                    LockInventory(true)
                    if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.ProcessCrackBaggy, label = Config.Language.ProgressBar.ProcessCrackBaggy, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.UseProcessingTable.AnimDict, clip = Config.Animations.UseProcessingTable.Anim, flag = Config.Animations.UseProcessingTable.Flags,}, }) then
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
						local chance = Config.CoreSettings.Chances.ProcessSuccess
						if chance >= math.random(1,100) then
                        	TriggerServerEvent('lusty94_cocaine:server:ProcessCrackBaggy')
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
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
        end
	end)
end)



-- process overdose cure
RegisterNetEvent('lusty94_cocaine:client:CreateOverDoseCure', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:OverDoseCureItems', function(HasItems)  
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
                        	TriggerServerEvent('lusty94_cocaine:server:CreateOverDoseCure')
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
			SendNotify(Config.Language.Notifications.NoItemsName, 'error', 2000)
        end
	end)
end)




----------------------< TAKE DRUGS >----------------------------

local effectstimer = Config.DrugSettings.Effects.EffectsTimer

-- Function to take cocaine
local function TakeCocaine()	
	Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
	Wait(1000)
	SetTimecycleModifier('spectator1')
	Wait(5000)
	if Config.DrugSettings.Effects.GiveArmour then
		AddArmourToPed(PlayerPedId(), ArmourAmount)
	end
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)
	if Config.DrugSettings.Effects.ReduceStress then
		TriggerServerEvent(Config.CoreSettings.EventNames.Stress, StressAmount)
	end      
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(8000)      
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)       
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(PlayerPedId(), true)           
    Wait(effectstimer)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    ClearTimecycleModifier()
    SetPedMotionBlur(PlayerPedId(), false)
	StopGameplayCamShaking(PlayerPedId(), true)
    ClearPedTasks(PlayerPedId())
	SendNotify(Config.Language.Notifications.OverDoseWarningName, 'error', 2000)
	if Config.DrugSettings.Effects.OverDose then
		TriggerServerEvent('lusty94_cocaine:server:OverDose')
	end 
end

--function to take crack
local function TakeCrack()
	Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
	Wait(1000)
	SetTimecycleModifier('spectator1')
	Wait(5000)
	if Config.DrugSettings.Effects.GiveArmour then
		AddArmourToPed(PlayerPedId(), ArmourAmount)
	end
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)
	if Config.DrugSettings.Effects.ReduceStress then
		TriggerServerEvent(Config.CoreSettings.EventNames.Stress, StressAmount)
	end
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(8000)      
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)       
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(PlayerPedId(), true)           
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    Wait(effectstimer)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 0.00)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    StopGameplayCamShaking(PlayerPedId(), true)
    SetPedIsDrunk(PlayerPedId(), false)
    SetPedMotionBlur(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
	SendNotify(Config.Language.Notifications.OverDoseWarningName, 'error', 2000)
	if Config.DrugSettings.Effects.OverDose then
		TriggerServerEvent('lusty94_cocaine:server:OverDose')
	end 
end


-- Take Cocaine
RegisterNetEvent('lusty94_cocaine:client:TakeCokeBaggy', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:TakeCokeBaggy', function(HasItems)  
        if HasItems then
			if busy then
				SendNotify('You Are Already Doing Something!', 'error', 2000)
			else
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.TakeCocaine, label = Config.Language.ProgressBar.TakeCocaine, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,}, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					TriggerServerEvent('lusty94_cocaine:server:TakeCokeBaggy')
					if Config.DrugSettings.Effects.Enabled then
						TakeCocaine()
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

-- Take Crack
RegisterNetEvent('lusty94_cocaine:client:TakeCrackBaggy', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:TakeCrackBaggy', function(HasItems)  
        if HasItems then
			if busy then
				SendNotify('You Are Already Doing Something!', 'error', 2000)
			else
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.TakeCrack, label = Config.Language.ProgressBar.TakeCrack, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,}, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					TriggerServerEvent('lusty94_cocaine:server:TakeCrackBaggy')
					if Config.DrugSettings.Effects.Enabled then
						TakeCrack()
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

-- overdose effect
RegisterNetEvent('lusty94_cocaine:client:OverDose', function()
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
RegisterNetEvent('lusty94_cocaine:client:TakeOverDoseCure', function()
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:TakeOverDoseCure', function(HasItems)  
        if HasItems then
			if busy then
				SendNotify('You Are Already Doing Something!', 'error', 2000)
			else
				busy = true
				LockInventory(true)
				if lib.progressCircle({ duration = Config.CoreSettings.ProgressBar.TakeOverDoseCure, label = Config.Language.ProgressBar.TakeOverDoseCure, position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, move = false, },  anim = { dict = Config.Animations.TakeDrugs.AnimDict, clip = Config.Animations.TakeDrugs.Anim, flag = Config.Animations.TakeDrugs.Flags,}, }) then
					busy = false
					LockInventory(false)
					ClearPedTasks(PlayerPedId())
					TriggerServerEvent('lusty94_cocaine:server:CureOverDose')
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

-- cocaine supplies shop
AddEventHandler("lusty94_cocaine:client:openSuppliesShop", function()
	local cokeItems = {
        label = "Coke Supplies", 
        slots = 9,
        items = {
            [1] = {name = "trowel",                 price = 5,      amount = 1000, info = {}, type = "item", slot = 1,},
            [2] = {name = "emptybaggies",         	price = 10,     amount = 1000, info = {}, type = "item", slot = 2,},
            [3] = {name = "scales",                 price = 500,    amount = 1000, info = {}, type = "item", slot = 3,},
            [4] = {name = "plasticjerrycan",        price = 100,    amount = 1000, info = {}, type = "item", slot = 4,},
            [5] = {name = "sodiumcarbonate",        price = 50,     amount = 1000, info = {}, type = "item", slot = 5,},
            [6] = {name = "water_bottle",          	price = 10,     amount = 1000, info = {}, type = "item", slot = 6,},
            [7] = {name = "cokeprocessingtable",    price = 1000,   amount = 1000, info = {}, type = "item", slot = 7,},
            [8] = {name = "acetone",                price = 250,    amount = 1000, info = {}, type = "item", slot = 8,},
            [9] = {name = "dimethylformamide",      price = 500,    amount = 1000, info = {}, type = "item", slot = 9,},
        },
    }
	if ShopType == 'qb'then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "Cocaine Supply Shop", cokeItems)
	elseif ShopType == 'jim' then
		TriggerServerEvent("jim-shops:ShopOpen", "shop", "Cocaine Supply Shop", cokeItems)
	elseif ShopType == 'ox' then
		exports.ox_inventory:openInventory('shop',{ type = 'CocaineSupplyShop' })
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

--dont touch
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		spawnLeaves()
    end
end)


--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        delete_prop(cokeTableProp)
		busy = false
        cokeTableProp = nil
        isCokeTablePlaced = false
		LockInventory(false)
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(plant, 'plant') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(plant, 'plant') end
		for _, v in pairs(cocaLeaves) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(CokeSuppliesPed, 'CokeSuppliesPed') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(CokeSuppliesPed, 'CokeSuppliesPed') end
		print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Cocaine V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)