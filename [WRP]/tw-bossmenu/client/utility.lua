jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}

PlayerJob = {}

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tworst:bossmenu:loadData')
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tworst:bossmenu:loadData')
end)

CreateThread(function()
    Core, Config.Framework = GetCore()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()
    TriggerServerEvent('tworst:bossmenu:loadData')
 
    SetPlayerGang()
    SetPlayerJob()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnGangUpdate")
AddEventHandler("QBCore:Client:OnGangUpdate", function(data)
    Wait(1000)
    SetPlayerGang()
end)


local activeBlips = {} -- Tüm aktif Blip'leri tutacak tablo

-- Blip oluşturma fonksiyonu
local function createBlip(coords, blipData, blipName)
    if activeBlips[blipName] then
        RemoveBlip(activeBlips[blipName]) -- Önce eski Blip'i kaldır
    end
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipData.blipID)
    SetBlipDisplay(blip, 4)
    local scale = string.format("%.1f", tonumber(blipData.blipSize) or 1.0)
    SetBlipScale(blip, tonumber(scale))
    SetBlipColour(blip, blipData.blipColorID)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.name)
    EndTextCommandSetBlipName(blip)
    activeBlips[blipName] = blip -- Yeni Blip'i tabloya ekle
    return blip
end

-- Blip güncelleme fonksiyonu
function updateBlips()
    if not BossMenu or not BossMenu.jobSettings or not BossMenu.jobSettings.blipList then
        if activeBlips["stash"] then
            RemoveBlip(activeBlips["stash"])
            activeBlips["stash"] = nil
        end
        if activeBlips["bossmenu"] then
            RemoveBlip(activeBlips["bossmenu"])
            activeBlips["bossmenu"] = nil
        end
        return
    end

    local blipList = BossMenu.jobSettings.blipList
    local stashCoords = BossMenu.jobSettings.jobStashCoords
    local bossMenuCoords = BossMenu.jobSettings.jobBossMenuCoords
    -- Stash Blip
    if blipList.stash and blipList.stash.blipState then
        createBlip(stashCoords, {
            blipID = tonumber(blipList.stash.blipID),
            blipColorID = tonumber(blipList.stash.blipColorID),
            blipSize = tonumber(blipList.stash.blipSize),
            name = blipList.stash.blipLabel or Config.Locales['stash']
        }, "stash")
    elseif activeBlips["stash"] then
        RemoveBlip(activeBlips["stash"])
        activeBlips["stash"] = nil
    end
    if blipList.bossmenu and blipList.bossmenu.blipState then
        createBlip(bossMenuCoords, {
            blipID = tonumber(blipList.bossmenu.blipID),
            blipColorID = tonumber(blipList.bossmenu.blipColorID),
            blipSize = tonumber(blipList.bossmenu.blipSize),
            name = blipList.bossmenu.blipLabel or Config.Locales['bossmenu']
        }, "bossmenu")
    elseif activeBlips["bossmenu"] then
        RemoveBlip(activeBlips["bossmenu"])
        activeBlips["bossmenu"] = nil
    end
end

-- Thread ile düzenli güncelleme
Citizen.CreateThread(function()
    while Core == nil or BossMenu == nil or BossMenu.jobSettings == nil do
        Citizen.Wait(500)
    end

    while true do
        updateBlips() 
        Citizen.Wait(60000) -- 5 dakika güncelle 
    end
end)


Citizen.CreateThread(function()
    while Core == nil or BossMenu == nil or BossMenu.jobSettings == nil do
        Citizen.Wait(500)
    end
    while true do
        local sleep = 1000

        if not BossMenu or not BossMenu.jobSettings or not BossMenu.jobSettings.jobStashCoords then
            Citizen.Wait(1000)
        else
            local player = PlayerPedId()
            local playerCoords = GetEntityCoords(player)
            local stashCoords = BossMenu.jobSettings.jobStashCoords
            local bossMenuCoords = BossMenu.jobSettings.jobBossMenuCoords
            local stashDistance = stashCoords.x and stashCoords.y and stashCoords.z and #(playerCoords - vector3(stashCoords.x, stashCoords.y, stashCoords.z)) or math.huge
            local bossMenuDistance = bossMenuCoords.x and bossMenuCoords.y and bossMenuCoords.z and #(playerCoords - vector3(bossMenuCoords.x, bossMenuCoords.y, bossMenuCoords.z)) or math.huge
            local jobName = BossMenu and BossMenu.jobSettings and BossMenu.jobSettings.jobName
            if stashDistance < 10.0 and stashDistance <= bossMenuDistance and jobName then
                sleep = 0
                if stashDistance > 3.0 then
                    DrawMarker(2, stashCoords.x, stashCoords.y, stashCoords.z + 0.0, 0, 0.75, 0.75, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                end
                if  stashDistance < 3.0 then
                    DrawText3D(stashCoords.x, stashCoords.y, stashCoords.z, Config.Locales['stash'])
                    if IsControlJustPressed(0, 38) then
                        openStash(jobName)
                    end
                end

            elseif bossMenuDistance < 10.0 and jobName then
                sleep = 0
                if bossMenuDistance > 3.0 then
                    DrawMarker(2, bossMenuCoords.x, bossMenuCoords.y, bossMenuCoords.z + 0.0, 0, 0.75, 0.75, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                end
                if bossMenuDistance < 3.0 then
                    DrawText3D(bossMenuCoords.x, bossMenuCoords.y, bossMenuCoords.z, Config.Locales['bossmenu'])
                    if IsControlJustPressed(0, 38) then
                    openBossMenu()
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

function SetPlayerJob()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        if next(PlayerData) == nil then
        else
            PlayerJob.name = PlayerData.job.name
            PlayerJob.grade = PlayerData.job.grade
            PlayerJob.joblabel = PlayerData.job.label
            PlayerJob.jobGradeName = PlayerData.job.grade_label
            PlayerJob.jobSalary = PlayerData.job.payment or 0
            TriggerServerEvent('tworst:bossmenu:updatePlayerJob', PlayerJob)

        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local PlayerData = Core.Functions.GetPlayerData()
        if next(PlayerData) == nil then
        else
            PlayerJob = {}
            PlayerJob.name = PlayerData["job"].name
            PlayerJob.grade = PlayerData["job"].grade.level
            PlayerJob.joblabel = PlayerData["job"].label
            PlayerJob.jobGradeName = PlayerData["job"].grade.name
            PlayerJob.jobSalary = PlayerData["job"].grade.payment or 0
            PlayerJob.isBoss = PlayerData["job"].grade.isboss or false
            TriggerServerEvent('tworst:bossmenu:updatePlayerJob', PlayerJob)
        end
    elseif Config.Framework == 'qbox' then
        local PlayerData = Core.Functions.GetPlayerData()
        if next(PlayerData) == nil then
        else
            PlayerJob = {}
            PlayerJob.name = PlayerData["job"].name
            PlayerJob.grade = PlayerData["job"].grade.level
            PlayerJob.joblabel = PlayerData["job"].label
            PlayerJob.jobGradeName = PlayerData["job"].grade.name
            PlayerJob.jobSalary = PlayerData["job"].payment or PlayerData["job"].grade.payment or 0
            PlayerJob.isBoss = PlayerData["job"].isboss or PlayerData["job"].grade.isboss or false
            TriggerServerEvent('tworst:bossmenu:updatePlayerJob', PlayerJob)
        end
    end
end

function SetPlayerGang()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()


    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local PlayerData = Core.Functions.GetPlayerData()
        if next(PlayerData) == nil then
        else
            PlayerGang = {}
            PlayerGang.name = PlayerData["gang"].name
            PlayerGang.grade = PlayerData["gang"].grade.level
            PlayerGang.joblabel = PlayerData["gang"].label
            PlayerGang.jobGradeName = PlayerData["gang"].grade.name
            PlayerGang.jobSalary = PlayerData["gang"].grade.payment or 0
            PlayerGang.isBoss = PlayerData["gang"].grade.isboss or false
            TriggerServerEvent('tworst:bossmenu:updatePlayerJob', PlayerGang)
        end
    elseif Config.Framework == 'qbox' then
        local PlayerData = Core.Functions.GetPlayerData()
        if next(PlayerData) == nil then
        else
            PlayerGang = {}
            PlayerGang.name = PlayerData["gang"].name
            PlayerGang.grade = PlayerData["gang"].grade.level
            PlayerGang.joblabel = PlayerData["gang"].label
            PlayerGang.jobGradeName = PlayerData["gang"].grade.name
            PlayerGang.jobSalary = PlayerData["gang"].payment or PlayerData["gang"].grade.payment or 0
            PlayerGang.isBoss = PlayerData["gang"].isboss or PlayerData["gang"].grade.isboss or false
            TriggerServerEvent('tworst:bossmenu:updatePlayerJob', PlayerGang)
        end
    end
end

function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do
            Wait(0)
        end
        while Core.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Wait(0)
        end
    else
        while Core == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Wait(0)
        end
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 90)
end

function ChangeClothes(key, value, texture)
    local playerPed = PlayerPedId()
    value = tonumber(value)
    texture = tonumber(texture)

    if key == 'jacket' then
        SetPedComponentVariation(playerPed, 11, value, texture, 2)
    end
    if key == 'shirt' then
        SetPedComponentVariation(playerPed, 8, value, texture, 2)
    end
    if key == 'arms' then
        SetPedComponentVariation(playerPed, 3, value, texture, 2)
    end
    if key == 'legs' then
        SetPedComponentVariation(playerPed, 4, value, texture, 2)
    end
    if key == 'shoes' then
        SetPedComponentVariation(playerPed, 6, value, texture, 2)
    end
    if key == 'mask' then
        SetPedComponentVariation(playerPed, 1, value, texture, 2)
    end
    if key == 'chain' then
        SetPedComponentVariation(playerPed, 7, value, texture, 2)
    end
    if key == 'decals' then
        SetPedComponentVariation(playerPed, 10, value, texture, 2)
    end
    if key == 'helmet' then
        SetPedPropIndex(playerPed, 0, value, texture, 2)
    end
    if key == 'glasses' then
        SetPedPropIndex(playerPed, 1, value, texture, 2)
    end
    if key == 'watches' then
        SetPedPropIndex(playerPed, 6, value, texture, 2)
    end
    if key == 'bracelets' then
        SetPedPropIndex(playerPed, 7, value, texture, 2)
    end
 
end

function openOutfitMenu()
    if Config.ClothingMenu == 'fivem-appearance' then
        TriggerEvent("fivem-appearance:client:openClothingShopMenu", false)
    end
    if Config.ClothingMenu == 'illenium-appearance' then
        TriggerEvent("illenium-appearance:client:openClothingShop", false)
    end
    if Config.ClothingMenu == 'esx_skin' then
        TriggerEvent('esx_skin:openSaveableMenu')
    end
    if Config.ClothingMenu == 'qb-clothing' then
        TriggerEvent("qb-clothing:client:openMenu")
    end
end

function openStash(jobName)
    if Config.Inventory == "qb_inventory" then
        local jobName = jobName or 'unknown'
        TriggerServerEvent('tworst:bossmenu:openStash', jobName)
    end

    if Config.Inventory == "ox_inventory" then 
        exports.ox_inventory:openInventory('stash', {id = jobName})
       -- TriggerServerEvent('tworst:bossmenu:openStash', jobName)
    end
end

RegisterCommand(Config.CreatorCommand, function()
    local playerData = TriggerCallback('tworst:bossmenu:getPlayerData')
    local isAdmin = TriggerCallback("tworst:bossmenu:checkIsAdmin")
    if not isAdmin then
        addNotification(Config.Notification['youarenotadmin'])
        return
    end
    if playerData then  
        if openCreatorMenu then
            return
        end
        SetNuiFocus(true, true)
        openCreatorMenu = true
        NuiMessage('OPEN_CREATOR', playerData)
    end
end)

function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end
