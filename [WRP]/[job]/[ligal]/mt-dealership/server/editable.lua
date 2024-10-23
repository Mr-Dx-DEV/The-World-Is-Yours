function addVehicleToGarage(PlayerData, vehicle, mods, plate)
    if Config.Core == 'qb' then
        MySQL.insert('INSERT INTO `player_vehicles` (license, citizenid, vehicle, hash, mods, plate) VALUES (?, ?, ?, ?, ?, ?)', { PlayerData.license, PlayerData.citizenid, vehicle, GetHashKey(vehicle), json.encode(mods), plate })

        if Config.mInsurance.enable then
            local info     = {}
            info.name      = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
            info.plate     = plate
            info.model     = vehicle

            if Config.mInsurance.inventory == "qb" then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
                xPlayer.Functions.AddItem('car_registration', 1, false, info)
            elseif Config.mInsurance.inventory == "ox" then
                local metadata = { description = 'Name: '..name..'   \nPlate: '..plate..'   \nModel: '..vehicle }
                exports.ox_inventory:AddItem(src, 'car_registration', 1, metadata)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
            end
            MySQL.insert('INSERT INTO m_insurance_registration (plate, model, registration, citizenid) VALUES (?, ?, ?, ?)', {plate, vehicle, 1, PlayerData.citizenid})
        end
    elseif Config.Core == 'esx' then
        MySQL.insert('INSERT INTO `owned_vehicles` (owner, plate, vehicle) VALUES (?, ?, ?)', { PlayerData.identifier, plate, json.encode({model = joaat(vehicle), plate = plate}) })

        if Config.mInsurance.enable then
            local src = source
            local xPlayer = ESX.GetPlayerFromId(src)
            local name = xPlayer.getName()
            local identifier = GetPlayerIdentifierByType(src, "license")

            local metadata = { description = 'Name: '..name..'   \nPlate: '..plate..'   \nModel: '..vehicle }
            exports.ox_inventory:AddItem(src, 'car_registration', 1, metadata)
            
            MySQL.insert('INSERT INTO m_insurance_registration (plate, model, registration, identifier) VALUES (?, ?, ?, ?)', {plate, vehicle, 1, identifier})
        end
    end
end
