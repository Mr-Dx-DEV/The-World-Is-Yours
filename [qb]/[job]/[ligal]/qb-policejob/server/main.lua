-- Variables
local Plates = {}
local PlayerStatus = {}
local Casings = {}
local BloodDrops = {}
local FingerDrops = {}
local Objects = {}
local QBCore = exports['qb-core']:GetCoreObject()
local updatingCops = false

-- Functions
local function UpdateBlips()
    local dutyPlayers = {}
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and (v.PlayerData.job.name == "police" or v.PlayerData.job.type == "leo" or v.PlayerData.job.name == "ambulance") and v.PlayerData.job.onduty then
            local coords = GetEntityCoords(GetPlayerPed(v.PlayerData.source))
            local heading = GetEntityHeading(GetPlayerPed(v.PlayerData.source))
            dutyPlayers[#dutyPlayers + 1] = {
                source = v.PlayerData.source,
                label = v.PlayerData.metadata["callsign"],
                job = v.PlayerData.job.name,
                location = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                    w = heading
                }
            }
        end
    end
    TriggerClientEvent("police:client:UpdateBlips", -1, dutyPlayers)
end

local function CreateBloodId()
    local bloodId = math.random(10000, 99999)
    while BloodDrops and BloodDrops[bloodId] do
        bloodId = math.random(10000, 99999)
    end
    return bloodId
end

local function CreateFingerId()
    local fingerId = math.random(10000, 99999)
    while FingerDrops and FingerDrops[fingerId] do
        fingerId = math.random(10000, 99999)
    end
    return fingerId
end

local function CreateCasingId()
    local caseId = math.random(10000, 99999)
    while Casings and Casings[caseId] do
        caseId = math.random(10000, 99999)
    end
    return caseId
end

local function CreateObjectId()
    local objectId = math.random(10000, 99999)
    while Objects and Objects[objectId] do
        objectId = math.random(10000, 99999)
    end
    return objectId
end

local function IsVehicleOwned(plate)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    return result
end

local function GetCurrentCops()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and (v.PlayerData.job.name == "police" or v.PlayerData.job.type == "leo") and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

local function DnaHash(s)
    return string.gsub(s, ".", function(c)
        return string.format("%02x", string.byte(c))
    end)
end

-- Utility function to check player proximity
local function IsPlayerNear(src, targetId, distance)
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(targetId)
    if not playerPed or not targetPed then return false end

    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    return #(playerCoords - targetCoords) <= distance
end

-- Safe notification for proximity checks
local function NotifyProximityViolation(src)
    -- Log or notify admins of potential exploit
    print("Player " .. src .. " is attempting proximity exploit.")
    TriggerClientEvent('QBCore:Notify', src, "You are too far from the target to perform this action.", "error")
end

-- Commands
QBCore.Commands.Add("spikestrip", Lang:t("commands.place_spike"), {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
        TriggerClientEvent('police:client:SpawnSpikeStrip', source)
    end
end)

QBCore.Commands.Add("grantlicense", Lang:t("commands.license_grant"), {{name = "id", help = Lang:t('info.player_id')}, {name = "license", help = Lang:t('info.license_type')}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.type == "leo" and Player.PlayerData.job.grade.level >= Config.LicenseRank then
        local SearchedPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if not SearchedPlayer then return end
        local licenseTable = SearchedPlayer.PlayerData.metadata["licences"]
        if licenseTable[args[2]] then
            TriggerClientEvent('QBCore:Notify', source, Lang:t("error.license_already"), "error")
            return
        end
        licenseTable[args[2]] = true
        SearchedPlayer.Functions.SetMetaData("licences", licenseTable)
        TriggerClientEvent('QBCore:Notify', SearchedPlayer.PlayerData.source, Lang:t("success.granted_license"), "success")
        TriggerClientEvent('QBCore:Notify', source, Lang:t("success.grant_license"), "success")
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.rank_license"), "error")
    end
end)

QBCore.Commands.Add("cuff", Lang:t("commands.cuff_player"), {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
        TriggerClientEvent("police:client:CuffPlayer", source)
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.on_duty_police_only"), "error")
    end
end)

QBCore.Commands.Add("escort", Lang:t("commands.escort"), {}, false, function(source)
    TriggerClientEvent("police:client:EscortPlayer", source)
end)

QBCore.Commands.Add("flagplate", Lang:t("commands.flagplate"), {{name = "plate", help = Lang:t('info.plate_number')}, {name = "reason", help = Lang:t('info.flag_reason')}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
        local reason = table.concat(args, " ", 2)
        Plates[args[1]:upper()] = {
            isflagged = true,
            reason = reason
        }
        TriggerClientEvent('QBCore:Notify', source, Lang:t("info.vehicle_flagged", {vehicle = args[1]:upper(), reason = reason}))
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.on_duty_police_only"), "error")
    end
end)

QBCore.Commands.Add("unflagplate", Lang:t("commands.unflagplate"), {{name = "plate", help = Lang:t('info.plate_number')}}, true, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" or Player.PlayerData.job.type == "leo" and Player.PlayerData.job.onduty then
        local plate = args[1]:upper()
        if Plates[plate] and Plates[plate].isflagged then
            Plates[plate].isflagged = false
            TriggerClientEvent('QBCore:Notify', source, Lang:t("info.unflag_vehicle", {vehicle = plate}))
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t("error.vehicle_not_flag"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, Lang:t("error.on_duty_police_only"), "error")
    end
end)

-- Example of refactoring proximity check for cuffing a player
RegisterNetEvent('police:server:CuffPlayer', function(playerId, isSoftcuff)
    local src = source
    if not IsPlayerNear(src, playerId, 2.5) then
        NotifyProximityViolation(src)
        return
    end
    local Player = QBCore.Functions.GetPlayer(src)
    local CuffedPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("police:client:GetCuffed", CuffedPlayer.PlayerData.source, Player.PlayerData.source, isSoftcuff)
end)

-- Example for escorting a player with proximity check
RegisterNetEvent('police:server:EscortPlayer', function(playerId)
    local src = source
    if not IsPlayerNear(src, playerId, 2.5) then
        NotifyProximityViolation(src)
        return
    end
    local Player = QBCore.Functions.GetPlayer(src)
    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("police:client:GetEscorted", EscortPlayer.PlayerData.source, Player.PlayerData.source)
end)

-- Additional refactoring for other proximity-based functions
RegisterNetEvent('police:server:PutPlayerInVehicle', function(playerId)
    local src = source
    if not IsPlayerNear(src, playerId, 2.5) then
        NotifyProximityViolation(src)
        return
    end
    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("police:client:PutInVehicle", EscortPlayer.PlayerData.source)
end)

RegisterNetEvent('police:server:SetPlayerOutVehicle', function(playerId)
    local src = source
    if not IsPlayerNear(src, playerId, 2.5) then
        NotifyProximityViolation(src)
        return
    end
    local EscortPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("police:client:SetOutVehicle", EscortPlayer.PlayerData.source)
end)

-- And so on for other server-side events where proximity checks are needed...
