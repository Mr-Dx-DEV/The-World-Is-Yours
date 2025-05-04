Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qb-core', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" or "qs" or "qb" or "codem" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "ps", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "qb", -- "ox" or "qb" or "esx"
    Progressbar = "qb", -- "ox" or "qb"

    Target = 'qb-target', -- Target name, leave it as qb-target if you are using ox_target
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = false, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = {
        Global = true, -- Global cooldown (Set to false to have individual cooldowns on stores, true to have cooldowns on all stores when one is robbed)
        Timer = 180, -- (Minutes) timer duration
    },

    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github

    PoliceJobs = {
        ["lspd"] = true,
        ["bcso"] = true,
        ["sahp"] = true,
        ["lsso"] = true,
        ["safw"] = true,
        ["sadoc"] = true,
        ["usms"] = true,
        ["fbi"] = true,
        ["dhs"] = true,
        ["ss"] = true,
        ["police"] = true,
        ["salsa"] = true
    },
     -- Jobs that can receive the dispatch
    MinimumPolice = 0, -- Minimum police required to start the robbery

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = false, -- Enable/Disable Bonus items
        BonusChance = 15, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "fleecacard", Chance = 30, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "fleecacard", Chance = 50, Amount = {min = 1, max = 1}},
            {Name = "fleecacard", Chance = 20, Amount = {min = 1, max = 1}},
        },
    },
    
    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },
    
    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 1, max = 3}, -- Amount of stress applied
    },

    ComputerPassword = { -- Password for the computer
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Safe Code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Password', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = { -- true = target, false = drawtext
        ["Button"] = 38, -- [E] by default

        ["Fusebox"] = true,
        ["Register"] = true,
        ["Atm"] = true,
        ["Server"] = true,
        ["Npc"] = true,
        ["Computer"] = true,
        ["Safe"] = true,
        ["Shelf"] = true,
    },

    -- Durations 
    NotificationDuration = 2500, -- Duration of the displayed notifications

    FuseboxDuration = 6000,
    RegisterDuration = 15000,
    ServerDuration = 6000,
    Computer1Duration = 6000,
    Computer2Duration = 6000,
    DoorDuration = 6000,
    AtmDuration = 6000,
    ShelfDuration = 2500,
    SafeDuration = 6000,
}

-- Add stores here if you have more than the default ones
Config.Stores247 = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains"} -- 24/7 Stores
Config.GasStations = {"Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed"} -- Gas Stations
Config.LiquorStores = {"VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- Liquor Stores
Config.AllStores = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains", "Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed", "VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- All Stores

Config.Register247 = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 3000, max = 6000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.RegisterLtdGasoline = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1500, max = 3000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.RegisterLiquor = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 500, max = 1500}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Atm247 = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1250, max = 2500}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.AtmLtdGasoline = {
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1000, max = 2000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeLiquor = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 3000, max = 4500}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeLtdGasoline = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 4500, max = 6000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Safe247 = { -- Reward from the safe if the data isnt corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 10000, max = 15000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.SafeCorrupt247 = { -- Reward from the safe if the data got corrupted
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 6000, max = 10000}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.MaxItems = 5 -- Max items that can be taken from the shelves
Config.RewardShelf = {
    {Name = "water_bottle", Chance = 20, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
    {Name = "vodka", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "beer", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "kurkakola", Chance = 20, Amount = {min = 1, max = 1}},
    {Name = "sandwich", Chance = 20, Amount = {min = 1, max = 1}},
}

Config.Items ={
    ["Circuit"] = "x_circuittester",
    ["Lockpick"] = "advancedlockpick",
    ["Harddrive"] = "x_harddrive", -- Item that is required before the robbery
    ["Device"] = "x_device",
    ["Key"] = "storekey",
}

Config.ItemsBreak ={
    ["Circuit"] = 0, -- % Break Chance
    ["Lockpick"] = 0, -- % Break Chance
    ["Device"] = 0, -- % Break Chance
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is on
    ["AlarmSoundVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmSoundDistance"] = 35.0, -- The distance that the sound reaches
    ["AlarmRepeat"] = 30, -- At 30 and Wait at 10000, the alarm will blare every 10 seconds for a total of 5 minutes
    ["AlarmWait"] = 10000, -- Waits between each alarm blare
}

Config.Stores = {
    ["Strawberry"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(28.36, -1349.44, 31.77),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(24.74, -1339.25, 28.5, 90.92),
        ["NpcCoords"] = vector4(31.26, -1339.97, 28.5, 88.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 271.84,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(19.3, -1335.64, 29.28), -- Circle Zone Coords
                drawtext = vector3(19.13, -1335.71, 29.28),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(24.98, -1347.29, 29.61), -- Circle Zone Coords
                drawtext = vector3(24.52, -1347.29, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(24.95, -1344.95, 29.61), -- Circle Zone Coords
                drawtext = vector3(24.5, -1344.99, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(33.17, -1348.75, 29.69), -- Circle Zone Coords
                drawtext = vector3(33.24, -1348.16, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(24.74, -1339.25, 29.5), -- Circle Zone Coords
                drawtext = vector3(25.11, -1339.29, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(31.26, -1339.97, 29.5), -- Circle Zone Coords
                drawtext = vector3(30.92, -1339.97, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(29.44, -1338.78, 29.39), -- Circle Zone Coords
                drawtext = vector3(28.86, -1339.39, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(29.44, -1338.78, 29.39), -- Circle Zone Coords
                drawtext = vector3(28.86, -1339.39, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(28.2, -1338.65, 29.02), -- Circle Zone Coords
                drawtext = vector3(28.19, -1339.36, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(30.87, -1342.5, 29.39),
                drawtext = vector3(30.84, -1343.13, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(32.38, -1342.6, 29.49),
                drawtext = vector3(32.34, -1343.04, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(33.97, -1342.7, 29.48),
                drawtext = vector3(33.94, -1343.01, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(28.2, -1345.14, 29.6),
                drawtext = vector3(27.46, -1345.23, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(31.26, -1345.17, 29.55),
                drawtext = vector3(30.33, -1345.25, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.03, -1345.18, 29.64),
                drawtext = vector3(33.71, -1345.05, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.12, -1346.7, 29.62),
                drawtext = vector3(33.7, -1346.63, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.04, -1348.26, 29.64),
                drawtext = vector3(33.79, -1348.21, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(19.28, -1349.54, 28.48), vector3(39.94, -1349.71, 28.48), vector3(39.7, -1336.96, 28.48), vector3(19.31, -1336.38, 28.48)},
    },

    ["DowntownVineWood"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(376.54, 323.09, 105.62),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(374.7, 334.2, 102.57, 72.94),
        ["NpcCoords"] = vector4(380.79, 331.9, 102.57, 74.74),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 256.76,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(371.02, 334.09, 103.43), -- Circle Zone Coords
                drawtext = vector3(370.4, 334.04, 103.44),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.06, 326.32, 103.68), -- Circle Zone Coords
                drawtext = vector3(372.51, 326.39, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.6, 328.59, 103.68), -- Circle Zone Coords
                drawtext = vector3(373.16, 328.69, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(380.63, 322.94, 103.69), -- Circle Zone Coords
                drawtext = vector3(380.76, 323.49, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(374.7, 334.2, 103.57), -- Circle Zone Coords
                drawtext = vector3(375.02, 334.15, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(380.79, 331.9, 103.57), -- Circle Zone Coords
                drawtext = vector3(380.41, 332.03, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(379.37, 333.42, 103.55), -- Circle Zone Coords
                drawtext = vector3(378.74, 333.07, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(379.37, 333.42, 103.55), -- Circle Zone Coords
                drawtext = vector3(378.74, 333.07, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(378.24, 333.84, 103.26), -- Circle Zone Coords
                drawtext = vector3(378.09, 333.23, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.91, 329.47, 103.59),
                drawtext = vector3(379.76, 329.1, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(381.37, 329.0, 103.59),
                drawtext = vector3(381.28, 328.66, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.86, 328.56, 103.57),
                drawtext = vector3(382.75, 328.27, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(376.77, 327.52, 103.72),
                drawtext = vector3(375.98, 327.77, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.62, 326.81, 103.61),
                drawtext = vector3(378.74, 326.95, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.36, 326.16, 103.52),
                drawtext = vector3(382.03, 326.2, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.36, 326.16, 103.52),
                drawtext = vector3(381.67, 324.74, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(381.69, 323.14, 103.6),
                drawtext = vector3(381.27, 323.24, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(384.37, 320.79, 103.24), vector3(386.26, 332.61, 103.24), vector3(371.79, 336.54, 103.24), vector3(368.82, 325.04, 103.24)},
    },

    ["BanhamCanyon"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3038.12, 589.82, 9.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3046.82, 582.27, 6.91, 193.6),
        ["NpcCoords"] = vector4(-3047.87, 588.8, 6.91, 199.29),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 17.02,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3049.5, 589.39, 8.13), -- Circle Zone Coords
                drawtext = vector3(-3049.58, 589.62, 7.76),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3039.15, 585.01, 8.02), -- Circle Zone Coords
                drawtext = vector3(-3039.0, 584.57, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3041.36, 584.27, 8.02), -- Circle Zone Coords
                drawtext = vector3(-3041.19, 583.84, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3040.49, 593.18, 8.15), -- Circle Zone Coords
                drawtext = vector3(-3040.77, 593.08, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3046.82, 582.27, 7.91), -- Circle Zone Coords
                drawtext = vector3(-3046.86, 582.61, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3047.87, 588.8, 7.91), -- Circle Zone Coords
                drawtext = vector3(-3047.75, 588.47, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3048.54, 586.67, 7.83), -- Circle Zone Coords
                drawtext = vector3(-3047.88, 586.28, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3048.54, 586.67, 7.83), -- Circle Zone Coords
                drawtext = vector3(-3047.88, 586.28, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3048.27, 585.58, 7.49), -- Circle Zone Coords
                drawtext = vector3(-3047.77, 585.52, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.38, 589.18, 8.01),
                drawtext = vector3(-3044.89, 589.4, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.93, 590.63, 8.02),
                drawtext = vector3(-3045.45, 590.75, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3046.34, 592.13, 8.03),
                drawtext = vector3(-3045.92, 592.23, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.24, 587.72, 7.99),
                drawtext = vector3(-3042.02, 586.8, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.96, 590.2, 7.9),
                drawtext = vector3(-3042.73, 589.48, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3043.9, 593.03, 7.97),
                drawtext = vector3(-3043.86, 592.67, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.5, 593.59, 7.97),
                drawtext = vector3(-3042.43, 593.15, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3041.0, 594.04, 7.97),
                drawtext = vector3(-3040.88, 593.62, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3040.03, 595.4, 7.7), vector3(-3051.89, 591.11, 7.7), vector3(-3047.47, 580.43, 7.7), vector3(-3036.24, 583.87, 7.7)},
    },

    ["Chumash"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3239.72, 1004.37, 14.89),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3250.3, 1000.94, 11.83, 174.48),
        ["NpcCoords"] = vector4(-3248.94, 1007.3, 11.83, 175.32),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.06,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3241.9, 1012.61, 12.58), -- Circle Zone Coords
                drawtext = vector3(-3241.88, 1012.94, 12.39),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3242.25, 1000.49, 12.94), -- Circle Zone Coords
                drawtext = vector3(-3242.3, 999.99, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3244.57, 1000.66, 12.95), -- Circle Zone Coords
                drawtext = vector3(-3244.55, 1000.21, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3240.25, 1008.57, 12.89), -- Circle Zone Coords
                drawtext = vector3(-3240.57, 1008.59, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3250.3, 1000.94, 12.83), -- Circle Zone Coords
                drawtext = vector3(-3250.3, 1001.46, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3248.94, 1007.3, 12.83), -- Circle Zone Coords
                drawtext = vector3(-3249.0, 1006.82, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3250.34, 1005.73, 12.79), -- Circle Zone Coords
                drawtext = vector3(-3249.85, 1005.04, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3250.34, 1005.73, 12.79), -- Circle Zone Coords
                drawtext = vector3(-3249.85, 1005.04, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3250.3, 1004.4, 12.45), -- Circle Zone Coords
                drawtext = vector3(-3249.86, 1004.34, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3246.39, 1006.75, 12.85),
                drawtext = vector3(-3246.01, 1006.76, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3246.15, 1008.3, 12.84),
                drawtext = vector3(-3245.95, 1008.2, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3246.1, 1009.8, 12.86),
                drawtext = vector3(-3245.72, 1009.76, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3244.02, 1003.79, 12.95),
                drawtext = vector3(-3244.1, 1003.14, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.71, 1006.78, 12.97),
                drawtext = vector3(-3243.93, 1006.01, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.56, 1009.84, 12.92),
                drawtext = vector3(-3243.65, 1009.45, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3242.02, 1009.65, 12.93),
                drawtext = vector3(-3242.05, 1009.21, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3240.49, 1009.44, 12.96),
                drawtext = vector3(-3240.53, 1009.1, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3239.4, 1010.18, 12.26), vector3(-3252.61, 1010.8, 12.26), vector3(-3253.63, 998.03, 12.26), vector3(-3240.44, 996.85, 12.26)},
    },

    ["MountChiliad"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1731.18, 6411.3, 37.07),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1731.66, 6422.33, 34.04, 62.31),
        ["NpcCoords"] = vector4(1737.2, 6418.74, 34.04, 60.06),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 245.41,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1723.33, 6413.2, 35.40), -- Circle Zone Coords
                drawtext = vector3(1723.21, 6413.03, 35.01),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1728.32, 6415.02, 35.15), -- Circle Zone Coords
                drawtext = vector3(1727.87, 6415.21, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1729.33, 6417.12, 35.15), -- Circle Zone Coords
                drawtext = vector3(1728.78, 6417.32, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1735.13, 6410.31, 35.35), -- Circle Zone Coords
                drawtext = vector3(1735.23, 6410.51, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1731.66, 6422.33, 35.04), -- Circle Zone Coords
                drawtext = vector3(1732.0, 6422.13, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1737.2, 6418.74, 35.04), -- Circle Zone Coords
                drawtext = vector3(1736.8, 6418.94, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1736.13, 6420.63, 34.99), -- Circle Zone Coords
                drawtext = vector3(1735.31, 6420.41, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1736.13, 6420.63, 34.99), -- Circle Zone Coords
                drawtext = vector3(1735.31, 6420.41, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1734.96, 6421.17, 34.66), -- Circle Zone Coords
                drawtext = vector3(1734.72, 6420.68, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1735.68, 6416.6, 35.07),
                drawtext = vector3(1735.57, 6416.28, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1737.14, 6416.07, 35.08),
                drawtext = vector3(1736.83, 6415.55, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1738.4, 6415.14, 35.05),
                drawtext = vector3(1738.22, 6414.95, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1732.2, 6415.42, 35.06),
                drawtext = vector3(1731.48, 6415.8, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1734.75, 6414.1, 35.03),
                drawtext = vector3(1734.02, 6414.43, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1737.47, 6412.84, 34.98),
                drawtext = vector3(1737.08, 6413.03, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1736.82, 6411.45, 34.98),
                drawtext = vector3(1736.4, 6411.65, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1736.12, 6410.05, 34.99),
                drawtext = vector3(1735.68, 6410.2, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1739.45, 6406.82, 34.92), vector3(1744.68, 6417.64, 34.92), vector3(1727.6, 6426.13, 34.92), vector3(1721.94, 6414.05, 34.92)},
    },

    ["SandyShores"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1965.52, 3740.08, 33.91),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1956.3, 3747.1, 31.34, 122.86),
        ["NpcCoords"] = vector4(1962.19, 3749.65, 31.34, 121.65),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 296.92,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1954.78, 3753.9, 32.62), -- Circle Zone Coords
                drawtext = vector3(1954.6, 3754.23, 32.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1960.52, 3740.29, 32.46), -- Circle Zone Coords
                drawtext = vector3(1960.01, 3740.0, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1959.32, 3742.29, 32.46), -- Circle Zone Coords
                drawtext = vector3(1958.94, 3742.06, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1968.18, 3743.41, 32.53), -- Circle Zone Coords
                drawtext = vector3(1968.11, 3743.55, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1956.3, 3747.1, 32.34), -- Circle Zone Coords
                drawtext = vector3(1956.57, 3747.27, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1962.19, 3749.65, 32.34), -- Circle Zone Coords
                drawtext = vector3(1961.76, 3749.38, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1960.15, 3749.9, 32.34), -- Circle Zone Coords
                drawtext = vector3(1959.9, 3749.09, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1960.15, 3749.9, 32.34), -- Circle Zone Coords
                drawtext = vector3(1959.9, 3749.09, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1959.12, 3749.22, 31.9), -- Circle Zone Coords
                drawtext = vector3(1959.31, 3748.89, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1963.36, 3747.15, 32.36),
                drawtext = vector3(1958.93, 3745.66, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1964.58, 3748.11, 32.37),
                drawtext = vector3(1960.41, 3746.51, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1966.02, 3748.72, 32.41),
                drawtext = vector3(1961.89, 3747.44, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1962.25, 3743.6, 32.41),
                drawtext = vector3(1962.03, 3743.27, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1964.8, 3745.04, 32.37),
                drawtext = vector3(1964.17, 3744.63, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1967.28, 3746.62, 32.37),
                drawtext = vector3(1966.37, 3747.77, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1968.03, 3745.27, 32.38),
                drawtext = vector3(1967.33, 3746.2, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1968.91, 3743.98, 32.38),
                drawtext = vector3(1968.12, 3744.74, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1970.56, 3743.27, 32.21), vector3(1962.28, 3758.23, 32.21), vector3(1951.64, 3751.9, 32.21), vector3(1959.96, 3737.25, 32.21)},
    },

    ["Harmony"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(544.21, 2672.67, 43.8),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(549.8, 2663.29, 41.16, 278.68),
        ["NpcCoords"] = vector4(543.58, 2663.32, 41.16, 278.2),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 97.8,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(555.08, 2665.51, 42.31), -- Circle Zone Coords
                drawtext = vector3(555.09, 2665.15, 42.2),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.57, 2671.25, 42.27), -- Circle Zone Coords
                drawtext = vector3(549.11, 2671.31, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.9, 2668.94, 42.27), -- Circle Zone Coords
                drawtext = vector3(549.46, 2669.07, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(540.27, 2671.36, 42.41), -- Circle Zone Coords
                drawtext = vector3(540.29, 2671.05, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(549.8, 2663.29, 42.16), -- Circle Zone Coords
                drawtext = vector3(549.38, 2663.24, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(543.58, 2663.32, 42.16), -- Circle Zone Coords
                drawtext = vector3(543.89, 2663.33, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(545.17, 2662.24, 42.12), -- Circle Zone Coords
                drawtext = vector3(545.77, 2662.88, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(545.17, 2662.24, 42.12), -- Circle Zone Coords
                drawtext = vector3(545.77, 2662.88, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(546.46, 2662.49, 41.85), -- Circle Zone Coords
                drawtext = vector3(546.41, 2663.04, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(543.33, 2665.95, 42.22),
                drawtext = vector3(543.31, 2666.4, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(541.83, 2665.52, 42.22),
                drawtext = vector3(541.79, 2666.02, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(540.3, 2665.29, 42.23),
                drawtext = vector3(540.22, 2665.88, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(545.61, 2668.73, 42.3),
                drawtext = vector3(546.38, 2668.85, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(542.94, 2668.46, 42.3),
                drawtext = vector3(543.45, 2668.48, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.73, 2667.96, 42.28),
                drawtext = vector3(540.09, 2667.95, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.63, 2669.52, 42.29),
                drawtext = vector3(539.99, 2669.53, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.31, 2671.03, 42.3),
                drawtext = vector3(539.78, 2671.07, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(550.1, 2673.66, 42.06), vector3(538.05, 2672.27, 42.06), vector3(540.3, 2655.47, 42.06), vector3(552.28, 2656.88, 42.06)},
    },

    ["GrandSenoraDesert"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2682.49, 3281.84, 57.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2671.11, 3283.62, 54.24, 150.17),
        ["NpcCoords"] = vector4(2674.78, 3288.77, 54.24, 150.26),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 329.31,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2676.56, 3293.89, 55.5), -- Circle Zone Coords
                drawtext = vector3(2676.8, 3294.18, 55.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2678.26, 3279.86, 55.35), -- Circle Zone Coords
                drawtext = vector3(2678.04, 3279.46, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2676.21, 3280.97, 55.36), -- Circle Zone Coords
                drawtext = vector3(2676.0, 3280.56, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2683.42, 3286.33, 55.37), -- Circle Zone Coords
                drawtext = vector3(2683.01, 3286.57, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2671.11, 3283.62, 55.24), -- Circle Zone Coords
                drawtext = vector3(2671.37, 3283.98, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2674.78, 3288.77, 55.24), -- Circle Zone Coords
                drawtext = vector3(2674.62, 3288.49, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2673.13, 3287.78, 55.22), -- Circle Zone Coords
                drawtext = vector3(2673.22, 3287.1, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2673.13, 3287.78, 55.22), -- Circle Zone Coords
                drawtext = vector3(2673.22, 3287.1, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2672.49, 3286.72, 54.82), -- Circle Zone Coords
                drawtext = vector3(2672.9, 3286.49, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2677.01, 3287.27, 55.28),
                drawtext = vector3(2674.25, 3283.55, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2677.67, 3288.69, 55.27),
                drawtext = vector3(2675.02, 3284.95, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2678.54, 3289.97, 55.27),
                drawtext = vector3(2675.83, 3286.48, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2678.07, 3283.71, 55.32),
                drawtext = vector3(2678.09, 3283.24, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2679.47, 3286.07, 55.37),
                drawtext = vector3(2679.27, 3285.39, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2680.81, 3288.75, 55.36),
                drawtext = vector3(2679.55, 3289.24, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2682.2, 3288.07, 55.37),
                drawtext = vector3(2681.02, 3288.4, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2683.54, 3287.31, 55.37),
                drawtext = vector3(2682.58, 3287.54, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2685.52, 3288.63, 55.24), vector3(2675.6, 3294.4, 55.24), vector3(2669.48, 3282.91, 55.24), vector3(2679.6, 3277.74, 55.24)},
    },

    ["TataviamMountains"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2559.97, 385.95, 110.27),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2549.14, 381.57, 107.62, 176.28),
        ["NpcCoords"] = vector4(2550.13, 387.67, 107.62, 178.78),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.48,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2546.18, 371.89, 108.61), -- Circle Zone Coords
                drawtext = vector3(2545.79, 371.93, 108.61),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2557.21, 381.32, 108.74), -- Circle Zone Coords
                drawtext = vector3(2557.25, 380.86, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2554.88, 381.39, 108.74), -- Circle Zone Coords
                drawtext = vector3(2554.92, 380.85, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2558.84, 389.48, 108.9), -- Circle Zone Coords
                drawtext = vector3(2558.5, 389.5, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2549.14, 381.57, 108.62), -- Circle Zone Coords
                drawtext = vector3(2549.18, 381.86, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2550.13, 387.67, 108.62), -- Circle Zone Coords
                drawtext = vector3(2550.1, 387.23, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2548.93, 386.26, 108.59), -- Circle Zone Coords
                drawtext = vector3(2549.44, 385.5, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2548.93, 386.26, 108.59), -- Circle Zone Coords
                drawtext = vector3(2549.44, 385.5, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2548.79, 384.85, 108.15), -- Circle Zone Coords
                drawtext = vector3(2549.42, 384.82, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2552.81, 387.37, 108.64),
                drawtext = vector3(2551.82, 382.92, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2552.79, 388.92, 108.64),
                drawtext = vector3(2551.88, 384.53, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2553.02, 390.47, 108.7),
                drawtext = vector3(2551.95, 386.22, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.23, 384.61, 108.78),
                drawtext = vector3(2555.56, 384.2, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.33, 387.61, 108.79),
                drawtext = vector3(2555.7, 386.76, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.46, 390.42, 108.75),
                drawtext = vector3(2554.11, 390.26, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2557.01, 390.45, 108.75),
                drawtext = vector3(2555.77, 390.2, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2558.54, 390.46, 108.76),
                drawtext = vector3(2557.61, 390.12, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2560.0, 391.48, 108.47), vector3(2546.76, 392.14, 108.47), vector3(2546.6, 379.88, 108.47), vector3(2559.6, 379.53, 108.47)},
    },
}

if GetResourceState('cfx-fm-ltd-gasoline') == 'started' then
    Config.Stores["Davis"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-53.8, -1757.23, 30.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-41.69, -1753.44, 28.42, 229.83),
        ["NpcCoords"] = vector4(-41.74, -1750.38, 28.42, 153.23),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 147.52,
        ["RegisterRotation2"] = 87.98,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.63, -1753.3, 29.46), -- Circle Zone Coords
                drawtext = vector3(-47.22, -1752.74, 29.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.51, -1755.71, 29.53), -- Circle Zone Coords
                drawtext = vector3(-46.66, -1755.82, 29.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-48.8, -1749.35, 29.66), -- Circle Zone Coords
                drawtext = vector3(-49.1, -1749.77, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-41.69, -1753.44, 29.42), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1752.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-41.74, -1750.38, 29.82), -- Circle Zone Coords
                drawtext = vector3(-41.99, -1751.24, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-40.14, -1750.74, 29.29), -- Circle Zone Coords
                drawtext = vector3(-40.66, -1751.07, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-40.14, -1750.74, 29.29), -- Circle Zone Coords
                drawtext = vector3(-40.66, -1751.07, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-42.6, -1753.09, 28.88), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1752.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-55.05, -1754.17, 29.42),
                drawtext = vector3(-54.6, -1753.61, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.79, -1752.64, 29.4),
                drawtext = vector3(-56.39, -1752.08, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.76, -1750.44, 29.42),
                drawtext = vector3(-56.34, -1750.89, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-55.5, -1748.85, 29.43),
                drawtext = vector3(-55.15, -1749.17, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.24, -1747.34, 29.43),
                drawtext = vector3(-53.88, -1747.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.16, -1751.91, 29.42),
                drawtext = vector3(-53.08, -1751.74, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.17, -1749.55, 29.44),
                drawtext = vector3(-51.45, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-50.42, -1747.6, 29.39),
                drawtext = vector3(-50.94, -1748.22, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-59.76, -1751.12, 29.25), vector3(-47.34, -1761.67, 29.25), vector3(-38.22, -1750.59, 29.25), vector3(-51.1, -1740.43, 29.25)},
    }

    Config.Stores["LittleSeoul"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-712.17, -909.45, 20.94),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-705.16, -906.89, 18.30, 274.03),
        ["NpcCoords"] = vector4(-706.87, -904.52, 18.22, 185.68),
        ["ChairCoords"] = vector3(-705.41, -905.81, 18.22),
        ["DigitalRegisterCoords"] = vector3(-708.14, -912.39, 19.33),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 187.53,
        ["RegisterRotation2"] = 127.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-709.78, -910.62, 19.26), -- Circle Zone Coords 
                drawtext = vector3(-709.84, -910.14, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-708.14, -912.39, 19.33), -- Circle Zone Coords
                drawtext = vector3(-707.57, -912.1, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-713.26, -907.85, 19.22), -- Circle Zone Coords
                drawtext = vector3(-713.27, -908.51, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-705.16, -906.89, 19.30), -- Circle Zone Coords
                drawtext = vector3(-705.84, -906.52, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-706.87, -904.52, 19.62), -- Circle Zone Coords
                drawtext = vector3(-706.81, -904.97, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-705.71, -903.82, 19.15), -- Circle Zone Coords
                drawtext = vector3(-705.82, -904.45, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-705.71, -903.82, 19.15), -- Circle Zone Coords
                drawtext = vector3(-705.82, -904.45, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-706.09, -907.1, 18.65), -- Circle Zone Coords
                drawtext = vector3(-705.84, -906.52, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-714.83, -916.1, 19.22),
                drawtext = vector3(-714.9, -915.27, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-717.25, -916.23, 19.22),
                drawtext = vector3(-717.28, -915.53, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.75, -914.39, 19.22),
                drawtext = vector3(-718.12, -914.21, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.77, -912.25, 19.22),
                drawtext = vector3(-718.22, -912.19, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.84, -910.16, 19.22),
                drawtext = vector3(-718.18, -910.2, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.86, -913.82, 19.22),
                drawtext = vector3(-715.14, -913.24, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.77, -910.69, 19.22),
                drawtext = vector3(-715.37, -910.05, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.55, -907.89, 19.22),
                drawtext = vector3(-715.52, -908.61, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-720.62, -916.81, 18.99), vector3(-704.17, -916.68, 18.99), vector3(-703.9, -900.17, 18.99), vector3(-720.36, -900.09, 18.99)},
    }

    Config.Stores["RichmanGlen"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1821.94, 787.63, 141.08),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-1823.97, 799.82, 137.09, 311.31),
        ["NpcCoords"] = vector4(-1826.99, 800.48, 137.14, 235.59),
        ["ChairCoords"] = vector3(-1826.18, 801.22, 137.12),
        ["DigitalRegisterCoords"] = vector3(-1822.45, 793.76, 138.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 230.0,
        ["RegisterRotation2"] = 170.46,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1824.85, 793.96, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1825.28, 794.34, 138.18),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1822.45, 793.76, 138.24), -- Circle Zone Coords
                drawtext = vector3(-1822.45, 794.52, 138.13),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-1828.92, 793.32, 138.48), -- Circle Zone Coords
                drawtext = vector3(-1828.68, 793.03, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-1823.97, 799.82, 138.09), -- Circle Zone Coords
                drawtext = vector3(-1824.75, 799.45, 138.11),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1826.99, 800.48, 138.54), -- Circle Zone Coords
                drawtext = vector3(-1826.46, 799.94, 138.14),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-1826.43, 801.6, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1826.22, 801.14, 138.12),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-1826.43, 801.6, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1826.22, 801.14, 138.12),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1824.46, 799.13, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1824.75, 799.45, 138.11),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1825.06, 786.52, 138.2),
                drawtext = vector3(-1825.42, 787.1, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.9, 784.99, 138.19),
                drawtext = vector3(-1827.13, 785.46, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.97, 785.26, 138.22),
                drawtext = vector3(-1828.52, 785.61, 138.32),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1830.29, 786.75, 138.22),
                drawtext = vector3(-1829.91, 787.15, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.57, 788.19, 138.24),
                drawtext = vector3(-1831.18, 788.54, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1827.09, 787.57, 138.21),
                drawtext = vector3(-1827.16, 788.5, 138.27),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1829.19, 789.67, 138.26),
                drawtext = vector3(-1829.24, 790.63, 138.28),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1830.69, 791.78, 138.29),
                drawtext = vector3(-1830.38, 791.45, 138.29),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1828.56, 782.26, 138.84), vector3(-1816.18, 793.53, 138.84), vector3(-1826.2, 803.87, 138.84), vector3(-1838.57, 792.6, 138.84)},
    }

    Config.Stores["MirrorPark"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1159.93, -327.02, 71.67),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1164.50, -315.93, 68.21, 278.87),
        ["NpcCoords"] = vector4(1162.13, -313.65, 68.21, 200.28),
        ["ChairCoords"] = vector3(1163.38, -313.58, 68.21),
        ["DigitalRegisterCoords"] = vector3(1162.5, -321.87, 69.32),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 197.53,
        ["RegisterRotation2"] = 137.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1160.58, -320.41, 69.25), -- Circle Zone Coords
                drawtext = vector3(1160.51, -319.85, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1162.5, -321.87, 69.32), -- Circle Zone Coords
                drawtext = vector3(1162.88, -321.39, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1156.8, -318.77, 69.44), -- Circle Zone Coords
                drawtext = vector3(1156.86, -319.22, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1164.50, -315.93, 69.21), -- Circle Zone Coords
                drawtext = vector3(1163.55, -315.86, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1162.13, -313.65, 69.61), -- Circle Zone Coords
                drawtext = vector3(1162.34, -314.12, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1163.44, -312.95, 68.81), -- Circle Zone Coords
                drawtext = vector3(1163.3, -313.64, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1163.44, -312.95, 68.81), -- Circle Zone Coords
                drawtext = vector3(1163.3, -313.64, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1163.62, -316.29, 68.77), -- Circle Zone Coords
                drawtext = vector3(1163.55, -315.86, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.41, -326.45, 69.09),
                drawtext = vector3(1156.3, -326.07, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.15, -326.91, 68.94),
                drawtext = vector3(1154.03, -326.46, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.55, -325.62, 69.02),
                drawtext = vector3(1152.96, -325.58, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.22, -323.54, 69.05),
                drawtext = vector3(1152.63, -323.38, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1151.76, -321.73, 69.24),
                drawtext = vector3(1152.31, -321.58, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1155.39, -324.46, 69.12),
                drawtext = vector3(1155.77, -323.81, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.66, -321.68, 69.14),
                drawtext = vector3(1155.25, -320.91, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.45, -318.82, 69.16),
                drawtext = vector3(1154.52, -319.53, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1151.04, -328.32, 69.32), vector3(1167.47, -325.5, 69.32), vector3(1164.68, -311.37, 69.32), vector3(1148.37, -314.27, 69.32)},
    }

    Config.Stores["GrapeSeed"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.47, 4929.45, 43.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1703.02, 4918.25, 41.07, 144.80),
        ["NpcCoords"] = vector4(1706.1, 4918.27, 41.07, 68.48),
        ["ChairCoords"] = vector3(1705.47, 4917.37, 41.07),
        ["DigitalRegisterCoords"] = vector3(1700.23, 4923.86, 42.18),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 62.53,
        ["RegisterRotation2"] = 2.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1702.62, 4924.18, 42.1), -- Circle Zone Coords
                drawtext = vector3(1703.03, 4923.78, 42.07),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1700.23, 4923.86, 42.18), -- Circle Zone Coords
                drawtext = vector3(1700.35, 4923.05, 42.07),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1706.45, 4925.69, 42.3), -- Circle Zone Coords
                drawtext = vector3(1706.12, 4926.02, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1703.02, 4918.25, 42.07), -- Circle Zone Coords
                drawtext = vector3(1703.72, 4918.81, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1706.1, 4918.27, 42.47), -- Circle Zone Coords
                drawtext = vector3(1705.62, 4918.51, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1705.87, 4916.86, 41.94), -- Circle Zone Coords
                drawtext = vector3(1705.44, 4917.48, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1705.87, 4916.86, 41.94), -- Circle Zone Coords
                drawtext = vector3(1705.44, 4917.48, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1703.3, 4919.18, 41.61), -- Circle Zone Coords
                drawtext = vector3(1703.72, 4918.81, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1701.25, 4931.45, 42.02),
                drawtext = vector3(1701.76, 4931.1, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1702.6, 4933.41, 41.98),
                drawtext = vector3(1702.95, 4933.09, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1704.72, 4933.61, 42.11),
                drawtext = vector3(1704.42, 4933.17, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1706.34, 4932.45, 42.15),
                drawtext = vector3(1706.06, 4931.95, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1708.02, 4931.37, 42.17),
                drawtext = vector3(1707.68, 4930.83, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1703.54, 4930.83, 42.05),
                drawtext = vector3(1703.68, 4930.04, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.89, 4929.04, 42.08),
                drawtext = vector3(1706.08, 4928.3, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1707.92, 4927.57, 42.04),
                drawtext = vector3(1707.52, 4927.83, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1705.07, 4938.0, 42.18), vector3(1693.64, 4921.75, 42.18), vector3(1706.17, 4912.73, 42.18), vector3(1718.39, 4928.88, 42.18)},
    }
else
    Config.Stores["Davis"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-53.8, -1757.23, 30.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-41.85, -1749.36, 28.42, 319.47),
        ["NpcCoords"] = vector4(-44.64, -1750.84, 28.42, 291.46),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 49.99,
        ["RegisterRotation2"] = 49.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-48.51, -1759.23, 29.54), -- Circle Zone Coords
                drawtext = vector3(-47.93, -1759.37, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.2, -1757.67, 29.41), -- Circle Zone Coords
                drawtext = vector3(-46.79, -1758.01, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-57.3, -1751.8, 29.63), -- Circle Zone Coords
                drawtext = vector3(-56.94, -1752.1, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-41.85, -1749.36, 29.42), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1749.84, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-44.64, -1750.84, 29.42), -- Circle Zone Coords
                drawtext = vector3(-44.24, -1750.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-43.85, -1748.06, 28.94), -- Circle Zone Coords
                drawtext = vector3(-43.29, -1748.5, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-48.77, -1754.54, 29.43),
                drawtext = vector3(-48.73, -1755.29, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-50.31, -1752.58, 29.41),
                drawtext = vector3(-50.4, -1753.09, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.38, -1752.62, 29.4),
                drawtext = vector3(-52.41, -1753.35, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.78, -1750.5, 29.38),
                drawtext = vector3(-52.74, -1751.15, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.33, -1750.28, 29.37),
                drawtext = vector3(-56.02, -1750.42, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.34, -1747.84, 29.38),
                drawtext = vector3(-54.12, -1748.08, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-51.51, -1747.42, 29.34),
                drawtext = vector3(-51.92, -1747.82, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-49.16, -1749.38, 29.33),
                drawtext = vector3(-49.6, -1749.78, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-59.76, -1751.12, 29.25), vector3(-47.34, -1761.67, 29.25), vector3(-38.22, -1750.59, 29.25), vector3(-51.1, -1740.43, 29.25)},
    }

    Config.Stores["LittleSeoul"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-711.7, -916.78, 21.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-707.75, -903.86, 18.22, 3.06),
        ["NpcCoords"] = vector4(-709.13, -906.89, 18.22, 336.96),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 90.0,
        ["RegisterRotation2"] = 90.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -915.72, 19.33), -- Circle Zone Coords
                drawtext = vector3(-706.12, -915.48, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -913.69, 19.20), -- Circle Zone Coords
                drawtext = vector3(-706.11, -913.68, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-718.19, -915.72, 19.83), -- Circle Zone Coords
                drawtext = vector3(-717.62, -915.72, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-707.75, -903.86, 19.22), -- Circle Zone Coords
                drawtext = vector3(-707.8, -904.35, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-709.13, -906.89, 19.22), -- Circle Zone Coords
                drawtext = vector3(-708.96, -906.56, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-710.23, -904.11, 18.79), -- Circle Zone Coords
                drawtext = vector3(-709.54, -904.1, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-709.72, -912.36, 19.21),
                drawtext = vector3(-709.2, -912.91, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-712.33, -911.75, 19.15),
                drawtext = vector3(-711.95, -912.24, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-713.81, -913.19, 19.14),
                drawtext = vector3(-713.42, -913.74, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.64, -911.76, 19.04),
                drawtext = vector3(-715.12, -912.3, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.72, -914.56, 19.06),
                drawtext = vector3(-718.11, -913.79, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.69, -910.71, 18.99),
                drawtext = vector3(-718.11, -910.69, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-716.53, -908.56, 19.05),
                drawtext = vector3(-716.58, -909.18, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-713.41, -908.67, 19.03),
                drawtext = vector3(-713.61, -909.18, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-720.62, -916.81, 18.99), vector3(-704.17, -916.68, 18.99), vector3(-703.9, -900.17, 18.99), vector3(-720.36, -900.09, 18.99)},
    }

    Config.Stores["RichmanGlen"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1822.28, 788.07, 139.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-1827.93, 800.13, 137.16, 42.18),
        ["NpcCoords"] = vector4(-1826.86, 796.98, 137.17, 14.68),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 132.47,
        ["RegisterRotation2"] = 132.47,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1819.09, 792.32, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1818.8, 793.09, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1820.47, 793.82, 138.08), -- Circle Zone Coords
                drawtext = vector3(-1819.88, 794.23, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-1827.51, 784.62, 138.8), -- Circle Zone Coords
                drawtext = vector3(-1827.19, 784.9, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-1827.93, 800.13, 138.16), -- Circle Zone Coords
                drawtext = vector3(-1827.36, 799.63, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1826.86, 796.98, 138.17), -- Circle Zone Coords
                drawtext = vector3(-1826.99, 797.44, 138.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1829.61, 798.39, 137.79), -- Circle Zone Coords
                drawtext = vector3(-1829.05, 798.9, 138.19),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1823.58, 792.67, 138.08),
                drawtext = vector3(-1823.05, 792.68, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.08, 791.36, 138.04),
                drawtext = vector3(-1825.43, 791.28, 138.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.37, 789.17, 138.06),
                drawtext = vector3(-1825.45, 789.22, 138.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.37, 789.21, 138.05),
                drawtext = vector3(-1827.76, 789.03, 138.27),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1829.26, 785.67, 138.14),
                drawtext = vector3(-1828.67, 786.1, 138.31),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.13, 788.07, 138.14),
                drawtext = vector3(-1830.91, 788.23, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.1, 790.86, 138.19),
                drawtext = vector3(-1830.76, 790.38, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.91, 792.99, 138.17),
                drawtext = vector3(-1828.55, 792.45, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1828.56, 782.26, 138.84), vector3(-1816.18, 793.53, 138.84), vector3(-1826.2, 803.87, 138.84), vector3(-1838.57, 792.6, 138.84)},
    }

    Config.Stores["MirrorPark"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1159.75, -327.2, 71.67),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1161.28, -313.38, 68.21, 9.15),
        ["NpcCoords"] = vector4(1160.51, -316.84, 68.21, 336.91),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 100.0,
        ["RegisterRotation2"] = 100.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.56, -324.89, 69.32), -- Circle Zone Coords
                drawtext = vector3(1165.04, -324.54, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.21, -322.89, 69.19), -- Circle Zone Coords
                drawtext = vector3(1164.76, -322.75, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1153.21, -326.89, 69.51), -- Circle Zone Coords
                drawtext = vector3(1153.75, -326.8, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1161.28, -313.38, 69.21), -- Circle Zone Coords
                drawtext = vector3(1161.41, -314.09, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1160.51, -316.84, 69.21), -- Circle Zone Coords
                drawtext = vector3(1160.76, -316.31, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1159.06, -314.13, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.7, -314.04, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1160.82, -322.06, 69.14),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1158.26, -322.01, 69.13),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.97, -323.65, 69.15),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1155.12, -322.48, 69.08),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.38, -325.1, 69.08),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1151.93, -322.05, 69.09),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1153.64, -319.7, 69.08),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.65, -319.33, 69.08),
                drawtext = vector3(1156.65, -319.65, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1151.04, -328.32, 69.32), vector3(1167.47, -325.5, 69.32), vector3(1164.68, -311.37, 69.32), vector3(1148.37, -314.27, 69.32)},
    }

    Config.Stores["GrapeSeed"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.78, 4929.27, 43.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1707.15, 4918.88, 41.06, 232.3),
        ["NpcCoords"] = vector4(1705.12, 4921.63, 41.06, 206.51),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 325.0,
        ["RegisterRotation2"] = 325.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1696.64, 4924.54, 42.18), -- Circle Zone Coords
                drawtext = vector3(1696.57, 4923.92, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1698.31, 4923.37, 42.05), -- Circle Zone Coords
                drawtext = vector3(1697.96, 4922.99, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1703.26, 4934.0, 42.26), -- Circle Zone Coords
                drawtext = vector3(1702.86, 4933.41, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1707.15, 4918.88, 42.06), -- Circle Zone Coords
                drawtext = vector3(1706.62, 4919.21, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1705.12, 4921.63, 42.06), -- Circle Zone Coords
                drawtext = vector3(1705.35, 4921.16, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1708.2, 4920.92, 41.61), -- Circle Zone Coords
                drawtext = vector3(1707.78, 4920.28, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1701.18, 4925.16, 42.09),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1703.1, 4926.98, 41.95),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1702.87, 4928.94, 41.96),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.26, 4929.67, 41.88),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.07, 4933.14, 41.94),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1707.6, 4931.5, 41.92),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1708.19, 4928.48, 41.88),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1706.28, 4926.09, 41.88),
                drawtext = vector3(1156.65, -319.65, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1705.07, 4938.0, 42.18), vector3(1693.64, 4921.75, 42.18), vector3(1706.17, 4912.73, 42.18), vector3(1718.39, 4928.88, 42.18)},
    }
end

if GetResourceState('cfx-mxc-liquorstore') == 'started' then
    Config.Stores["VespucciCanals"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1226.82, -902.07, 13.99),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1219.41, -910.58, 11.30, 123.00),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 32.7,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1221.42, -908.36, 12.29), -- Circle Zone Coords
                drawtext = vector3(-1221.16, -908.71, 12.33),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1219.41, -910.58, 12.53), -- Circle Zone Coords
                drawtext = vector3(-1220.0, -911.16, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1219.22, -912.48, 12.53), -- Circle Zone Coords
                drawtext = vector3(-1219.17, -912.14, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1216.98, -914.6, 12.38), -- Circle Zone Coords
                drawtext = vector3(-1217.16, -914.27, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1226.51, -907.17, 12.56),
                drawtext = vector3(-1226.06, -906.89, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.29, -906.03, 12.56),
                drawtext = vector3(-1226.8, -905.81, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.95, -905.03, 12.56),
                drawtext = vector3(-1227.46, -904.84, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.27, -902.93, 12.28),
                drawtext = vector3(-1223.67, -903.11, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1222.35, -904.23, 12.37),
                drawtext = vector3(-1222.88, -904.43, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1225.38, -908.55, 12.76),
                drawtext = vector3(-1225.09, -908.46, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1224.69, -906.14, 12.27),
                drawtext = vector3(-1225.15, -906.39, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1222.64, -899.35, 12.39), vector3(-1210.81, -913.93, 12.39), vector3(-1223.09, -921.91, 12.39), vector3(-1232.55, -906.31, 12.39)},
    }

    Config.Stores["MorningWood"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1491.47, -383.78, 42.39),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1483.87, -375.35, 39.16, 221.85),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 135.9,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1486.27, -377.68, 40.11), -- Circle Zone Coords
                drawtext = vector3(-1485.83, -377.22, 40.17),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1483.87, -375.35, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1483.32, -375.96, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1482.59, -374.61, 40.17), -- Circle Zone Coords
                drawtext = vector3(-1482.85, -374.89, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1480.76, -371.95, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1481.38, -372.66, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1484.7, -381.71, 40.35),
                drawtext = vector3(-1485.04, -381.24, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1485.81, -382.88, 40.35),
                drawtext = vector3(-1486.15, -382.36, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1486.89, -384.03, 40.35),
                drawtext = vector3(-1487.19, -383.44, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1488.28, -384.59, 40.35),
                drawtext = vector3(-1488.71, -384.22, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.83, -380.94, 40.35),
                drawtext = vector3(-1491.4, -380.53, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.88, -379.47, 40.35),
                drawtext = vector3(-1489.52, -379.91, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1487.95, -381.24, 39.8),
                drawtext = vector3(-1487.3, -381.89, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-1486.32, -389.65, 39.9), vector3(-1472.93, -375.89, 39.9), vector3(-1481.95, -366.53, 39.9), vector3(-1496.84, -378.62, 39.9)},
    }

    Config.Stores["GreatOceanHighway"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-2974.49, 390.58, 16.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-2963.0, 390.87, 14.04, 173.4),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 86.9,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-2966.15, 391.35, 14.99), -- Circle Zone Coords
                drawtext = vector3(-2965.55, 391.32, 15.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-2963.0, 390.87, 15.04), -- Circle Zone Coords
                drawtext = vector3(-2963.0, 390.26, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-2961.43, 390.63, 15.06), -- Circle Zone Coords
                drawtext = vector3(-2962.05, 390.7, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-2958.19, 390.89, 15.03), -- Circle Zone Coords
                drawtext = vector3(-2959.06, 390.96, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.13, 387.32, 14.95),
                drawtext = vector3(-2968.15, 387.6, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.78, 387.36, 14.95),
                drawtext = vector3(-2969.69, 387.82, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2971.29, 387.53, 14.95),
                drawtext = vector3(-2971.28, 387.89, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.66, 388.04, 14.95),
                drawtext = vector3(-2972.61, 389.04, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.1, 393.2, 14.91),
                drawtext = vector3(-2971.71, 393.0, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.86, 392.92, 15.05),
                drawtext = vector3(-2969.9, 392.43, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.93, 390.17, 14.72),
                drawtext = vector3(-2970.02, 389.32, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-2974.17, 382.18, 14.91), vector3(-2957.38, 380.53, 14.91), vector3(-2956.41, 395.43, 14.91), vector3(-2973.5, 396.57, 14.91)},
    }

    Config.Stores["MurrietaHeights"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1141.57, -980.89, 48.37),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1130.77, -983.28, 45.42, 8.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 279.32,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1134.13, -983.1, 46.37), -- Circle Zone Coords
                drawtext = vector3(1133.44, -983.07, 46.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1130.77, -983.28, 46.42), -- Circle Zone Coords
                drawtext = vector3(1130.67, -982.75, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1129.44, -983.4, 46.43), -- Circle Zone Coords
                drawtext = vector3(1129.9, -983.35, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1126.29, -984.37, 46.39), -- Circle Zone Coords
                drawtext = vector3(1127.03, -984.24, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1135.2, -978.71, 46.7),
                drawtext = vector3(1135.17, -979.05, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.09, -978.66, 46.7),
                drawtext = vector3(1136.9, -978.76, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.55, -978.81, 46.7),
                drawtext = vector3(1138.37, -978.56, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1139.8, -978.67, 46.7),
                drawtext = vector3(1137.78, -982.07, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1140.38, -983.64, 46.47),
                drawtext = vector3(1140.31, -983.06, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.11, -984.0, 46.42),
                drawtext = vector3(1138.01, -983.27, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.53, -980.92, 46.05),
                drawtext = vector3(1137.43, -980.24, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1140.81, -976.27, 46.25), vector3(1123.7, -978.93, 46.25), vector3(1124.47, -993.08, 46.25), vector3(1143.02, -990.4, 46.25)},
    }

    Config.Stores["BolingBroke"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1166.43, 2703.84, 39.18),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1165.6, 2714.34, 37.16, 268.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 180.95,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1165.4, 2711.05, 38.09), -- Circle Zone Coords
                drawtext = vector3(1165.43, 2711.6, 38.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1165.6, 2714.34, 38.16), -- Circle Zone Coords
                drawtext = vector3(1166.09, 2714.33, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1165.82, 2715.77, 38.16), -- Circle Zone Coords
                drawtext = vector3(1165.8, 2715.32, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1165.33, 2719.07, 38.15), -- Circle Zone Coords
                drawtext = vector3(1165.28, 2718.31, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.52, 2709.32, 38.32),
                drawtext = vector3(1169.23, 2709.3, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.46, 2707.69, 38.32),
                drawtext = vector3(1169.24, 2707.72, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.53, 2706.15, 38.32),
                drawtext = vector3(1169.32, 2706.15, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1168.83, 2704.85, 38.32),
                drawtext = vector3(1168.48, 2704.85, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.01, 2704.99, 38.32),
                drawtext = vector3(1164.12, 2705.29, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.14, 2707.24, 38.32),
                drawtext = vector3(1164.66, 2707.24, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1166.8, 2707.41, 38.32),
                drawtext = vector3(1167.61, 2707.41, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1158.38, 2702.84, 38.12), vector3(1170.88, 2703.34, 38.12), vector3(1170.38, 2721.67, 38.12), vector3(1158.37, 2721.75, 38.12)},
    }
else
    Config.Stores["VespucciCanals"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1226.82, -902.07, 13.99),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1220.01, -911.22, 11.33, 123.84),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 32.7,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1222.33, -907.82, 12.43), -- Circle Zone Coords
                drawtext = vector3(-1222.01, -908.3, 12.33),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1220.01, -911.22, 12.33), -- Circle Zone Coords
                drawtext = vector3(-1220.49, -911.49, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1220.55, -913.15, 12.22), -- Circle Zone Coords
                drawtext = vector3(-1220.89, -912.6, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1221.2, -916.25, 11.33), -- Circle Zone Coords
                drawtext = vector3(-1220.68, -915.91, 11.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1225.74, -909.05, 12.39),
                drawtext = vector3(-1225.47, -909.02, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1226.76, -907.76, 12.39),
                drawtext = vector3(-1226.38, -907.61, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.64, -906.53, 12.39),
                drawtext = vector3(-1227.3, -906.28, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.36, -904.77, 12.39),
                drawtext = vector3(-1224.01, -905.12, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.62, -902.47, 12.39),
                drawtext = vector3(-1223.45, -902.79, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1222.03, -903.18, 12.39),
                drawtext = vector3(-1222.29, -903.37, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1220.88, -905.03, 12.39),
                drawtext = vector3(-1221.11, -905.22, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1222.64, -899.35, 12.39), vector3(-1210.81, -913.93, 12.39), vector3(-1223.09, -921.91, 12.39), vector3(-1232.55, -906.31, 12.39)},
    }

    Config.Stores["MorningWood"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1491.47, -383.78, 42.39),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1483.87, -375.35, 39.16, 221.85),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 133.77,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1486.67, -378.46, 40.27), -- Circle Zone Coords
                drawtext = vector3(-1486.22, -378.05, 40.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1483.87, -375.35, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1483.32, -375.96, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1481.99, -375.86, 40.13), -- Circle Zone Coords
                drawtext = vector3(-1482.36, -376.07, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1478.62, -375.8, 39.16), -- Circle Zone Coords
                drawtext = vector3(-1479.03, -375.38, 39.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1484.7, -381.71, 40.35),
                drawtext = vector3(-1485.04, -381.24, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1485.81, -382.88, 40.35),
                drawtext = vector3(-1486.15, -382.36, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1486.89, -384.03, 40.35),
                drawtext = vector3(-1487.19, -383.44, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.44, -380.01, 40.35),
                drawtext = vector3(-1488.96, -380.58, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.83, -380.94, 40.35),
                drawtext = vector3(-1491.4, -380.53, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.17, -378.95, 40.35),
                drawtext = vector3(-1491.04, -379.34, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.71, -377.49, 40.35),
                drawtext = vector3(-1489.5, -377.88, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-1486.32, -389.65, 39.9), vector3(-1472.93, -375.89, 39.9), vector3(-1481.95, -366.53, 39.9), vector3(-1496.84, -378.62, 39.9)},
    }

    Config.Stores["GreatOceanHighway"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-2974.49, 390.58, 16.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-2963.0, 390.87, 14.04, 173.4),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 85.24,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-2967.03, 390.9, 15.15), -- Circle Zone Coords
                drawtext = vector3(-2966.46, 390.9, 15.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-2963.0, 390.87, 15.04), -- Circle Zone Coords
                drawtext = vector3(-2963.0, 390.26, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-2961.79, 389.05, 15.03), -- Circle Zone Coords
                drawtext = vector3(-2962.53, 389.09, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-2959.6, 386.9, 14.04), -- Circle Zone Coords
                drawtext = vector3(-2959.56, 387.29, 14.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.13, 387.32, 14.85),
                drawtext = vector3(-2968.15, 387.6, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.78, 387.36, 14.84),
                drawtext = vector3(-2969.69, 387.82, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2971.29, 387.53, 14.93),
                drawtext = vector3(-2971.28, 387.89, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.92, 391.84, 14.98),
                drawtext = vector3(-2970.19, 391.22, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.1, 393.2, 14.91),
                drawtext = vector3(-2971.71, 393.0, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2970.47, 393.99, 15.0),
                drawtext = vector3(-2970.48, 393.64, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.23, 393.91, 15.0),
                drawtext = vector3(-2968.41, 393.43, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-2974.17, 382.18, 14.91), vector3(-2957.38, 380.53, 14.91), vector3(-2956.41, 395.43, 14.91), vector3(-2973.5, 396.57, 14.91)},
    }

    Config.Stores["MurrietaHeights"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1141.57, -980.89, 48.37),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1130.77, -983.28, 45.42, 8.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 276.69,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1134.81, -982.36, 46.52), -- Circle Zone Coords
                drawtext = vector3(1134.19, -982.45, 46.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1130.77, -983.28, 46.42), -- Circle Zone Coords
                drawtext = vector3(1130.67, -982.75, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1129.24, -981.67, 46.41), -- Circle Zone Coords
                drawtext = vector3(1129.79, -981.57, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1126.75, -979.62, 45.40), -- Circle Zone Coords
                drawtext = vector3(1126.8, -980.06, 45.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1135.2, -978.71, 46.37),
                drawtext = vector3(1135.17, -979.05, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.78, -978.34, 46.36),
                drawtext = vector3(1136.9, -978.76, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.33, -978.12, 46.35),
                drawtext = vector3(1138.37, -978.56, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.88, -982.58, 46.32),
                drawtext = vector3(1137.78, -982.07, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1140.15, -983.56, 46.2),
                drawtext = vector3(1139.82, -983.5, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.77, -984.61, 46.69),
                drawtext = vector3(1138.79, -984.3, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.61, -984.94, 46.69),
                drawtext = vector3(1136.59, -984.6, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1140.81, -976.27, 46.25), vector3(1123.7, -978.93, 46.25), vector3(1124.47, -993.08, 46.25), vector3(1143.02, -990.4, 46.25)},
    }

    Config.Stores["BolingBroke"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1166.43, 2703.84, 39.18),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1165.6, 2714.34, 37.16, 268.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 178.85,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1165.96, 2710.2, 38.26), -- Circle Zone Coords
                drawtext = vector3(1165.95, 2710.77, 38.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1165.6, 2714.34, 38.16), -- Circle Zone Coords
                drawtext = vector3(1166.09, 2714.33, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1167.46, 2715.53, 37.99), -- Circle Zone Coords
                drawtext = vector3(1167.46, 2715.01, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1169.58, 2717.83, 37.58), -- Circle Zone Coords
                drawtext = vector3(1169.15, 2717.93, 37.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.52, 2709.32, 38.05),
                drawtext = vector3(1169.23, 2709.3, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.46, 2707.69, 38.06),
                drawtext = vector3(1169.24, 2707.72, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.53, 2706.15, 38.06),
                drawtext = vector3(1169.32, 2706.15, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1165.11, 2707.23, 37.94),
                drawtext = vector3(1165.85, 2707.13, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.01, 2704.99, 38.32),
                drawtext = vector3(1164.12, 2705.29, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2706.67, 38.32),
                drawtext = vector3(1163.42, 2706.56, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2708.68, 38.34),
                drawtext = vector3(1163.53, 2708.73, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1158.38, 2702.84, 38.12), vector3(1170.88, 2703.34, 38.12), vector3(1170.38, 2721.67, 38.12), vector3(1158.37, 2721.75, 38.12)},
    }
end

Config.Weapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    -- Melee
    "WEAPON_KNIFE", -- Knife
    "WEAPON_NIGHTSTICK", -- Night Stick
    "WEAPON_HAMMER", -- Hammer
    "WEAPON_BAT", -- Bat
    "WEAPON_CROWBAR", -- Crowbar
    "WEAPON_GOLFCLUB", -- Golfclub
    "WEAPON_BOTTLE", -- Bottle
    "WEAPON_DAGGER", -- Dagger
    "WEAPON_HATCHET", -- Hatchet
    "WEAPON_KNUCKLE", -- Knuckle Duster
    "WEAPON_MACHETE", -- Machete
    "WEAPON_FLASHLIGHT", -- Flashlight
    "WEAPON_SWITCHBLADE", -- Switch Blade
    "WEAPON_POOLCUE", -- Poolcue
    "WEAPON_WRENCH", -- Wrench
    "WEAPON_BATTLEAXE", -- Battle Axe

    -- Pistols
    "WEAPON_PISTOL", -- Pistol
    "WEAPON_PISTOL_MK2", -- Pistol Mk2
    "WEAPON_COMBATPISTOL", -- Combat Pistol
    "WEAPON_PISTOL50", -- Pistol 50
    "WEAPON_SNSPISTOL", -- SNS Pistol 
    "WEAPON_HEAVYPISTOL", -- Heavy Pistol
    "WEAPON_VINTAGEPISTOL", -- Vintage Pistol
    "WEAPON_MARKSMANPISTOL", -- Marksman Pistol
    "WEAPON_REVOLVER", -- Revolver
    "WEAPON_APPISTOL", -- AP Pistol
    "WEAPON_STUNGUN", -- Stun Gun
    "WEAPON_FLAREGUN", -- Flare Gun
    "WEAPON_PROJECTXPISTOL", -- PROJECT X PISTOL

    -- SMGs
    "WEAPON_MICROSMG", -- Micro SMG
    "WEAPON_MACHINEPISTOL", -- Machine Pistol
    "WEAPON_SMG", -- SMG
    "WEAPON_SMG_MK2", -- SMG Mk2
    "WEAPON_ASSAULTSMG", -- Assault SMG
    "WEAPON_COMBATPDW", -- Combat PDW
    "WEAPON_MG", -- MG
    "WEAPON_COMBATMG", -- Combat MG
    "WEAPON_COMBATMG_MK2", -- Combat MG Mk2
    "WEAPON_GUSENBERG", -- Gusenberg
    "WEAPON_MINISMG", -- Mini SMG
    "WEAPON_PROJECTXSMG", -- PROJECT X SMG

    -- Assault Rifles
    "WEAPON_ASSAULTRIFLE", -- Assault Rifle
    "WEAPON_ASSAULTRIFLE_MK2", -- Assault Rifle Mk2
    "WEAPON_CARBINERIFLE", -- Carbine Rifle
    "WEAPON_CARBINERIFLE_MK2", -- Carbine Rifle Mk2
    "WEAPON_ADVANCEDRIFLE", -- Advanced Rifle
    "WEAPON_SPECIALCARBINE", -- Special Carbine
    "WEAPON_BULLPUPRIFLE", -- Bullpup Rifle
    "WEAPON_COMPACTRIFLE", -- Compact Rifle
    "WEAPON_MILITARYRIFLE", -- Military Rifle
    "WEAPON_TACTICALRIFLE", -- Tactical Rifle
    "WEAPON_PROJECTX", -- PROJECT X WEAPON
    "WEAPON_ARCTIC516", -- PROJECT X VX ARCTIC 516

    -- Sniper rifles
    "WEAPON_SNIPERRIFLE", -- Sniper Rifle
    "WEAPON_HEAVYSNIPER", -- Heavy Sniper
    "WEAPON_HEAVYSNIPER_MK2", -- Heavy Sniper Mk2
    "WEAPON_MARKSMANRIFLE", -- Marksman Rifle

    -- Shotguns
    "WEAPON_PUMPSHOTGUN", -- Pump Shotgun
    "WEAPON_SAWNOFFSHOTGUN", -- Sawnoff Shotgun
    "WEAPON_BULLPUPSHOTGUN", -- Bullpup Shotgun
    "WEAPON_ASSAULTSHOTGUN", -- Assault Shotgun
    "WEAPON_MUSKET", -- Musket
    "WEAPON_HEAVYSHOTGUN", -- Heavy Shotgun
    "WEAPON_DBSHOTGUN", -- Double Barrel Shotgun
    "WEAPON_AUTOSHOTGUN", -- Auto Shotgun

    -- Heavy Weapons
    "WEAPON_GRENADELAUNCHER", -- Grenade Launcher
    "WEAPON_RPG", -- RPG
    "WEAPON_MINIGUN", -- Minigun
    "WEAPON_FIREWORK", -- Firework
    "WEAPON_RAILGUN", -- Railgun
    "WEAPON_HOMINGLAUNCHER", -- Homing Launcher
    "WEAPON_GRENADELAUNCHER_SMOKE", -- Smoke Grenade Launcher 
    "WEAPON_COMPACTLAUNCHER", -- Compact Launcher

    -- Thrown Weapons
    "WEAPON_GRENADE", -- Grenade
    "WEAPON_STICKYBOMB", -- Sticky Bomb
    "WEAPON_PROXMINE", -- Proximity Mine
    "WEAPON_BZGAS", -- BZ Gas
    "WEAPON_MOLOTOV", -- Molotov
    "WEAPON_FIREEXTINGUISHER", -- Fire Extinguisher
    "WEAPON_PETROLCAN", -- Petrol Can
    "WEAPON_FLARE", -- Flare
    "WEAPON_BALL", -- Ball
    "WEAPON_SNOWBALL", -- Snowball
    "WEAPON_SMOKEGRENADE", -- Smoke Grenade
    "WEAPON_PIPEBOMB", -- Pipe Bomb
}

Config.MaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true}
Config.FemaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true}
Config.UseDecor = false
Config.Decorname = "SpawnedPed"

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.DoorStates = { -- Sync
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

if GetResourceState('cfx-mxc-liquorstore') == 'started' then
    Config.DoorList = {
        ["VespucciCanals"] = {
            {
                objYaw = 33.37,
                objCoords = vector3(-1219.81, -912.93, 12.4),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["MorningWood"] = {
            {
                objYaw = 135.0,
                objCoords = vector3(-1481.97, -375.23, 40.24),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["GreatOceanHighway"] = {
            {
                objYaw = 85.59,
                objCoords = vector3(-2961.49, 389.72, 15.13),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["MurrietaHeights"] = {
            {
                objYaw = 278.42,
                objCoords = vector3(1129.22, -982.51, 46.5),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["BolingBroke"] = {
            {
                objYaw = 179.6,
                objCoords = vector3(1166.71, 2715.82, 38.23),
                objHash = 1760805631,
                locked = true,
            },
        },
    }
else
    Config.DoorList = {
        ["VespucciCanals"] = {
            {
                objYaw = 33.86,
                objCoords = vector3(-1219.63, -912.41, 12.48),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["MorningWood"] = {
            {
                objYaw = 134.93,
                objCoords = vector3(-1482.69, -374.94, 40.31),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["GreatOceanHighway"] = {
            {
                objYaw = 86.39,
                objCoords = vector3(-2961.75, 390.26, 15.19),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["MurrietaHeights"] = {
            {
                objYaw = 277.84,
                objCoords = vector3(1129.51, -982.78, 46.57),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["BolingBroke"] = {
            {
                objYaw = 179.92,
                objCoords = vector3(1166.27, 2715.51, 38.31),
                objHash = 1173348778,
                locked = true,
            },
        },
    }
end

Config.Steps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.ExtraSteps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.Tasks = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}