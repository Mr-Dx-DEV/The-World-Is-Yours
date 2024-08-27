local Core

Config.Framework = "STANDALONE"

CreateThread(function()
    Wait(2500)
    if Core == nil or Config.UseBuiltInNotifications then
        RegisterNetEvent('17mov_DrawDefaultNotification' .. GetCurrentResourceName(), function(msg)
            Notify(msg)
        end)

        if Core == nil then
            TriggerEvent("esx:getSharedObject", function(obj)
                Core = obj
                Config.Framework = "ESX"
            end)
        end
    end
end)

TriggerEvent("__cfx_export_qb-core_GetCoreObject", function(getCore)
    Core = getCore()
    Config.Framework = "QBCore"
end)

TriggerEvent("__cfx_export_es_extended_getSharedObject", function(getCore)
    Core = getCore()
    Config.Framework = "ESX"
end)

function Notify(msg)
    if Config.Framework == "QBCore" then
        Core.Functions.Notify(msg)
    elseif Config.Framework == "ESX" then
        Core.ShowNotification(msg)
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(false, true)
    end
end

function ShowHelpNotification(msg)
    if msg == nil then return end
    AddTextEntry('HelpNotification', msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 500
    DrawRect(_x, _y + 0.0125, 0.030 + factor, 0.03, 0, 0, 0, 150)
end
