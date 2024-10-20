local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels
local OverDoseLevels = Config.DrugSettings.OverDoseLevels
local xpAmount = Config.XP.XPAmount
local xpChance = Config.XP.XPChance


----------< USEABLE ITEMS >-------------

local useItems = {
    { name = 'processingtable',     event = 'lusty94_mushrooms:client:openProcessingTable'},
    { name = 'magic_mushroom',      event = 'lusty94_mushrooms:client:TakeMagicMushrooms'},
    { name = 'indigo_mycota_cure',  event = 'lusty94_mushrooms:client:TakeOverDoseCure'},
    { name = 'deathcap_mushroom',   event = 'lusty94_mushrooms:client:TakeDeathCapMushroom'},
}

for k,v in pairs(useItems) do
    QBCore.Functions.CreateUseableItem(v.name, function(source, item)
        TriggerClientEvent(v.event, source)
    end)
end


--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Mushrooms" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end



--------------CALL BACKS-----------
-- raw mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:RawMushroomItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Drying.RequiredItemName)
    local item1amount = Config.Processing.Drying.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Drying.RequiredItem2Name)
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

-- dried mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:MagicMushroomItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Processing.RequiredItemName)
    local item1amount = Config.Processing.Processing.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Processing.RequiredItem2Name)
    local item2amount = Config.Processing.Processing.RequiredItem2Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount then
        cb(true)
    else
        cb(false)
    end
end)



--overdose cure callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:OverDoseCureItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItemName)
    local item1amount = Config.Processing.Curing.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem2Name)
    local item2amount = Config.Processing.Curing.RequiredItem2Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount then
        cb(true)
    else
        cb(false)
    end
end)

--take magic mushrooms callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:TakeMagicMushrooms', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Processing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

-- take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)



-- deathcap mushroom callback
QBCore.Functions.CreateCallback('lusty94_mushrooms:get:DeathcapMushroom', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName("deathcap_mushroom")
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)



----------EVENTS-------------

-- pick raw mushroom
RegisterServerEvent('lusty94_mushrooms:server:PickMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local probability = math.random(1, 100)
    local items = {'libertycap_mushroom', 'indigomilkcap_mushroom', 'deathcap_mushroom', }
    local selectItems = items[math.random(#items)]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            amount = math.random(2,5)
        elseif DrugXP <= 500 then
            amount = math.random(5,8)
        elseif DrugXP <= 750 then
            amount = math.random(8, 11)
        elseif DrugXP <= 1250 then
            amount = math.random(11, 14)
        elseif DrugXP <= 1500 then
            amount = math.random(14, 17)
        elseif DrugXP <= 2000 then
            amount = math.random(17, 20)
        end
    else amount = math.random(1,3) end
    if InvType == 'qb' then
        Player.Functions.AddItem(selectItems, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[selectItems], 'add', amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, selectItems, amount) then
            exports.ox_inventory:AddItem(src,selectItems, amount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarryName, 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)


--dry mushrooms
RegisterServerEvent('lusty94_mushrooms:server:DryMushroom', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Drying.DriedItemAmount end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Drying.RequiredItemName, Config.Processing.Drying.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Drying.RequiredItemName], 'remove', Config.Processing.Drying.RequiredItemAmount)        
        Player.Functions.AddItem(Config.Processing.Drying.DriedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Drying.DriedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Drying.DriedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Drying.RequiredItemName, Config.Processing.Drying.RequiredItemAmount)
            exports.ox_inventory:AddItem(src,Config.Processing.Drying.DriedItemName, returnAmount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarryName, 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)


--make magic mushrooms
RegisterServerEvent('lusty94_mushrooms:server:MakeMagicMushrooms', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Processing.ProcessedItemAmount end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Processing.RequiredItemName, Config.Processing.Processing.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Processing.RequiredItemName], 'remove', Config.Processing.Processing.RequiredItemAmount)        
        Player.Functions.RemoveItem(Config.Processing.Processing.RequiredItem2Name, Config.Processing.Processing.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Processing.RequiredItem2Name], 'remove', Config.Processing.Processing.RequiredItem2Amount)        
        Player.Functions.AddItem(Config.Processing.Processing.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Processing.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Processing.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Processing.RequiredItemName, Config.Processing.Processing.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Processing.RequiredItem2Name, Config.Processing.Processing.RequiredItem2Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Processing.ProcessedItemName, returnAmount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarryName, 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)


--make overdose cure
RegisterServerEvent('lusty94_mushrooms:server:MakeOverdoseCure', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Curing.ProcessedItemAmount end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Curing.RequiredItemName, Config.Processing.Curing.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.RequiredItemName], 'remove', Config.Processing.Curing.RequiredItemAmount)        
        Player.Functions.RemoveItem(Config.Processing.Curing.RequiredItem2Name, Config.Processing.Curing.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.RequiredItem2Name], 'remove', Config.Processing.Curing.RequiredItem2Amount)        
        Player.Functions.AddItem(Config.Processing.Curing.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Curing.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Curing.RequiredItemName, Config.Processing.Curing.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Curing.RequiredItem2Name, Config.Processing.Curing.RequiredItem2Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Curing.ProcessedItemName, returnAmount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarryName, 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)














-- take magic mushrooms
RegisterServerEvent('lusty94_mushrooms:server:TakeMagicMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    
    if InvType == 'qb' then
	    Player.Functions.RemoveItem(Config.Processing.Processing.ProcessedItemName, 1)
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Processing.ProcessedItemName], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, Config.Processing.Processing.ProcessedItemName, 1)        
    end
end)

-- take deathcap mushrooms
RegisterServerEvent('lusty94_mushrooms:server:TakeDeathCapMushrooms', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
	    Player.Functions.RemoveItem("deathcap_mushroom", 1)
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["deathcap_mushroom"], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, "deathcap_mushroom", 1)        
    end

end)

-- update overdose
RegisterServerEvent('lusty94_mushrooms:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount)) -- Edit overdose counter here dont go too high or players wont be able to consume that many magic mushrooms without overdosing each time
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then -- ONCE A PLAYER REACHES THIS NUMBER OR GOES PAST IT THEY WILL ALWAYS OVERDOSE WHEN CONSUMING MAGIC MUSHROOMS SO BE CAREFUL WHEN SETTING THIS VALUE
        Wait(3000)       
        TriggerClientEvent('lusty94_mushrooms:client:OverDose', src)
    end    
end)

-- remove overdose
RegisterServerEvent('lusty94_mushrooms:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    if OverDose >= 1 then
        if InvType == 'qb' then
            Player.Functions.RemoveItem(Config.Processing.Curing.ProcessedItemName, 1)
	        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], "remove")
        elseif InvType == 'ox' then
            exports.ox_inventory:RemoveItem(src, Config.Processing.Curing.ProcessedItemName, 1)   
        end
        Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount))
        SendNotify(src, Config.Language.Notifications.OverDoseCuredName, 'success', 2000)
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCuredName, 'error', 2000)
    return
    end
end)


-- /commands
if Config.DrugSettings.Effects.OverDose then
    QBCore.Commands.Add(OverDoseName, "Check Your OverDose Level", {}, true, function(source, args)
        local source = source
        local src = source
        local level = 1
        local Player = QBCore.Functions.GetPlayer(source)
        local data = Player.PlayerData.metadata[OverDoseName]
        if data ~= nil then
            for i=1, #OverDoseLevels, 1 do
                if data >= OverDoseLevels[i] then
                    level = i + 1
                end
            end
            SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
        end
    end)
end

-- /commands
if Config.XP.Enabled then
    if Config.XP.Command then
        QBCore.Commands.Add(MetaDataName, "Check Your Drug XP Level", {}, true, function(source, args)
            local source = source
            local src = source
            local level = 1
            local Player = QBCore.Functions.GetPlayer(source)
            local data = Player.PlayerData.metadata[MetaDataName]
            if data ~= nil then
                for i=1, #Levels, 1 do
                    if data >= Levels[i] then
                        level = i + 1
                    end
                end
                SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
            end
        end)
    end
end

--supplies shop
function MushroomSupplyStore()
    exports.ox_inventory:RegisterShop('MushroomSupplyStore', {
        name = 'Mushroom Supply Shop',
        inventory = {
            { name = 'acetone', price = 250 },
            { name = 'dimethylformamide', price = 500 },
            { name = 'dryingrack', price = 100 },
            { name = 'scales', price = 250 },
            { name = 'processingtable', price = 1000 },
            { name = 'emptybaggies', price = 10 },
        },
    })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Mushrooms |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops automatically |^5 ^5--<^3!^5>--^7')
            MushroomSupplyStore()
            print('^5--<^3!^5>-- ^7| Shops registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)
local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Mushrooms/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
		--print(advice)
	end)
end
CheckVersion()