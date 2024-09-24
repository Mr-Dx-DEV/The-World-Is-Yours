Config = {}

Config.DebugPoly = false -- Show target polys (true or false)

Config.CoffeItem = "coffee"

Config.ReviveClientEvent = 'wasabi_ambulance:revive'

Config.Locale = "en"

--Mr desk
Config.MrCoord = vector4(-447.2, -291.19, 34.81, 111.64)
--Xray desk
Config.Xray = vector4(-441.027, -303.276, 34.78, 49.85)

Config.TargetInfos = {
    ["EMSWertAmbulanceDuty"] = {     -------------------
        Coord = vector3(-447.8, -319.39, 34.91),
        Heading = 25,
        Lenght = 1.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertArmoryStash"] = {     -------------------
        Coord = vector3(-451.87, -325.45, 34.91),
        Heading = 350,
        Lenght = 2.2,
        Width = 2.6,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertBossMenu"] = {     -------------------
        --Don't tuch event value
        Coord = vector3(-447.14, -321.26, 34.91),
        Heading = 20,
        Lenght = 1.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "qb-bossmenu:client:OpenMenu",
        Icon = "fas fa-clipboard",
        Label = "Boss Menu",
        Distance = 1.5
    },
    ["EMSWertMrComputer"] = {                   -------------------
        --Don't tuch event value
        Coord = vector3(-443.91, -295.73, 34.91),
        Heading = 290,
        Lenght = 2.0,
        Width = 1.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "wert-ambulancejob:mr-panel",
        Icon = "fas fa-desktop",
        Label = "MRI Computer",
        Distance = 1.0
    },
    ["EMSWertMrDesk"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-447.17, -290.58, 34.91),
        Heading = 25,
        Lenght = 3.8,
        Width = 3.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    ["EMSWertXrayComputer"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-441.92, -299.61, 34.91),
        Heading = 290,
        Lenght = 2,
        Width = 1,
        Minz = 33.91,
        Maxz = 37.91,
        Event = "wert-ambulancejob:xray-panel",
        Icon = "fas fa-desktop",
        Label = "XRAY Computer",
        Distance = 1.0
    },
    ["EMSWertXrayDesk"] = {            -------------------
        --Don't tuch event value
        Coord = vector3(-440.39, -303.26, 34.91),
        heading = 30,
        Lenght = 2.0,
        Width = 4.0,
        Minz = 33.91,
        Maxz = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },
    --
    ["EMSWertAmbulanceComputer"] = {          -------------------
        Coord = vector3(-454.44, -319.09, 34.91),
        Heading = 25,
        Lenght = 2,
        Width = 2,
        minZ = 33.91,
        maxZ = 37.91,
        Event = nil,
        Icon = nil,
        Label = nil,
        Distance = 1.5
    },

    ["EMSBloodCard"] = {          -------------------
        --Don't tuch event value
        Coord = vector3(-445.81, -324.56, 34.91),
        Heading = 0,
        Lenght = 2.0,
        Width = 1.0,
        minZ = 33.91,
        maxZ = 37.91,
        Event = 'wert-ambulancejob:take-blood-card',
        Icon = "fa-solid fa-address-card",
        Label = 'Buy blood card',
        Distance = 1.5
    },
}

-- Armory items
Config.Items = {
    label = "Ambulance Armory",
    slots = 8,
    items = {
        [1] = {
            name = "radio",
            price = 250,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "bandage",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_flashlight",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_fireextinguisher",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "painkillers",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "emptytube",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "emptysyringe",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "emptybaggy",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "medbag",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "medikit",
            price = 10,
            amount = 10,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "advancedlockpick",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "diving_gear",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "oxy",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "morphine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "syringe",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "nikon",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "harness",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "advancedrepairkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "repairkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "cleaningkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "binoculars",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 21,
        },
        [22] = {
            name = "armor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 22,
        },
        [23] = {
            name = "parachute",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 23,
        },
        [24] = {
            name = "defib",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 24,
        },
        [25] = {
            name = "accesstool",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 25,
        },
        [26] = {
            name = "tylenol",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 26,
        },
        [27] = {
            name = "peptobismol",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 27,
        },
        [28] = {
            name = "loperamide",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 28,
        },
        [29] = {
            name = "aspirin",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 29,
        },
        [30] = {
            name = "ibuprofen",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 30,
        },
        [31] = {
            name = "dramamine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 31,
        },
        [32] = {
            name = "covidvaccine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 32,
        },
        [33] = {
            name = "doxycycline",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 33,
        },
        [34] = {
            name = "azithromycin",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 34,
        },
        [35] = {
            name = "acyclovir",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 35,
        },
        [36] = {
            name = "sedative",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 36,
        },
        [37] = {
            name = "tweezers",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 37,
        },
        [38] = {
            name = "suturekit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 38,
        },
        [39] = {
            name = "icepack",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 39,
        },
        [40] = {
            name = "burncream",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 40,
        },
        [41] = {
            name = "liquidheroin",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 41,
        },
        [42] = {
            name = "ketamine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 42,
        },
    }
}

-- Elevator coords
Config.ElevatorInfos = {
    [-1] = {
        Coord = vector3(339.88, -586.28, 28.8),
        Heading = 340,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 29.0,
        Maxz = 29.3,
        Distance = 1.5,
        Tpcoord = vector4(339.82, -584.66, 28.8, 75.64),
    },
    [1] = {
        Coord = vector3(325.57, -603.57, 43.28),
        Heading = 70,
        Lenght = 0.2,
        Width = 0.4,
        Minz = 43.5,
        Maxz = 43.8,
        Distance = 1.5,
        Tpcoord = vector4(327.29, -603.33, 43.28, 340.34),
    },
    [2] = {
        Coord = vector3(338.13, -583.64, 74.16),
        Heading = 340,
        Lenght = 2.8,
        Width = 0.4,
        Minz = 73.80,
        Maxz = 74.56,
        Distance = 1.5,
        Tpcoord = vector4(339.12, -584.01, 74.16, 251.08),
    },
}

--Garage config

Config.GarageEnabled = false -- If you want don't use garage change false

Config.GarageNpcInfos = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = {
            coord = vector4(340.53, -582.82, 28.8, 72.09),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "car",
        },
        ["helicopter"] = {
            coord = vector4(337.74, -586.7, 74.16, 249.22),
            hash = GetHashKey("s_m_y_valet_01"),
            type = "helicopter",
        },
    },
}

Config.GarageSpawnCoords = {
    --Pillbox
    ["pillbox"] = {
        ["car"] = vector4(332.05, -578.33, 28.8, 340.2),
        ["helicopter"] = vector4(352.6, -588.51, 74.16, 69.65)
    },
}

Config.EmsVehicles = {
    ["car"] = {
        "ambulance",
        "lguard",
    },
    ["helicopter"] = {
        "polmav"
    },
}

-- Npc doctor

Config.NpcDoctors = {
    {coord = vector4(312.77, -594.62, 43.28, 345.11), name = "Dr. Eric Forman"}, -- Gabz
}

Config.ReviveTime = 50000
Config.RestTime = 30000

Config.NpcDoctorCost = 1000
Config.NpcDoctorMoney = "bank" -- or "bank"

Config.UseCheckOnlineDoc = true

Config.Beds = {
    ["Dr. Eric Forman"] = {
        ["dead"] = {vector4(-1862.91, -334.58, 49.44, 326.14), vector4(-1865.74, -332.19, 49.44, 317.79)},
        ["rest"] = {vector4(-1868.61, -330.21, 49.44, 316.49), vector4(-1872.08, -327.19, 49.44, 319.81), vector4(-1878.58, -322.15, 49.44, 317.24), vector4(-1875.07, -317.92, 49.44, 151.89), vector4(-1871.84, -320.47, 49.44, 140.84), vector4(-1868.94, -323.25, 49.44, 142.59), vector4(-1861.59, -326.36, 50.0, 207.67)}
    },
}