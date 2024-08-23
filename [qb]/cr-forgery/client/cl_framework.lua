local QBCore, ESX
if Config.Framework.Framework == "QBCore" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

FCUtils = {}

function FCUtils.CheckReqs(data)
    local p = promise.new()
    if Config.Framework.Framework == "QBCore" then
        QBCore.Functions.TriggerCallback('cr-forgery:server:CheckRequirements', function(hasReq)
            p:resolve(hasReq)
        end, data)
    else
        print("CheckReqs | "..Lcl('debug_standalonefunction'))
    end
    return p
end

function FCUtils.FetchXP()
    local p = promise.new()
    if Config.Framework.Framework == "QBCore" then
        local xp = QBCore.Functions.GetPlayerData().metadata['forgeryXp'] or 0
        p:resolve(xp)
    else
        print("FetchXP | "..Lcl('debug_standalonefunction'))
    end
    return p
end

-- Popular Circle Minigame scripts
---@param minigameData table - Data used for the minigame
function FCUtils.CircleMinigame(minigameData)
    local p = promise.new() -- Do not touch
    if not minigameData.enabled then p:resolve(true) return p end
    local cAmount = math.random(minigameData.CircleAmount.min, minigameData.CircleAmount.max)

    if Config.Framework.CircleMinigame == "ps-ui" then
        exports['ps-ui']:Circle(function(success)
            p:resolve(success)
        end, cAmount, math.random(minigameData.CircleTimeDifficulty.min, minigameData.CircleTimeDifficulty.max))
    elseif Config.Framework.CircleMinigame == "qb-lock" then
        local success = exports['qb-lock']:StartLockPickCircle(cAmount, math.random(minigameData.CircleTimeDifficulty.min, minigameData.CircleTimeDifficulty.max))
        p:resolve(success)
    elseif Config.Framework.CircleMinigame == "oxlib" then
        local success = lib.skillCheck(minigameData.OxLibDifficulty)
        p:resolve(success)
    end
    return p -- Do not touch
end

function FCUtils.Minigame(gameType, minigameData)
    local p = promise.new()
    if minigameData.type == 'circle' then
        FCUtils.CircleMinigame(minigameData):next(function(success)
            p:resolve(success)
        end)
    else
        -- Custom Minigame Implementation Needed
        FCUtils.Debug(Lcl('debug_minigameImplentationNeeded', gameType, minigameData.type), true, true)
        p:resolve(true)
    end
    return p
end

-- Client-Sided Notification Matrix
---@param notifType number - Notification Type (1 = Success, 2 = Info, 3 = Failure)
---@param message string - Message Sent
---@param title? string - Message Title (If Applicable)
function FCUtils.Notif(notifType, message, title)
    local notifConfig = Config.Framework.Notifications
    local notifMappings = {
        [1] = {qb = "success", oxlib = "success", mythic = "success", other = "success"}, -- Mapping for success
        [2] = {qb = "primary", oxlib = "info", mythic = "inform", other = "info"}, -- Mapping for info
        [3] = {qb = "error", oxlib = "error", mythic = "error", other = "error"}  -- Mapping for error
    }
    local typeMap = notifMappings[notifType] or notifMappings[3] -- Default to error if notifType not found
    local nType = typeMap[notifConfig]

	if notifConfig == "okok" then exports['okokNotify']:Alert(title, message, 3000, nType)
	elseif notifConfig == "mythic" then exports['mythic_notify']:DoHudText(nType, message)
	elseif notifConfig == 'chat' then TriggerEvent('chatMessage', message)
	elseif notifConfig == "tnj" then exports['tnj-notify']:Notify(message, nType, 3000)
    elseif notifConfig == "oxlib" then lib.notify({title = title, description = message, type = nType})
    elseif notifConfig == 'qb' then QBCore.Functions.Notify(message, nType)
    elseif notifConfig == "ESX" then ESX.ShowNotification(message, nType, 3000)
--luacheck: push ignore
	elseif notifConfig == 'other' then
        print("Notif | "..Lcl('debug_standalonefunction'))
	end
--luacheck: pop
end

--- DrawText Function
---@param bool boolean - true = Displays DrawText | False = Removes Current DrawText
---@param text? string - Message shown
function FCUtils.DrawText(bool, text)
	if bool then
        if not text then text = "" end
        if Config.Framework.DrawText == "oxlib" then lib.showTextUI(text)
		elseif Config.Framework.DrawText == 'okok' then exports['okokTextUI']:Open(text, 'darkblue', 'right')
        elseif Config.Framework.DrawText == "PSUI" then exports['ps-ui']:DisplayText(text, "primary")
		elseif Config.Framework.Framework == 'QBCore' then exports['qb-core']:DrawText(text, 'right')
        elseif Config.Framework.Framework == "ESX" then exports['esx_textui']:TextUI(text)
		end
	else
        if Config.Framework.DrawText == "oxlib" then lib.hideTextUI()
		elseif Config.Framework.DrawText == 'okok' then exports['okokTextUI']:Close()
        elseif Config.Framework.DrawText == "PSUI" then exports['ps-ui']:HideText()
		elseif Config.Framework.Framework == 'QBCore' then exports['qb-core']:HideText()
        elseif Config.Framework.Framework == "ESX" then exports['esx_textui']:HideUI()
        end
	end
end

function FCUtils.Input(title, submit, options)
    local p = promise.new()
    if Config.Framework.Input == 'ox' then
        local o, order, i = {}, {}, 1
        local dialog
        for _, v in ipairs(options) do
            if v.type == 'text' then
                o[#o+1] = {type = 'input', label = v.text, required = true, default = v.default or nil}
            elseif v.type == 'radio' then
                local oo = {}
                for _, b in ipairs(v.options) do oo[#oo+1] = {value = b.value, label = b.text} end
                o[#o+1] = {type = 'select', label = v.text, options = oo, required = true}
            elseif v.type == 'date' then
                o[#o+1] = {type = 'date', label = v.text, required = true, returnString = true, default = v.default or '01/01/2000', min = "01/01/1910", max = "12/31/2010"}
            end
            order[v.name] = i
            i = i+1
        end
        dialog = lib.inputDialog(title, o)
        local retval = {dialog, order}
        p:resolve(retval)
    elseif Config.Framework.Input == 'qb' then
        local dialog = exports['qb-input']:ShowInput({header = title, submitText = submit, inputs = options})
        local retval = {dialog}
        p:resolve(retval)
    end
    return p
end

-- Function to build menus
---@param title string - Name of the menu
---@param options table - table containing all of the options
function FCUtils.MakeMenu(title, options)
    local m
    if Config.Framework.Menu == 'nh' then
        m = {{header = title, disabled = true}}
        for _, v in ipairs(options) do
            m[#m+1] = {
                header = v.header,
                context = v.desc,
                event  = v.event,
                args = {v.license},
                disabled = not v.canForge,
            }
        end
        m[#m+1] = { header = Lcl('input_close'), event  = "cr-forgery:client:Close"}
        TriggerEvent("nh-context:createMenu", m)
    elseif Config.Framework.Menu == 'qb' then
        m = {{header = title, isMenuHeader = true}}
        for _, v in ipairs(options) do
            m[#m+1] = {
                header = v.header,
                text = v.desc,
                isMenuHeader = not v.canForge,
                params = {
                    event  = v.event,
                    args = v.license
                },
            }
        end
        m[#m+1] = { header = Lcl('input_close'), event  = "qb-menu:client:closeMenu"}
        exports['qb-menu']:openMenu(m)
    elseif Config.Framework.Menu == 'ox' then
        local o = {}
        for _, v in ipairs(options) do
            o[#o+1] = {
                title = v.header,
                description = v.desc,
                disabled = not v.canForge,
                progress = v.xpRatio,
                onSelect = function() TriggerEvent(v.event, v.license) end,
            }
        end
        o[#o+1] = { title = Lcl('input_close'), onSelect = function() lib.hideContext() end }
        m = {id = 'forge_menu', title = title, options = o}
        lib.registerContext(m)
        lib.showContext('forge_menu')
    end
end

--- Progress Bar
---@param time integer --Time in MS
---@param text string -- Text Displayed
---@param onFinish function -- On Finsh Function
---@param onCancel function -- On Cancel Function
---@param freezeplayer boolean -- Does it Freeze the player
---@param dict? string -- Animation Dict
---@param anim? string -- Animation
---@param flag? integer -- Animation Flag
function FCUtils.ProgressUI(time, text, onFinish, onCancel, canCancel, freezeplayer, dict, anim, flag)
    if not onFinish then onFinish = function() end end
    if not onCancel then onCancel = function() end end
    if Config.Framework.ProgressUI == "mythic" then
        TriggerEvent("mythic_progbar:client:progress", {name = "CRForgeryProgress", duration = time, label = text, useWhileDead = false, canCancel = canCancel,
            controlDisables = { disableMovement = freezeplayer, disableCarMovement = freezeplayer, disableMouse = false, disableCombat = true },
            animation = { animDict = dict, anim = anim, flags = flag },
        }, function(status) if status then onCancel() else onFinish() end end)
    elseif Config.Framework.ProgressUI == "rprogress" then
        local Progress = Config.RProgressUI
        local Anim = {animationDictionary = dict, animationName = anim}
        local Controls = {Mouse = false, Player = freezeplayer, Vehicle = freezeplayer}
        Progress.canCancel = canCancel Progress.Duration = time Progress.Label = text Progress.Animation = Anim Progress.DisableControls = Controls
        Progress.onComplete = function(cancelled) if cancelled then onCancel() else onFinish() end end
        exports['rprogress']:Custom(Progress)
    elseif Config.Framework.ProgressUI == "oxlib" then
        local pb = { duration = time, label = text, useWhileDead = false, canCancel = canCancel, disable = {car = freezeplayer, move = freezeplayer, combat = freezeplayer}}
        if dict and anim then pb.anim = {dict = dict, clip = anim, flag = flag} end
        if lib.progressBar(pb) then onFinish() else onCancel() end
    elseif Config.Framework.Framework == "QBCore" then
        QBCore.Functions.Progressbar("CRForgeryProgress", text, time, true, canCancel,
        { disableMovement = freezeplayer, disableCarMovement = freezeplayer, disableMouse = false, disableCombat = true },
        { animDict = dict, anim = anim, flags = flag},
        {}, {}, function() onFinish() end, function() onCancel() end)
    elseif Config.Framework.Framework == "ESX" then
        ESX.Progressbar(text, time,{ FreezePlayer = freezeplayer,
            animation ={ type = "anim", dict = dict, lib = anim },
            onFinish = onFinish(), onCancel = onCancel()
        })
    else
        print(Lcl('debug_standalonefunction'))
    end
end

function FCUtils.GetItemLabel(item)
    return QBCore.Shared.Items[item].label
end

function FCUtils.GenerateCitizenID()
    return tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
end

function FCUtils.DropEvidence(coords)
    if not Config.DropFingerPrintEvidence or IsWearingHandshoes() then return end
    if math.random(100) < Config.FingerPrintDropChance then
        TriggerServerEvent("evidence:server:CreateFingerDrop", coords)
    end
end

function FCUtils.GetAllIDs()
    local p = promise.new()
    if Config.Framework.Framework == "QBCore" then
        QBCore.Functions.TriggerCallback('cr-forgery:server:getAllIds', function(idList)
            p:resolve(idList)
        end)
    end
    return p
end

--- Function to check if player is wearing gloves or not
---@return boolean - Is the player wearing gloves?
function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true

    if model == 'mp_m_freemode_01' then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

-- Targets & Interactions Thread
Citizen.CreateThread(function()
    if  Config.Framework.Interaction.UseTarget then

        for k, v in pairs(Config.Locations) do
            local EnterOptions = {{name = "ForgeryEnter_"..k, type = "client", event = "cr-forgery:client:Enter", icon = "fas fa-user-secret", label = Lcl('interact_Enter'), loc = k}}
            if Config.Framework.Interaction.Target == 'qb-target' then
                exports['qb-target']:AddBoxZone("ForgeryEnter_"..k, v.coords.xyz, 1.6, 1.1,
                    {name = "ForgeryEnter", heading = v.coords[4], debugPoly = Config.Debug, minZ= v.coords.z-0.5, maxZ= v.coords.z+1.0}, {options = EnterOptions, distance = 2.5})
            elseif Config.Framework.Interaction.Target == "oxtarget" then
                exports['ox_target']:addBoxZone({coords = v.coords.xyz, size = vec3(1,1,1), rotation = v.coords[4], debug = Config.Debug, options = EnterOptions})
            end
        end

        local LeaveOptions = {{name = "ForgeryLeave", type = "client", event = "cr-forgery:client:Leave", icon = "fas fa-user-secret", label = Lcl('interact_Leave')}}
        local ForgeOptions = {{name = "ForgeryForge", type = "client", event = "cr-forgery:client:IDForgery", icon = "fas fa-user-secret", label = Lcl('interact_Forge')}}
        if Config.Framework.Interaction.Target == 'qb-target' then
            exports['qb-target']:AddBoxZone("ForgeryLeave", vector3(1173.54, -3196.63, -39.01), 1.5, 1.0,
                {name = "ForgeryLeave", heading = 89, debugPoly = Config.Debug, minZ=-40.00, maxZ=-38.00}, {options = LeaveOptions, distance = 2.5})
            exports['qb-target']:AddBoxZone("ForgeryForge", vector3(1169.52, -3196.85, -39.01), 0.4, 0.5,
                {name = "ForgeryForge", heading = 290, debugPoly = Config.Debug, minZ=-39.30, maxZ=-38.80}, {options = ForgeOptions, distance = 2.5})
        elseif Config.Framework.Interaction.Target == "oxtarget" then
            exports['ox_target']:addBoxZone({coords = vector3(1173.54, -3196.63, -39.01), size = vec3(1,1.2,1), rotation = 89, debug = Config.Debug, options = LeaveOptions})
            exports['ox_target']:addBoxZone({coords = vector3(1169.52, -3196.85, -39.01), size = vec3(1,1,1), rotation = 290, debug = Config.Debug, options = ForgeOptions})
        end
    else
        if Config.Framework.Interaction.OxLibDistanceCheck then

            for k, v in pairs(Config.Locations) do
                local EnterPoint = lib.points.new(v.coords.xyz, 1)
                function EnterPoint:onEnter() FCUtils.DrawText(true, "["..Config.Framework.Interaction.Key.."] "..Lcl('interact_Enter')) end
                function EnterPoint:onExit() FCUtils.DrawText(false) end
                function EnterPoint:nearby() if IsControlJustPressed(0, Config.KeyList[Config.Framework.Interaction.Key]) then FCUtils.DrawText(false) TriggerEvent('cr-forgery:client:Enter', {loc = k}) end end
            end

            local ExitPoint = lib.points.new(Config.OutsideCoords.coords, 1)
            function ExitPoint:onEnter() FCUtils.DrawText(true, "["..Config.Framework.Interaction.Key.."] "..Lcl('interact_Leave')) end
            function ExitPoint:onExit() FCUtils.DrawText(false) end
            function ExitPoint:nearby() if IsControlJustPressed(0, Config.KeyList[Config.Framework.Interaction.Key]) then FCUtils.DrawText(false) TriggerEvent('cr-forgery:client:Leave') end end

            local ForgePoint = lib.points.new(Config.OutsideCoords.coords, 1)
            function ForgePoint:onEnter() FCUtils.DrawText(true, "["..Config.Framework.Interaction.Key.."] "..Lcl('interact_Forge')) end
            function ForgePoint:onExit() FCUtils.DrawText(false) end
            function ForgePoint:nearby() if IsControlJustPressed(0, Config.KeyList[Config.Framework.Interaction.Key]) then FCUtils.DrawText(false) TriggerEvent('cr-forgery:client:IDForgery') end end
        end
    end
end)

AddEventHandler('onResourceStop', function(r)
    if r == GetCurrentResourceName() then
        if not Config.Framework.Interaction.UseTarget or Config.Framework.Interaction.Target == "oxtarget" then return end
        exports['qb-target']:RemoveZone("ForgeryLeave")
        exports['qb-target']:RemoveZone("ForgeryForge")
        for k, _ in pairs(Config.Locations) do
            exports['qb-target']:RemoveZone("ForgeryEnter_"..k)
        end
    end
end)