local QBCore = exports['qb-core']:GetCoreObject()
FSUtils = {}

if Config.Debug then
    -- Sets the player specified as arg 1, the xp specified as arg 2
    -- example : /setforgexp 1 50 (1 -> player ID, 50 -> Forge XP)
    RegisterCommand('setforgexp',function(_, args)
        local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
        Player.Functions.SetMetaData('forgeryXp', tonumber(args[2]))
    end)

    -- Check if the item in the slot specified in arg 1 has the `forged` metadata
    -- example : /checkForged 1 (Checks if the item/id in the player's 1st slot has the forged metadata)
    RegisterCommand('checkForged',function(source, args)
        local forged = CheckIsForged(source, tonumber(args[1]))
        print(forged)
    end)
end

RegisterNetEvent('cr-forgery:server:UpdateBucket', function(loc) SetPlayerRoutingBucket(source, loc) end)

if Config.Framework.Framework == "QBCore" then
    QBCore.Functions.CreateCallback("cr-forgery:server:CheckRequirements", function(source, cb, license)
        cb(CheckRequirements(source, license))
    end)

    QBCore.Functions.CreateCallback("cr-forgery:server:fetchXp", function(source, cb)
        cb(QBCore.Functions.GetPlayer(source).PlayerData.metadata['forgeryXp'])
    end)

    QBCore.Functions.CreateCallback("cr-forgery:server:getAllIds", function(source, cb)
        local list = FSUtils.FetchAllIDs(source)
        cb(list)
    end)

    QBCore.Functions.CreateUseableItem(Config.ScannerOptions.scannerItem, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        TriggerClientEvent('cr-forgery:client:openIDScanner', source)
    end)

    if not Config.convertBl_Idcard then
        for k, v in pairs(Config.Licences) do
            -- You may edit this to fit your server's way of showing ids if you have custom ones.
            QBCore.Functions.CreateUseableItem(v.Card, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                if not Player.Functions.GetItemByName(item.name) then return end
                local PlayerPed = GetPlayerPed(source)
                local gender
                local n = Config.KeyNames
                QBCore.Debug(item.info)
                if item.info[n.gender] then print(item.info[n.gender]) gender = Config.GenderOptions[item.info[n.gender]] end
                for _, v_ in pairs(QBCore.Functions.GetPlayers()) do
                    local TargetPed = GetPlayerPed(v_)
                    local dist = #(GetEntityCoords(PlayerPed) - GetEntityCoords(TargetPed))
                    print(k, item.info[n.citizenid], item.info[n.firstName], item.info[n.lastName], item.info[n.birthDate], item.info.type, gender, item.info[n.nationality])
                    if dist < 3.0 then
                        TriggerClientEvent('chat:addMessage', v_,  {
                                template = '<div class="chat-message advert"><div class="chat-message-body"><br><strong>{0}:</strong> <br>' ..
                                (v.ShownOptions['citizenid'] and item.info[n.citizenid] and '<strong>' .. Lcl('info_CID') .. ':</strong> {1} <br>') ..
                                (v.ShownOptions['firstName'] and item.info[n.firstName]  and '<strong>' .. Lcl('input_FirstName') .. ':</strong> {2} <br>') ..
                                (v.ShownOptions['lastName'] and item.info[n.lastName] and '<strong>' .. Lcl('input_LastName') .. ':</strong> {3} <br>') ..
                                (v.ShownOptions['birthDate'] and item.info[n.birthDate] and '<strong>' .. Lcl('info_BirthDate') .. ':</strong> {4} <br>') ..
                                (item.info.type and '<strong>' .. Lcl('info_Licenses') .. ':</strong> {5} <br>' or '') ..
                                (v.ShownOptions['gender'] and gender and '<strong>' .. Lcl('input_Gender') .. ':</strong> {6} <br>' or '') ..
                                (v.ShownOptions['nationality'] and item.info[n.nationality] and '<strong>' .. Lcl('input_Nationality') .. ':</strong> {7} <br>' or '') ..
                                '</div></div>',
                                args = {
                                    k,
                                    item.info[n.citizenid] or nil,
                                    item.info[n.firstName] or nil,
                                    item.info[n.lastName] or nil,
                                    item.info[n.birthDate] or nil,
                                    item.info.type or nil,
                                    gender or nil,
                                    item.info[n.nationality] or nil,
                                }
                            }
                        )
                        print("event triggered..")
                    end
                end
            end)
        end
    end
end

-- Checks if a specified item is forged
---@param source number Player source
---@param item any number (slot) or table (item or item metadata) to check for
---@return nil|boolean - is Item forged (Nil if cant find item) ?
function CheckIsForged(source, item)
    local theItem
    if Config.Framework.useOxInv then
        if type(item) == 'table' then
            theItem = item
        else
            theItem = exports.ox_inventory:GetSlot(source, tonumber(item))
        end
        if not theItem then
            FSUtils.Debug(Lcl('error_checkIsForged'))
            FSUtils.Notify(3, Lcl('error_checkIsForged'), Lcl('notif_Title'), source)
            return
        end
        return theItem.forged or (theItem.info and theItem.info.forged) or (theItem.metadata and theItem.metadata.forged) or false
    elseif Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        if type(item) == "table" then
            theItem = item
        else
            theItem = Player.Functions.GetItemBySlot(tonumber(item))
        end
        if not theItem then
            FSUtils.Debug(Lcl('error_checkIsForged'))
            FSUtils.Notify(3, Lcl('error_checkIsForged'), Lcl('notif_Title'), source)
            return
        end
        return theItem.forged or (theItem.info and theItem.info.forged) or false
    else
        return
    end
end exports('CheckIsForged', CheckIsForged)

function FSUtils.FetchAllIDs(src)
    local list = {}
    if Config.Framework.UseOxInv or Config.Framework.Framework == "ESX" then
        local allItems = exports.ox_inventory:Items()
        for _, v in pairs(Config.Licences) do
            local items = exports.ox_inventory:GetSlotsWithItem(src, v.Card)
            for _, v_ in pairs(items) do
                list[#list+1] = {label = allItems[v.Card].label, info = v_.metadata}
            end
        end
    else
        local Player = QBCore.Functions.GetPlayer(src)
        for _, v in pairs(Config.Licences) do
            local items = Player.Functions.GetItemsByName(v.Card)
            QBCore.Debug(items)
            for _, v_ in pairs(items) do
                list[#list+1] = {label = QBCore.Shared.Items[v.Card].label, info = v_.info}
            end
        end
    end
    return list
end

-- Add Forge XP to a specified player
---@param source number Player source
---@return number xp amount of xp the source has
function FSUtils.FetchXP(source)
    if not Config.UseExperience then return 0 end
    if Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.PlayerData.metadata['forgeryXp']
    else
        return 0
    end
end

-- Add Forge XP to a specified player
---@param source number - Player source
---@param xp number - xp amount to add
function FSUtils.AddExperience(source, xp)
    if not Config.UseExperience then return end
    if Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.SetMetaData('forgeryXp', Player.PlayerData.metadata['forgeryXp'] + xp)
    end
end

-- Server-sided Notification Matrix
---@param notifType number - Type of Notification Shown (1 = Success, 2 = Info, 3 = Failure)
---@param message string - Message Sent
---@param title string - Message Title (If Applicable)
---@param serversource? number -- Sent if source is needed.
function FSUtils.Notif(notifType, message, title, serversource)
    local src = source
    if serversource then src = serversource end
    local notifConfig = Config.Framework.Notifications
    local notifMappings = {
        [1] = {qb = "success", oxlib = "success", mythic = "success", other = "success"}, -- Mapping for success
        [2] = {qb = "primary", oxlib = "info", mythic = "inform", other = "info"}, -- Mapping for info
        [3] = {qb = "error", oxlib = "error", mythic = "error", other = "error"}  -- Mapping for error
    }
    local typeMap = notifMappings[notifType] or notifMappings[3] -- Default to error if notifType not found
    local nType = typeMap[notifConfig]

	if Config.Framework.Notifications == 'qb' or Config.Framework.Notifications == 'tnj' then
        TriggerClientEvent('QBCore:Notify', src, message, nType)
	elseif Config.Framework.Notifications == "okok" then
        TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, nType)
	elseif Config.Framework.Notifications == "mythic" then
        TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = nType, text = message, length = 5000})
	elseif Config.Framework.Notifications == 'chat' then
		TriggerClientEvent('chatMessage', src, message)
    elseif Config.Framework.Notifications == "oxlib" then
        TriggerClientEvent('ox_lib:notify', src, {title = title, description = message, type = nType})
    elseif Config.Framework.Notifications == "ESX" then
        TriggerClientEvent('esx:showNotification', src, message, nType)
--luacheck: push ignore
	elseif Config.Framework.Notifications == 'other' then
		--You can add any notification system here.
	end
--luacheck: pop
end

-- Getter for player's money
---@param source number - Player source
---@param type string - Money Type
---@return number - Money
function FSUtils.CheckMoney(source, type)
    if Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.PlayerData.money[type]
    end
    return 0
end

--- Adding Money
---@param source number -- Player source
---@param type string -- Currency being removed
---@param amount number -- Amounnt being removed
function FSUtils.RemoveMoney(source, type, amount)
    if Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player.Functions.RemoveMoney(type, amount)
    end
end

--- Check if the player has all the items in a specific table
---@param source number -- Player source
---@param table table -- Table containing all the items being removed (v.item, v.amount)
---@return boolean retval -- Does the player have all the items?
function FSUtils.CheckHasItems(source, table)
    if Config.Framework.Framework == "QBCore" then
        local retval = true
        local Player = QBCore.Functions.GetPlayer(source)
        for _, v in pairs(table) do
            local item = Player.Functions.GetItemByName(v.item)
            if not item or item.amount < v.amount then
                retval = false
                break
            end
        end
        return retval
    end
    return false
end

-- Removing Items
---@param source number -- Player source
---@param item any -- Item being removed
---@param amount? any -- Amount being removed
function FSUtils.RemoveItem(source, item, amount)
    if not amount then amount = 1 end
    if Config.Framework.UseOxInv == "OxInv" then
        local ox_inventory = exports.ox_inventory
        ox_inventory:RemoveItem(source, item, amount)
    elseif Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", amount)
    end
end

--- Adding Items
---@param source number -- Player source
---@param item string -- Item being added
---@param amount number -- Amoung being added
---@param info? any -- Item metadata (if needed)
---@return boolean -- Returns if the player can carry the item
function FSUtils.GiveItem(source, item, amount, info)
    local itemGiven = false
    if Config.convertBl_Idcard then item, info = FSUtils.BlConvert(source, item, info) end
    if Config.Framework.UseOxInv then
        local ox_inventory = exports.ox_inventory
        if ox_inventory:CanCarryItem(source, item, amount) and ox_inventory:AddItem(source, item, amount, info) then itemGiven = true end
    elseif Config.Framework.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.AddItem(item, amount, false, info) then TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount) itemGiven = true end
    end
    return itemGiven
end

function FSUtils.Logs(source, license, info)
    if not Config.Framework.Logs then return end
    TriggerEvent('qb-log:server:CreateLog', 'identificationforgery', Lcl('forgery_title'), 'orange', "**"..Lcl('logs_desc', GetPlayerName(source)).."\n"..license.."\nInfo : **\n"..Lcl('logs_CID').." : **"..info.citizenid.."\n**"..Lcl('input_FirstName').." : "..info.firstname.." "..info.lastname.."\nDOB : "..info.birthdate.."\nNationality : "..info.nationality)
end

function FSUtils.BlConvert(src, card, data)
    local mugshot = lib.callback.await('bl_idcard:cb:getMugShot', src)

    if not mugshot then
        print('Mugshot for license creation not found. Source: ' .. src .. ' | ' .. GetPlayerName(src))
        return card, false
    end

    data.imageURL = mugshot
    data.idType = card
    if card == 'id_card' and data[Config.KeyNames.gender] == 0 then data.idType = 'male_id'
    elseif card == 'id_card' and data[Config.KeyNames.gender] == 1 then data.idType = 'female_id' end
    -- Create the description (for ox_inv)
    data.description = string.format(
        'Name: %s %s\n\nDate of Birth: %s\n\nGender: %s\n\nNationality: %s',
        data.firstName or '',
        data.lastName or '',
        data.dob or Lcl('info_Unknown'),
        data.sex == 0 and 'Male' or 'Female',
        data.nationality or ''
    )
    QBCore.Debug(data)
    return card, data
end