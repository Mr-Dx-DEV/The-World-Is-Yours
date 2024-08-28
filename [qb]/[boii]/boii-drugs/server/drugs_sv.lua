----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- POLICE NOTIFY --<!>--
RegisterServerEvent('boii-drugs:sv:AlertPolice', function(coords)
	local players = Core.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        for i = 1, #Config.JobSettings.Services.Jobs, 1 do
            if v and v.PlayerData.job.name == Config.JobSettings.Services.Jobs[i].name and v.PlayerData.job.onduty then
                TriggerClientEvent('boii-drugs:cl:AlertPolice', -1, coords)
            end
        end
    end
end)
--<!>-- POLICE NOTIFY--<!>--

--<!>-- POLICE TRACKER --<!>--
RegisterServerEvent('boii-drugs:sv:AlertPoliceTracker', function(coords)
	local players = Core.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        for i = 1, #Config.JobSettings.Services.Jobs, 1 do
            if v and v.PlayerData.job.name == Config.JobSettings.Services.Jobs[i].name and v.PlayerData.job.onduty then
                TriggerClientEvent('boii-drugs:cl:AlertPoliceTracker', -1, coords)
            end
        end
    end
end)
--<!>-- POLICE TRACKER--<!>--

--<!>-- ADD/REMOVE ITEM EVENTS START --<!>--
-- Remove item event; Added due to recent qb-core update.
RegisterServerEvent('boii-drugs:sv:RemoveItem', function(itemremove, amount)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if pData.Functions.RemoveItem(itemremove, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemremove], 'remove', amount)
    end
end)
-- Add item event; Added due to recent qb-core update.
RegisterServerEvent('boii-drugs:sv:AddItem', function(itemadd, amount)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if pData.Functions.AddItem(itemadd, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemadd], 'add', amount)
    end
end)
--<!>-- ADD/REMOVE ITEM EVENTS END --<!>--

--<!>-- ADD MONEY --<!>--
RegisterServerEvent('boii-drugs:sv:SearchGuardReward', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if Config.Ketamine.Search.Peds.Money.Use == 'money' then
        pData.Functions.AddMoney(Config.Ketamine.Search.Peds.Money.Money, Config.Ketamine.Search.Peds.Money.Amount, 'pickpocket-ketamine')
        return
    end
    if Config.Ketamine.Search.Peds.Money.Use == 'item' then
        pData.Functions.AddItem(Config.Ketamine.Search.Peds.Money.Item, Config.Ketamine.Search.Peds.Money.Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Ketamine.Search.Peds.Money.Item], 'add', Config.Ketamine.Search.Peds.Money.Amount)
    end
end)
--<!>-- ADD MONEY --<!>--