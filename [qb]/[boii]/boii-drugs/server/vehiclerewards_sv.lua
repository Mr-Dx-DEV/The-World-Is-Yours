----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- REWARDS --<!>--
RegisterServerEvent('boii-drugs:sv:VehicleRewards', function(reward, rewardamount)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local CurrentCops = GetCurrentCops()
    if CurrentCops ~= nil then
        amount = rewardamount
    elseif CurrentCops >= 1 and CurrentCops <= 3 then
        amount = math.ceil(rewardamount*1.1)
    elseif CurrentCops >= 3 and CurrentCops <= 5 then
        amount = math.ceil(rewardamount*1.3)
    elseif CurrentCops >= 7 then
        amount = math.ceil(rewardamount*1.5)
    end
    pData.Functions.AddItem(reward, rewardamount)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[reward], 'add', amount)
    TriggerClientEvent('boii-drugs:cl:EndDelivery', src)
end)
--<!>-- REWARDS --<!>--