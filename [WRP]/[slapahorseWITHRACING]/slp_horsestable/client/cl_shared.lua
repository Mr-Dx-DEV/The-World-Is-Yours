
RegisterNetEvent('slapaHorse:showNotif')
AddEventHandler('slapaHorse:showNotif', function(text)
    
    if Config.FrameworkUsed == 'qb' then
        QBCore = exports['qb-core']:GetCoreObject()
        QBCore.Functions.Notify(text, 'primary')
    elseif Config.FrameworkUsed == 'esx' then
        ESX = exports['es_extended']:getSharedObject()
        ESX.ShowNotification(text)
    end

end)

RegisterNetEvent('horsestable:client:openGarage',function()
    if Config.FrameworkUsed == 'qb' then
        QBCore.Functions.TriggerCallback("horsestable:server:GetHorses", function(result)
            if result == nil then
                QBCore.Functions.Notify("You have no horses yet.", "error", 5000)
            else
                local counter = 1

                for _, v in pairs(result) do
                    lib.setMenuOptions('horse_garage', {label = v.horsename, description = tostring(v.horsetype), args = {horsetex = v.horsetype, horsename = v.horsename, horsehair = v.horsehair}}, counter)
                    counter += 1
                end
                
                lib.showMenu('horse_garage')
                
            end
        end)
    elseif Config.FrameworkUsed == 'esx' then
        ESX.TriggerServerCallback('horsestable:server:GetHorses', function(result)
            if result == nil then
                TriggerEvent('slapaHorse:showNotif',"You have no horses yet.")
            else
                local counter = 1

                for _, v in pairs(result) do
                    lib.setMenuOptions('horse_garage', {label = v.horsename, description = tostring(v.horsetype), args = {horsetex = v.horsetype, horsename = v.horsename, horsehair = v.horsehair}}, counter)
                    counter += 1

                end
                
                lib.showMenu('horse_garage')
            end
        end) 
    end
end)

RegisterNetEvent('horsestable:openHorseDealer')
AddEventHandler('horsestable:openHorseDealer', function()
    TriggerServerEvent('horsestable:server:setRoutingBucket', PlayerPedId())
    FreezeEntityPosition(PlayerPedId(), true)
    spawnHorse(0)
    spawnCam()
    horseNum = 0
    lib.showMenu('horse_stable')
    Wait(500)
end)
