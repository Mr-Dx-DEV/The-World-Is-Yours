RegisterCommand("police", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == 'police' then
                TwoNa.TriggerCallback("2na_chat:sendJobMessages", source, {
                    job = 'police',
                    message = {
                        type = 'POLICE',
                        header = character.name,
                        color = Config.TypeColors["police"].color,
                        bgColor = Config.TypeColors["police"].bg,
                        text = text
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    bgColor = Config.TypeColors["error"].bg,
                    header = "PERMISSON ERROR",
                    args = { "You don't have enough permissions to use this command!" }
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                bgColor = Config.TypeColors["error"].bg,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" }
            })
        end
    end)
end)

RegisterCommand("ems", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == 'ambulance' then
                TwoNa.TriggerCallback("2na_chat:sendJobMessages", source, {
                    job = 'ambulance',
                    message = {
                        type = 'EMS',
                        header = character.name,
                        color = Config.TypeColors["ems"].color,
                        bgColor = Config.TypeColors["ems"].bg,
                        text = text
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    bgColor = Config.TypeColors["error"].bg,
                    header = "PERMISSON ERROR",
                    args = { "You don't have enough permissions to use this command!" }
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                bgColor = Config.TypeColors["error"].bg,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" }
            })
        end
    end)
end)

RegisterCommand("grove", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == 'grove' then
                TwoNa.TriggerCallback("2na_chat:sendJobMessages", source, {
                    job = 'grove',
                    message = {
                        type = 'GROVE',
                        header = character.name,
                        color = Config.TypeColors["gang"].color,
                        bgColor = Config.TypeColors["gang"].bg,
                        text = text
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    bgColor = Config.TypeColors["error"].bg,
                    header = "PERMISSON ERROR",
                    args = { "You don't have enough permissions to use this command!" }
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                bgColor = Config.TypeColors["error"].bg,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" }
            })
        end
    end)
end)

RegisterCommand("adminwhisper", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    if IsPlayerAceAllowed(source, "command") then
        TwoNa.TriggerCallback("2na_chat:sendAdminMessages", source,
            {
                type = "ADMIN WHISPER",
                color = Config.TypeColors["whisper"].color,
                bgColor = Config.TypeColors["whisper"].bg,
                header = GetPlayerName(source),
                text = text
            })
    else
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = Config.TypeColors["error"].color,
            bgColor = Config.TypeColors["error"].bg,
            header = "SYSTEM ERROR",
            args = { "An error occured while trying to gather character information!" }
        })
    end
end)

RegisterCommand("announce", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    if IsPlayerAceAllowed(source, "command") then
        TwoNa.TriggerCallback("2na_chat:sendAdminAnnounce", source,
            {
                type = "SYSTEM",
                color = Config.TypeColors["whisper"].color,
                bgColor = Config.TypeColors["whisper"].bg,
                header = "ANNOUNCEMENT",
                text = text
            })
    else
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = Config.TypeColors["error"].color,
            bgColor = Config.TypeColors["error"].bg,
            header = "SYSTEM ERROR",
            args = { "An error occured while trying to gather character information!" }
        })
    end
end)

RegisterCommand("ooc", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:sendMessages", source,
        {
            type = 'OOC',
            color = Config.TypeColors["ooc"].color,
            bgColor = Config.TypeColors["ooc"].bg,
            text = text
        })
end)

RegisterCommand("tweet", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:sendMessages", source,
        {
            type = 'TWEET',
            color = Config.TypeColors["tweet"].color,
            bgColor = Config.TypeColors["tweet"].bg,
            text = text
        })
end)

RegisterCommand("showidentity", function(source, args, rawCommand)
    TwoNa.TriggerCallback("2na_chat:getCharacterInfo", source, {}, function(character)
        if character then
            TwoNa.TriggerCallback("2na_chat:showIdentity", source, {
                type = "CHARACTER INFO",
                color = Config.TypeColors["charinfo"].color,
                bgColor = Config.TypeColors["charinfo"].bg,
                header = character.name,
                text = "Gender: " ..
                    TwoNa.Functions.Capitalize(character.gender) ..
                    "\nDate of birth: " .. character.birth .. "\nJob: " .. character.job.label
            })
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = '#de4949',
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information." }
            })
        end
    end)
end)

RegisterCommand("yellowpages", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    TwoNa.TriggerCallback("2na_chat:sendYellowPages", source,
        {
            type = 'YELLOW PAGES',
            color = Config.TypeColors["yellow_pages"].color,
            bgColor = Config.TypeColors["yellow_pages"].bg,
            text = text
        })
end)

RegisterCommand("charinfo", function(source, args, rawCommand)
    TwoNa.TriggerCallback("2na_chat:getCharacterInfo", source, {}, function(character)
        if character then
            TriggerClientEvent("chat:addMessage", source, {
                type = "CHARACTER INFO",
                color = Config.TypeColors["charinfo"].color,
                bgColor = Config.TypeColors["charinfo"].bg,
                header = character.name,
                args = {
                    "Name: " .. character.name ..
                    " | " ..
                    "Gender: " ..
                    TwoNa.Functions.Capitalize(character.gender) ..
                    " | " ..
                    "Date of birth: " ..
                    character.birth ..
                    "\nJob: " ..
                    character.job.label ..
                    '\nBank balance: ^2$' ..
                    character.accounts.bank .. '^0\nCash amount: ^2$ ' .. character.accounts.cash
                }
            })
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = '#de4949',
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information." }
            })
        end
    end)
end)

RegisterCommand("whisper", function(source, args, rawCommand)
    local targetId = args[1]
    local text = ""

    for k, v in ipairs(args) do
        if k == 1 then
        else
            text = text .. " " .. v
        end
    end

    if tostring(source) == tostring(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = '#de4949',
            header = "SYSTEM ERROR",
            args = { "You cannot whipser to yourself!" }
        })

        return
    end

    TwoNa.TriggerCallback("2na_chat:sendWhisperMessage", source,
        {
            target = targetId,
            message = {
                type = 'WHISPER',
                color = Config.TypeColors["whisper"].color,
                bgColor = Config.TypeColors["whisper"].bg,
                text = text
            }
        })
end)

RegisterCommand("playmusic", function(source, args, rawCommand)
    local url = args[1]
    local text = ""
    for k, v in ipairs(args) do
        text = text .. " " .. v
    end
    text = text:gsub("%s+", " ")
    if #text == 0 then
        return
    end
    if not url or not tostring(url) then
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = '#de4949',
            header = "Invalid Url",
            args = { "Invalid url !" }
        })
        return
    end
    TwoNa.TriggerCallback("2na_chat:playMusicWithUrl", source,
        {
            url = url,
        }
    )
end)

RegisterCommand("stopmusic", function(source, args, rawCommand)
    TwoNa.TriggerCallback("2na_chat:stopMusic", source)
end)

RegisterCommand("musicvolume", function(source, args, rawCommand)
    local volume = args[1]
    TwoNa.TriggerCallback("2na_chat:setMusicVolume", source,
        {
            volume = tonumber(volume) or 1
        }
    )
end)
