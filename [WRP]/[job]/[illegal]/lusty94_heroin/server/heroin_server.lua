local QBCore = exports['qb-core']:GetCoreObject()
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels
local OverDoseLevels = Config.DrugSettings.OverDoseLevels


----------< USEABLE ITEMS >-------------

local heroinItems = {
    { name = 'heroinprocessingtable',   event = 'lusty94_heroin:client:openProcessingTable'},
    { name = 'heroin_vial',             event = 'lusty94_heroin:client:TakeHeroin'},
}

for k,v in pairs(heroinItems) do
    QBCore.Functions.CreateUseableItem(v.name, function(source, item)
        TriggerClientEvent(v.event, source)
    end)
end

if Config.DrugSettings.Effects.OverDose then
    QBCore.Functions.CreateUseableItem('heroinoverdosecure', function(source, item)
        TriggerClientEvent('lusty94_heroin:client:TakeOverDoseCure', source)
    end)
end

--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Heroin" end
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

--remove items
local function removeItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount)
    end
end

--add items
local function addItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:AddItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, item, amount) then
            exports.ox_inventory:AddItem(src, item, amount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
        end
    end
end


--return amount for heroin processing
local function calculateHeroinReturn(DrugXP)
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            return math.random(1, 3)
        elseif DrugXP <= 500 then
            return math.random(3, 5)
        elseif DrugXP <= 750 then
            return math.random(5, 7)
        elseif DrugXP <= 1250 then
            return math.random(7, 9)
        elseif DrugXP <= 1500 then
            return math.random(9, 11)
        elseif DrugXP <= 2200 then
            return math.random(11, 13)
        end
    else
        return math.random(3,5) -- edit item reward amounts if not using XP here - THIS IS USED GLOBALLY FOR ALL ITEMS IN THIS SCRIPT SO DO NOT SET TOO HIGH
    end
end

local function giveXP()
    if Config.XP.Enabled then
        local MetaDataName = Config.XP.MetaDataName
        local DrugXP = Player.PlayerData.metadata[MetaDataName]
        local xpChance = Config.XP.XPChance
        local xpAmount = math.random(5,10) -- edit XP reward here
        if xpChance >= math.random(1,100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXp, 'error', 2000)
        end
    end	
end


--------------< CALL BACKS >-----------

--jerry can callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:JerryCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.Ether.RequiredItem) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--hydrochloric acid can callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:HydroCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.HydrochloricAcid.RequiredItem) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--proccess heroinbase callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessHeroinBase', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItemName)
    local item1amount = Config.Processing.HeroinBase.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem2Name)
    local item2amount = Config.Processing.HeroinBase.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem3Name)
    local item3amount = Config.Processing.HeroinBase.RequiredItem3Amount
    local item4 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem4Name)
    local item4amount = Config.Processing.HeroinBase.RequiredItem4Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount and item4 and item4.amount >= item4amount then
        cb(true)
    else
        cb(false)
    end
end)

--proccess pureheroin callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessPureHeroin', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItemName)
    local item1amount = Config.Processing.PureHeroin.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItem2Name)
    local item2amount = Config.Processing.PureHeroin.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItem3Name)
    local item3amount = Config.Processing.PureHeroin.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)

--process overdose cure callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:OverDoseCureItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItemName)
    local item1amount = Config.Processing.Curing.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem2Name)
    local item2amount = Config.Processing.Curing.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem3Name)
    local item3amount = Config.Processing.Curing.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)

--heroin vial callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessHeroinVial', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItemName)
    local item1amount = Config.Processing.Bagging.HeroinVial.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItem3Name)
    local item3amount = Config.Processing.Bagging.HeroinVial.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)



--take heroin callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:TakeHeroin', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.TakeDrugs.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.TakeDrugs.RequiredItem2Name)
    if item1 and item1.amount >= 1 and item2 and item2.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)


-- check active cops on duty
local function copsOnDuty()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "bcso" or Player.PlayerData.job.name == "leo" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

-- callback to check for starting mission
QBCore.Functions.CreateCallback('lusty94_heroin:server:StartMission', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local copsOnDuty = copsOnDuty()
    if not Player then return end
    if copsOnDuty >= Config.CoreSettings.Police.MinCops then
        cb(true)
    else
        cb(false)
        SendNotify(src,Config.Language.Notifications.NoCops, 'error', 2500)
    end
end)



----------< EVENTS >-------------



--pick OpiumPlants
RegisterServerEvent('lusty94_heroin:server:PickOpiumPlants', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    local returnAmount = calculateHeroinReturn(DrugXP)
    addItem(src, 'opiumsap', returnAmount)
    giveXP()
end)



--pick Lime
RegisterServerEvent('lusty94_heroin:server:GetLime', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    local returnAmount = calculateHeroinReturn(DrugXP)
    -- IF USING DRUG SCRIPTS THEN UNCOMMENT CEMENT BELOW AS THIS IS NEEDED FOR OTHER SCRIPTS [ COCIANE ]
    -- cocaine and heroin scripts share target models for the construction pallets! IF USING BOTH SCRIPTS THEN USE ONE OR THE OTHER TO GET THE ITEMS REQUIRED
    local items = { 
        'limepowder',
        --[[ 'cement', ]]
    }
    for _, palletItems in pairs(items) do
        addItem(src, palletItems, returnAmount)
        Wait(500)
    end
    giveXP()
end)


--pick Ether
RegisterServerEvent('lusty94_heroin:server:GetEther', function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    local returnAmount = calculateHeroinReturn(DrugXP)
    removeItem(src, Config.CoreSettings.Props.Ether.RequiredItem, 1)
    Wait(500)
    addItem(src, 'ether', returnAmount)
    giveXP()
end)

--pick HydrochloricAcid
RegisterServerEvent('lusty94_heroin:server:GetHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    local returnAmount = calculateHeroinReturn(DrugXP)
    removeItem(src, Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, 1)
    Wait(500)
    addItem(src, 'hydrochloricacid', returnAmount)
    giveXP()
end)




--search guards for chemicals
RegisterServerEvent('lusty94_heroin:server:SearchGuards', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local cashenabled = Config.Processing.Mission.FindCash
    local chance = Config.CoreSettings.Chances.SearchBody
    if not Player then return end
    if chance >= math.random(1,100)  then
        local items = { 'acetone', 'papaverine', 'noscapine',} -- add more items here if you wish but makes sure to change here if you change recipe in config
        for _, rewards in pairs(items) do
            local itemsAmount = math.random(2,4)
            Wait(500)
            addItem(src, rewards, itemsAmount)
        end
        if cashenabled then
            local cashchance = Config.Processing.Mission.CashChance
            local cashamount = Config.Processing.Mission.CashAmount
            if cashchance >= math.random(1,100) then
                if InvType == 'qb' then
                    Player.Functions.AddMoney('cash', cashamount)
                elseif InvType == 'ox' then
                    if exports.ox_inventory:CanCarryItem(src, 'money', cashamount) then
                        exports.ox_inventory:AddItem(src, 'money', cashamount)
                    else
                        SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
                    end
                end
            end
        end
    else
        SendNotify(src, Config.Language.Notifications.NothingFound, 'error', 2000)
    end
end)



--process heroin base
RegisterNetEvent('lusty94_heroin:server:ProcessHeroinBase', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local returnAmount = calculateHeroinReturn(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.HeroinBase.RequiredItemName, Config.Processing.HeroinBase.RequiredItemAmount)
    Wait(500)
    removeItem(src, Config.Processing.HeroinBase.RequiredItem2Name, Config.Processing.HeroinBase.RequiredItem2Amount)
    Wait(500)
    removeItem(src, Config.Processing.HeroinBase.RequiredItem3Name, Config.Processing.HeroinBase.RequiredItem3Amount)
    Wait(500)
    removeItem(src, Config.Processing.HeroinBase.RequiredItem4Name, Config.Processing.HeroinBase.RequiredItem4Amount)
    Wait(500)
    addItem(src, Config.Processing.HeroinBase.ProcessedItemName, returnAmount)
end)


--process pure heroin
RegisterNetEvent('lusty94_heroin:server:ProcessPureHeroin', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local returnAmount = calculateHeroinReturn(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.PureHeroin.RequiredItemName, Config.Processing.PureHeroin.RequiredItemAmount)
    Wait(500)
    removeItem(src, Config.Processing.PureHeroin.RequiredItem2Name, Config.Processing.PureHeroin.RequiredItem2Amount)
    Wait(500)
    removeItem(src, Config.Processing.PureHeroin.RequiredItem3Name, Config.Processing.PureHeroin.RequiredItem3Amount)
    Wait(500)
    addItem(src, Config.Processing.PureHeroin.ProcessedItemName, returnAmount)
end)

-- process heroin vial
RegisterServerEvent('lusty94_heroin:server:ProcessHeroinVial', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local returnAmount = calculateHeroinReturn(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.Bagging.HeroinVial.RequiredItemName, Config.Processing.Bagging.HeroinVial.RequiredItemAmount)
    Wait(500)
    removeItem(src, Config.Processing.Bagging.HeroinVial.RequiredItem3Name, Config.Processing.Bagging.HeroinVial.RequiredItem3Amount)
    Wait(500)
    addItem(src, Config.Processing.Bagging.HeroinVial.BaggedItemName, returnAmount)
end)



-- create overdose cure
RegisterServerEvent('lusty94_heroin:server:CreateOverDoseCure', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName] 
    local returnAmount = calculateHeroinReturn(DrugXP)
    if not Player then return end
    removeItem(src, Config.Processing.Curing.RequiredItemName, Config.Processing.Curing.RequiredItemAmount)
    Wait(500)
    removeItem(src, Config.Processing.Curing.RequiredItem2Name, Config.Processing.Curing.RequiredItem2Amount)
    Wait(500)
    removeItem(src, Config.Processing.Curing.RequiredItem3Name, Config.Processing.Curing.RequiredItem3Amount)
    Wait(500)
    addItem(src, Config.Processing.Curing.ProcessedItemName, returnAmount)
end)





--take heroin vial
RegisterServerEvent('lusty94_heroin:server:TakeHeroin', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    removeItem(src, Config.Processing.TakeDrugs.RequiredItemName, 1)
end)



--update overdose
RegisterServerEvent('lusty94_heroin:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]
    if not Player then return end
    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount))
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then
        Wait(3000)       
        TriggerClientEvent('lusty94_heroin:client:OverDose', src)
    end    
end)

--remove overdose
RegisterServerEvent('lusty94_heroin:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]
    if not Player then return end
    if OverDose >= 1 then
        if Player.Functions.RemoveItem(Config.Processing.Curing.ProcessedItemName, 1) then
            Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount))
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], "remove")
            SendNotify(src, Config.Language.Notifications.OverDoseCuredName, 'success', 2000)
        end
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCured, 'error', 2000)
    return
    end
end)






--------------< COMMANDS >---------------

--/commands
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

--/commands
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


--------------------------< QB-INVENTORY SUPPLY SHOPS >--------------------
--supply shop
RegisterServerEvent('lusty94_heroin:server:SupplyShop', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local heroinSupplies = {
        {name = "trowel",                 price = 5,      amount = 1000, info = {}, type = "item", slot = 1,},
        {name = "emptyvial",              price = 5,      amount = 1000, info = {}, type = "item", slot = 2,},
        {name = "scales",                 price = 500,    amount = 1000, info = {}, type = "item", slot = 3,},
        {name = "plasticjerrycan",        price = 100,    amount = 1000, info = {}, type = "item", slot = 4,},
        {name = "heroinprocessingtable",  price = 1000,   amount = 1000, info = {}, type = "item", slot = 5,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'heroinSupplies',
        label = 'Heroin Supply Shop',
        slots = 5,
        items = heroinSupplies
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'heroinSupplies')
    end
end)


--------------------------< OX_INVENTORY SUPPLY SHOPS >--------------------
--supply shop
function HeroinSupplyShop()
    exports.ox_inventory:RegisterShop('HeroinSupplyShop', {
        name = 'Heroin Supply Shop',
        inventory = {
            { name = 'trowel', price = 5 },
            { name = 'emptyvial', price = 5 },
            { name = 'scales', price = 500 },
            { name = 'plasticjerrycan', price = 100 },
            { name = 'heroinprocessingtable', price = 100 },
        },
    })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Heroin 2.0.1 |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops automatically |^5 ^5--<^3!^5>--^7')
            HeroinSupplyShop()
            print('^5--<^3!^5>-- ^7| Shops registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Heroin/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
		--print(advice)
	end)
end
CheckVersion()