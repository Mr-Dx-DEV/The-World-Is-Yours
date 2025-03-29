function Lcl(txt, ...) if CRForgeryLocales[txt] then return string.format(CRForgeryLocales[txt], ...) else print('Locale Error, Contact Server Admin. ('..txt..')') end end

Config = {}
Config.Debug = false
Config.DisableVersionCheck = false

Config.Framework = {
    Framework = "QBCore", -- "QBCore" | "ESX" is not stable yet
    Interaction = {
        UseTarget = true, -- Leave true if you are using qb-target. Set to false to disable targetting and enable oxlib points + DrawText for all interactions
        Target = "qb-target", -- "qb-target" | "oxtarget"
        Key = "G" -- Key to press when interacting with things if not using targets (Default : G | See Config.KeyList to know which string to change this value to.)
    },
    Menu = 'qb', -- qb/nh/ox
    Input = 'qb', -- qb/ox

    --Framework Overrides (You can change specific framework related functions to ones from other scripts.)
    UseOxInv = true, -- For ESX and QBCore. Lets ESX users utilize the "uses" configuration on the usb (Uses Item Metadata)
    CircleMinigame = "oxlib", -- "ps-ui" | "qb-lock" | "oxlib" | (You can use your own (See cl_framework)
    Doorlocks = 'ox', --  'qb' = qb-doorlock | 'nui' = nui-doorlock | 'ox' = ox_doorlocks
    Notifications = "qb", -- "okok" | "mythic" | "tnj" | "oxlib" | "qb" | "ESX" | "chat" |
    ProgressUI = "oxlib", -- "oxlib" | "mythic" | "rprogress" (Custom Settings at the bottom) |  Otherwise leave blank ("") to use Framework Settings.
    DrawText = "oxlib", -- "oxlib" | "okok" | "psui" | Otherwise leave blank ("") to use Framework Settings.
    Logs = false -- True = Logs Enabled | False = Logs Disabled
    -- *Important* All oxlib option requires oxlib to be enabled in the fxmanifest *Important*
}

Config.convertBl_Idcard = false -- Convert the ids made to be compatible with bl_idcard [https://github.com/Byte-Labs-Studio/bl_idcard]
--[[ NOTES :
    All modifications to city-hall, inventory, & other external script should be done as instructed per bl_idcards
    Modifications to the JS portion of qb/ps-inventory need to be changed to follow bl_idcard's keyNames (Found below)
]]

Config.CustomProp = true -- Set to false if you don't want to use the custom prop

Config.ForgeTime = 15 -- Time Is In Seconds
Config.UseExperience = true -- Use XP system

Config.KeyNames = { -- Customize the name of the keys used for the card's metadata table.
    -- You can easily adapt these to your own id_card script if it uses different keys from the default ones.
    firstName = 'firstname',
    lastName = 'lastname',
    birthDate = 'birthdate',
    gender = 'gender',
    nationality = 'nationality',
    citizenid = 'citizenid',
    type = 'type',
}

-- NOTE : If using Config.convertBl_Idcard = true, the keynames are automatically/internally set as
if Config.convertBl_Idcard then
    Config.KeyNames = {
        firstName = 'firstName',
        lastName = 'lastName',
        birthDate = 'dob',
        gender = 'sex',
        nationality = 'nationality',
        citizenid = 'id',
        type = 'type',
    }
end

-- coords : Entry coords
-- Licenses : Licenses available at this specific location
-- Legal : Set true to so cards made at this location do not receive the "forged" metadata.
Config.Locations = {
    {coords = vector4(459.79, -1869.56, 27.11, 225.62), licenses = {'ID Card'}, legal = false,},
    {coords = vector4(455.35, -1874.77, 26.92, 225.51), licenses = {'ID Card', 'Drivers License'}, legal = true}
}

Config.GenderOptions = {
    [0] = 'Male',
    [1] = 'Women',
    --[3] = 'Other',
}


Config.ScannerOptions = {
    scannerItem = 'id_scanner',
    usesCardQuality = true, -- REQUIRES USE OF XP, Uses the card quality system which works with XP
    detectForge = 10, -- Minumum Chance for the scanner to detect if the id is forged (If the quality ratio is lower than this, this is the base chance of detection)
    inspectTime = 15, -- Time in seconds to inspect an ID
    scannedOptions = { -- Options information shown on the ID scanner
        birthDate = {enabled = true, label = 'DOB'},
        gender = {enabled = true, label = 'Gender'},
        nationality = {enabled = true, label = 'Nationality'},
        citizenid = {enabled = true, label = 'Citizen ID'},
        type = {enabled = true, label = 'Licence Type'},
    },
    InspectMinigame = {
        type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
        enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
        CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
        CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
        OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
    }
}

--[[
Detection Formula :

    DetectionRatio = 100 - (Player XP when card was crafted  / xpNeededForPerfect * 100)
    if DetectionRatio < Config.ScannerOptions.detectForge then DetectionRatio = Config.ScannerOptions.detectForge end

    if math.random(100) < DetectionRatio then return CARD IS FORGED (true) else CARD SHOWS NO SIGN OF FORGERY (false) end
]]

Config.Licences = {
    ["ID Card"] = {
        xpNeeded = 0, -- Xp Needed if using Config.UseExperience
        xpNeededForPerfect = 100, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
        xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
        ForgingCost = 0, -- Leave at 0 for free, or set a price.
        MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
        RequiredItems = { -- List of items required to craft a card.
        -- Leave the table empty if you don't want to require items to forge.
        -- You can add as many items as wanted by following the template
        -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
            [1] = {item = "plastic", amount = 2},
        },
        Card = "id_card", --Card Item Given ("item hash")
        --Description = "IDENTIFICATION CARD" -- Card Description if it requires one
        ShownOptions = { --Options shown for both when making the ID and showing the ID
            citizenid = true,
            firstName = true,
            lastName = true,
            birthDate = true,
            gender = true,
            nationality = true,
        },
        ForgeMinigame = {
            type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
            enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
            CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
            CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
            OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
        }
    },
    ["Drivers License"] = {
        xpNeeded = 35, -- Xp Needed if using Config.UseExperience
        xpNeededForPerfect = 300, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
        xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
        ForgingCost = 5000, -- Leave at 0 for free, or set a price.
        MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
        RequiredItems = { -- List of items required to craft a card.
        -- Leave the table empty if you don't want to require items to forge.
        -- You can add as many items as wanted by following the template
        -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
            -- [1] = {item = "plastic", amount = 2},
            -- [2] = {item = "dye", amount = 1}
        },
        Card = "driver_license", --Card Item Given ("item hash")
        Description = "CLASS G DRIVERS LICENSE", -- Card Description if it requires one
        ShownOptions = { --Options shown for both when making the ID and showing the ID
            citizenid = true,
            firstName = true,
            lastName = true,
            birthDate = true,
            gender = true,
            nationality = true,
        },
        ForgeMinigame = {
            type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
            enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
            CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
            CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
            OxLibDifficulty = "easy", -- 'easy' | 'medium' | 'hard' Oxlib difficulty
        }
    },
    ["Weapon License"] = {
        xpNeeded = 50, -- Xp Needed if using Config.UseExperience
        xpNeededForPerfect = 500, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
        xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
        ForgingCost = 5000, -- Leave at 0 for free, or set a price.
        MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
        RequiredItems = { -- List of items required to craft a card.
        -- Leave the table empty if you don't want to require items to forge.
        -- You can add as many items as wanted by following the template
        -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
            -- [1] = {item = "plastic", amount = 2},
            -- [2] = {item = "dye", amount = 1}
        },
        Card = "weaponlicense", --Card Item Given ("item hash")
        Description = "CLASS ONE WEAPON LICENSE",
        ShownOptions = { --Options shown for both when making the ID and showing the ID
            citizenid = true,
            firstName = true,
            lastName = true,
            birthDate = true,
            gender = true,
            nationality = true,
        },
        ForgeMinigame = {
            type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
            enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
            CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
            CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
            OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
        }
    },
    -- ["Hunting License"] = {
    --     xpNeeded = 10, -- Xp Needed if using Config.UseExperience
    --     xpNeededForPerfect = 30, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
    --     xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
    --     ForgingCost = 5000, -- Leave at 0 for free, or set a price.
    --     MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
    --     RequiredItems = { -- List of items required to craft a card.
    --     -- Leave the table empty if you don't want to require items to forge.
    --     -- You can add as many items as wanted by following the template
    --     -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
    --         -- [1] = {item = "plastic", amount = 2},
    --         -- [2] = {item = "dye", amount = 1}
    --     },
    --     Card = "huntinglicense", --Card Item Given ("item hash")
    --     Description = "HUNTING LICENSE",
    --     ShownOptions = { --Options shown for both when making the ID and showing the ID
    --         citizenid = true,
    --         firstName = true,
    --         lastName = true,
    --         birthDate = true,
    --         gender = true,
    --         nationality = true,
    --     },
    --     ForgeMinigame = {
    --         type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
    --         enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
    --         CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
    --         CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
    --         OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
    --     }
    -- },
    -- ["Waters License"] = {
    --     xpNeeded = 10, -- Xp Needed if using Config.UseExperience
    --     xpNeededForPerfect = 30, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
    --     xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
    --     ForgingCost = 5000, -- Leave at 0 for free, or set a price.
    --     MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
    --     RequiredItems = { -- List of items required to craft a card.
    --     -- Leave the table empty if you don't want to require items to forge.
    --     -- You can add as many items as wanted by following the template
    --     -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
    --         -- [1] = {item = "plastic", amount = 2},
    --         -- [2] = {item = "dye", amount = 1}
    --     },
    --     Card = "waterslicense", --Card Item Given ("item hash")
    --     Description = "WATERS LICENSE",
    --     ShownOptions = { --Options shown for both when making the ID and showing the ID
    --         citizenid = true,
    --         firstName = true,
    --         lastName = true,
    --         birthDate = true,
    --         gender = true,
    --         nationality = true,
    --     },
    --     ForgeMinigame = {
    --         type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
    --         enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
    --         CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
    --         CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
    --         OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
    --     }
    -- },
    -- ["Fishing License"] = {
    --     xpNeeded = 10, -- Xp Needed if using Config.UseExperience
    --     xpNeededForPerfect = 30, -- XP Needed to perfect the card and reduce the chance for cops to discover it being forged. The closer xp the player has to this number, the lesser the chance of it being scanned forged.
    --     xpGiven = 1, -- XP Given after a craft if using Config.UseExperience
    --     ForgingCost = 5000, -- Leave at 0 for free, or set a price.
    --     MoneyType = "cash", -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
    --     RequiredItems = { -- List of items required to craft a card.
    --     -- Leave the table empty if you don't want to require items to forge.
    --     -- You can add as many items as wanted by following the template
    --     -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
    --         -- [1] = {item = "plastic", amount = 2},
    --         -- [2] = {item = "dye", amount = 1}
    --     },
    --     Card = "fishinglicense", --Card Item Given ("item hash")
    --     Description = "DEEP SEA FISHING LICENSE",
    --     ShownOptions = { --Options shown for both when making the ID and showing the ID
    --         citizenid = true,
    --         firstName = true,
    --         lastName = true,
    --         birthDate = true,
    --         gender = true,
    --         nationality = true,
    --     },
    --     ForgeMinigame = {
    --         type = 'circle', -- 'circle' | Anything else for custom, Need your implementation
    --         enabled = true, -- enables or disables the use of a minigame wnen inspecting a card.
    --         CircleAmount = {min = 5, max = 8}, -- Amount of circles for the minigame
    --         CircleTimeDifficulty = {min = 7, max = 15}, -- Difficulty for the minigame (time for a complete rotation (Higher = slower))
    --         OxLibDifficulty = {'easy', 'easy', 'medium'}, -- 'easy' | 'medium' | 'hard' | {'easy', 'easy', 'medium'} - Oxlib difficulty
    --     }
    -- },
}

-- Evidence Config
-- Can drop fingerprints at the door & when forging cards
Config.DropFingerPrintEvidence = true -- Enables Fingerprint Drops
Config.FingerPrintDropChance = 50 -- % Chance to drop fingerprint if not wearing gloves
Config.MaleNoHandshoes = { -- Male Gloves
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,
}
Config.FemaleNoHandshoes = { -- Female Gloves
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,
}

Config.KeyList = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}