bot_Token = ""
bot_logo = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
bot_name = "Tworst Store"


discord_webhook = {
    ['jobfinish'] =
    "https://discord.com/api/webhooks/1272507836458598544/PaDVD8U2MJVk7aHo9EeWQWjcMpjfLtEHydB0DX--Y8oJnRUgFB60cf4p6D0e501-JUH3",
}

local Caches = {
    Avatars = {}
}
local FormattedToken = "Bot " .. bot_Token
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = { data = resultData, code = errorCode, headers = resultHeaders }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        { ["Content-Type"] = "application/json", ["Authorization"] = FormattedToken }
    )

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    local discordId = nil
    local imgURL = nil
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if discordId then
        if Caches.Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif"
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            end
            Caches.Avatars[discordId] = imgURL
        else
            imgURL = Caches.Avatars[discordId]
        end
    end
    return imgURL
end

function sendDiscordLogHistory(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = botname,
                color = 0xFFA500,
                author = {
                    name = 'Tworst  Electrician - JOB FINISH',
                },
                thumbnail = {
                    url = data.avatar
                },
                fields = {
                    { name = "Player Name", value = data.name or false,            inline = true },
                    { name = "Player ID",   value = data.id or false,              inline = true },
                    { name = "Owner ID",    value = data.owneridentifier or false, inline = true },
                    {
                        name = "──────────Job Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Job Price", value = string.format("%s%d", Config.MoneyType, tonumber(data.money) or 'undefined'), inline = true },

                },
                footer = {
                    text = "Tworst Store - https://discord.gg/tworst",
                    icon_url =
                    "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['jobfinish'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end

function GetLobbyByPlayerSource(src)
    for owner, lobby in pairs(coopData) do
        for _, player in ipairs(lobby.players) do
            if player.source == src then
                return owner, lobby
            end
        end
    end
    return nil, nil
end

AddEventHandler('playerDropped', function(reason)
    local src = source
    local owneridentifier, lobby = GetLobbyByPlayerSource(src)
    if not lobby then return end

    for i, player in ipairs(lobby.players) do
        if player.source == src then
            if player.playerIdentifier == owneridentifier then
                local vehiclesToDelete = {}
                for k, v in pairs(lobby.roomSetting.Vehicle) do
                    table.insert(vehiclesToDelete, v)
                end

                for key, value in pairs(lobby.roomSetting.VehicleNetId) do
                    table.insert(vehiclesToDelete, value)
                end


                for _, vehicle in ipairs(vehiclesToDelete) do
                    if DoesEntityExist(vehicle) then
                        DeleteEntity(vehicle)
                    end
                end

                for _, vehicle in ipairs(vehiclesToDelete) do
                    for iii, v in ipairs(lobby.roomSetting.Vehicle) do
                        if v == vehicle then
                            table.remove(lobby.roomSetting.Vehicle, iii)
                            break
                        end
                    end
                end

                if next(Ladders) then
                    for index, value in pairs(Ladders) do
                        if value.owneridentifier == owneridentifier then
                            Ladders[index] = nil
                            UpdateLadders()
                            SetTimeout(500, function()
                                TriggerClientEvent("tworst-electrician:removeLadder", -1, index)
                            end)
                        end
                    end
                end

                if next(Lifts) then
                    for indexx, valuee in pairs(Lifts) do
                        if valuee.owneridentifier == owneridentifier then
                            Lifts[indexx] = nil
                            lobby.roomSetting.Lifts[indexx] = nil
                            UpdateLift(indexx)
                            SetTimeout(500, function()
                                TriggerClientEvent("tworst-electrician:removeLift", -1, indexx)
                            end)
                        end
                    end
                end

                for kkk, vvv in pairs(lobby.roomSetting.Lifts) do
                    Lifts[kkk] = nil
                    lobby.roomSetting.Lifts[kkk] = nil
                    UpdateLift(kkk)
                    TriggerClientEvent("tworst-electrician:removeLift", -1, kkk)
                end


                for _, remainingPlayer in ipairs(lobby.players) do
                    if remainingPlayer.source ~= src then
                        TriggerClientEvent('tworst-electrician:client:resetjob', remainingPlayer.source)
                        TriggerClientEvent('tw-electrician:client:sendNotification', remainingPlayer.source,
                            Config.NotificationText['playerleftlobby'].text,
                            Config.NotificationText['playerleftlobby'].type)
                    end
                end
                coopData[owneridentifier] = nil
                JoobTask[owneridentifier] = nil
            else
                table.remove(lobby.players, i)

                for _, remainingPlayer in ipairs(lobby.players) do
                    TriggerClientEvent('tworst-electrician:client:RefreshLobby', remainingPlayer.source,
                        coopData[owneridentifier])
                    TriggerClientEvent('tw-electrician:client:sendNotification', remainingPlayer.source,
                        Config.NotificationText['playerleftlobby'].text,
                        Config.NotificationText['playerleftlobby'].type)
                end
            end

            break
        end
    end
end)
