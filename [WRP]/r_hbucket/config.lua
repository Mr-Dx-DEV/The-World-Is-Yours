/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-helicopter-bucket
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Configuration ]]

Config = {
    Language = 'en', -- Language library used for the script, see the last lines to modify the text of the language. (Config.Languages)

    UseOutdatedVersion = false, -- Enable this parameter to suppress alert messages in the console if you wish to use an older version of the script.

    Debug = false, -- Allows to display messages in the client console when the player takes different actions

    ESX = false, -- ESX compatibility (you can modify this function on cl_utils.lua)
    QB = true, -- QB compatibility (you can modify this function on cl_utils.lua)

    Helicopter = {
        -- You can create helicopters as many times as you want
        [`polmav`] = { -- Name of the helicopter
            ropeOffset = vector3(0.0, 0.0, -0.7), -- Offset of the rope from the helicopter
            waterScale = 15.0, -- Size of the water
            manageJobs = { -- Permission to interact with the bucket, only if ESX or QB is enabled
                'pilot'
            },
            manageSeat = {-1, 0}, -- -1 = driver, 0 = right front passenger, 1 = left rear passenger, 2 = right rear passenger
            siren = {
                enabled = true, -- Allows you to activate or not the alarm
                soundName = 'yelp', -- Sound name
                distance = 300.0 -- Distance from the siren
            },
            capacity = 1300, -- Loading capacity of the helicopter in liters
            pumpPower = 4.0, -- Water loading power
            waterDischargePower = 2.0 -- Water discharge power
        },
        [`swift`] = { -- Name of the helicopter
            ropeOffset = vector3(0.0, 0.0, -0.7), -- Offset of the rope from the helicopter
            waterScale = 15.0, -- Size of the water
            manageJobs = { -- Permission to interact with the bucket, only if ESX or QB is enabled
                'pilot'
            },
            manageSeat = {-1, 0}, -- -1 = driver, 0 = right front passenger, 1 = left rear passenger, 2 = right rear passenger
            siren = {
                enabled = true, -- Allows you to activate or not the alarm
                soundName = 'yelp', -- Sound name
                distance = 300.0 -- Distance from the siren
            },
            capacity = 1300, -- Loading capacity of the helicopter in liters
            pumpPower = 4.0, -- Water loading power
            waterDischargePower = 2.0 -- Water discharge power
        }
    },

    HUD = {
        Text = true, -- Displays or not the text as shown in the image https://i.imgur.com/VtVWFW7.png
        NUI = true -- Displays or not the nui as shown in the image https://i.imgur.com/Jw8fqBA.png
    },

    Fires = {
        SmartFires = { -- https://store.londonstudios.net/
            enabled = true,
            name = 'SmartFires', -- Name of the resource
            detectionRadius = 20.0, -- Distance of fire detection in x and y
            healthSpeed = 2.0 -- A fire appears with 100 life, this parameter allows you to manage the speed of decrease.
        },
        ToxicFire = { -- https://tox-scripts.tebex.io/package/4838366
            enabled = false,
            name = 'firescript', -- Name of the resource
            detectionRadius = 20.0, -- Distance of fire detection in x and y
            healthSpeed = 2.0 -- A fire appears with 100 life, this parameter allows you to manage the speed of decrease.
        },
        zFire = { -- https://store.zeadevelopment.com/
            enabled = false,
            name = 'z_fire', -- Name of the resource
            detectionRadius = 20.0, -- Distance of fire detection in x and y
            healthSpeed = 2.0 -- A fire appears with 100 life, this parameter allows you to manage the speed of decrease.
        }
    },

    Effect = {
        water = {
            dict = "core",
            name = "water_cannon_jet"
        },
        vapor = {
            dict = "core",
            name = "ent_amb_smoke_gaswork"
        }
    }
}

-- https://docs.fivem.net/docs/game-references/controls/
Config.Keys = {
    DropWaterKey = 306, -- Key to drop water
    DropWaterKeyString = '~INPUT_REPLAY_ENDPOINT~', -- Key string to drop water

    SirenKey = 86,
    SirenKeyString = '~INPUT_VEH_HORN~',

    DeleteBucketKey = 38,
    DeleteBucketKeyString = '~INPUT_PICKUP~'
}

-- Libraries of languages.
Config.Languages = {
    ['en'] = {
        ['quantity'] =  "The bambi bucket contains ~b~{s}/{m}L",
        ['dropwater'] = "To drop water press "..Config.Keys.DropWaterKeyString,
        ['siren'] = "Activate the siren press "..Config.Keys.SirenKeyString,
        ['deletebucket'] = "Putting away the bambi bucket "..Config.Keys.DeleteBucketKeyString
    },
    ['fr'] = {
        ['quantity'] = "Le seau d'eau contient ~b~{s}/{m}L",
        ['dropwater'] = "Pour lacher de l'eau presse "..Config.Keys.DropWaterKeyString,
        ['siren'] = "Activer la sirène de largage "..Config.Keys.SirenKeyString,
        ['deletebucket'] = "Ranger le bambi bucket "..Config.Keys.DeleteBucketKeyString
    }
}