----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

-- Debugging
Config.Debug = true -- Enables/disables debug messages

-- Core settings for renamed cores
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    PlayerLoaded = 'QBCore:Client:OnPlayerLoaded', -- Name of player load event. default; 'QBCore:Client:OnPlayerLoaded'
    PlayerUnload = 'QBCore:Client:OnPlayerUnload', -- Name of player unload event. default; 'QBCore:Client:OnPlayerUnload'
    VehicleKeysEvent = 'vehiclekeys:client:SetOwner', -- Name of you vehicle keys event. default; 'vehiclekeys:client:SetOwner'
    EvidenceEvent = 'evidence:client:SetStatus', -- Name of your evidence event. default; 'evidence:client:SetStatus'
    FuelEvent = 'LegacyFuel' -- The name of your fuel event. Default; LegacyFuel
}

-- Blip settings
Config.Blips = {
    -- Shared
    {title = 'Hydrochloric Acid', colour = 5, id = 51, coords = vector3(2705.04, 1557.17, 26.04), scale = 0.6, useblip = false},
    {title = 'Construction Site', colour = 5, id = 51, coords = vector3(-453.74, -983.82, 25.9), scale = 0.6, useblip = false},
    
    -- Weed
    {title = 'Smoke On The Water', colour = 25, id = 496, coords = vector3(-1173.55, -1574.21, 5.38), scale = 0.6, useblip = false},
    
    -- Ketamine
    {title = 'Suspicious Worker', colour = 7, id = 51, coords = vector3(569.32, 2796.66, 42.02), scale = 0.6, useblip = false},
    {title = 'Ketamine Processing', colour = 7, id = 51, coords = vector3(-1358.46, -756.26, 22.3), scale = 0.6, useblip = false},

    -- Heroin
    {title = 'Pharmacist', colour = 10, id = 51, coords = vector3(95.23, -1607.81, 30.9), scale = 0.6, useblip = false}, 
    {title = 'Opium Field', colour = 10, id = 51, coords = vector3(-2332.28, 2516.33, 3.43), scale = 0.6, useblip = false}, 
    {title = 'Ether Barrels', colour = 10, id = 51, coords = vector3(453.47, -585.43, 28.50), scale = 0.6, useblip = false},
    {title = 'Morphine Processing', colour = 10, id = 51, coords = vector3(166.04, 295.21, 111.84), scale = 0.6, useblip = false},
    {title = 'Heroin Base Processing', colour = 10, id = 51, coords = vector3(-1125.46, 4895.55, 218.47), scale = 0.6, useblip = false}, 
    {title = 'Heroin Processing', colour = 10, id = 51, coords = vector3(1963.15, 4639.16, 42.10), scale = 0.6, useblip = false},

    -- Meth
    {title = 'Prospecting Zone', colour = 10, id = 365, coords = vector3(2823.87, -627.59, 5.19), scale = 0.8, useblip = false},
    {title = 'Methymaline Barrels', colour = 1, id = 51, coords = vector3(3494.18, 3645.89, 42.6), scale = 0.6, useblip = false},
    {title = 'Airport Boxes', colour = 1, id = 51, coords = vector3(-798.32, -2795.76, 13.95), scale = 0.6, useblip = false},
    {title = 'Meth Processing', colour = 1, id = 51, coords = vector3(1389.87, 3600.18, 38.94), scale = 0.6, useblip = false},
    
    -- Cocaine
    {title = 'Cocaine Field', colour = 3, id = 51, coords = vector3(2829.24, -1468.1, 11.43), scale = 0.6, useblip = false},
    {title = 'Gasoline Tankers', colour = 3, id = 51, coords = vector3(-1932.35, 3038.86, 32.81), scale = 0.6, useblip = false},
    {title = 'Airport Carts', colour = 3, id = 51, coords = vector3(-1150.35, -2566.99, 13.94), scale = 0.6, useblip = false},
    {title = 'Cocaine Processing', colour = 3, id = 51, coords = vector3(517.33, 172.95, 100.25), scale = 0.6, useblip = false},
    {title = 'Crack Processing', colour = 3, id = 51, coords = vector3(-255.73, -1544.53, 31.90), scale = 0.6, useblip = false},

    -- Bulk buyer
    {title = 'Bulk Buyer', colour = 5, id = 51, coords = vector3(-1757.21, 427.49, 127.70), scale = 0.6, useblip = false}
}

-- Ped settings
Config.Peds = {
    -- Weed
    {name = 'Clyde', coords = vector4(-1169.42, -1573.99, 4.66, 36.20), model = 'u_m_y_hippie_01', scenario = 'WORLD_HUMAN_LEANING', label = 'Speak To Clyde', icon = 'fa-solid fa-shop', event = 'boii-drugs:cl:SmokeShopMenu', distance = 2.0},
    
    -- Ketamine
    {name = 'Suspicious Worker', coords = vector4(569.32, 2796.66, 42.02, 270.22), model = 'a_m_y_beachvesp_02', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Worker', icon = 'fa-solid fa-shop', event = 'boii-drugs:cl:KetaminePedMenu', distance = 2.0},
    
    -- Heroin
    {name = 'Pharmacist', coords = vector4(91.23, -1603.81, 30.90, 248.07), model = 's_m_m_doctor_01', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Pharmacist', icon = 'fab fa-drupal', event = 'boii-drugs:cl:PharmacyMainMenu', distance = 2.0},
    {name = 'Willy', coords = vector4(166.0, 293.21, 110.84, 20.07), model = 'u_m_m_willyfist', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Willy', icon = 'fab fa-drupal', event = 'boii-drugs:cl:MorphineProcessor', distance = 2.0},
    {name = 'Terry', coords = vector4(-1124.27, 4892.85, 218.47, 19.07), model = 'ig_terry', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Terry', icon = 'fab fa-drupal', event = 'boii-drugs:cl:HeroinBaseProcessor', distance = 2.0},
    {name = 'Ashley', coords = vector4(1967.15, 4634.16, 41.10, 39.07), model = 'ig_ashley', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Ashley', icon = 'fab fa-drupal', event = 'boii-drugs:cl:HeroinProcessor', distance = 2.0},

    -- Meth
    {name = 'Chef', coords = vector4(1389.87, 3600.18, 38.94, 109.48), model = 'ig_chef2', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Chef', icon = 'fab fa-drupal', event = 'boii-drugs:cl:MethProcessor', distance = 2.0},

    -- Cocaine
    {name = 'Avon', coords = vector4(515.13, 174.49, 100.68, 248.07), model = 'ig_avon', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Avon', icon = 'fab fa-drupal', event = 'boii-drugs:cl:CocaineProcessor', distance = 2.0},
    {name = 'Stretch', coords = vector4(-255.79, -1543.23, 31.9, 157.78), model = 'ig_stretch', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak To Stretch', icon = 'fab fa-drupal', event = 'boii-drugs:cl:CrackProcessor', distance = 2.0},

    -- Bulk buyer
    {name = 'Madrazo', coords = vector4(-1757.21, 427.49, 127.70, 243.89), model = 'cs_martinmadrazo', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Madrazo', icon = 'fab fa-drupal', event = 'boii-drugs:cl:BulkSellingMenu', distance = 2.0},
}

-- Bodyguard 
Config.Bodyguard = {
    {name = 'Vincent', coords = vector4(-1759.69, 427.25, 127.35, 76.44), model = 'csb_vincent', weapon = 'WEAPON_ASSAULTRIFLE'}
}

-- XP settings
Config.XP = {
    Use = false, -- Toggles xp system on or off; true = on, false = off
    Command = true, -- Toggles xp command on or off; true = on, false = off
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line included in readme this is also your /drugxp command
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8)
        1000, -- level 2 
        1250, -- level 3 
        1562, -- level 4
        1953, -- level 5
        2441, -- level 6 
        3051, -- level 7
        3814, -- level 8
        4768, -- level 9
        5960, -- level 10
        7450, -- level 11    
        9312, -- level 12      
        11640, -- level 13
        14550, -- level 14
        18188, -- level 15
        22735, -- level 16
        28419, -- level 17
        35524, -- level 18
        44405, -- level 19
        55506, -- level 20
        69383, -- level 21
        86729, -- level 22
        108411, -- level 23
        135514, -- level 24
        169393, -- level 25 -- Max level morphine cutting
        211741, -- level 26
        264677, -- level 27
        330846, -- level 28
        413558, -- level 29 -- Max level heroin cutting
        516947, -- level 30
        646184, -- level 31
        807730, -- level 32
        1009663, -- level 33 -- Max level crack cutting
        1262079, -- level 34
        1577598, -- level 35 
        1971998, -- level 36
        2464998, -- level 37 -- Max level meth cutting
        3081247, -- level 38 
        3851559, -- level 39
        4814449, -- level 40
        6018062, -- level 41 -- Max level coke cutting
    }
}

Config.JobSettings = {
    Blacklist = {
        Jobs = { -- Blacklisted job list; these jobs cannot access drug locations whilst on duty
            {name = 'ambulance'}

            -- You can add as many jobs here as required. Example below;
            -- {name = 'police'},
            -- {name = 'dea'},
            -- {name = 'fib'}
        }
    },
    Services = {
        Jobs = { -- Service job list; these jobs will receive alerts and cannot access drug locations whilst on duty
            {name = 'police'}

            -- You can add as many jobs here as required. Example below;
            -- {name = 'police'},
            -- {name = 'dea'},
            -- {name = 'fib'}
        }
    }
}

-- Store settings
Config.Stores = {
    Weed = {
        SmokeShop = {
            Times = {
                Use = true, -- Enables time locks; true = enabled, false = disabled
                Start = 18, -- Time you can access
                End = 21 -- Cut off time
            },
            Money = {
                UseItem = false, -- Toggle cash as item; true = CashItem reward, false = MoneyType reward
                Type = 'cash', -- Money type rewarded for bulk selling; 'cash', 'bank', 'crypto' etc...
                Item = 'dirtycash', -- Name of your cash item in your city
            },
            Items = { -- Items available for sale in smoke on the water                 
                [1] = {name = 'empty_weed_bag', price = 2, amount = 1000, info = {}, type = 'item', slot = 1},
                [2] = {name = 'rollingpapers', price = 1, amount = 2000, info = {}, type = 'item', slot = 2},
                [3] = {name = 'lighter', price = 2, amount = 1000, info = {}, type = 'item', slot = 3},
                [4] = {name = 'trowel', price = 100, amount = 1000, info = {}, type = 'item', slot = 4},
                [5] = {name = 'distilled_water', price = 2, amount = 1000, info = {}, type = 'item', slot = 5},
                [6] = {name = 'weed_fertilizer', price = 25, amount = 1000, info = {}, type = 'item', slot = 6},
                [7] = {name = 'drug_shears', price = 100, amount = 1000, info = {}, type = 'item', slot = 7},
                [8] = {name = 'drug_scales', price = 1200, amount = 100, info = {}, type = 'item', slot = 8},
                [9] = {name = 'drug_grinder', price = 10, amount = 100, info = {}, type = 'item', slot = 9},
                [10] = {name = 'weed_skunk_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 10},
                [11] = {name = 'weed_skunk_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 11},
                [12] = {name = 'weed_og-kush_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 12},
                [13] = {name = 'weed_og-kush_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 13},
                [14] = {name = 'weed_white-widow_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 14},
                [15] = {name = 'weed_white-widow_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 15},
                [16] = {name = 'weed_ak47_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 16},
                [17] = {name = 'weed_ak47_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 17},
                [18] = {name = 'weed_amnesia_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 18},
                [19] = {name = 'weed_amnesia_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 19},
                [20] = {name = 'weed_purple-haze_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 20},
                [21] = {name = 'weed_purple-haze_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 21},
                [22] = {name = 'weed_gelato_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 22},
                [23] = {name = 'weed_gelato_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 23},
                [24] = {name = 'weed_zkittlez_seed_m', price = 10, amount = 100, info = {}, type = 'item', slot = 24},
                [25] = {name = 'weed_zkittlez_seed_f', price = 80, amount = 100, info = {}, type = 'item', slot = 25}
            },	
            Drugs = { 
                Bags = { -- Bags are 50% of the street sale minimum prices if you are using BOII-DRUGSALES *(adjust these however you like)*
                    ['weed_skunk'] = 5,
                    ['weed_og-kush'] = 8,
                    ['weed_white-widow'] = 10,
                    ['weed_ak47'] = 13,
                    ['weed_amnesia'] = 15,
                    ['weed_purple-haze'] = 18,
                    ['weed_gelato'] = 25,
                    ['weed_zkittlez'] = 30
                }
            }
        }
    },
    Heroin = {
        Pharmacy = {
            Times = {
                Use = true, -- Enables time locks; true = enabled, false = disabled
                Start = 18, -- Time you can access
                End = 21 -- Cut off time
            },
            Items = { -- Items sold by pharamacy do not remove the required items unless you plan to add your own method to aquire them
                [1] = { name = 'emptyvial', price = 5, amount = 100, info = {}, type = 'item', slot = 1 }, -- Required
                [2] = { name = 'sterilewater', price = 2, amount = 100, info = {}, type = 'item', slot = 2 }, -- Required
                [3] = { name = 'syringe', price = 5, amount = 100, info = {}, type = 'item', slot = 3 }, -- Required
                [4] = { name = 'aceticacid', price = 10, amount = 100, info = {}, type = 'item', slot = 4 }, -- Required
                [5] = { name = 'painkillers', price = 35, amount = 100, info = {}, type = 'item', slot = 5 },
                [6] = { name = 'bandage', price = 10, amount = 100, info = {}, type = 'item', slot = 6 },     
            },
        },
        Morphine = {
            BlackMarket = {
                Items = { -- Black market items stocked by processing peds
                    [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                    [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                    [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                    [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                    [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                    [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                    [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7}, -- Required
                    [8] = { name = 'razorblade', price = 20, amount = 50, info = {}, type = 'item', slot = 8} -- Required
                }
            }
        },
        HeroinBase = {
            BlackMarket = {
                Items = { -- Black market items stocked by processing peds
                    [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                    [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                    [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                    [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                    [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                    [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                    [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7}, -- Required
                    [8] = { name = 'razorblade', price = 20, amount = 50, info = {}, type = 'item', slot = 8} -- Required
                }
            }
        },
        Heroin = {
            BlackMarket = {
                Items = { -- Black market items stocked by processing peds
                    [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                    [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                    [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                    [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                    [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                    [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                    [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7}, -- Required
                    [8] = { name = 'razorblade', price = 20, amount = 50, info = {}, type = 'item', slot = 8} -- Required
                }
            }
        }
    },
    Meth = {
        BlackMarket = {
            Items = { -- Black market items stocked by processing peds
                [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7} -- Required
            }
        }
    },
    Cocaine = {
        Cocaine = {
            BlackMarket = {
                Items = { -- Black market items stocked by processing peds
                    [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                    [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                    [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                    [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                    [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                    [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                    [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7} -- Required
                }
            }
        },
        Crack = {
            BlackMarket = {
                Items = { -- Black market items stocked by processing peds
                    [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                    [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                    [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                    [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                    [5] = { name = 'trowel', price = 100, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                    [6] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                    [7] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 7} -- Required
                }
            }
        }
    },
    BulkSelling = {
        Times = {
            Use = true, -- Enables time locks; true = enabled, false = disabled
            Start = 18, -- Time you can access
            End = 21 -- Cut off time
        },
        Money = {
            UseItem = false, -- Toggle cash as item; true = CashItem reward, false = MoneyType reward
            Type = 'cash', -- Money type rewarded for bulk selling; 'cash', 'bank', 'crypto' etc...
            Item = 'dirtycash', -- Name of your cash item in your city
        },
        Drugs = { -- Bulkselling drugs list
            Bags = { -- Adjust prices here
                ['ketamine'] = 15,
                ['morphinebaggy'] = 20,
                ['heroinbaggy'] = 25,
                ['morphine'] = 30,
                ['liquidheroin'] = 35,
                ['crack_baggy'] = 40,
                ['meth'] = 50,
                ['cokebaggy'] = 65,
            },
            Ounces = { -- Adjust prices here
                ['ketamine_1oz'] = 420,
                ['heroin_1oz'] = 630,
                ['crack_1oz'] = 840,
                ['meth_1oz'] = 945,
                ['coke_1oz'] = 1050,
            } 
        },
        BlackMarket = {
            Items = { -- Black market items stocked by processing peds
                [1] = { name = 'lockpick',      price = 300,   amount = 100, info = {}, type = 'item', slot = 1 },
                [2] = { name = 'burnerphone',   price = 200,   amount = 100, info = {}, type = 'item', slot = 2 },
                [3] = { name = 'tracker_remover',   price = 500,   amount = 100, info = {}, type = 'item', slot = 3 },
            }
        }
    }
}

-- Drug materials settings
Config.DrugMaterials = {
    Shared = {
        Hydrochloric = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_ind_mech_01c'}, -- Prop used for hydrochloric if you wish to change the prop do so here
            Time = math.random(8,15), -- Time in (s) to collect hydrochloric
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 70, -- Chance to collect hydrochloric acid successfully 10 = 10% - 100 = 100%
            Alert = 30, -- Chance to send alert to police on failiure to collect
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            Required = {name = 'plasticjerrycan', label = 'Plastic Jerrycan'}, -- Item required to collect hydrochloric acid
            Return = {name = 'hydrochloricacid', label = 'Hydrochlorid Acid'}, -- Item returned by collecting hydrochloric acid
            Stress = math.random(1,8) -- Stress gained by failing to collect hydrochloric acid
        },
        ConstructionSite = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 9 -- Animation flags for progress bar
            },
            Prop = {'prop_cons_cements01'}, -- Prop used for building materials if you wish to change the prop do so here
            Time = math.random(2,4), -- Time in (s) to collect building materials
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 70, -- Chance to collect building materials successfully 10 = 10% - 100 = 100%
            Alert = 30, -- Chance to send alert to police on failiure to collect
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            Stress = math.random(1,8), -- Stress gained by failing to collect building materials
            RewardItems = {
                'cement',
                'iron',
                'steel',
                'copper',
                'rubber',
                --'slakedlime', -- REQUIRED
            }
        }
    },
    Heroin = {
        Opium = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 9 -- Animation flags for progress bar
            },
            Field = vector3(-2305.91, 2526.83, 3.08), -- Location of plants change the coords here to move the field
            Prop = 'prop_plant_cane_01a', -- Plant prop to spawn at field location
            Plants = 12, -- Amount of plants to spawn
            Distance = 100, -- How close/far you should be to spawn/delete plants
            Range = 2.0, -- Range between yourself and closest prop type
            Time = math.random(2,5), -- Time in (s) to harvest plants
            Chance = 75, -- Chance to harvest plants successfully 10 = 10% - 100 = 100%
            Stress = math.random(1,8), -- Stress gained by failing to pick plants
            Required = {name = 'razorblade', label = 'Razorblade'}, -- Item required to prospect rocks
            Return = {name = 'opium', label = 'Opium Sap'}, -- Item to receive from plants
        },
        Ether = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_barrel_exp_01a'}, -- Prop used if you wish to change the prop do so here
            Time = math.random(10,16), -- Time in (s) to collect 
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 70, -- Chance to collect successfully 10 = 10% - 100 = 100%
            Alert = 100, -- Chance to send alert to police on failiure to collect
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            Stress = math.random(1,8), -- Stress gained by failing to collect
            Required = {name = 'plasticjerrycan', label = 'Plastic Jerrycan'}, -- Item required to collect 
            Return = {name = 'ether', label = 'Ether'}, -- Item returned by collecting 
        },
    },
    Meth = {
        Methylamine = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_barrel_02b'}, -- Prop used for methylamine if you wish to change the prop do so here
            Time = math.random(10,16), -- Time in (s) to collect methylamine
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 60, -- Chance to collect methylamine successfully 10 = 10% - 100 = 100%
            Alert = 100, -- Chance to send alert to police on failiure to collect
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            Stress = math.random(1,8), -- Stress gained by failing to collect methylamine
            Required = {name = 'plasticjerrycan', label = 'Plastic Jerrycan'}, -- Item required to collect methylamine
            Return = {name = 'methylamine', label = 'Methylamine'}, -- Item returned by collecting methylamine
        },
        Acetone = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_boxpile_07d'}, -- Prop used for acetone boxes if you wish to change the prop do so here
            Time = math.random(8,14), -- Time in (s) to collect from acetone boxes
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 75, -- Chance to collect from acetone boxes successfully 10 = 10% - 100 = 100%
            Alert = 100, -- Chance to send alert to police on failiure to collect
            Stress = math.random(1,8), -- Stress gained by failing to collect from acetone boxes
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            RewardItems = { -- Reward items for searching acetone boxes you can add anything here
                'iron',
                'steel',
                'copper',
                'rubber',
                'acetone', -- REQUIRED
            }
        },
        Lithium = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Field = vector3(2827.85, -626.65, 2.0), -- Location of prospecting rocks change the coords here to move
            Prop = 'prop_rock_1_i', -- Prospecting rocks prop to spawn at field location
            Rocks = 15, -- Amount of rocks to spawn
            Distance = 100, -- How close/far you should be to spawn/delete rocks
            Range = 2.0, -- Range between yourself and closest prop type
            Time = math.random(5,10), -- Time in (s) to prospect rocks 
            Chance = 75, -- Chance to prospect rocks successfully 10 = 10% - 100 = 100%
            Stress = math.random(1,8), -- Stress gained by failing to prospect rocks
            Required = {name = 'trowel', label = 'Trowel'}, -- Item required to prospect rocks
            RewardItems = { -- Reward items for prospecting rocks you can add anything here 
                'iron',
                'steel',
                'copper',
                'rubber',
                'lithium', -- REQUIRED
            }
        }
    },
    Cocaine = {
        CocaPlants = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 9 -- Animation flags for progress bar
            },
            Field = vector3(2829.24, -1468.1, 11.43), -- Location of coca plants change the coords here to move the field
            Prop = 'prop_bush_dead_02', -- Cocaine plant prop to spawn at field location
            Plants = 15, -- Amount of plants to spawn
            Distance = 100, -- How close/far you should be to spawn/delete cocaplants
            Range = 2.0, -- Range between yourself and closest prop type
            Time = math.random(2,5), -- Time in (s) to harvest coca plants
            Chance = 75, -- Chance to harvest coca plants successfully 10 = 10% - 100 = 100%
            Stress = math.random(1,8), -- Stress gained by failing to pick coca plants
            Required = {name = 'drug_shears', label = 'Timming Shears'}, -- Item required to prospect rocks
            Return = {name = 'cocaleaf', label = 'Coca Leaves'}, -- Item to receive from coca plants
        },
        IllegalGasoline = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_air_fueltrail2'}, -- Prop used for illegal gasoline if you wish to change the prop do so here
            Time = math.random(8,15), -- Time in (s) to collect illegal gasoline
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 50, -- Chance to collect illegal gasoline successfully 10 = 10% - 100 = 100%
            Alert = 100, -- Chance to send alert to police on failiure to collect 10 = 10% - 100 = 100%
            Stress = math.random(1,8), -- Stress gained by failing to collect illegal gasoline
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            Required = {name = 'plasticjerrycan', label = 'Plastic Jerrycan'}, -- Item required to collect illegal gasoline
            Return = {name = 'illegalgasoline', label = 'Illegal Gasoline'}, -- Item returned by collecting illegal gasoline
        },
        Benzocaine = {
            Animations = {
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictonary for progress bar
                Anim = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
                Flags = 49 -- Animation flags for progress bar
            },
            Prop = {'prop_air_cargo_01b'}, -- Prop used for building materials if you wish to change the prop do so here
            Time = math.random(8,14), -- Time in (s) to collect building materials
            Range = 2.0, -- Range between yourself and closest prop type
            Chance = 50, -- Chance to collect building materials successfully 10 = 10% - 100 = 100%
            Alert = 100, -- Chance to send alert to police on failiure to collect
            Stress = math.random(1,8), -- Stress gained by failing to collect building materials
            Cooldown = 60, -- Cooldown timer in (mins) 10 = 10mins, 15 = 15mins, etc etc..
            RewardItems = { -- High chance reward items for searching airplane carts you can add anything here
                'goldchain',
                'iphone',
                'samsungphone',
                'rolex',
                'bandage',
                'tosti',
                'kurkakola',
                'vodka',
                'whiskey',
                'benzocaine', -- REQUIRED
            },
        },
        Water = {
            Animations = {
                Dict = 'timetable@gardener@filling_can', -- Animation dictonary for progress bar
                Anim = 'gar_ig_5_filling_can', -- Animation for progress bar
                Flags = 9 -- Animation flags for progress bar
            },
            Height = 0.5, -- Adjust the height for getwaterweight check
            Time = math.random(5,10), -- Time in (s) to collect water
            Required = {name = 'plasticjerrycan', label = 'Plastic Jerrycan'}, -- Item required to collect illegal gasoline
            Return = {name = 'water_jerrycan', label = 'Jerrycan of Water'}, -- Item returned by collecting illegal gasoline
        },
    }
}

-- Drug processing
Config.Processing = {
    Heroin = {
        Morphine = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing 
                End = 21 -- Cut off time for processing 
            },
            Time = math.random(10,18), -- Time in (s) to process 
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'opium', label = 'Opium Sap', amount = 11},
                ['2'] = {name = 'slakedlime', label = 'Slaked Lime', amount = 5},
                ['3'] = {name = 'ammonia', label = 'Concentrated Ammonia', amount = 4}
            },
            Return = {name = 'morphinebase', label = 'Morphine Base'}
        },
        HeroinBase = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing 
                End = 21 -- Cut off time for processing 
            },
            Time = math.random(10,18), -- Time in (s) to process 
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'morphinebase', label = 'Morphine Base', amount = 2},
                ['2'] = {name = 'aceticacid', label = 'Acetic Acid', amount = 5},
                ['3'] = {name = 'sodiumcarbonate', label = 'Sodium Carbonate', amount = 2}
            },
            Return = {name = 'heroinbase', label = 'Heroin Base',}
        },
        Heroin = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing 
                End = 21 -- Cut off time for processing 
            },
            Time = math.random(10,18), -- Time in (s) to process 
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'heroinbase', label = 'Heroin Base', amount = 1},
                ['2'] = {name = 'hydrochloricacid', label = 'Hydrochloric Acid', amount = 3},
                ['3'] = {name = 'ether', label = 'Petroleum Ether', amount = 4}
            },
            Return = {name = 'heroin_1oz', label = 'Ounce of Heroin'}
        }
    },
    Meth = {
        Meth = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing 
                End = 21 -- Cut off time for processing 
            },
            Time = math.random(10,18), -- Time in (s) to process 
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'methylamine', label = 'Methylamine', amount = 3},
                ['2'] = {name = 'hydrochloricacid', label = 'Hydrochloric Acid', amount = 5},
                ['3'] = {name = 'acetone', label = 'Acetone', amount = 2},
                ['4'] = {name = 'lithium', label = 'Lithium', amount = 6}
            },
            Return = {name = 'meth_1oz', label = 'Ounce of Meth'}
        }
    },
    Cocaine = {
        Crack = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing 
                End = 21 -- Cut off time for processing 
            },
            Time = math.random(10,18), -- Time in (s) to process
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'coke_1oz', label = 'Ounce of Cocaine', amount = 1},
                ['2'] = {name = 'sodiumbicarbonate', label = 'Sodium Bicarbonate', amount = 5},
                ['3'] = {name = 'water_jerrycan', label = 'Jerrycan of Water', amount = 3}
            },
            Return = {name = 'crack_1oz', label = 'Ounce of Crack'}
        },
        Cocaine = {
            Animations = {
                Dict = 'anim@amb@board_room@supervising@', -- Animations used to process
                Anim = 'think_01_hi_amy_skater_01', -- Animations used to process
                Flags = 49 -- Animation flags used to process
            },
            Times = {
                Use = true, -- Enables time locks on processing; true = enabled, false = disabled - can process 24/7
                Start = 10, -- Time you can start processing
                End = 21 -- Cut off time for processing
            },
            Time = math.random(10,18), -- Time in (s) to process
            Alert = 0, -- Chance to send alert to police when processing
            Required = {
                ['1'] = {name = 'cocaleaf', label = 'Coca Leaf', amount = 10},
                ['2'] = {name = 'illegalgasoline', label = 'Illegal Gasoline', amount = 3},
                ['3'] = {name = 'cement', label = 'Cement', amount = 3},
                ['4'] = {name = 'benzocaine', label = 'Benzocaine', amount = 5}
            },
            Return = {name = 'coke_1oz', label = 'Ounce of Cocaine'}
        }
    }
}

-- Drug cutting
Config.DrugCutting = {
    Shared = {
        Animations = {
            Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dictonary for cutting drugs
            Anim = 'base_female', -- Animation for cutting drugs
            Flags = 49, -- Animation flags for cutting drugs
        },
        Time = math.random(2,4), -- Time in (s) to cut drugs
        Required = {
            ['1'] = { name = 'drug_cuttingkit', label = 'Cutting Kit' },
            ['2'] = { name = 'drug_scales', label = 'Scales' }
        }
    },
    Heroin = {
        Morphine = {
            Required = {
                ['1'] = {name = 'empty_weed_bag', label = 'Resealable Bags'},
                ['2'] = {name = 'morphinebase', label = 'Morphine Base'}
            },
            Return = {name = 'morphinebaggy', label = 'Bag of Morphine'}
        },
        Heroin = {
            Required = {
                ['1'] = {name = 'empty_weed_bag', label = 'Resealable Bags'},
                ['2'] = {name = 'heroin_1oz', label = 'Ounce of Heroin'}
            },
            Return = {name = 'heroinbaggy', label = 'Bag of Heroin'}
        }
    },
    Meth = {
        Meth = {
            Required = {
                ['1'] = {name = 'empty_weed_bag', label = 'Resealable Bags'},
                ['2'] = {name = 'meth_1oz', label = 'Ounce of Meth'}
            },
            Return = {name = 'meth', label = 'Bag of Meth'}
        }
    },
    Cocaine = {
        Crack = {
            Required = {
                ['1'] = {name = 'empty_weed_bag', label = 'Resealable Bags'},
                ['2'] = {name = 'crack_1oz', label = 'Ounce of Crack'}
            },
            Return = {name = 'crack_baggy', label = 'Bag of Crack'}
        },
        Cocaine = {
            Required = {
                ['1'] = {name = 'empty_weed_bag', label = 'Resealable Bags'},
                ['2'] = {name = 'coke_1oz', label = 'Ounce of Cocaine'}
            },
            Return = {name = 'cokebaggy', label = 'Bag of Cocaine'}
        }
    }
}

Config.PrepDrugs = {
    Heroin = {
        Morphine = {
            Animations = {
                Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dictonary for cutting drugs
                Anim = 'base_female', -- Animation for cutting drugs
                Flags = 49, -- Animation flags for cutting drugs
            },
            Time = math.random(5,8), -- Time in (s) to prepare
            Required = {
                ['1'] = {name = 'sterilewater', label = 'Sterile Water'},
                ['2'] = {name = 'emptyvial', label = 'Empty Vial'}
            },
            Return = {name = 'morphine', label = 'Morphine'}
        },
        Heroin = {
            Animations = {
                Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dictonary for cutting drugs
                Anim = 'base_female', -- Animation for cutting drugs
                Flags = 49, -- Animation flags for cutting drugs
            },
            Time = math.random(5,8), -- Time in (s) to prepare
            Required = {
                ['1'] = {name = 'sterilewater', label = 'Sterile Water'},
                ['2'] = {name = 'emptyvial', label = 'Empty Vial'}
            },
            Return = {name = 'liquidheroin', label = 'Liquid Heroin'}
        }
    }
}

-- Drug taking settings
Config.TakeDrugs = {
    Heroin = {
        Morphine = {
            Animations = {
                Dict = 'amb@world_human_hang_out_street@female_hold_arm@idle_a', -- Animation dictonary for taking 
                Anim = 'idle_a', -- Animation for taking 
                Flags = 49 -- Animation flags for taking 
            },
            Effects = true, -- Enables screen effects; true = enabled, false = disabled 
            Time = math.random(2,5), -- Time in (s) to take
            Required = {name = 'syringe', label = 'Syringe'}
        },
        Heroin = {
            Animations = {
                Dict = 'amb@world_human_hang_out_street@female_hold_arm@idle_a', -- Animation dictonary for taking 
                Anim = 'idle_a', -- Animation for taking 
                Flags = 49 -- Animation flags for taking 
            },
            Effects = true, -- Enables screen effects; true = enabled, false = disabled 
            Time = math.random(2,5), -- Time in (s) to take
            Required = {name = 'syringe', label = 'Syringe'}
        }
    },
    Meth = {
        Meth = {
            Animations = {
                Dict = 'switch@trevor@trev_smoking_meth', -- Animation dictonary for taking 
                Anim = 'trev_smoking_meth_loop', -- Animation for taking 
                Flags = 49 -- Animation flags for taking 
            },
            Effects = true, -- Enables screen effects; true = enabled, false = disabled 
            Time = math.random(5,8) -- Time in (s) to take 
        }
    },
    Cocaine = {
        Crack = {
            Animations = {
                Dict = 'switch@trevor@trev_smoking_meth', -- Animation dictonary for taking 
                Anim = 'trev_smoking_meth_loop', -- Animation for taking 
                Flags = 49 -- Animation flags for taking 
            },
            Effects = true, -- Enables screen effects; true = enabled, false = disabled 
            Time = math.random(5,8), -- Time in (s) to take
            Required = {name = 'lighter', label = 'Lighter'}
        },
        Cocaine = {
            Animations = {
                Dict = 'switch@trevor@trev_smoking_meth', -- Animation dictonary for taking 
                Anim = 'trev_smoking_meth_loop', -- Animation for taking 
                Flags = 49 -- Animation flags for taking 
            },
            Effects = true, -- Enables screen effects; true = enabled, false = disabled 
            Time = math.random(5,8) -- Time in (s) to take
        }
    }
} 

-- Weed settings
Config.Plants = {
    Outdoor = {
        UseTarget = true, -- Enables/disables qb-target for plants; true = qb-target enabled, false = in range check enabled
        Growth = {
            Timer = 1, -- Plant update timer in (mins) this directly affects the growth rate of strains defined server side
            Defaults = {
                Hunger = 15, -- Amount of hunger plants will start with by default
                Thirst = 12, -- Amount of thirst plants will start with by default
                Quality = 16 -- Amount of quality plants will start with by default
            }
        },
        Props = {
            ['state'] = {
                -- Edit props and prop height here
                s1 = {'bkr_prop_weed_bud_01b', -1.035},
                s2 = {'bkr_prop_weed_med_01a', -4.80},
                s3 = {'bkr_prop_weed_med_01a', -4.55},
                s4 = {'bkr_prop_weed_lrg_01a', -4.40},
                s5 = {'bkr_prop_weed_lrg_01a', -4.25},
                s6 = {'bkr_prop_weed_lrg_01a', -4.18}
            }
        },
        Actions = {
            Plant = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 9, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,2), -- Time in (s) to plant seeds
                Range = 1.5, -- Range check for planting to close to another plant
                OnlyOutdoors = true, -- Enables/disables ground type checks; true = enables, false = disabled
                Required = {name = 'trowel', label = 'Trowel'} -- Item required to plant seeds
            },
            Harvest = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(3,8), -- Time in (s) to harvest plants
                Required = {name = 'drug_shears', label = 'Trimming Shears'} -- Item required to harvest plants
            },
            Feed = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to feed plants
                Increase = math.random(10,20), -- Amount to increase hunger on feeding
                Quality = 0.3, -- Amount of quality to increase on feeding 0.5 = 50% "Increase" amount
                Required = {name = 'weed_fertilizer', label = 'Big Bud Fertilizer'}
            },
            Water = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to water plants
                Increase = math.random(10,20), -- Amount to increase thirst on watering
                Quality = 0.3, -- Amount of quality to increase on watering 0.5 = 50% "Increase" amount
                Required = {name = 'distilled_water', label = 'Distilled Water'}
            },
            Destroy = {
                Animations = {
                    Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'weed_spraybottle_crouch_base_inspector', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 9, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(1,3), -- Time in (s) to destroy plants
                AutoDelete = true -- Enables auto deletion of plants when hunger/thirst/quality is below 1
            },
            Trimming = {
                Animations = {
                    Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'base_female', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(7,13), -- Time in (s) to trim crops
                Required = {
                    ['1'] = {name = 'drug_shears', label = 'Trimming Shears'},
                    ['2'] = {name = 'drug_scales', label = 'Scales'},
                    ['3'] = {name = 'empty_weed_bag', label = 'Resealable Bags'}
                }
            },
            Rolling = {
                Animations = {
                    Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'base_female', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                },
                Time = math.random(5,8), -- Time in (s) to water plants
                Required = {
                    ['1'] = {name = 'drug_grinder', label = 'Grinder'},
                    ['2'] = {name = 'rollingpapers', label = 'Rolling Paper', amount = 2}
                }
            }, 
            Smoking = {
                Animations = {
                    Dict = 'timetable@gardener@smoking_joint', -- Animation dict; https://wiki.gtanet.work/index.php?title=Animations
                    Anim = 'smoke_idle', -- Animation; https://wiki.gtanet.work/index.php?title=Animations
                    Flags = 49, -- Animation flags refer to; https://docs.fivem.net/natives/?_0xEA47FE3719165B94
                    Prop = 'prop_sh_joint_01', -- Prop; https://forge.plebmasters.de/objects
                    Bone =  57005, -- Bone index refer to; https://wiki.gtanet.work/index.php?title=Bones
                    Coords = vector3(0.12, 0.03, -0.05), -- Prop coordinates
                    Rotation = vector3(0.0, 10.0, 70.0), -- Prop rotation
                },
                Time = math.random(5,10), -- Time in (s) to smoke joints
                Effects = true, -- Enables or disable screen effects; true = enables, false = disabled
                Required = {name = 'lighter', label = 'Lighter'}
            }
        }
    }
}

-- Drug selling settings
Config.DrugSales = {
    Street = {
        Times = {
            Use = true, -- Enables time locks; true = enabled, false = disabled
            Start = 18, -- Time you can access
            End = 21 -- Cut off time
        },
        Money = {
            UseItem = false, -- Toggle cash as item; true = CashItem reward, false = MoneyType reward
            Type = 'cash', -- Money type rewarded for bulk selling; 'cash', 'bank', 'crypto' etc...
            Item = 'dirtycash' -- Name of your cash item in your city
        },
        Cops = 0, -- Number of active cops required to sell drugs
        Sale = 20, -- Chance in % for successful sale
        Steal = 40, -- Chance in % for peds to steal
        Alert = 10, -- Chance in % for peds to alertcops
        Drugs = { -- Your street selling drugs list add your servers drugs here; drugs sell from top down; if you have bags of weed and bags of coke you will sell the weed first!
            {name = 'weed_skunk', label = 'Bag of Skunk', minprice = 30, maxprice = 42, minamount = 1, maxamount = 12},
            {name = 'weed_og-kush', label = 'Bag of OG Kush', minprice = 33, maxprice = 45, minamount = 1, maxamount = 10},
            {name = 'weed_white-widow', label = 'Bag of White-Widow', minprice = 36, maxprice = 47, minamount = 1, maxamount = 14},
            {name = 'weed_ak47', label = 'Bag of AK47', minprice = 39, maxprice = 49, minamount = 1, maxamount = 11},
            {name = 'weed_amnesia', label = 'Bag of Amnesia', minprice = 42, maxprice = 51, minamount = 1, maxamount = 9},
            {name = 'weed_purple-haze', label = 'Bag of Purple Haze', minprice = 45, maxprice = 53, minamount = 1, maxamount = 8},
            {name = 'weed_gelato', label = 'Bag of Purple Haze', minprice = 48, maxprice = 55, minamount = 1, maxamount = 9},
            {name = 'weed_zkittlez', label = 'Bag of Purple Haze', minprice = 45, maxprice = 57, minamount = 1, maxamount = 10},
            {name = 'ketamine', label = 'Bag of Ketamine', minprice = 20, maxprice = 51, minamount = 4, maxamount = 12},
            {name = 'morphinebaggy', label = 'Bag of Morphine', minprice = 25, maxprice = 58, minamount = 3, maxamount = 10},
            {name = 'morphine', label = 'Vial of Morphine', minprice = 40, maxprice = 67, minamount = 3, maxamount = 8},
            {name = 'heroinbaggy', label = 'Bag of Heroin', minprice = 35, maxprice = 62, minamount = 5, maxamount = 15},
            {name = 'liquidheroin', label = 'Vial of Heroin', minprice = 51, maxprice = 80, minamount = 5, maxamount = 11},
            {name = 'crack_baggy', label = 'Bag of Crack', minprice = 61, maxprice = 96, minamount = 3, maxamount = 8},
            {name = 'meth', label = 'Bag of Meth', minprice = 83, maxprice = 116, minamount = 5, maxamount = 10},
            {name = 'cokebaggy', label = 'Bag of Cocaine', minprice = 91, maxprice = 152, minamount = 2, maxamount = 12}
        },
        Peds = {
            Blacklist = { -- Ped blacklist; add any peds here you do not want to be able to sell drugs too
				'ig_avon',
				'ig_stretch',
				'ig_chef2',
				'u_m_m_willyfist',
				'ig_terry',
				'ig_ashley',
				'u_m_y_hippie_01',
				's_m_m_doctor_01',
				'cs_martinmadrazo',
                'csb_vincent',
                'mp_m_shopkeep_01',
                's_m_y_ammucity_01',
                'a_m_y_stwhi_01',
				
            }
        }
    },
    Deliveries = {
        Times = {
            Use = true, -- Enables time locks; true = enabled, false = disabled
            Start = 18, -- Time you can access
            End = 21 -- Cut off time
        },
        Money = {
            UseItem = false, -- Toggle cash as item; true = CashItem reward, false = MoneyType reward
            Type = 'cash', -- Money type rewarded for bulk selling; 'cash', 'bank', 'crypto' etc...
            Item = 'dirtycash' -- Name of your cash item in your city
        },
        Cops = 0, -- Number of active cops required to sell drugs
        Timer = 20, -- Time in (s) to receive delivery
        Cooldown = 5, -- Time in (mins) to be able to request another delivery
        Ped = {{model = 'a_m_y_stwhi_01', hash = 0x2418C430, event = 'boii-drugs:cl:MakeDelivery', icon = 'fa-solid fa-comment', label = 'Offer Drugs', scenario = 'WORLD_HUMAN_SMOKING', distance = 2.0}}, -- Your delivery ped; model, scenario
        Drugs = { -- Your delivery drugs these are 28*bag prices -25%; adjust these however you like; drugs sell from top down; if you have ounces of heroin and coke you will sell the heroin first!
            {name = 'heroin_1oz', label = 'Ounce of Heroin', minprice = 1241, maxprice = 1995},
            {name = 'crack_1oz', label = 'Ounce of Crack', minprice = 1680, maxprice = 2415},
            {name = 'meth_1oz', label = 'Ounce of Meth', minprice = 2016, maxprice = 2520},
            {name = 'coke_1oz', label = 'Ounce of Cocaine', minprice = 2100, maxprice = 2835},
        },
        Locations = {
            [1] =  { ['x'] = -790.72, ['y'] = -964.07, ['z'] = 15.16, ['h'] = 330.71},
	        [2] =  { ['x'] = 1143.71, ['y'] = -299.11, ['z'] = 68.80, ['h'] = 96.11},
	        [3] =  { ['x'] = 1104.49, ['y'] = 87.08, ['z'] = 80.89, ['h'] = 324.07},
	        [4] =  { ['x'] = 1136.46, ['y'] = -1247.57, ['z'] = 21.19, ['h'] = 124.63},
	        [5] =  { ['x'] = 979.76, ['y'] = -1659.31, ['z'] = 29.27, ['h'] = 353.66},
	        [6] =  { ['x'] = 654.00, ['y'] = -3017.50, ['z'] = 6.15, ['h'] = 359.33},
	        [7] =  { ['x'] = -991.04, ['y'] = -2634.62, ['z'] = 13.98, ['h'] = 61.12},
	        [8] =  { ['x'] = -3268.97, ['y'] = 954.53, ['z'] = 8.35, ['h'] = 268.82},
	        [9] =  { ['x'] = 1621.19, ['y'] = 3564.39, ['z'] = 35.29, ['h'] = 302.04},
	        [10] =  { ['x'] = -358.91, ['y'] = 6062.09, ['z'] = 31.50, ['h'] = 42.95}
        }
    }
}

-- Ketamine settings; - other drugs will be updated in layout for easier readability
Config.Ketamine = {
    Locations = {
        Spawn = { 
            [1] = {
                vehicle = 'rumpo2', -- Vehicle to be spawned
                driver = 's_m_m_security_01', -- Driver ped to spawn
                driverweapon = 'WEAPON_MICROSMG', -- Weapon to give driver
                passenger = 's_m_m_security_01', -- Passenger ped to spawn
                passengerweapon = 'WEAPON_MICROSMG', -- Weapon to give passenger
                coords = vector4(-488.79, 6263.74, 12.56, 63.11),  -- Coords to spawn vehicle
                blip = 67, -- Vehicle blip
                colour = 7,  -- Vehicle blip colour
                scale = 0.7, -- Vehicle blip scale
                label = 'Ketamine Vehicle', -- Vehicle blip label
                chips = math.ceil(math.random(3,5)), -- Amount of chips to find to remove tracker
                hacks = math.ceil(math.random(2,4)), -- Amount of times needed to hack to remove tracker
                hacktimer = math.ceil(math.random(30,45)), -- Amount of time to remove chips in seconds
                hackcooldown = math.ceil(math.random(30,45)), -- Cooldown timer between hacks in seconds
                reward = 'liquidketamine', -- Item rewarded on delivery
                rewardamount = math.ceil(math.random(8,15)), -- Amount to reward on delivery; scales based on cop count
                searchtimer = math.random(8,15), -- Amount of time taken to search vehicle
            },
            [2] = {
                vehicle = 'rumpo2', -- Vehicle to be spawned
                driver = 's_m_m_security_01', -- Driver ped to spawn
                driverweapon = 'WEAPON_MICROSMG', -- Weapon to give driver
                passenger = 's_m_m_security_01', -- Passenger ped to spawn
                passengerweapon = 'WEAPON_MICROSMG', -- Weapon to give passenger
                coords = vector4(1537.85, 784.91, 77.45, 64.37),  -- Coords to spawn vehicle
                blip = 67, -- Vehicle blip
                colour = 7,  -- Vehicle blip colour
                scale = 0.7, -- Vehicle blip scale
                label = 'Ketamine Vehicle', -- Vehicle blip label
                chips = math.ceil(math.random(3,5)), -- Amount of chips to find to remove tracker
                hacks = math.ceil(math.random(2,4)), -- Amount of times needed to hack to remove tracker
                hacktimer = math.ceil(math.random(30,45)), -- Amount of time to remove chips in seconds
                hackcooldown = math.ceil(math.random(30,45)), -- Cooldown timer between hacks in seconds
                reward = 'liquidketamine', -- Item rewarded on delivery
                rewardamount = math.ceil(math.random(8,15)), -- Amount to reward on delivery; scales based on cop count
                searchtimer = math.random(8,15), -- Amount of time taken to search vehicle
            }
            -- Add more spawn locations here
        },
        Delivery = {
            [1] = {
                coords = vector3(-558.16, -1691.61, 19.27),  -- Coords to add blip to map
                blip = 67, -- Delivery location blip
                colour = 7,  -- Delivery location colour
                scale = 0.7, -- Delivery location alpha
                label = 'Ketamine Delivery', -- Vehicle blip label
            },
            [2] = {
                coords = vector3(2409.28, 3037.45, 48.15),  -- Coords to add blip to map
                blip = 67, -- Delivery location blip
                colour = 7,  -- Delivery location colour
                scale = 0.7, -- Delivery location alpha
                label = 'Ketamine Delivery', -- Vehicle blip label
            }
            -- Add more delivery locations here
        },
        Processing = {
            {name = 'ket_table1', coords = vector4(-1358.82, -759.11, 22.3, 177.04), model = 'v_ret_ml_tableb', icon = 'fa-solid fa-flask-vial', label = 'Ketamine Processing', event = 'boii-drugs:cl:KetProcessingMenu', distance = 2.0},
            {name = 'ket_table2', coords = vector4(-1360.84, -756.04, 22.3, 77.8), model = 'v_ret_ml_tableb', icon = 'fa-solid fa-flask-vial', label = 'Ketamine Processing', event = 'boii-drugs:cl:KetProcessingMenu', distance = 2.0}
        },
    },
    Worker = {
        Times = {
            Use = true, -- Toggle time locks for store
            Open = 6, -- Open time for store
            Close = 20, -- Close time for store
        },
        Emails = {
            Request = {
                Required = {name = 'phone', label = 'Phone'}, -- Item required to request emails
                Delay = math.random(10, 20), -- Time in seconds to receive request emails 
                Cooldown = 60, -- Time in mins to be able to request a new email
            },
            Delivery = {
                Delay = math.random(10, 20), -- Time in seconds to receive delivery emails 
            }
        },
        Store = {
            Items = {
                [1] = { name = 'lockpick', price = 300, amount = 100, info = {}, type = 'item', slot = 1},
                [2] = { name = 'phone', price = 700, amount = 100, info = {}, type = 'item', slot = 2},
                [3] = { name = 'radio', price = 2000, amount = 100, info = {}, type = 'item', slot = 3},
                [4] = { name = 'empty_weed_bag', price = 2, amount = 500, info = {}, type = 'item', slot = 4}, -- Required
                [5] = { name = 'drug_cuttingkit', price = 1000, amount = 50, info = {}, type = 'item', slot = 5}, -- Required
                [6] = { name = 'drug_scales', price = 1500, amount = 50, info = {}, type = 'item', slot = 6}, -- Required
                [7] = { name = 'tracker_remover', price = 500, amount = 50, info = {}, type = 'item', slot = 7} -- Required
            }
        }
    },
    Search = {
        Peds = {
            Chance = 100, -- Chance to receive money when searching peds
            Money = {
                Use = 'money', -- Type of money to return on successful search; 'money' = qb-core moneytypes *(cash, bank, crypto)*, 'item' = returns a item
                Money = 'cash', -- Money type; 'cash', 'bank', 'crypto'
                Item = {name = 'cash', label = 'Cash'}, -- Item to be returned if Money Use = false
                Amount = math.ceil(math.random(500, 1000)) -- Amount to reward
            }
        }
    },
    Tracker = {
        Delay = math.random(15, 30), -- Time in seconds to send a new location ping
        Tool = {name = 'tracker_remover', label = 'Tracking Chip Remover'}, -- Item required to remove tracker
    },
    Processing = {
        Timers = {
            Prep = math.random(8, 15), -- Time in seconds to prepare processing materials
            Wait = math.random(10, 30) -- Time in seconds to wait for processing
        },
        Required = {
            ['1'] = {name = 'liquidketamine', label = 'Liquid Ketamine', amount = 6},
            ['2'] = {name = 'distilled_water', label = 'Distilled Water', amount = 3},
            ['3'] = {name = 'sodiumbicarbonate', label = 'Sodium Bicarbonate', amount = 2}
        },
        Return = {name = 'ketamine_1oz', label = 'Ounce of Ketamine'}
    },
    Cutting = {
        Time = math.random(8, 12), -- Time in seconds to cut ounces
        Required = {
            ['1'] = {name = 'drug_cuttingkit', label = 'Cutting Kit'},
            ['2'] = {name = 'drug_scales', label = 'Scales'},
            ['3'] = {name = 'empty_weed_bag', label = 'Resealable Bags'}
        },
        Return = {name = 'ketamine', label = 'Bag of Ketamine'}
    },
    Take = {
        Time = math.random(3, 6), -- Time in seconds to take ketamine
        Effects = true, -- Toggles screen effects when taking ketamine
    }
}

-- Animations; - currently only ketamine all other anims will be moved in time
Config.Animations = {
    Tracker = {
        Connect = {
            Dict = 'mini@repair', -- Animation dictonary for connecting tool to vehicle
            Anim = 'fixing_a_ped', -- Animation for connecting tool to vehicle
            Flags = 49 -- Animation flags for connecting tool to vehicle
        }
    },
    Delivery = {
        Search = {
            Dict = 'mini@repair', -- Animation dictonary for searching vehicle
            Anim = 'fixing_a_ped', -- Animation for searching vehicle
            Flags = 49 -- Animation flags for searching vehicle
        }
    },
    Processing = {
        Prep = {
            Dict = 'timetable@gardener@filling_can', -- Animation dictionary for preparing processing materials
            Anim = 'gar_ig_5_filling_can', -- Animation for preparing processing materials
            Flags = 49 -- Animation flags for preparing processing materials
        },
        Wait = {
            Dict = 'anim@amb@board_room@supervising@', -- Animation dictionary whilst waiting for processing
            Anim = 'think_01_hi_amy_skater_01', -- Animation whilst waiting for processing
            Flags = 49 -- Animation flags whilst waiting for processing
        }
    },
    Cutting = {
        Dict = 'amb@prop_human_parking_meter@female@base', -- Animation dictonary for cutting drugs
        Anim = 'base_female', -- Animation for cutting drugs
        Flags = 49, -- Animation flags for cutting drugs
    },
    Take = {
        Dict = 'switch@trevor@trev_smoking_meth', -- Animation dictonary for taking 
        Anim = 'trev_smoking_meth_loop', -- Animation for taking 
        Flags = 49 -- Animation flags for taking 
    }
}