Config = {}

-- Enable debug messages
Config.Debug = false

-- The framework you are using
-- Only qb-core is supported at this time
Config.Framework = "qb-core"

-- Name of the item to associate with the boosting UI
Config.BoostingLaptop = "boostlaptop"

-- Name of the item used to disable trackers
Config.HackingDevice = "hacking_device"

-- Item required to VIN Scratch
Config.ScratchItem = "boostfile"

-- What phone are you using
-- Available options: qb-phone, qs-smartphone, lb-phone, renewed-phone
Config.Phone = "qb-phone"

-- Fuel script
-- Available options: qb-fuel, LegacyFuel, ps-fuel
Config.Fuel = "LegacyFuel"

-- Max amount of contracts that can be issued at once
Config.MaxContracts = 10

-- Delay between issuing contracts (in seconds)
Config.IssueDelay = {60, 180}

-- Time before contract expires (in hours)
Config.Expiration = 6

-- Cooldown for contracts in minutes
Config.Cooldown = 15

-- Type of payment used
-- Available options: crypto, cash, bank, renewed
-- If not using crypto, then make sure to increase
-- the reward amounts down below
Config.Payment = "cash"

-- Only if using renewed for payment
-- shung, gne, xcoin, lme
-- Or whatever you have setup
Config.CryptoCoin = "shung"

-- List of all jobs that are considered police
Config.PoliceJobs = {
    ['lspd'] = true,
            ['bcso'] = true,
            ['sahp'] = true,
            ['lsso'] = true,
            ['safw'] = true,
            ['sadoc'] = true,
            ['usms'] = true,
            ['fbi'] = true,
            ['dhs'] = true,
            ['ss'] = true,
            ['police'] = true,
            ['sheriff'] = true,
            ['ambulance'] = false,
}

-- Change to your vehicle keys event
-- Serverside
function Config.VehicleKeys(src, plate)
    TriggerClientEvent("vehiclekeys:client:SetOwner", src, plate)
end

-- Change to your vehicle keys event
-- Clientside
function Config.VehicleKeysRemove(plate)
    TriggerEvent("qb-vehiclekeys:client:RemoveKeys", plate)
end

-- Change to your event for dispatch
function Config.Dispatch(vehicle, coords)
    exports["ps-dispatch"]:CarBoosting(vehicle)
end

-- Event used by inventories when an item is added to display on screen
function Config.ItemAddEvent(src, item)
    -- QB
    TriggerClientEvent("inventory:client:ItemBox", src, item, "add", 1)
end

-- Delay (in seconds) before notifying the police of the boosting
Config.DispatchDelay = 30

-- Delay (in seconds) before alerting police of the tracking being hacked (happens after an attempt is made)
Config.DispatchDelayHacking = 10

-- Available options for hacking:
-- "numeric",
-- "alphabet",
-- "alphanumeric",
-- "greek",
-- "braille",
-- "runes"

-- Color of the shaded area (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
Config.ShadedAreaColor = 1 -- Red

-- Boosting tiers
Config.Tiers = {
    ["D"] = {
        title = "New Booster",
        xpRequired = 0, -- Setting value to 0 makes it the default tier
        xpReward = {1, 3},
        probability = 0.5,
        canScratch = false,
        hasTracker = false,
        trackerCount = 1, -- if tracker is enabled, how many hacks are required?
        hackDelay = 15, -- delay/cooldown between hacks
        scratchChance = 0,
        hack = {"numeric", "alphabet"},
        cost = {1, 2},
        payment = {3, 6},
        rewardItems = {
            enabled = false, -- Is the item reward enabled
            chance = 25, -- The chance to reward an item, 0-100
            itemsRandom = true, -- If true, will reward a random item from the list, if false, will reward all items
            items = {
                "weapon_pistol",
                "pistol_ammo"
            }
        },
        pedWeapons = {
            "weapon_hammer",
            "weapon_switchblade",
            "weapon_hammer"
        },
        pedAfraid = true, -- is the ped afraid of weapons
        scratchVehicles = {},
        finishDistance = 300, -- distance to finish contract
        MinCops = 2,
        MinCopsVin = 2,
        damageDetection = {
            enabled = true, -- Is the damage detection enabled
            threshold = 0.01, -- The threshold to detect damage, 0-1. 0.1 means that a damage event of 10% of the total vehicle health will trigger the reduction. Try using low values like 0.01, or lower.
            reduction = 0.05, -- The reduction of the reward, 0-1. 0.05 means that 5% of the reward will be reduced each time the threshold is met
        }

    },
    ["C"] = {
        title = "Booster",
        xpRequired = 25,
        xpReward = {2, 3},
        probability = 0.25,
        hasTracker = false,
        trackerCount = 1, -- if tracker is enabled, how many hacks are required?
        hackDelay = 15, -- delay/cooldown between hacks
        canScratch = false,
        scratchChance = 0,
        hack = {"numeric", "alphabet"},
        cost = {2, 4},
        payment = {4, 7},
        rewardItems = {
            enabled = false, -- Is the item reward enabled
            chance = 25, -- The chance to reward an item, 0-100
            itemsRandom = false, -- If true, will reward a random item from the list, if false, will reward all items
            items = {
                "weapon_pistol",
                "pistol_ammo"
            }
        },
        pedWeapons = {
            "weapon_hammer",
            "weapon_switchblade",
            "weapon_knife"
        },
        pedAfraid = true, -- is the ped afraid of weapons
        scratchVehicles = {},
        finishDistance = 300,
        MinCops = 2,
        MinCopsVin = 2,
        damageDetection = {
            enabled = true, -- Is the damage detection enabled
            threshold = 0.01, -- The threshold to detect damage, 0-1. 0.1 means that a damage event of 10% of the total vehicle health will trigger the reduction. Try using low values like 0.01, or lower.
            reduction = 0.05, -- The reduction of the reward, 0-1. 0.05 means that 5% of the reward will be reduced each time the threshold is met
        }
    },
    ["B"] = {
        title = "Experienced Booster",
        xpRequired = 50,
        xpReward = {2, 5},
        hasTracker = true,
        trackerCount = 1, -- if tracker is enabled, how many hacks are required?
        hackDelay = 15, -- delay/cooldown between hacks
        probability = 0.125,
        canScratch = false,
        scratchChance = 0,
        hack = {"numeric", "alphabet", "alphanumeric"},
        cost = {3, 5},
        payment = {6, 9},
        rewardItems = {
            enabled = false, -- Is the item reward enabled
            chance = 25, -- The chance to reward an item, 0-100
            itemsRandom = false, -- If true, will reward a random item from the list, if false, will reward all items
            items = {
                "weapon_pistol",
                "pistol_ammo"
            }
        },
        pedWeapons = {
            "weapon_knife",
            "weapon_pistol",
        },
        pedAfraid = false, -- is the ped afraid of weapons
        scratchVehicles = {},
        finishDistance = 300,
        MinCops = 2,
        MinCopsVin = 2,
        damageDetection = {
            enabled = true, -- Is the damage detection enabled
            threshold = 0.01, -- The threshold to detect damage, 0-1. 0.1 means that a damage event of 10% of the total vehicle health will trigger the reduction. Try using low values like 0.01, or lower.
            reduction = 0.05, -- The reduction of the reward, 0-1. 0.05 means that 5% of the reward will be reduced each time the threshold is met
        }
    },
    ["A"] = {
        title = "Pro Booster",
        xpRequired = 100,
        xpReward = {3, 5},
        hasTracker = true,
        trackerCount = 2, -- if tracker is enabled, how many hacks are required?
        hackDelay = 15, -- delay/cooldown between hacks
        probability = 0.1,
        canScratch = false,
        scratchChance = 0,
        hack = {"alphanumeric", "greek"},
        cost = {4, 8},
        payment = {10, 20},
        rewardItems = {
            enabled = false, -- Is the item reward enabled
            chance = 25, -- The chance to reward an item, 0-100
            itemsRandom = false, -- If true, will reward a random item from the list, if false, will reward all items
            items = {
                "weapon_pistol",
                "pistol_ammo"
            }
        },
        pedWeapons = {
            "weapon_pistol",
            "weapon_combatpistol"
        },
        pedAfraid = false, -- is the ped afraid of weapons
        scratchVehicles = {},
        finishDistance = 300,
        MinCops = 2,
        MinCopsVin = 2,
        damageDetection = {
            enabled = true, -- Is the damage detection enabled
            threshold = 0.01, -- The threshold to detect damage, 0-1. 0.1 means that a damage event of 10% of the total vehicle health will trigger the reduction. Try using low values like 0.01, or lower.
            reduction = 0.05, -- The reduction of the reward, 0-1. 0.05 means that 5% of the reward will be reduced each time the threshold is met
        }
    },
    ["S"] = {
        title = "Perfect Booster",
        xpRequired = 150,
        xpReward = {4, 7},
        hasTracker = true,
        trackerCount = 3, -- if tracker is enabled, how many hacks are required?
        hackDelay = 15, -- delay/cooldown between hacks
        probability = 0.025,
        canScratch = true,
        scratchChance = 25,
        hack = {"braille", "runes"},
        cost = {10, 15},
        payment = {20, 50},
        rewardItems = {
            enabled = false, -- Is the item reward enabled
            chance = 25, -- The chance to reward an item, 0-100
            itemsRandom = false, -- If true, will reward a random item from the list, if false, will reward all items
            items = {
                "weapon_pistol",
                "pistol_ammo"
            }
        },
        pedWeapons = {
            "weapon_machinepistol",
            "weapon_combatpistol"
        },
        pedAfraid = false, -- is the ped afraid of weapons
        scratchVehicles = {
            {   -- Change to your likings and add as many as you like
                name = "Adder",
                model = "adder",
                cost = {100, 200},
            },
            {
                name = "Sultan",
                model = "sultan",
                cost = {75, 175},
            },
            {
                name = "Elegy",
                model = "elegy",
                cost = {150, 300},
            },
        },
        finishDistance = 300,
        MinCops = 2,
        MinCopsVin = 2,
        damageDetection = {
            enabled = true, -- Is the damage detection enabled
            threshold = 0.01, -- The threshold to detect damage, 0-1. 0.1 means that a damage event of 10% of the total vehicle health will trigger the reduction. Try using low values like 0.01, or lower.
            reduction = 0.05, -- The reduction of the reward, 0-1. 0.05 means that 5% of the reward will be reduced each time the threshold is met
        }
    }
}

Config.SpawnLocations = {
    {   -- D, C
        spawnCoords = vector4(459.56695, -633.5574, 27.896368, 213.99015),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(452.90588, -625.0888, 28.545799, 254.82211),
                model = "a_m_y_vindouche_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(450.95339, -635.492, 28.518392, 310.00445),
                model = "a_m_y_stbla_02",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- D, C
        spawnCoords = vector4(-790.0446, -810.1955, 20.014596, 180.62977),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-778.2656, -803.8992, 21.103788, 113.5911),
                model = "a_m_y_musclbeac_02",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(-795.9995, -804.9652, 20.60897, 213.98237),
                model = "a_m_y_gencaspat_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- D, C
        spawnCoords = vector4(-633.9234, -1162.377, 9.029108, 35.780776),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-632.8422, -1149.715, 9.689886, 168.18383),
                model = "a_m_y_cyclist_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(-635.4655, -1173.671, 11.608807, 1.1080266),
                model = "a_m_y_downtown_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- D, C
        spawnCoords = vector4(-1448.083, -675.6621, 25.860668, 212.07051),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-1456.787, -675.8779, 26.531295, 294.82873),
                model = "a_m_y_beach_03",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(-1454.221, -681.6689, 26.531309, 282.24041),
                model = "a_m_o_ktown_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- D, C
        spawnCoords = vector4(1181.4311, -1571.487, 38.794292, 179.19725),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(1169.508, -1576.637, 39.399879, 263.40869),
                model = "a_m_m_skidrow_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(1185.5118, -1554.14, 39.401138, 175.11791),
                model = "a_m_m_soucent_02",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- D, C
        spawnCoords = vector4(981.86462, -2549.734, 27.69477, 354.52572),
        tiers = {"D", "C"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(996.50708, -2554, 28.470357, 57.296344),
                model = "a_m_m_skidrow_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(967.42102, -2549.7, 28.301992, 324.73037),
                model = "a_m_m_prolhost_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },

    {   -- B, A
        spawnCoords = vector4(218.53825, 175.47595, 104.70711, 250.12826),
        tiers = {"B", "A"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(225.90077, 165.46862, 105.31408, 14.663114),
                model = "a_m_m_fatlatin_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(208.64195, 165.65103, 105.53926, 341.17279),
                model = "a_m_m_afriamer_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- B, A
        spawnCoords = vector4(-1136.106, -1165.26, 2.0881848, 302.06933),
        tiers = {"B", "A"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-1137.734, -1157.415, 2.7016191, 119.64952),
                model = "a_m_m_stlat_02",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(-1134.244, -1173.922, 2.3837893, 99.32862),
                model = "a_m_m_tennis_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },
    {   -- B, A
        spawnCoords = vector4(52.444461, 562.03723, 179.69444, 334.84341),
        tiers = {"B", "A"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(41.745147, 564.16394, 179.69482, 244.49356),
                model = "a_f_y_juggalo_01",
                weapon = "random",
                armor = {0, 0}
            },
            {
                spawnCoords = vector4(64.067779, 566.74475, 181.0057, 92.929885),
                model = "a_f_m_fatcult_01",
                weapon = "random",
                armor = {0, 0}
            }
        }
    },

    {   -- S
        spawnCoords = vector4(-136.4699, 902.24121, 235.08946, 269.29318),
        tiers = {"S"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-137.5409, 892.02868, 235.22021, 330.66735),
                model = "a_m_y_hasjew_01",
                weapon = "random",
                armor = {5, 15}
            },
            {
                spawnCoords = vector4(-146.6646, 908.9909, 235.65605, 227.92002),
                model = "a_m_y_smartcaspat_01",
                weapon = "random",
                armor = {5, 15}
            }
        }
    },
    {   -- S
        spawnCoords = vector4(-738.6146, -262.9404, 36.341274, 31.847288),
        tiers = {"S"},
        spawnPeds = true,
        active = false,
        pedActive = false,
        peds = {
            {
                spawnCoords = vector4(-739.9508, -279.0353, 36.94905, 328.22305),
                model = "a_m_m_skidrow_01",
                weapon = "random",
                armor = {5, 15}
            },
            {
                spawnCoords = vector4(-724.5899, -281.476, 36.96482, 75.081497),
                model = "a_m_m_tennis_01",
                weapon = "random",
                armor = {5, 15}
            }
        }
    },
}

-- Locations where you turn in the boosted vehicles
Config.ReturnLocations = {
    {
        coords = vector3(-2322.58, 293.92584, 169.46688),
        active = false
    },
    {
        coords = vector3(-69.56758, 1878.4442, 197.0186),
        active = false
    },
    {
        coords = vector3(499.87994, -2162.445, 5.9182729),
        active = false
    },
    {
        coords = vector3(-1545.66, 886.86, 181.35),
        active = false
    },
    {
        coords = vector3(-401.23, 1195.61, 325.64),
        active = false
    },
    {
        coords = vector3(-68.15, 897.78, 235.56),
        active = false
    },
    {
        coords = vector3(684.96, 605.29, 128.91),
        active = false
    },
    {
        coords = vector3(199.74, 1225.01, 225.46),
        active = false
    },
    {
        coords = vector3(571.04, -3035.76, 6.07),
        active = false
    },
    {
        coords = vector3(135.84, -3340.27, 6.02),
        active = false
    },
    {
        coords = vector3(-585.37, -2349.37, 13.83),
        active = false
    },
    {
        coords = vector3(-454.3, -1711.32, 18.64),
        active = false
    },
    {
        coords = vector3(-966.71, -2069.37, 9.41),
        active = false
    },
    {
        coords = vector3(-1176.46, -1744.09, 4.02),
        active = false
    },
    {
        coords = vector3(-1155.36, -1179.7, 5.62),
        active = false
    },
    {
        coords = vector3(-1666.75, -887.36, 8.65),
        active = false
    },
    {
        coords = vector3(-2048.95, -467.67, 11.71),
        active = false
    },
    {
        coords = vector3(-1035.13, -491.27, 36.7),
        active = false
    },
    {
        coords = vector3(-222.95, -271.88, 49.0),
        active = false
    },
    {
        coords = vector3(-588.9, 195.52, 71.43),
        active = false
    },
    {
        coords = vector3(-802.87, 374.23, 87.88),
        active = false
    },
    {
        coords = vector3(441.6, 245.38, 103.21),
        active = false
    },
    {
        coords = vector3(1150.7, -492.47, 65.45),
        active = false
    },
    {
        coords = vector3(458.48, -920.63, 35.97),
        active = false
    },
    {
        coords = vector3(946.28, -1229.14, 25.67),
        active = false
    },
    {
        coords = vector3(1113.56, 258.52, 80.86),
        active = false
    },
    {
        coords = vector3(1521.32, 775.22, 77.43),
        active = false
    },
    {
        coords = vector3(1873.43, 2620.4, 45.67),
        active = false
    },
    {
        coords = vector3(1731.26, 3309.09, 41.22),
        active = false
    },
    {
        coords = vector3(388.36, 3589.27, 33.29),
        active = false
    },
    {
        coords = vector3(714.34, 4175.04, 40.71),
        active = false
    },
    {
        coords = vector3(1325.06, 4330.82, 38.03),
        active = false
    },
    {
        coords = vector3(1690.96, 4780.85, 41.92),
        active = false
    },
    {
        coords = vector3(2439.33, 4992.96, 46.05),
        active = false
    },
    {
        coords = vector3(3806.2, 4455.95, 4.35),
        active = false
    },
    {
        coords = vector3(3327.99, 5151.64, 18.3),
        active = false
    },
    {
        coords = vector3(2203.69, 5579.32, 53.83),
        active = false
    },
    {
        coords = vector3(-576.24, 5330.65, 70.25),
        active = false
    },
    {
        coords = vector3(-2220.75, 4234.1, 47.14),
        active = false
    },
    {
        coords = vector3(-2213.88, 3482.16, 30.17),
        active = false
    },
    {
        coords = vector3(2877.47, 4486.11, 48.47),
        active = false
    },
    {
        coords = vector3(1728.47, 6404.94, 34.46),
        active = false
    },
    {
        coords = vector3(142.39, 6605.67, 31.84),
        active = false
    },
    {
        coords = vector3(-125.1, 6479.25, 31.47),
        active = false
    },
    {
        coords = vector3(140.33, 6346.45, 31.31),
        active = false
    },
    {
        coords = vector3(-278.01, 6026.85, 31.54),
        active = false
    },
    {
        coords = vector3(-762.32, 5525.72, 33.48),
        active = false
    },
    {
        coords = vector3(-223.07, 6433.75, 31.2),
        active = false
    },
    {
        coords = vector3(-1157.29, 2673.55, 18.09),
        active = false
    },
    {
        coords = vector3(-1921.66, 2037.73, 140.74),
        active = false
    },
}

-- Locations where you scratch the VIN
Config.ScratchLocations = {
    {
        coords = vector3(-861.1444, -1087.24, 2.1628782),
        active = false
    },
    {
        coords = vector3(996.84234, -2411.261, 30.509004),
        active = false
    },
    {
        coords = vector3(-792.741, -174.1163, 37.284214),
        active = false
    },
}

Config.FirstNames = {
    "Eli",
    "Raymond",
    "Graham",
    "Finn",
    "Benjamin",
    "Pierre",
    "Conrad",
    "Leo",
    "Cooper",
    "Tate",
    "Marco",
    "Andrew",
    "Jonathan",
    "Karter",
    "Javier",
}

Config.LastNames = {
    "Welch",
    "Wilkins",
    "Cuevas",
    "Padilla",
    "Fuentes",
    "Ferrell",
    "Obrien",
    "Valenzuela",
    "Jenkins",
    "Mahoney",
    "Moran",
    "Nielsen",
}