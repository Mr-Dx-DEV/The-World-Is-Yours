QBCore = exports[Config['Settings'].Core]:GetCoreObject()

colors = {
    [1] = "Metallic Graphite Black",
    [2] = "Metallic Black Steel",
    [3] = "Metallic Dark Silver",
    [4] = "Metallic Silver",
    [5] = "Metallic Blue Silver",
    [6] = "Metallic Steel Gray",
    [7] = "Metallic Shadow Silver",
    [8] = "Metallic Stone Silver",
    [9] = "Metallic Midnight Silver",
    [10] = "Metallic Gun Metal",
    [11] = "Metallic Anthracite Grey",
    [12] = "Matte Black",
    [13] = "Matte Gray",
    [14] = "Matte Light Grey",
    [15] = "Util Black",
    [16] = "Util Black Poly",
    [17] = "Util Dark silver",
    [18] = "Util Silver",
    [19] = "Util Gun Metal",
    [20] = "Util Shadow Silver",
    [21] = "Worn Black",
    [22] = "Worn Graphite",
    [23] = "Worn Silver Grey",
    [24] = "Worn Silver",
    [25] = "Worn Blue Silver",
    [26] = "Worn Shadow Silver",
    [27] = "Metallic Red",
    [28] = "Metallic Torino Red",
    [29] = "Metallic Formula Red",
    [30] = "Metallic Blaze Red",
    [31] = "Metallic Graceful Red",
    [32] = "Metallic Garnet Red",
    [33] = "Metallic Desert Red",
    [34] = "Metallic Cabernet Red",
    [35] = "Metallic Candy Red",
    [36] = "Metallic Sunrise Orange",
    [37] = "Metallic Classic Gold",
    [38] = "Metallic Orange",
    [39] = "Matte Red",
    [40] = "Matte Dark Red",
    [41] = "Matte Orange",
    [42] = "Matte Yellow",
    [43] = "Util Red",
    [44] = "Util Bright Red",
    [45] = "Util Garnet Red",
    [46] = "Worn Red",
    [47] = "Worn Golden Red",
    [48] = "Worn Dark Red",
    [49] = "Metallic Dark Green",
    [50] = "Metallic Racing Green",
    [51] = "Metallic Sea Green",
    [52] = "Metallic Olive Green",
    [53] = "Metallic Green",
    [54] = "Metallic Gasoline Blue Green",
    [55] = "Matte Lime Green",
    [56] = "Util Dark Green",
    [57] = "Util Green",
    [58] = "Worn Dark Green",
    [59] = "Worn Green",
    [60] = "Worn Sea Wash",
    [61] = "Metallic Midnight Blue",
    [62] = "Metallic Dark Blue",
    [63] = "Metallic Saxony Blue",
    [64] = "Metallic Blue",
    [65] = "Metallic Mariner Blue",
    [66] = "Metallic Harbor Blue",
    [67] = "Metallic Diamond Blue",
    [68] = "Metallic Surf Blue",
    [69] = "Metallic Nautical Blue",
    [70] = "Metallic Bright Blue",
    [71] = "Metallic Purple Blue",
    [72] = "Metallic Spinnaker Blue",
    [73] = "Metallic Ultra Blue",
    [74] = "Metallic Bright Blue",
    [75] = "Util Dark Blue",
    [76] = "Util Midnight Blue",
    [77] = "Util Blue",
    [78] = "Util Sea Foam Blue",
    [79] = "Uil Lightning blue",
    [80] = "Util Maui Blue Poly",
    [81] = "Util Bright Blue",
    [82] = "Matte Dark Blue",
    [83] = "Matte Blue",
    [84] = "Matte Midnight Blue",
    [85] = "Worn Dark blue",
    [86] = "Worn Blue",
    [87] = "Worn Light blue",
    [88] = "Metallic Taxi Yellow",
    [89] = "Metallic Race Yellow",
    [90] = "Metallic Bronze",
    [91] = "Metallic Yellow Bird",
    [92] = "Metallic Lime",
    [93] = "Metallic Champagne",
    [94] = "Metallic Pueblo Beige",
    [95] = "Metallic Dark Ivory",
    [96] = "Metallic Choco Brown",
    [97] = "Metallic Golden Brown",
    [98] = "Metallic Light Brown",
    [99] = "Metallic Straw Beige",
    [100] = "Metallic Moss Brown",
    [101] = "Metallic Biston Brown",
    [102] = "Metallic Beechwood",
    [103] = "Metallic Dark Beechwood",
    [104] = "Metallic Choco Orange",
    [105] = "Metallic Beach Sand",
    [106] = "Metallic Sun Bleeched Sand",
    [107] = "Metallic Cream",
    [108] = "Util Brown",
    [109] = "Util Medium Brown",
    [110] = "Util Light Brown",
    [111] = "Metallic White",
    [112] = "Metallic Frost White",
    [113] = "Worn Honey Beige",
    [114] = "Worn Brown",
    [115] = "Worn Dark Brown",
    [116] = "Worn straw beige",
    [117] = "Brushed Steel",
    [118] = "Brushed Black steel",
    [119] = "Brushed Aluminium",
    [120] = "Chrome",
    [121] = "Worn Off White",
    [122] = "Util Off White",
    [123] = "Worn Orange",
    [124] = "Worn Light Orange",
    [125] = "Metallic Securicor Green",
    [126] = "Worn Taxi Yellow",
    [127] = "police car blue",
    [128] = "Matte Green",
    [129] = "Matte Brown",
    [130] = "Worn Orange",
    [131] = "Matte White",
    [132] = "Worn White",
    [133] = "Worn Olive Army Green",
    [134] = "Pure White",
    [135] = "Hot Pink",
    [136] = "Salmon pink",
    [137] = "Metallic Vermillion Pink",
    [138] = "Orange",
    [139] = "Green",
    [140] = "Blue",
    [141] = "Mettalic Black Blue",
    [142] = "Metallic Black Purple",
    [143] = "Metallic Black Red",
    [144] = "hunter green",
    [145] = "Metallic Purple",
    [146] = "Metaillic V Dark Blue",
    [147] = "MODSHOP BLACK1",
    [148] = "Matte Purple",
    [149] = "Matte Dark Purple",
    [150] = "Metallic Lava Red",
    [151] = "Matte Forest Green",
    [152] = "Matte Olive Drab",
    [153] = "Matte Desert Brown",
    [154] = "Matte Desert Tan",
    [155] = "Matte Foilage Green",
    [156] = "DEFAULT ALLOY COLOR",
    [157] = "Epsilon Blue",
    [158] = "Unknown",
}

-------------------
---- Alerts System :
-------------------

RegisterNetEvent('l2s-policehub:client:SendAlert')
AddEventHandler('l2s-policehub:client:SendAlert', function(proirty ,code, title, infos, coords, time, sound, police, ambulance, blips, icon, alertnumber, trs)
    NewPoliceAlert(proirty, code, title, infos, coords, time, sound, blips, icon, alertnumber, police, ambulance, trs) 
end)



RegisterNetEvent('l2s-policehub:client:sendNewsBlip')
AddEventHandler('l2s-policehub:client:sendNewsBlip', function(title, code, blips, coords, proirty)
    if code =='Dispatch' then
        return
    end

    local alpha = 250
    local burglary = AddBlipForCoord(coords.x, coords.y, coords.z)
    if proirty == 3 then
        SetBlipFlashesAlternate(burglary,true)
    end
    SetBlipScale(burglary, blips.Scale)
    SetBlipSprite(burglary, blips.Sprite)
    SetBlipColour(burglary, blips.Color)
    SetBlipHighDetail(burglary, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(code..': '..title)
    EndTextCommandSetBlipName(burglary)
        while alpha ~= 0 do
        Citizen.Wait(120 * 4)
        alpha = alpha - 1
        SetBlipAlpha(burglary, alpha)
        if alpha == 0 then
        RemoveBlip(burglary)
            return
        end
    end
end)


function GetStreetAndZone()
    local plyPos = GetEntityCoords(PlayerPedId(), true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
    local street = street1 .. ", " .. zone
    return street
end

function NewPoliceAlert(proirty ,code, title, infos, coords, time, sound, blips, icon, alertnumber, police, ambulance, trs)
    if QBCore.Functions.GetPlayerData().metadata['policehub']['alerts']['enablealerts'] == true then
        SendNUIMessage({ 
            action = 'newalert',
            proirty = proirty,
            code = code,
            icon = icon,
            title = title,
            infos = infos,
            coords = coords,
            time = time,
            sound = sound,
            alertnumber = alertnumber,
            police = police, 
            ambulance = ambulance,
            trs = trs,
        })
        TriggerEvent('l2s-policehub:client:sendNewsBlip', title, code, blips, coords, proirty)
    end
end

function GetVehicleDescription()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not DoesEntityExist(currentVehicle) then
      return
    end
  
    plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
    make = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle))
    color1, color2 = GetVehicleColours(currentVehicle)
  
    if color1 == 0 then color1 = 1 end
    if color2 == 0 then color2 = 2 end
    if color1 == -1 then color1 = 158 end
    if color2 == -1 then color2 = 158 end 
  
    if math.random(1, 100) > 70 then
      plate = "Unknown"
    end
  
  
    local vehicleData  = {
      model = make,
      plate = plate,
      firstColor = colors[color1],
      secondColor = colors[color2],
    }
    return vehicleData
end
-------------------
---- Alerts Events :
-------------------
--- شرح اعدادات الاليرتات :
-- local proirty = 2 -- اولوية الحالة اعلى اولوية 1 واقلها 3
-- local code = '10-5' -- اكود الحالة
-- local title = 'Store Robbery' -- 
-- local coords = {x = pos.x, y = pos.y, z = pos.z} -- لا تعدل عليها
-- local time = 10000 -- وقت الاشعار تحت يمين (ms)
-- local sound = 1 -- رقم الصوت 
-- local amublance = true -- هل يوصل للإسعاف
-- local police = false -- هل يوصل للشرطة
-- local icon = 'phone' -- رقم الايكون اذا حدده من الاشعارات
-- local blips = { -- اعادات البلبز
--     Color = 1, -- اللون
--     Sprite = 280, -- الرقم
--     Scale = 1.2, -- الحجم
-- }
-------------------
-------------------
local mytime = 0
-- < Police Emergency Alerts > : 
                                
RegisterNetEvent('dispatch:officerDown')
AddEventHandler('dispatch:officerDown', function()

    local pos = GetEntityCoords(PlayerPedId(),  true)
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 1
    local code = '10-78'
    local icon = 'skull-crossbones' -- icon map
    local title = 'Emergency'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 305,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)

RegisterNetEvent('dispatch:emergncy')
AddEventHandler('dispatch:emergncy', function()


    local pos = GetEntityCoords(PlayerPedId(),  true)
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 1
    local icon = 'fa-radiation-alt' -- icon map
    local code = '10-14P'
    local title = 'Emergency'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 1
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 305,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)

RegisterNetEvent('dispatch:normaldown')
AddEventHandler('dispatch:normaldown', function()


    local pos = GetEntityCoords(PlayerPedId(),  true)
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = '10-15P'
    local title = 'Normal down'
    local icon = 'heart-circle-xmark' -- icon map
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 1
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 305,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)


RegisterNetEvent('dispatch:w7dtn8l')
AddEventHandler('dispatch:w7dtn8l', function()
    if mytime >= 3 then
        QBCore.Functions.Notify('You cant spam please wait 1 m')
        Wait(1 * 60000)
        mytime = 0
    else
        mytime = mytime + 1
    end

    local pos = GetEntityCoords(PlayerPedId(),  true)
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = '10-16P'
    local icon = 'child'
    local title = 'Transfer Request'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 1
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 545,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)

---- < Medica Alerts > 
RegisterNetEvent('dispatch:emsDown')
AddEventHandler('dispatch:emsDown', function()
    if mytime >= 3 then
        QBCore.Functions.Notify('You cant spam please wait 1 m')
        Wait(1 * 60000)
        mytime = 0
    else
        mytime = mytime + 1
    end

    local pos = GetEntityCoords(PlayerPedId(),  true)
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 1
    local code = '10-13D'
    local title = 'Doctor down'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local icon = 'skull-crossbones' -- icon map
    local time = 7500
    local sound = 1
    local amublance = true
    local police = false
    local blips = {
        Color = 1,
        Sprite = 305,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)

RegisterNetEvent('dispatch:emsN8L')
AddEventHandler('dispatch:emsN8L', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    if mytime >= 3 then
        QBCore.Functions.Notify('You cant spam please wait 1 m')
        Wait(1 * 60000)
        mytime = 0
    else
        mytime = mytime + 1
    end
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = '10-14D'
    local title = 'Transfer Request'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 1
    local amublance = true
    local police = false
    local icon = 'child'
    local blips = {
        Color = 1,
        Sprite = 545,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    if time > 0 then
        Wait(1 * 60000)
        mytime = 0
    end
end)
----------
RegisterNetEvent('dispatch:gunshot')
AddEventHandler('dispatch:gunshot', function()
    if GetResourceState("l2s-paintball") == "started" then 
        if exports['l2s-paintball']:IsPlayerInPB() then
            return
        end
    end
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local vehicleData = GetVehicleDescription() or {}
    local CurrentWeapon = GetSelectedPedWeapon(PlayerPedId())
    local weapon = QBCore.Shared.Weapons[CurrentWeapon]["label"] or "UNKNOWN"
    if weapon ~= 'Petrol Can' then else return end
    if isInVehicle then
        local info = {
            {icon = 'crosshairs', text = weapon},
            {icon = 'car', text = vehicleData.model},
            {icon = 'digital-tachograph', text = vehicleData.plate},
            {icon = 'spray-can', text = vehicleData.firstColor},
            {icon = 'globe-americas', text = GetStreetAndZone()},
        }
        local proirty = 3
        local code = '20-2V'
        local icon = 'gun'
        local title = 'Vehicle Gunshot Report'
        local coords = {x = pos.x, y = pos.y, z = pos.z}
        local time = 4500
        local sound = 1
        local amublance = false
        local police = true
        local blips = {
            Color = 1,
            Sprite = 229,
            Scale = 1.2,
        }
        TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)

    else
        local info = {
            {icon = 'crosshairs', text = weapon},
            {icon = 'globe-americas', text = GetStreetAndZone()},
        }
        local proirty = 3
        local icon = 'gun'
        local code = '20-2'
        local title = 'Gunshot Report'
        local coords = {x = pos.x, y = pos.y, z = pos.z}
        local time = 4500
        local sound = 1
        local amublance = false
        local police = true
        local blips = {
            Color = 1,
            Sprite = 229,
            Scale = 1.2,
        }
        TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    end
end)
--- robberys alerts

RegisterNetEvent('dispatch:lockpick')
AddEventHandler('dispatch:lockpick', function()
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    if isInVehicle then
        local pos = GetEntityCoords(PlayerPedId(),  true)
        local vehicleData = GetVehicleDescription() or {}
        local info = {
            {icon = 'car', text = vehicleData.model},
            {icon = 'digital-tachograph', text = vehicleData.plate},
            {icon = 'spray-can', text = vehicleData.firstColor},
            {icon = 'globe-americas', text = GetStreetAndZone()},
        }
        local proirty = 1
        local code = '10-4'
        local title = 'Vehicle Theft'
        local icon = 'car-burst'
        local coords = {x = pos.x, y = pos.y, z = pos.z}
        local time = 7500
        local sound = 5
        local amublance = false
        local police = true
        local blips = {
            Color = 4,
            Sprite = 225,
            Scale = 1.2,
        }
        TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    else
        local pos = GetEntityCoords(PlayerPedId(),  true)
        local vehicleData = GetVehicleDescription() or {}
        local info = {
            {icon = 'globe-americas', text = GetStreetAndZone()},
        }
        local proirty = 1
        local code = '10-4'
        local title = 'Vehicle Theft'
        local icon = 'car-burst'
        local coords = {x = pos.x, y = pos.y, z = pos.z}
        local time = 7500
        local sound = 5
        local amublance = false
        local police = true
        local blips = {
            Color = 4,
            Sprite = 225,
            Scale = 1.2,
        }
        TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
    end

end)

RegisterNetEvent('dispatch:prisonBreak')
AddEventHandler('dispatch:prisonBreak', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 1
    local code = '20-4'
    local title = 'Jail Break'
    local icon = 'handcuffs'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 7500
    local sound = 5
    local amublance = false
    local police = true
    local blips = {
        Color = 4,
        Sprite = 188,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)


RegisterNetEvent('dispatch:cayorobbery')
AddEventHandler('dispatch:cayorobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 1
    local code = '10-18'
    local title = 'Cayo Land Heist'
    local icon = 'masks-theater'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 487,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:pacificRobbery')
AddEventHandler('dispatch:pacificRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 3
    local code = '10-17'
    local title = 'Pacific Bank Robbery'
    local icon = 'building-columns'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 487,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:unionRobbery')
AddEventHandler('dispatch:unionRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 3
    local code = '10-16'
    local title = 'Union Bank Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local icon = 'building-columns'
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 486,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)


RegisterNetEvent('dispatch:cayorobbery')
AddEventHandler('dispatch:cayorobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 1
    local code = '10-18'
    local title = 'Cayo Land Heist'
    local icon = 'masks-theater'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 487,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:yachtrobbery')
AddEventHandler('dispatch:yachtrobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-13'
    local title = 'Yacht Robbery'
    local icon = 'sailboat'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 455,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)


RegisterNetEvent('dispatch:artRobbery')
AddEventHandler('dispatch:artRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-11'
    local title = 'ART Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local icon = 'masks-theater'
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 269,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:trainrobbery')
AddEventHandler('dispatch:trainrobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-10'
    local title = 'Train Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local icon = 'train'
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 477,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:paletoRobbery')
AddEventHandler('dispatch:paletoRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 3
    local code = '10-15'
    local title = 'Paleto Bank Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local icon = 'building-columns'
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 267,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:truckRobbery')
AddEventHandler('dispatch:truckRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-8'
    local title = 'Bank Truck Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local icon = 'truck-moving'
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 67,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:jewelryRobbery')
AddEventHandler('dispatch:jewelryRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 3
    local code = '10-14'
    local title = 'Vangelico Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local icon = 'gem'
    local sound = 3
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 439,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)



RegisterNetEvent('dispatch:bobcatRobbery')
AddEventHandler('dispatch:bobcatRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-12'
    local title = 'Bobcat Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 3
    local amublance = false
    local icon = 'box'
    local police = true
    local blips = {
        Color = 1,
        Sprite = 291,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)


RegisterNetEvent('dispatch:fleecaRobbery')
AddEventHandler('dispatch:fleecaRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-9'
    local title = 'Fleeca Bank Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local icon = 'building-columns'
    local sound = 1
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 88,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)


RegisterNetEvent('dispatch:houseRobbery')
AddEventHandler('dispatch:houseRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-6'
    local title = 'House Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 1
    local icon = 'house'
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 418,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('dispatch:storeRobbery')
AddEventHandler('dispatch:storeRobbery', function()
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '10-5'
    local title = 'Store Robbery'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local icon = 'cart-shopping'
    local sound = 1
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 52,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

-- calls
RegisterNetEvent('police:911r')
AddEventHandler('police:911r', function(mes)
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'digital-tachograph', text = mes},
    }
    local proirty = 2
    local code = '911a'
    local title = 'New Anonymous Call'
    local coords = {x = 0.0, y = 0.0, z = 0.0}
    local time = 10000
    local icon = ''
    local sound = 4
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 280,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)

RegisterNetEvent('police:911')
AddEventHandler('police:911', function(mes)
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'digital-tachograph', text = mes},
        {icon = 'user', text = QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname},
        {icon = 'phone', text = QBCore.Functions.GetPlayerData().charinfo.phone},
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }

    local proirty = 2
    local icon = 'phone'
    local code = '911'
    local title = 'New Call'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 4
    local amublance = false
    local police = true
    local blips = {
        Color = 1,
        Sprite = 280,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon)
end)

RegisterNetEvent('doctor:997')
AddEventHandler('doctor:997', function(mes)
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local info = {
        {icon = 'digital-tachograph', text = mes},
        {icon = 'user', text = QBCore.Functions.GetPlayerData().charinfo.firstname .. ' ' .. QBCore.Functions.GetPlayerData().charinfo.lastname},
        {icon = 'phone', text = QBCore.Functions.GetPlayerData().charinfo.phone},
        {icon = 'globe-americas', text = GetStreetAndZone()},
    }
    local proirty = 2
    local code = '997'
    local icon = 'phone'
    local title = 'New Call'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 4
    local amublance = true
    local police = false
    local blips = {
        Color = 1,
        Sprite = 280,
        Scale = 1.2,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips)
end)



--- Alerts Actions :


RegisterNUICallback('reply911call', function(data, cb)
    TriggerServerEvent('l2s-policehub:server:911reply', data.phone, data.message)
end)



RegisterNUICallback('SendNewAlert', function(data, cb)
    local pos = GetEntityCoords(PlayerPedId(),  true)
    local officername =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | Unit: ["..QBCore.Functions.GetPlayerData().metadata["callsign"].."]"
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'envelope', text = data.text}
    }
    local proirty = 2
    local code = 'Dispatch'
    local title = 'To All Officers'
    local coords = {x = pos.x, y = pos.y, z = pos.z}
    local time = 10000
    local sound = 1
    local amublance = false
    local police = true
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance)
	TriggerServerEvent('l2s-policehub:server:discordlog', 'GlobalActions', "**New Alert To All Officers** :\n\n** By Officer: **\n`"..officername.."` \n \n **Deatils:**\n`Text : "..data.text.."`")
end)




RegisterNUICallback('SendToEms', function(data, cb)
    local officername =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | Unit: ["..QBCore.Functions.GetPlayerData().metadata["callsign"].."]"
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = 'Police'
    local title = data.title..': Need EMS'
    local coords = {x = data.x, y = data.y, z = 30.1}
    local time = 10000
    local sound = 1
    local amublance = true
    local police = false
    local icon = data.icon
    local blips = {
        Color = 6,
        Sprite = 153,
        Scale = 0.7,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon, true)
	TriggerServerEvent('l2s-policehub:server:discordlog', 'GlobalActions', "**Tranfer To EMS** :\n\n** By Officer: **\n`"..officername.."` \n \n **Deatils:**\n`Text : "..data.title.."\n "..data.code.."`")
end)


RegisterNUICallback('SendToPolice', function(data, cb)
    local officername =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | Unit: ["..QBCore.Functions.GetPlayerData().metadata["callsign"].."]"
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = 'Ambulance'
    local title = data.title..': Need Officer'
    local coords = {x = data.x, y = data.y, z = 30.1}
    local time = 10000
    local sound = 1
    local amublance = false
    local police = true
    local icon = data.icon
    local blips = {
        Color = 29,
        Sprite = 526,
        Scale = 0.7,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon, true)
	TriggerServerEvent('l2s-policehub:server:discordlog', 'GlobalActions', "**Tranfer To EMS** :\n\n** By Officer: **\n`"..officername.."` \n \n **Deatils:**\n`Text : "..data.title.."\n "..data.code.."`")
end)

RegisterNUICallback('AreaHaveShotFire', function(data, cb)
    local officername =  QBCore.Functions.GetPlayerData().charinfo.firstname .." " ..QBCore.Functions.GetPlayerData().charinfo.lastname.. " | Unit: ["..QBCore.Functions.GetPlayerData().metadata["callsign"].."]"
    local playerData = QBCore.Functions.GetPlayerData()
    local callsignal = playerData.metadata["callsign"] ~= nil and playerData.metadata["callsign"] or "None"
    local info = {
        {icon = 'user', text = callsignal .. ' | ' .. playerData['charinfo']['firstname']:sub(1,1) .. '. ' .. playerData['charinfo']['lastname']},
        {icon = 'globe-americas', text = GetStreetAndZone()}
    }
    local proirty = 2
    local code = 'Shoot Fire'
    local title = data.title
    local coords = {x = data.x, y = data.y, z = 30.1}
    local time = 10000
    local sound = 1
    local amublance = false
    local police = true
    local icon = data.icon
    local blips = {
        Color = 40,
        Sprite = 161,
        Scale = 1.5,
    }
    TriggerServerEvent('l2s-policehub:server:sendalert', proirty ,code, title, info, coords, time, sound, police, amublance, blips, icon)
	TriggerServerEvent('l2s-policehub:server:discordlog', 'GlobalActions', "**Tranfer To EMS** :\n\n** By Officer: **\n`"..officername.."` \n \n **Deatils:**\n`Text : "..data.title.."\n "..data.code.."`")
end)
----------------------- Gun Fire Loop

--[[ local alerted = false
Citizen.CreateThread(function()
    local ped = PlayerPedId()
    while true do
        local weapon = GetSelectedPedWeapon(PlayerPedId())
        if IsPedArmed(PlayerPedId(), 6) then
            Citizen.Wait(30)
        else
            Citizen.Wait(2500)
        end
            if GetSelectedPedWeapon(PlayerPedId()) then
                if IsPedShooting(PlayerPedId()) then
                    if not alerted then
                        alerted = true
                        TriggerEvent("dispatch:gunshot")
                        Citizen.Wait(2500)
                        alerted = false
                    end
                end
            end

        Citizen.Wait(8)
    end
end) ]]

function GetBlipsStreetName(x,y)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, x,y, 30, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(x,y, 30))
    local street = street1 .. ", " .. zone
    return street
end
