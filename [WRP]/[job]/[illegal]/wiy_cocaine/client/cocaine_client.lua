local QBCore = exports['qb-core']:GetCoreObject()
local spawnedCocaLeaves, spawnedCokeBlips, spawnedCokeTable = {}, {}, {}
local busy, hasSearched  = false, false
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local InvType = Config.CoreSettings.Inventory.Type




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
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    elseif NotifyType == 'custom' then
        --insert your custom notification function here
    end
end



--general blips
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


--supplies ped
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        if v.useped then
            lib.requestModel(v.model, 20000)
            cocainePed = CreatePed(0, v.model, v.coords.x, v.coords.y, v.coords.z-1, v.coords.w, false, false)
            FreezeEntityPosition(cocainePed, true)
            SetEntityInvincible(cocainePed, true)
            SetBlockingOfNonTemporaryEvents(cocainePed, true)
			if v.playanim then
            	TaskStartScenarioInPlace(cocainePed, v.scenario, 0, v.playanim)
			end
			if TargetType == 'qb' then
				exports['qb-target']:AddTargetEntity(cocainePed, { options = { 
					{ 
						type = "client", 
						action = function()
							if not busy then
								cokeSupplyShop()
							else
								SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
							end
						end,
						icon = v.targeticon, 
						label = v.targetlabel, 
					}, 
				}, distance = v.targetdistance })
			elseif TargetType == 'ox' then
				exports.ox_target:addLocalEntity(cocainePed, { 
					{ 
						name = 'cocainePed', 
						icon = v.targeticon, 
						label = v.targetlabel, 
						onSelect = function()
							if not busy then
								cokeSupplyShop()
							else
								SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
							end
						end,
						distance = v.targetdistance,
					},
				})
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


local CementModel = Config.CoreSettings.Props.Cement.Name
local GasolineModel = Config.CoreSettings.Props.Gasoline.Name
local HydrochloricAcidModel = Config.CoreSettings.Props.HydrochloricAcid.Name
	--props
if Config.CoreSettings.DrugScripts.Enabled then
	print('^5--<^3!^5>-- ^7| Lusty94_Cocaine |^5 ^5--<^3!^5>--^7 Config.CoreSettings.DrugScripts is enabled - TARGET MODELS FOR CEMENT, GASOLINE AND HYDROCHLORIC ACID HAVE BEEN REMOVED TO PREVENT CLASHES WITH OTHER SCRIPTS - MAKE SURE ITEM NAMES MATCH THROUGHOUT PROCESSING OPTIONS ^5--<^3!^5>--^7')
else
	CreateThread(function()
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetModel(CementModel, { options = { 
				{ 
					type = 'client', 
					action = function()
						if not busy then
							GetCokeCement()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					icon = Config.CoreSettings.Props.Cement.Icon, 
					label = Config.CoreSettings.Props.Cement.Label, 
				}, 
			}, distance = Config.CoreSettings.Props.Cement.Distance, })
			exports['qb-target']:AddTargetModel(GasolineModel, { options = { 
				{ 
					type = 'client', 
					action = function()
						if not busy then
							GetCokeGasoline()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					item = Config.CoreSettings.Props.Gasoline.Item, 
					icon = Config.CoreSettings.Props.Gasoline.Icon, 
					label = Config.CoreSettings.Props.Gasoline.Label, 
				}, }, distance = Config.CoreSettings.Props.Gasoline.Distance, })
				exports['qb-target']:AddTargetModel(HydrochloricAcidModel, { options = { 
					{ 
						type = 'client', 
						action = function()
							if not busy then
								GetCokeHydro()
							else
								SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
							end
						end, 
						item = Config.CoreSettings.Props.HydrochloricAcid.Item,
						icon = Config.CoreSettings.Props.HydrochloricAcid.Icon, 
						label = Config.CoreSettings.Props.HydrochloricAcid.Label, 
					}, }, distance = Config.CoreSettings.Props.HydrochloricAcid.Distance, })
		elseif TargetType == 'ox' then
			exports.ox_target:addModel(CementModel, (
				{ 
					name = 'cement', 
					onSelect = function()
						if not busy then
							GetCokeCement()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					icon = Config.CoreSettings.Props.Cement.Icon, 
					label = Config.CoreSettings.Props.Cement.Label, 
					distance = Config.CoreSettings.Props.Cement.Distance, 
				}
			))
			exports.ox_target:addModel(GasolineModel, (
				{ 
					name = 'Gasoline', 
					onSelect = function()
						if not busy then
							GetCokeGasoline()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					items = Config.CoreSettings.Props.Gasoline.Item, 
					icon = Config.CoreSettings.Props.Gasoline.Icon, 
					label = Config.CoreSettings.Props.Gasoline.Label, 
					distance = Config.CoreSettings.Props.Gasoline.Distance, 
				}
			))
			exports.ox_target:addModel(HydrochloricAcidModel, (
				{ 
					name = 'HydrochloricAcid', 
					onSelect = function()
						if not busy then
							GetCokeHydro()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end, 
					items = Config.CoreSettings.Props.HydrochloricAcid.Item, 
					icon = Config.CoreSettings.Props.HydrochloricAcid.Icon, 
					label = Config.CoreSettings.Props.HydrochloricAcid.Label, 
					distance = Config.CoreSettings.Props.HydrochloricAcid.Distance,
				}
			))
		end
	end)
end



--chance to call police
function cokePoliceChance()
	local chance = Config.CoreSettings.Chances.CallPolice
	local PoliceType = Config.CoreSettings.Police.Type
	if chance >= math.random(1,100) then
		if PoliceType == 'qb' then
			TriggerServerEvent('police:server:policeAlert', 'Suspicious Activity')
		elseif PoliceType == 'ps' then
			exports['ps-dispatch']:SuspiciousActivity()
		elseif PoliceType == 'custom' then
			--insert your own police notification methods here
		end
	end
end


--cement cooldown
function CokeCementCooldown()
    local timer =  Config.CoreSettings.CoolDownTimers.Cement
    if hasSearched then
        return
    end
    hasSearched = true
    SetTimeout(timer, function()
        hasSearched = false
    end)
end

--gasoline cooldown
function CokeGasolineCooldown()
    local timer =  Config.CoreSettings.CoolDownTimers.Gasoline
    if hasSearched then
        return
    end
    hasSearched = true
    SetTimeout(timer, function()
        hasSearched = false
    end)
end

--hydro cooldown
function CokeHydroCooldown()
    local timer =  Config.CoreSettings.CoolDownTimers.HydrochloricAcid
    if hasSearched then
        return
    end
    hasSearched = true
    SetTimeout(timer, function()
        hasSearched = false
    end)
end


----------------------------< COCA LEAVES >----------------------------------


--respawns leaves every 30 mins
CreateThread(function()
    while true do
        Wait(Config.CoreSettings.CoolDownTimers.RespawnLeaves) -- waits 30 minutes DONT TOUCH THIS EDIT THE TIMER CONFIG SIDE
        for _, plant in pairs(spawnedCocaLeaves) do SetEntityAsMissionEntity(plant, false, true) DeleteObject(plant) SetEntityAsNoLongerNeeded(plant) end
        spawnedCocaLeaves = {}
        Wait(2500) -- wait 2.5 seconds before spawning new leaves
        spawnCocaLeaf() -- spawns new leaves
    end
end)

--spawn coca leaves
function spawnCocaLeaf()
	for k,v in pairs(Config.Plants) do
		local CokeModel = Config.CoreSettings.Props.CocaLeaves.Name
		lib.requestModel(CokeModel, 10000)
		cocaLeaves = CreateObject(CokeModel, v.coords.x, v.coords.y, v.coords.z-1, false, true, false) -- if plants floating or too low edit the -1 value on the Z axis
		PlaceObjectOnGroundProperly(cocaLeaves)
		FreezeEntityPosition(cocaLeaves, true)
		spawnedCocaLeaves[#spawnedCocaLeaves+1] = cocaLeaves
		if TargetType == 'qb' then
			exports['qb-target']:AddTargetEntity(cocaLeaves, { options = { 
				{ 
					type = "client", 
					item = v.item,
					action = function()
						if not busy then
							collectCocaLeaf()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					icon = v.icon, 
					label = v.label, 
				}, 
			}, distance = v.distance })
		elseif TargetType == 'ox' then
			exports.ox_target:addLocalEntity(cocaLeaves, (
				{ 
					name = 'cocaLeaves', 
					items = v.item, 
					label = v.label, 
					icon = v.icon, 
					onSelect = function()
						if not busy then
							collectCocaLeaf()
						else
							SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
						end
					end,
					distance = v.distance, 
				}
			))
		end
		-- local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        -- SetBlipSprite(blip, 501)
        -- SetBlipDisplay(blip, 4)
        -- SetBlipScale(blip, 0.8)
        -- SetBlipColour(blip, 2)
        -- SetBlipAsShortRange(blip, true)
        -- BeginTextCommandSetBlipName("STRING")
        -- AddTextComponentString("Coca Leaf")
        -- EndTextCommandSetBlipName(blip)
        -- spawnedCokeBlips[cocaLeaves] = blip
	end
end

--collect coca leaf
function collectCocaLeaf()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local itemLabel = ItemLabel('cocaleaf')
	local nearbyObject, nearbyID    
	for i=1, #spawnedCocaLeaves, 1 do
		if #(coords - GetEntityCoords(spawnedCocaLeaves[i])) < 3 then
			nearbyObject, nearbyID = spawnedCocaLeaves[i], i
		end
	end   
	if nearbyObject and IsPedOnFoot(playerPed) then
		if busy then
			SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
		else
			--if you want to add the skillcheck minigame then uncomment the relevant lines below
			--local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
			--if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.PickCocaLeaves, 
					label = 'Picking '..itemLabel, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = true, combat = true, },  
					anim = { 
						dict = Config.Animations.PickCocaLeaves.AnimDict, 
						clip = Config.Animations.PickCocaLeaves.Anim, 
						flag = Config.Animations.PickCocaLeaves.Flags,
					}, 
					prop = { 
						model = Config.Animations.PickCocaLeaves.Prop, 
						bone = Config.Animations.PickCocaLeaves.Bone, 
						pos = Config.Animations.PickCocaLeaves.Pos, 
						rot = Config.Animations.PickCocaLeaves.Rot, 
					}, 
				}) then
					if Config.CoreSettings.Chances.GetLeaves >= math.random(1,100) then
						TriggerServerEvent('lusty94_cocaine:server:PickCocaLeaves')
					else
						SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
					end
					if spawnedCokeBlips[nearbyObject] then
						RemoveBlip(spawnedCokeBlips[nearbyObject])
						spawnedCokeBlips[nearbyObject] = nil
					end
					SetEntityAsMissionEntity(nearbyObject, false, true)
					DeleteObject(nearbyObject)
					spawnedCocaLeaves[nearbyID] = nil
					busy = false
					LockInventory(false)
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
				end
			--else
				--SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
			--end
		end 
	end
end



--get Cement
function GetCokeCement()
	local itemLabel = ItemLabel('cement')
	if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
		if hasSearched then
			SendNotify(Config.Language.Notifications.Cooldown, 'error', 2000)
			return
		else
			--if you want to add the skillcheck minigame then uncomment the relevant lines below
			--local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
			--if success then
				busy = true
				LockInventory(true)
				if lib.progressCircle({ 
					duration = Config.CoreSettings.Timers.GetCement, 
					label = 'Collecting '..itemLabel, 
					position = 'bottom', 
					useWhileDead = false, 
					canCancel = true, 
					disable = { car = true, move = true, combat = true, },  
					anim = { 
						dict = Config.Animations.GetCement.AnimDict, 
						clip = Config.Animations.GetCement.Anim, 
						flag = Config.Animations.GetCement.Flags,
					}, 
					prop = { 
						model = Config.Animations.GetCement.Prop, 
						bone = Config.Animations.GetCement.Bone, 
						pos = Config.Animations.GetCement.Pos, 
						rot = Config.Animations.GetCement.Rot, 
					}, 
				}) then
					CokeCementCooldown()
					if Config.CoreSettings.Chances.GetCement >= math.random(1,100) then
						TriggerServerEvent('lusty94_cocaine:server:GetCement')
					else
						SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
						cokePoliceChance()
					end
					busy = false
					LockInventory(false)
				else 
					busy = false
					LockInventory(false)
					SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
				end
			--else
				--SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
			--end
		end
	end
end


--get Gasoline
function GetCokeGasoline()
	local itemLabel = ItemLabel('gasoline')
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:GasCan', function(HasItems)  
		if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
				return
			else
				if hasSearched then
					SendNotify(Config.Language.Notifications.Cooldown, 'error', 2000)
				else
					--if you want to add the skillcheck minigame then uncomment the relevant lines below
					--local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
					--if success then
						busy = true
						LockInventory(true)
						if lib.progressCircle({ 
							duration = Config.CoreSettings.Timers.GetGasoline, 
							label = 'Collecting '..itemLabel, 
							position = 'bottom', 
							useWhileDead = false, 
							canCancel = true, 
							disable = { car = true, move = true, combat = true, },  
							anim = { 
								dict = Config.Animations.GetGasoline.AnimDict, 
								clip = Config.Animations.GetGasoline.Anim, 
								flag = Config.Animations.GetGasoline.Flags,
							}, 
							prop = { 
								model = Config.Animations.GetGasoline.Prop, 
								bone = Config.Animations.GetGasoline.Bone, 
								pos = Config.Animations.GetGasoline.Pos, 
								rot = Config.Animations.GetGasoline.Rot, 
							}, 
						}) then
							CokeGasolineCooldown()
							if Config.CoreSettings.Chances.GetGas >= math.random(1,100) then
								TriggerServerEvent('lusty94_cocaine:server:GetGasoline')
							else
								SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
								cokePoliceChance()
							end
							busy = false
							LockInventory(false)	
						else 
							busy = false
							LockInventory(false)	
							SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
						end
					--else
						--SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
					--end
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
		end
	end)
end


--get HydrochloricAcid
function GetCokeHydro()
	local itemLabel = ItemLabel('hydrochloricacid')
	QBCore.Functions.TriggerCallback('lusty94_cocaine:get:HydroCan', function(HasItems)  
		if HasItems then
			if busy then
				SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
			else
				if hasSearched then
					SendNotify(Config.Language.Notifications.Cooldown, 'error', 2000)
					return
				else
					--if you want to add the skillcheck minigame then uncomment the relevant lines below
					--local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
					--if success then
						busy = true
						LockInventory(true)
						if lib.progressCircle({ 
							duration = Config.CoreSettings.Timers.GetHydrochloricAcid, 
							label = 'Collecting '..itemLabel, 
							position = 'bottom', 
							useWhileDead = false, 
							canCancel = true, 
							disable = { car = true, move = true, combat = true, },  
							anim = { 
								dict = Config.Animations.GetHydrochloricAcid.AnimDict, 
								clip = Config.Animations.GetHydrochloricAcid.Anim, 
								flag = Config.Animations.GetHydrochloricAcid.Flags,
							}, 
							prop = { 
								model = Config.Animations.GetHydrochloricAcid.Prop, 
								bone = Config.Animations.GetHydrochloricAcid.Bone, 
								pos = Config.Animations.GetHydrochloricAcid.Pos, 
								rot = Config.Animations.GetHydrochloricAcid.Rot, 
							}, 
						}) then
							CokeHydroCooldown()
							if Config.CoreSettings.Chances.GetHydro >= math.random(1,100) then
								TriggerServerEvent('lusty94_cocaine:server:GetHydrochloricAcid')
							else
								SendNotify(Config.Language.Notifications.NothingFound, 'error', 2000)
								cokePoliceChance()
							end
							busy = false
							LockInventory(false)	
						else 
							busy = false
							LockInventory(false)	
							SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
						end
					--else
						--SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
					--end
				end
			end
		else
			SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
		end
	end)
end




------------------------< PROCESSING >------------------------


--spawn processing table
function spawnCokeTable()
	local table = Config.CoreSettings.Props.ProcessingTable.Name
	local coords = Config.CoreSettings.Props.ProcessingTable.Locations[math.random(#Config.CoreSettings.Props.ProcessingTable.Locations)]
	local icon = Config.CoreSettings.Props.ProcessingTable.Icon
	local label = Config.CoreSettings.Props.ProcessingTable.Label
	local distance = Config.CoreSettings.Props.ProcessingTable.Distance
	lib.requestModel(table, 20000)
	cokeTable = CreateObject(table, coords.x, coords.y, coords.z-1, false, true, false) -- if table is floating or too low edit the -1 value on the Z axis
	PlaceObjectOnGroundProperly(cokeTable)
	FreezeEntityPosition(cokeTable, true)
	SetEntityHeading(cokeTable, coords.w)
	spawnedCokeTable[#spawnedCokeTable+1] = cokeTable
	if TargetType == 'qb' then
		exports['qb-target']:AddTargetEntity(cokeTable, { options = { 
			{ 
				type = "client", 
				action = function()
					if not busy then
						openCokeMenu()
					else
						SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
					end
				end,
				icon = icon, 
				label = label, 
			}, 
		}, distance = distance })
	elseif TargetType == 'ox' then
		exports.ox_target:addLocalEntity(cokeTable, (
			{ 
				name = 'cokeTable',
				label = label, 
				icon = icon, 
				onSelect = function()
					if not busy then
						openCokeMenu()
					else
						SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
					end
				end,
				distance = distance, 
			}
		))
	end
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, 126)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipColour(blip, 4)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coke Table")
	EndTextCommandSetBlipName(blip)
end

--menu to process cocaine items
function openCokeMenu()
	local options = {}
    for k, v in pairs(Config.Processing) do
        local label = ItemLabel(k)
        table.insert(options, {
            title = "Process: " .. label,
            description = "Required Items: \n \n" .. GetRecipeDetails(v),
            event = "lusty94_cocaine:client:CheckMaxProcessable",
			icon = ItemImage(k),
			image = ItemImage(k),
			args = { item = k }
        })
    end
    lib.registerContext({
        id = 'cocaine_processing_menu',
        title = 'Cocaine Processing',
        options = options
    })

    lib.showContext('cocaine_processing_menu')
end


--calculate max processable
RegisterNetEvent("lusty94_cocaine:client:CheckMaxProcessable", function(data)
    local item = data.item
    TriggerServerEvent("lusty94_cocaine:server:GetMaxProcessable", item)
end)


--processing menu
RegisterNetEvent("lusty94_cocaine:client:ShowProcessingInput", function(item, maxProcessable)
    if maxProcessable == 0 then
        SendNotify(Config.Language.Notifications.NoItems, 'error', 2000)
        return
    end
    local input = lib.inputDialog("Select Quantity", {
        {
            type = 'slider',
            label = "Amount to Process",
            min = 1,
            max = maxProcessable,
            default = 1
        }
    })
    if not input then return end
    local quantity = input[1]
    TriggerEvent("lusty94_cocaine:client:ProcessItem", { item = item, quantity = quantity })
end)


--process items
RegisterNetEvent("lusty94_cocaine:client:ProcessItem", function(data)
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
        return
    end
    busy = true
    LockInventory(true)
    local itemLabel = ItemLabel(data.item)
    if lib.progressCircle({
        duration = Config.CoreSettings.Timers.ProcessItems * data.quantity,
        label = 'Processing ' .. data.quantity .. ' x ' .. itemLabel,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, },
        anim = {
            dict = Config.Animations.UseProcessingTable.AnimDict,
            clip = Config.Animations.UseProcessingTable.Anim,
            flag = Config.Animations.UseProcessingTable.Flags,
        },
    }) then
        TriggerServerEvent('lusty94_cocaine:server:ProcessItem', data.item, data.quantity)
		busy = false
		LockInventory(false)
    else
        SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
    end
    busy = false
    LockInventory(false)
end)

--get recipe details
function GetRecipeDetails(recipe)
    local details = {}
    for _, v in ipairs(recipe.required) do
        table.insert(details, ItemLabel(v.item) .. " x" .. v.amount)
    end
    return table.concat(details, " \n")
end





----------------------< TAKE DRUGS >----------------------------

local effectstimer = 20000 -- timer in MS for effects duration
local EvidenceEvent = Config.CoreSettings.EventNames.Evidence

--take cocaine
function TakeCocaine()
	local playerPed = PlayerPedId()	
	Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(playerPed, 1.49)
	Wait(1000)
	SetTimecycleModifier('spectator1')
	Wait(5000)    
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(8000)      
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)       
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true)           
    Wait(effectstimer)
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    ClearTimecycleModifier()
    SetPedMotionBlur(playerPed, false)
	StopGameplayCamShaking(playerPed, true)
end

--take crack
function TakeCrack()
	local playerPed = PlayerPedId()	
	Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(playerPed, 1.49)
	Wait(1000)
	SetTimecycleModifier('spectator1')
	Wait(5000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(8000)      
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(2000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(3000)       
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true)           
    Wait(effectstimer)
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 0.00)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    StopGameplayCamShaking(playerPed, true)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
end

--function to use items
function UseCokeItems(itemName)
    local playerPed = PlayerPedId()
    local item = Config.Drugs[itemName]
    TriggerServerEvent('lusty94_cocaine:server:UseItem', itemName)
    Wait(2000) -- wait timer just to stop the rats that try spam items or remove them from inventory before declaring busy as false and unlocking inventory again
    busy = false
    LockInventory(false)
    if item.armour > 0 then
        SetPedArmour(playerPed, GetPedArmour(playerPed) + item.armour)
    end
    if item.stress > 0 then
        TriggerServerEvent('hud:server:RelieveStress', item.stress)
    end
	if item.effect == 'crack' then
    	TakeCrack()
	elseif item.effect == 'coke' then
		TakeCocaine()
	end
end

--use consumable items
RegisterNetEvent('lusty94_cocaine:client:UseItem', function(itemName)
    local item = Config.Drugs[itemName]    
    if not item then return end
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
		return
    else
        QBCore.Functions.TriggerCallback('lusty94_cocaine:server:hasItem', function(hasItem)
            if hasItem then
                busy = true
                LockInventory(true)
                if lib.progressCircle({
                    duration = item.duration,
                    label = item.label,
                    position = 'bottom',
                    canCancel = item.cancel,
                    disable = {
                        move = not item.canmove,
                        car = true,
                        combat = true,
                    },
                    anim = {
                        dict = item.dict,
                        clip = item.anim,
                        flag = item.flag,
                    },
                    prop = {
                    
                        model = item.prop,
                        bone = item.bone,
                        pos = item.pos,
                        rot = item.rot,
                        
                    },
                }) 
                then
                    UseCokeItems(itemName)
                else
                    busy = false
                    LockInventory(false)
                    SendNotify(Config.Language.Notifications.Cancelled, 'error', 2500)
                end
            end
        end, itemName) -- Pass the itemName to the callback
    end
end)


--supply shop
function cokeSupplyShop()
	if InvType == 'qb'then
		TriggerServerEvent('lusty94_cocaine:server:SuppliesShop')
	elseif InvType == 'ox' then
		exports.ox_inventory:openInventory('shop',{ type = 'CocaineSupplyShop' })
	end
end



--lock inventory to prevent exploits
function LockInventory(toggle)
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true)
    else 
        LocalPlayer.state:set("inv_busy", false, true)
    end
end

--display item images for ox_lib menu
function ItemImage(img)
	if InvType == 'ox' then
		return "nui://ox_inventory/web/images/".. img.. '.png'
	elseif InvType == 'qb' then
		return "nui://qb-inventory/html/images/".. QBCore.Shared.Items[img].image
	end
end

--get the label of an item
function ItemLabel(label)
	if InvType == 'ox' then
		local Items = exports['ox_inventory']:Items()
		return Items[label]['label']
    elseif InvType == 'qb' then
		return QBCore.Shared.Items[label]['label']
	end
end

--dont touch
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		spawnCocaLeaf()
		spawnCokeTable()
    end
end)

--spawn leaves on player load
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    for _, v in pairs(spawnedCocaLeaves) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) SetEntityAsNoLongerNeeded(v) end
    spawnedCocaLeaves = {}
	Wait(1000)
    spawnCocaLeaf()
end)

--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		busy = false
		LockInventory(false)
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(cocaLeaves, 'cocaLeaves') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(cocaLeaves, 'cocaLeaves') end
		if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(cocainePed, 'cocainePed') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(cocainePed, 'cocainePed') end
		for _, v in pairs(spawnedCocaLeaves) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
		spawnedCocaLeaves = {}
		for _, v in pairs(spawnedCokeTable) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end
		spawnedCokeTable = {}
		StopAllScreenEffects()
		print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Cocaine V2.1.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)