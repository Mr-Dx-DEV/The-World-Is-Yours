local QBCore = exports["qb-core"]:GetCoreObject()
local InQueue = {}
local ActiveContracts = {}

-------- POPULATE CARS ---------------
local Cars = {}
local Tiers = {}
CreateThread(function()
    -- Temporary table to hold tiers and their xpRequired values
    local tempTable = {}

    -- Fill the tempTable with pairs of 'tier-xpRequired'
    for tier, v in pairs(Config.Tiers) do
        table.insert(tempTable, {tier = tier, xpRequired = v.xpRequired})
    end

    -- Sort the tempTable based on the 'xpRequired' value
    table.sort(tempTable, function(a, b)
        return a.xpRequired < b.xpRequired
    end)

    -- Now, populate the Cars and Tiers tables in the correct order
    for _, v in ipairs(tempTable) do
        Cars[v.tier] = {}
        table.insert(Tiers, v.tier)
    end
end)

CreateThread(function()
    while not QBCore do Wait(250) end
    for k, v in pairs(QBCore.Shared.Vehicles) do
        if v["tier"] and Cars[v["tier"]] then
            Cars[v["tier"]][#Cars[v["tier"]] + 1] = {
                model = v["model"],
                name = v["name"]
            }
        end
    end

    local function WarnTier(tiers)
        if LengthOfTable(tiers) < 1 then return end
        local tierStr = ""
        for _, tier in ipairs(tiers) do
            tierStr = tierStr .. tier:upper() .. ", "
        end

        local msgs = {
            "{separator}",
            "CAR BOOSTING: ERROR IN SETUP DETECTED",
            "{separator}",
            "TIER(s) {tiers} HAVE NO ASSOCIATED VEHICLES",
            "IN QB-CORE VEHICLES.LUA",
            "{separator}",
            "PLEASE REFER TO DOCUMENTATION",
            "FOR FURTHER INFORMATION!",
            "https://docs.elusivestudios.net",
            "{separator}",
        }

        local maxWidth = 56
        local separator = "-"
        
        for _, msg in ipairs(msgs) do
            local msgLength = #msg
            local printMsg = ""
            if msg == "{separator}" then
                -- Insert separator
                for i = 1, maxWidth do
                    printMsg = printMsg .. separator
                end
                print(printMsg)
            elseif string.find(msg, "{tiers}") then
                -- Message that contains the tiers
                local newStr = string.gsub(msg, "{tiers}", tierStr)
                msgLength = #newStr
                local remaining = maxWidth - msgLength
                local eachLength = remaining / 2
                local eachMsg = ""
                for i = 1, eachLength do
                    eachMsg = eachMsg .. separator
                end
                printMsg = eachMsg .. newStr .. eachMsg
                print(printMsg)
            else
                -- Everything else
                local remaining = maxWidth - msgLength
                local eachLength = remaining / 2
                local eachMsg = ""
                for i = 1, eachLength do
                    eachMsg = eachMsg .. separator
                end
                printMsg = eachMsg .. msg .. eachMsg
                print(printMsg)
            end
        end
    end

    -- Wait a few seconds to make sure message is at bottom of output
    Wait(3000)

    -- Check if tiers have been setup properly
    local notFound = {}
    if LengthOfTable(Cars) > 0 then
        for _, tier in pairs(Tiers) do
            if LengthOfTable(Cars[tier]) < 1 then
                table.insert(notFound, tier)
            end
        end

        if LengthOfTable(notFound) > 0 then
            WarnTier(notFound)
        end
    else
        WarnTier(Tiers)
    end

end)

--------- NOTIFICATIONS ---------------
local function Notify(src, text, type)
    TriggerClientEvent("QBCore:Notify", src, text, type)
end

--------- QUEUE SYSTEM ----------------
QBCore.Functions.CreateCallback("qb-boosting:server:Queue", function(src, cb, status)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then cb("error") return end
    local PData = Player.PlayerData
    if not PData then cb("error") return end
    local CID = PData.citizenid
    if not CID then cb("error") return end
    if status and not InQueue[CID] then
        -- Join Queue
        InQueue[CID] = {}
        cb("success")
        if Config.Debug then print("Boosting: ", CID, "joined queue") end
    elseif InQueue[CID] then
        -- Leave Queue
        InQueue[CID] = nil
        cb("success")
        if Config.Debug then print("Boosting: ", CID, "left queue") end
    else
        cb("error")
        return
    end
end)

RegisterNetEvent("qb-boosting:server:lbmail", function(subject, text)
    local src = source
    local number = exports["lb-phone"]:GetEquippedPhoneNumber(src)
    local email = exports["lb-phone"]:GetEmailAddress(number)
    local success, id = exports["lb-phone"]:SendMail({
        to = email,
        subject = subject,
        message = text,
        attachments = {},
        actions = {}
    })
end)

RegisterNetEvent("qb-boosting:server:renewedmail", function(subject, text)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    local mailData = {
        sender = "Unknown",
        subject = subject,
        message = text,
    }
    TriggerEvent("qb-phone:server:sendNewMail", mailData, cid)
end)

CreateThread(function()
    while true do
        Wait(Config.Debug and 3000 or math.random(Config.IssueDelay[1] * 1000, Config.IssueDelay[2] * 1000))
        if LengthOfTable(InQueue) > 0 then
            for cid, data in pairs(InQueue) do
                if cid and IsOnline(cid) and AmountOfContracts(cid) < Config.MaxContracts then
                    CreateContract(GetSource(cid))
                elseif cid and not IsOnline(cid) then
                    InQueue[cid] = nil
                end
            end
        end
    end
end)

------------ UTIL FUNCTIONS ---------------
function GetNumCops()
    local players = QBCore.Functions.GetQBPlayers()
    local num = 0
    for _, ply in pairs(players) do
        if Config.PoliceJobs[ply.PlayerData.job.name] and ply.PlayerData.job.onduty then
            num = num + 1
        end
    end
    return num
end

function LengthOfTable(tbl)
    local int = 0
    for _ in pairs(tbl) do int = int + 1 end
    return int
end

function IsOnline(CID)
    local players = QBCore.Functions.GetQBPlayers()
    for _, data in pairs(players) do
        if data.PlayerData.citizenid == CID then
            return true
        end
    end
    return false
end

function GetSource(CID)
    local players = QBCore.Functions.GetQBPlayers()
    for _, data in pairs(players) do
        if data.PlayerData.citizenid == CID then
            return data.PlayerData.source
        end
    end
    return false
end

function GenerateTimestamp()
    local currentTime = os.time()
    local expirationTime = currentTime + (Config.Expiration * 3600)
    return expirationTime
end

function IsPlateAvailable(plate)
    if LengthOfTable(ActiveContracts) < 1 then return true end
    for _, contract in pairs(ActiveContracts) do
        if contract.plate == plate then
            return false
        end
    end
    return true
end

function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar("SELECT plate FROM player_vehicles WHERE plate = ?", { plate })
    if result or not IsPlateAvailable(plate) then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

function convertToSortedArray(tiersTable)
    local sortedTiers = {}
    for tierName, tierData in pairs(tiersTable) do
        tierData.name = tierName
        table.insert(sortedTiers, tierData)
    end
    table.sort(sortedTiers, function(a, b) return a.xpRequired < b.xpRequired end)
    return sortedTiers
end

function RepToTier(rep)
    local sortedTiers = convertToSortedArray(Config.Tiers)
    local defaultTier = sortedTiers[1].name  -- default tier
    for i, t in ipairs(sortedTiers) do
        if rep >= t.xpRequired then
            defaultTier = t.name
        else
            break
        end
    end
    return defaultTier
end

function AllowedTiers(PlayerTier)
    local idxPlayerTier = 0
    -- Find the index of player's tier
    for idx, tier in ipairs(Tiers) do
        if tier == PlayerTier then
            idxPlayerTier = idx
            break
        end
    end

    -- Get only the tiers up to the player's tier
    local allowedTiers = {}
    for i = 1, idxPlayerTier do
        table.insert(allowedTiers, Tiers[i])
    end

    return allowedTiers
end

function AdjustProbabilities(PlayerTier, allowedTiers)
    -- Initialize adjusted probabilities
    local probAdjusted = {}

    local decreaseFactor = 0.5  -- Adjust this value to control the decrease rate

    -- Find player's tier index
    local playerTierIndex = 0
    for index, tier in ipairs(Tiers) do
        if tier == PlayerTier then
            playerTierIndex = index
            break
        end
    end

    for _, tier in ipairs(allowedTiers) do
        -- Find current tier index
        local currentTierIndex = 0
        for index, tierName in ipairs(Tiers) do
            if tierName == tier then
                currentTierIndex = index
                break
            end
        end

        local tierDiff = playerTierIndex - currentTierIndex

        if tierDiff == 0 then
            probAdjusted[tier] = Config.Tiers[tier].probability
        else
            -- Decrease the probability for lower tiers
            probAdjusted[tier] = Config.Tiers[tier].probability * decreaseFactor^tierDiff
        end
    end

    -- Normalize the probabilities so they sum up to 1
    local total = 0
    for _, probability in pairs(probAdjusted) do
        total = total + probability
    end

    for tier, probability in pairs(probAdjusted) do
        probAdjusted[tier] = probability / total
    end

    return probAdjusted
end


function getRandomTier(PlayerTier, allowedTiers)
    local adjustedProbabilities = AdjustProbabilities(PlayerTier, allowedTiers)

    math.randomseed(os.time())
    local randomValue = math.random()

    local currentSum = 0

    -- sort tiers from allowedTiers to ensure consistent order
    table.sort(allowedTiers)

    for _, tier in ipairs(allowedTiers) do
        currentSum = currentSum + adjustedProbabilities[tier]
        if randomValue <= currentSum then
            return tier
        end
    end

    return nil
end


function RandomName()
    math.randomseed(os.time())
    local first = Config.FirstNames[math.random(1, LengthOfTable(Config.FirstNames))]
    local last = Config.LastNames[math.random(1, LengthOfTable(Config.LastNames))]
    return first .. " " .. last
end

function RandomCar(tier, type)
    if not Cars[tier] or (Cars[tier] and LengthOfTable(Cars[tier]) < 1) then return nil end
    math.randomseed(os.time())
    if type == "VIN Scratch" then
        local rand = math.random(1, #Config.Tiers[tier].scratchVehicles)
        return {Config.Tiers[tier].scratchVehicles[rand]["name"]:upper(), Config.Tiers[tier].scratchVehicles[rand]["model"], rand}
    else
        local rand = math.random(1, #Cars[tier])
        return {Cars[tier][rand]["name"]:upper(), Cars[tier][rand]["model"]}
    end
end

local int = 0
function GenerateIdentifier()
    int = int + 1
    return int
end

function AddContractToList(cid, contract)
    if not ActiveContracts[cid] then ActiveContracts[cid] = {} end
    table.insert(ActiveContracts[cid], contract)
end

function tableContains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function GenerateVehicleSpawn(tier)
    -- Wrap each spawn location with its original index
    local indexedSpawnLocations = {}
    for i, spawnLocation in ipairs(Config.SpawnLocations) do
        table.insert(indexedSpawnLocations, {index = i, value = spawnLocation})
    end

    -- Shuffle the indexed spawn locations
    local shuffledSpawnLocations = shuffleArray(indexedSpawnLocations)

    -- Iterate through the shuffled array
    for i, spawnLocation in ipairs(shuffledSpawnLocations) do
        if not spawnLocation.value.active and (tableContains(spawnLocation.value.tiers, tier)) then
            -- Return the original index of the selected spawn location
            return spawnLocation.index
        end
    end
    return -1
end

function ShuffleTable(tbl)
    local n = #tbl
    local shuffled_table = {}
    local original_indices = {}

    -- create a copy of the original table and index map
    for i = 1, n do
        shuffled_table[i] = tbl[i]
        original_indices[tbl[i]] = i
    end

    -- Fisher-Yates shuffle algorithm
    for i = n, 2, -1 do
        local j = math.random(i) -- get random index
        shuffled_table[i], shuffled_table[j] = shuffled_table[j], shuffled_table[i] -- swap elements
    end

    -- find first available route
    for i = 1, n do
        if not shuffled_table[i].active then
            return original_indices[shuffled_table[i]]
        end
    end

    return nil -- if no available routes
end

function shuffleArray(array)
    local n = #array
    for i = n, 2, -1 do
        local j = math.random(i)
        array[i], array[j] = array[j], array[i]
    end
    return array
end

function getIndexByValue(array, value)
    for index, v in ipairs(array) do
        if v == value then
            return index
        end
    end
    return nil
end

function GenerateDropoff()
    return ShuffleTable(Config.ReturnLocations)
end

function GenerateScratchLocation()
    return ShuffleTable(Config.ScratchLocations)
end

function AmountOfContracts(cid)
    if not ActiveContracts[cid] then return 0 end
    return LengthOfTable(ActiveContracts[cid])
end

function GetContractFromID(cid, id)
    for _, v in pairs(ActiveContracts[cid]) do
        if v.id == id then
            return _
        end
    end
end

function SyncData(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local PData = Player.PlayerData
    local xp = PData.metadata["carboostrep"] or 0
    local tier = RepToTier(xp)
    local balance = 0
    if Config.Payment == "crypto" then
        balance = PData.money.crypto
    elseif Config.Payment == "cash" then
        balance = PData.money.cash
    elseif Config.Payment == "bank" then
        balance = PData.money.bank
    elseif Config.Payment == "renewed" then
        local coin = Config.CryptoCoin
        local crypto = Player.PlayerData.metadata.crypto
        balance = crypto[coin]
    end
    TriggerClientEvent("qb-boosting:client:syncDataUI", src, xp, tier, balance)
end

function CreateContract(src, data)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local PlayerRep = PData.metadata["carboostrep"] or 0
    local PlayerTier = RepToTier(PlayerRep)
    local CanScratch = Config.Tiers[PlayerTier].canScratch
    
    if data then
        TriggerClientEvent("qb-boosting:client:SendContract", src, data)
        return
    end
    
    math.randomseed(os.time())
    
    local identifier = GenerateIdentifier()
    local gType = "Boosting"
    local Allowed = AllowedTiers(PlayerTier)
    local gTier = getRandomTier(PlayerTier, Allowed)
    local gName = RandomName()
    local gPlate = GeneratePlate()
    local gCost = math.random(Config.Tiers[gTier].cost[1], Config.Tiers[gTier].cost[2])
    
    math.randomseed(os.time())
    local random = math.random(1, 100)
    if CanScratch and random <= Config.Tiers[gTier].scratchChance then
        gType = "VIN Scratch"
    end

    local hasTracker = Config.Tiers[gTier].hasTracker
    
    local gCar = RandomCar(gTier, gType)

    if gType == "VIN Scratch" then
        gCost = math.random(Config.Tiers[gTier].scratchVehicles[gCar[3]].cost[1], Config.Tiers[gTier].scratchVehicles[gCar[3]].cost[2])
    end

    local contract = {
        id = identifier,
        type = gType,
        letter = gTier,
        name = gName,
        car = gCar[1],
        model = gCar[2],
        plate = gPlate,
        buyInCost = gCost,
        creationTime = GenerateTimestamp(),
        active = false,
        tracker = hasTracker,
        playerSource = src
    }
    AddContractToList(PData.citizenid, contract)
    TriggerClientEvent("qb-boosting:client:SendContract", src, contract)
end

function StartBoostContract(src, cid, id)
    local contractID = GetContractFromID(cid, id)
    local spawn = GenerateVehicleSpawn(ActiveContracts[cid][contractID].letter)
    if spawn < 1 then
        Notify(src, "No Spawns Found", "error")
    else
        Config.SpawnLocations[spawn].active = true
    end
    ActiveContracts[cid][contractID].spawn = spawn
    local model = ActiveContracts[cid][contractID].model
    local spawnCoords = Config.SpawnLocations[spawn].spawnCoords
    local plate = ActiveContracts[cid][contractID].plate
    math.randomseed(os.time())
    local random = 1
    if Config.Debug then
        random = math.random(4, 7)
    else
        random = math.random(10, 30)
    end

    TriggerClientEvent("qb-boosting:client:MissionStarted", src, {ActiveContracts[cid][contractID], spawn})
    CreateThread(function()
        Wait(random * 1000)
        TriggerClientEvent("qb-boosting:client:SpawnVehicle", src, {model, spawnCoords, plate})
    end)

end

function RandomVIN()
    local random = tostring(QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(2)):
        upper()
    return random
end

function AddVin(plate)
    MySQL.query("UPDATE player_vehicles SET vinnumber = @vin WHERE plate = @plate", {
        ["@vin"] = RandomVIN(),
        ["@plate"] = plate
    })
end
exports("AddVin", AddVin)

local function GetCID(src)
    if LengthOfTable(ActiveContracts) > 0 then
        for k, v in pairs(ActiveContracts) do
            if v.playerSource == src then
                return k
            end
        end
    end
end

function SendMessage(src, message)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local CID = PData.citizenid
    MySQL.query("INSERT INTO car_boosting_messages (citizenid, message) VALUES (@citizenid, @message)", {
        ["@citizenid"] = CID,
        ["@message"] = message
    })

    local msgs = GetMessages(src)
    TriggerClientEvent("qb-boosting:client:ReceiveMessages", src, msgs)
end

function GetMessages(src)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local CID = PData.citizenid
    local messages = MySQL.Sync.fetchAll("SELECT * FROM car_boosting_messages WHERE citizenid = @citizenid", {
        ["@citizenid"] = CID
    })

    return messages
end

function LogBoost(src, boostType, vehicle, value, success, enemy_killed)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local CID = PData.citizenid
    MySQL.query("INSERT INTO car_boosting (citizenid, type, vehicle, value, success, enemy_killed) VALUES (@citizenid, @type, @vehicle, @value, @success, @enemy_killed)", {
        ["@citizenid"] = CID,
        ["@type"] = boostType,
        ["@vehicle"] = vehicle,
        ["@value"] = value,
        ["@success"] = success,
        ["@enemy_killed"] = enemy_killed
    })
end

------------- CALL BACKS ------------------

QBCore.Functions.CreateCallback("qb-boosting:server:GetMessages", function(src, cb)
    local messages = GetMessages(src)
    cb(messages)
end)

QBCore.Functions.CreateCallback("qb-boosting:server:GetBoostData", function(src, cb)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb("error") end
    local PData = Player.PlayerData
    if not PData then return cb("error") end
    local CID = PData.citizenid
    if not CID then return cb("error") end
    local boosts = MySQL.Sync.fetchAll("SELECT * FROM car_boosting WHERE citizenid = @citizenid", {
        ["@citizenid"] = CID
    })

    if #boosts < 1 then
        return cb("nodata")
    end

    -- Get Total Enemies Killed
    local enemiesKilled = 0
    for _, v in pairs(boosts) do
        enemiesKilled = enemiesKilled + v.enemy_killed
    end

    -- Get Total Successes
    local totalSuccesses = 0
    for _, v in pairs(boosts) do
        if v.success == 1 then
            totalSuccesses = totalSuccesses + 1
        end
    end

    -- Get Total Failures
    local totalFailures = 0
    for _, v in pairs(boosts) do
        if v.success == 0 then
            totalFailures = totalFailures + 1
        end
    end

    -- Get Total Value
    local totalValue = 0
    for _, v in pairs(boosts) do
        totalValue = totalValue + v.value
    end

    cb({
        total = #boosts,
        successes = totalSuccesses,
        failures = totalFailures,
        value = totalValue,
        enemies = enemiesKilled,
        contracts = boosts
    })
end)

QBCore.Functions.CreateCallback("qb-boosting:server:Accept", function(src, cb, id)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb("error") end
    local PData = Player.PlayerData
    if not PData then return cb("error") end
    local CID = PData.citizenid
    if not CID then return cb("error") end
    if not id then return cb("error") end

    math.randomseed(os.time())
    local contract = ActiveContracts[CID][GetContractFromID(CID, id)]
    if contract.type == "Boosting" then
        if GetNumCops() < Config.Tiers[contract.letter].MinCops then cb("nocops") return end
    elseif contract.type == "VIN Scratch" then
        if GetNumCops() < Config.Tiers[contract.letter].MinCopsVin then cb("nocops") return end
    end

    local cost = contract.buyInCost
    local balance = 0
    if Config.Payment == "crypto" then
        balance = PData.money.crypto
    elseif Config.Payment == "cash" then
        balance = PData.money.cash
    elseif Config.Payment == "bank" then
        balance = PData.money.bank
    elseif Config.Payment == "renewed" then
        local coin = Config.CryptoCoin
        local crypto = Player.PlayerData.metadata.crypto
        balance = crypto[coin]
    end
    if balance < cost then
        cb("error.cost")
        return
    elseif Config.Payment ~= "renewed" then
        Player.Functions.RemoveMoney(Config.Payment, cost)
    else
        local coin = Config.CryptoCoin
        exports["qb-phone"]:RemoveCrypto(src, coin, cost)
    end

    StartBoostContract(src, CID, id)
    contract.active = true
    SyncData(src)

    cb("success")
end)

QBCore.Functions.CreateCallback("qb-boosting:server:Decline", function(src, cb, id)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb("error") end
    local PData = Player.PlayerData
    if not PData then return cb("error") end
    local CID = PData.citizenid
    if not CID then return cb("error") end
    if not id then return cb("error") end

    for k, contract in pairs(ActiveContracts[CID]) do
        if contract.id == id then
            ActiveContracts[CID][k] = nil
            break
        end
    end

    cb("success")
end)

QBCore.Functions.CreateCallback("qb-boosting:server:Cancel", function(src, cb, data)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return cb("error") end
    local PData = Player.PlayerData
    if not PData then return cb("error") end
    local CID = PData.citizenid
    if not CID then return cb("error") end
    if not data then return cb("error") end

    for k, contract in pairs(ActiveContracts[CID]) do
        if contract.id == data[1] then

            -- Make Spawn Available
            local spawn = ActiveContracts[CID][k].spawn
            if spawn then
                Config.SpawnLocations[spawn].active = false
            end
        
            -- Make Dropoff Available
            local dropoff = ActiveContracts[CID][k].dropoff
            if dropoff then
                Config.ReturnLocations[dropOff].active = false
            end
        
            -- Make Scratch Available
            local scratchLocation = ActiveContracts[CID][k].scratchLocation
            if scratchLocation then
                Config.ScratchLocations[scratchLocation].active = false
            end

            local enemyKilled = contract.enemy_killed or 0
            local contractType = "Boost"
            if contract.type == "VIN Scratch" then
                contractType = "Scratch"
            end
            LogBoost(src, contractType, contract.model, 0, false, enemyKilled)

            ActiveContracts[CID][k] = nil
            break
        end
    end

    Config.SpawnLocations[data[2]].active = false
    SyncData(src)

    cb("success")
end)

QBCore.Functions.CreateCallback("qb-boosting:server:GetTime", function(src, cb)
    cb(os.time())
end)

---------------- NET EVENTS ----------------------
RegisterNetEvent("qb-boosting:server:TrackerStatus", function(id, status)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].tracker = not status
    local type = ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].type
    if status and type == "Boosting" then
        local dropOff = GenerateDropoff()
        Config.ReturnLocations[dropOff].active = true
        ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].dropoff = dropOff
        TriggerClientEvent("qb-boosting:client:DropOffNotify", src, dropOff)
    elseif status then
        local scratchLocation = GenerateScratchLocation()
        Config.ScratchLocations[scratchLocation].active = true
        ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].scratchLocation = scratchLocation
        TriggerClientEvent("qb-boosting:client:VINScratchNotify", src, scratchLocation)
    end
end)

RegisterNetEvent("qb-boosting:server:Reward", function(id, netid, model, mods)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local contract = ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)]
    local tier = contract.letter
    local type = contract.type
    math.randomseed(os.time())
    if type == "Boosting" then
        local rewardCrypto = math.random(Config.Tiers[tier].payment[1], Config.Tiers[tier].payment[2])
        if Config.Tiers[tier].damageDetection.enabled then
            local damage = contract.damage or 0
            rewardCrypto = rewardCrypto - (rewardCrypto * Config.Tiers[tier].damageDetection.reduction) * damage
        end
        if Config.Payment ~= "renewed" then
            Player.Functions.AddMoney(Config.Payment, rewardCrypto)
        else
            exports["qb-phone"]:AddCrypto(src, Config.CryptoCoin, rewardCrypto)
        end
        Notify(src, Lang:t("info.received_reward"), "success")
        local enemyKilled = contract.enemy_killed or 0
        LogBoost(src, "Boost", contract.model, rewardCrypto, true, enemyKilled)
    else
        local entity = NetworkGetEntityFromNetworkId(netid)
        local plate = GetVehicleNumberPlateText(entity)
        MySQL.insert.await("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, vinscratch, vinnumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        , {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            model,
            entity,
            json.encode(mods),
            plate,
            0,
            1,
            RandomVIN()
        })
        Config.VehicleKeys(src, plate)
        TriggerClientEvent("QBCore:Notify", src, "VIN Scratched.", "success")
        local enemyKilled = contract.enemy_killed or 0
        LogBoost(src, "Scratch", contract.model, 0, true, enemyKilled)
    end
    local rewardXP = math.random(Config.Tiers[tier].xpReward[1], Config.Tiers[tier].xpReward[2])
    local rep = Player.PlayerData.metadata["carboostrep"] or 0
    Player.Functions.SetMetaData("carboostrep", rep + rewardXP)

    -- Reward the item
    if Config.Tiers[tier].rewardItems.enabled then
        local rewardChance = Config.Tiers[tier].rewardItems.chance
        local rand = math.random(1, 100)
        if rand <= rewardChance then
            if Config.Tiers[tier].rewardItems.itemsRandom then
                local item = Config.Tiers[tier].rewardItems.items[math.random(1, #Config.Tiers[tier].rewardItems.items)]
                Player.Functions.AddItem(item, 1)
                local itemData = QBCore.Shared.Items[item]
                Config.ItemAddEvent(src, itemData)
                Notify(src, Lang:t("info.received_item", {item}), "success")
            else
                for _, item in ipairs(Config.Tiers[tier].rewardItems.items) do
                    Player.Functions.AddItem(item, 1)
                    local itemData = QBCore.Shared.Items[item]
                    Config.ItemAddEvent(src, itemData)
                    Notify(src, Lang:t("info.received_item", {item}), "success")
                end
            end
        end
    end

    -- Make Spawn Available
    local spawn = ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].spawn
    if spawn then
        Config.SpawnLocations[spawn].active = false
    end

    -- Make Dropoff Available
    local dropoff = ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].dropoff
    if dropoff then
        Config.ReturnLocations[dropoff].active = false
    end

    -- Make Scratch Available
    local scratchLocation = ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)].scratchLocation
    if scratchLocation then
        Config.ScratchLocations[scratchLocation].active = false
    end

    ActiveContracts[Player.PlayerData.citizenid][GetContractFromID(Player.PlayerData.citizenid, id)] = nil
end)

RegisterNetEvent("qb-boosting:server:SendMessage", function(message)
    local src = source
    SendMessage(src, message)
end)

RegisterNetEvent("qb-boosting:server:PedKilled", function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local CID = PData.citizenid
    if not CID then return end
    local contract = ActiveContracts[CID][GetContractFromID(CID, id)]
    if not contract.enemy_killed then contract.enemy_killed = 0 end
    contract.enemy_killed = contract.enemy_killed + 1
end)

RegisterNetEvent("qb-boosting:server:VehicleDamage", function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local PData = Player.PlayerData
    if not PData then return end
    local CID = PData.citizenid
    if not CID then return end
    local contract = ActiveContracts[CID][GetContractFromID(CID, id)]
    if not contract.damage then contract.damage = 0 end
    contract.damage = contract.damage + 1
end)

----------------------- ITEM STUFF ---------------------------------
QBCore.Functions.CreateUseableItem(Config.BoostingLaptop, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local rep = Player.PlayerData.metadata["carboostrep"] or 0
    local tier = RepToTier(rep)
    local balance = 0
    if Config.Payment == "crypto" then
        balance = Player.PlayerData.money.crypto
    elseif Config.Payment == "cash" then
        balance = Player.PlayerData.money.cash
    elseif Config.Payment == "bank" then
        balance = Player.PlayerData.money.bank
    elseif Config.Payment == "renewed" then
        local coin = Config.CryptoCoin
        local crypto = Player.PlayerData.metadata.crypto
        balance = crypto[coin]
    end

    if Player.Functions.GetItemByName(Config.BoostingLaptop) then
        TriggerClientEvent("qb-boosting:client:Open", source, rep, tier, balance)
    end
end)

QBCore.Functions.CreateUseableItem(Config.HackingDevice, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(Config.HackingDevice) then
        TriggerClientEvent("qb-boosting:client:DisableTracker", source)
    end
end)

QBCore.Functions.CreateUseableItem(Config.ScratchItem, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(Config.ScratchItem) then
        TriggerClientEvent("qb-boosting:client:ScratchVIN", source)
    end
end)

AddEventHandler("onServerResourceStart", function(resname)
    if resname == GetCurrentResourceName() then
        local success, result = pcall(MySQL.query.await, "SELECT * FROM player_vehicles WHERE vinnumber IS NULL")
        if success and result[1] then
            local queries = {}
            for i = 1, #result do
                local row = result[i]
                queries[#queries + 1] = {
                    query = "UPDATE player_vehicles SET vinnumber = @vin WHERE id = @id", parameters = {
                        ["@id"] = row.id,
                        ["@vin"] = RandomVIN()
                    }
                }
            end
            if queries[1] then
                MySQL.transaction(queries)
            end
        end
    end
end)

AddEventHandler("playerDropped", function()
    local src = source
    local CID = GetCID(src)
    if not CID then return end
    if ActiveContracts[CID] then
        ActiveContracts[CID] = nil
    end
end)

---------------------- DEBUG -----------------------------
if Config.Debug then
    RegisterCommand("boostXP", function(src, args)
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.SetMetaData("carboostrep", tonumber(args[1]))
    end)
end