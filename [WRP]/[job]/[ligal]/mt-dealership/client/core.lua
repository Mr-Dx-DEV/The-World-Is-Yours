
if Config.Core == 'qb' then
    QBCore = exports[Config.CoreName]:GetCoreObject()
elseif Config.Core == 'esx' then
    ESX = exports[Config.CoreName]:getSharedObject()
end

serverVehicles = {}
CreateThread(function()
    if Config.Core == 'qb' then
        serverVehicles = QBCore.Shared.Vehicles
    elseif Config.Core == 'esx' then
        serverVehicles = Config.vehicles
    end
end)

function getPlayerJob()
    local PlayerJob = nil
    if Config.Core == 'qb' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        PlayerJob = PlayerData.job.name
    elseif Config.Core == 'esx' then
        PlayerJob = lib.callback.await('mt-dealership:server:getPlayerJobESX', false)
    end
    return PlayerJob
end

function getIsBossJob()
    local PlayerBoss = false
    if Config.Core == 'qb' then
        local PlayerData = QBCore.Functions.GetPlayerData()
        PlayerBoss = PlayerData.job.isboss
    elseif Config.Core == 'esx' then
        PlayerBoss = lib.callback.await('mt-dealership:server:getPlayerJobIsBossESX', false)
    end
    return PlayerBoss
end

function openManagementMenu()
    if Config.Core == 'qb' then
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    elseif Config.Core == 'esx' then
        TriggerEvent('esx_society:openBossMenu', getPlayerJob(), function(menu)
            ESX.CloseContext() 
        end, {wash = false})
    end
end
