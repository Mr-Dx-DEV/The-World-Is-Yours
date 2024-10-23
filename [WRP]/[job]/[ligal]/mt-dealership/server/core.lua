if Config.Core == 'qb' then
    Core = exports[Config.CoreName]:GetCoreObject()
elseif Config.Core == 'esx' then
    ESX = exports[Config.CoreName]:getSharedObject()
end

serverVehicles = {}
CreateThread(function()
    if Config.Core == 'qb' then
        serverVehicles = Core.Shared.Vehicles
    elseif Config.Core == 'esx' then
        serverVehicles = Config.vehicles
    end
end)

if Config.Core == 'esx' then
    lib.callback.register('mt-dealership:server:getPlayerJobESX', function(source)
        local src = source
        local Player = ESX.GetPlayerFromId(src)
        return Player.getJob().name
    end)

    lib.callback.register('mt-dealership:server:getPlayerJobIsBossESX', function(source)
        local src = source
        local Player = ESX.GetPlayerFromId(src)
        if Player.getJob().grade_name == 'boss' then return true else return false end
    end)
end

function getPlayerJob()
    local src = source
    local PlayerJob = nil
    if Config.Core == 'qb' then
        local Player = Core.Functions.GetPlayer(src)
        if not Player then return end
        PlayerJob = Player.PlayerData.job.name
    elseif Config.Core == 'esx' then
        local Player = ESX.GetPlayerFromId(src)
        if not Player then return end
        PlayerJob = Player.getJob().name
    end
    return PlayerJob
end
