local QBCore = exports[Config.Core]:GetCoreObject()

function Notify(msg, type, time)
    QBCore.Functions.Notify(msg, type, time)
end

function GetVehicleName(hash)
    name = GetDisplayNameFromVehicleModel(hash)
    return name
end

function MakeAnimation(animation)
    if Config.EmoteMenu == "dp" then
        TriggerEvent('animations:client:EmoteCommandStart', {animation})
    elseif Config.EmoteMenu == "rp" then
        exports["rpemotes"]:EmoteCommandStart(animation)
    elseif Config.EmoteMenu == "scully" then
        exports["scully_emotemenu"]:playEmoteByCommand(animation)
    elseif Config.EmoteMenu == "aty_emote" then
        exports.aty_emote:PlayEmote(animation)
    elseif Config.EmoteMenu == "cylex_animmenuv2" then
        exports['cylex_animmenuv2']:playEmote(animation)
    else
        print("Missing or write wrong on: Config.EmoteMenu")
    end
end

function CancelAnimation()
    if Config.EmoteMenu == "dp" then
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    elseif Config.EmoteMenu == "rp" then
        exports["rpemotes"]:EmoteCommandStart("c")
    elseif Config.EmoteMenu == "scully" then
        exports["scully_emotemenu"]:cancelEmote()
    elseif Config.EmoteMenu == "aty_emote" then
        exports.aty_emote:CancelEmote()
    elseif Config.EmoteMenu == "cylex_animmenuv2" then
        exports['cylex_animmenuv2']:playEmote('c')
    else
        print("Missing or write wrong on: Config.EmoteMenu")
    end
end