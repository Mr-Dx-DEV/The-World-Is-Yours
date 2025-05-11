Config = {}

Config.Framework = "qb" -- auto, esx or qb
Config.voipSystem = "auto" -- pma-voice, pma-voice, mumble-voip, saltychat
Config.debug = false
Config.radioName = "radio" -- item name
Config.defaultVolume = 50 -- default volume of the radio, 0 - 100

Config.RadioProp = 'prop_cs_hand_radio'

Config.jobChannels = { -- channels where only designated jobs can participate
    [1] = {
        frequency = {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10"
        },
        jobs = {
            "lspd",
            "bcso",
            "sahp",
            "lsso",
            "safw",
            "sadoc",
            "usms",
            "fbi",
            "dhs",
            "ss",
            "police",
            "salsa"
        }

    },
    [2] = {
        frequency = {
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10"
        },
        jobs = {
            "ambulance",
            "lspd",
            "bcso",
            "sahp",
            "lsso",
            "safw",
            "sadoc",
            "usms",
            "fbi",
            "dhs",
            "ss",
            "police",
            "salsa"
        }
    }
}

Config.Locale = {
    created = "Channel successfully created!",
    created_fail = "Already created with the same frequency.",

    disconnected = "Successfully disconnected from the radio!",
    disconnected_fail = "An error occurred while disconnecting from the radio.",

    connected = "Radio connection successfully established!",
    password = "Enter your password to access this channel.",

    notfound = "The frequency you want to join was not found!",
    wrong = "Incorrect password!",

    wait = "Try again in 1 second.",
    kick = "Disconnected due to not having a radio.",
    job = "This frequency is assigned to a specific job!",

    volume_up = "Volume increased.",
    volume_down = "Volume decreased.",
    max = "Volume is at maximum level!",
    min = "Volume is at minimum level!"
}


function getFramework()
    if Config.Framework == "esx" then
        return exports['es_extended']:getSharedObject(), "esx"
    elseif Config.Framework == "qb" then
        return exports["qb-core"]:GetCoreObject(), "qb"
    elseif Config.Framework == "auto" then
        if GetResourceState('qb-core') == 'started' then
            return exports["qb-core"]:GetCoreObject(), "qb"
        elseif GetResourceState('es_extended') == 'started' then
            return exports['es_extended']:getSharedObject(), "esx"
        end
    end
end