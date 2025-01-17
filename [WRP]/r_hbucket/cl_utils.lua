/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-helicopter-bucket
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Compatibility init ]]

local ESX = nil

if Config.ESX then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.QB then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- [[ Functions ]]

-- Compare the player's job with the one in the script configuration (only if ESX or QB is enabled)
function verifyJobPlayer(model)
    if model ~= nil then
        if Config.ESX then
            local ESXdata = ESX.GetPlayerData()
            for i = 1, #Config.Helicopter[model].manageJobs do
                if ESXdata.job ~= nil then
                    if ESXdata.job.name == Config.Helicopter[model].manageJobs[i] then
                        return true
                    end
                end
            end
        elseif Config.QB then
            local QBdata = QBCore.Functions.GetPlayerData()
            
            for i = 1, #Config.Helicopter[model].manageJobs do
                if QBdata.job and QBdata.job.name == Config.Helicopter[model].manageJobs[i] then
                    return true
                end
            end
        else
            return true
        end
    end

    return true
end

-- [[ Command ]]

RegisterCommand('setupbucket', function(src, args, rawCommand)
    debug("Command received")

    if veh == 0 then return end
    if Config.Helicopter[entityModel] == nil then debug("Helicopter not found") return end

    if not verifyJobPlayer(entityModel) then return end
    
    local netId = NetworkGetNetworkIdFromEntity(veh)

    if bucket[netId] ~= nil then debug("Helicopter found but already init") return end

    debug("Helicopter found")

    local hash = GetHashKey('bambi_bucket')
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(5)
    end

    debug("Loaded model")

    TriggerServerEvent('r_hbucket:server:createBucket', netId)
end, false)

function Hint(message)
    AddTextEntry('r_hbucket', message)
    BeginTextCommandDisplayHelp('r_hbucket')
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

function DrawHud()
    if Config.Helicopter[entityModel] == nil then return end
    
    ClearPrints()
    SetTextEntry_2("STRING")
    text = Config.Languages[Config.Language]['quantity']
    text = text:gsub("{s}", floor(bucket[netId].quantity))
    text = text:gsub("{m}", Config.Helicopter[entityModel].capacity)
    AddTextComponentString(text)
    DrawSubtitleTimed(10, 1)
end

function debug(text)
    if Config.Debug then
        print(text)
    end
end