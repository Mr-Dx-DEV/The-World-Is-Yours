RegisterNetEvent('mt-dealership:client:notify', function(message, type)
    lib.notify({ description = message, type = type })
end)

RegisterNetEvent('mt-dealerships:client:addKeys', function(plate, vehicle)
    if Config.VehicleKeys == 'qs-vehiclekeys' then
        exports['qs-vehiclekeys']:GiveKeys(plate, vehicle)
    elseif Config.vehiclekeys == 'sk-keys' then
        local model = vehicle
        exports['sk-keys']:buyvehicle(plate, model)
    else    
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    end
end)
