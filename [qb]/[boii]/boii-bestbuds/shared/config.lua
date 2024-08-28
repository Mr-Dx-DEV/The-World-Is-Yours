----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}
-- Core settings you can ignore these if you have not renamed your core
Config.CoreSettings = {
   Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    InputName = 'qb-input', -- The name of your input menu for billing. Default; qb-input
    SkillBarName = 'qb-skillbar', -- The name of your skillbar. Default; qb-skillbar
    ItemCheckEvent = 'QBCore:HasItem', -- The name of your item check event. Default; 'QBCore:HasItem'
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    DutyEvent = 'QBCore:ToggleDuty', -- The name of your duty event. Default; 'QBCore:ToggleDuty'
    AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    BossMenuEvent = 'qb-bossmenu:client:OpenMenu', -- Name of your boss menu event. Default; 'qb-bossmenu:client:OpenMenu'
    PhoneEvent = 'qs-smartphone:RefreshPhone', -- The name of your phone event this is needed for billing. Default; 'qb-phone:RefreshPhone'
    ClothingEvent = 'qb-clothing:client:openOutfitMenu', -- The name of your clothing event this is needed to open outfit menu. Default; 'qb-clothing:client:OpenOutfitMenu'
    FuelEvent = 'LegacyFuel' -- The name of your fuel event. Default; LegacyFuel
}
-- Blips
Config.Blips = {
	{title='Best Buds', colour=52, id=469, x =378.24, y = -829.53, z = 30.07, scale = 0.6, useblip = true},
}
-- Job settings
Config.JobSettings = {
    JobName = 'bestbuds', -- Name of your job in your `qb-core/shared/jobs.lua`
    MenuItem = 'bbmenu', -- Name of your menu item
    Locations = { -- Job targeting locations
        Duty = {{name = 'bb_duty', coords = vector3(375.69, -824.53, 29.3), length = 1.2, width = 1.2, heading = 181.41, debugPoly = false, minZ = 29.80, maxZ = 30.30, distance = 1.5}},
        Boss = {{name = 'bb_bossmenu', coords = vector3(373.48, -823.91, 29.3), length = 1.0, width = 1.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 29.45, distance = 1.5}},
        BossStorage = {{name = 'bb_bossstorage', coords = vector3(376.87, -824.67, 29.3), length = 1.0, width = 1.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 29.20, distance = 1.5}},
        JobStorage = {{name = 'bb_jobstorage', coords = vector3(381.27, -819.61, 29.3), length = 2.0, width = 2.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 2.0}},
        JobStore = {{name = 'bb_jobstore', coords = vector3(383.25, -827.29, 29.3), length = 1.0, width = 2.0, heading = 268.0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0}},
        SnackTable = {{name = 'bb_snacktable', coords = vector3(375.63, -829.01, 29.3), length = 1.0, width = 1.0, heading = 0.0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0}},
        Tray = {{name = 'bb_tray', coords = vector3(378.88, -827.38, 29.3), length = 1.0, width = 1.0, heading = 0.0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0}},
        EPOS = {
            {name = 'bb_epos_1', coords = vector3(380.31, -827.39, 29.3), length = 1.0, width = 1.0, heading = 0.0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0},
            {name = 'bb_epos_2', coords = vector3(375.52, -827.39, 29.3), length = 1.0, width = 1.0, heading = 0.0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0}
        },
        Harvest = {
            Strain1 = {
                {name = 'bb_strain1_1', coords = vector3(378.16, -813.24, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0},
                {name = 'bb_strain1_2', coords = vector3(378.21, -811.47, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0}
            },
            Strain2 = {
                {name = 'bb_strain2_1', coords = vector3(379.31, -813.26, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0},
                {name = 'bb_strain2_2', coords = vector3(379.34, -811.47, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0}
            },
            Strain3 = {
                {name = 'bb_strain3_1', coords = vector3(380.40, -813.34, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0},
                {name = 'bb_strain3_2', coords = vector3(380.60, -811.47, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0}
            },
            Strain4 = {
                {name = 'bb_strain4_1', coords = vector3(382.22, -813.41, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0},
                {name = 'bb_strain4_2', coords = vector3(381.78, -811.47, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0}
            },
            Strain5 = {
                {name = 'bb_strain5_1', coords = vector3(383.23, -813.41, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0},
                {name = 'bb_strain5_2', coords = vector3(382.85, -811.47, 28.43), length = 1.0, width = 1.0, heading = 180.0, debugPoly = true, minZ = 28.30, maxZ = 30.30, distance = 2.0}     
            }
        },
        Trimming = {{name = 'bb_trimming', coords = vector3(382.78, -817.55, 29.3), length = 1.0, width = 2.0, heading = 182.65, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.5}},
        Rolling = {{name = 'bb_jointrolling', coords = vector3(377.33, -827.34, 29.3), length = 1.0, width = 1.0, heading = 182.65, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.5}},
        BongTable = {{name = 'bb_bongtable', coords = vector3(382.29, -831.17, 29.3), length = 2.0, width = 2.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.5}},
        Edibles = {{name = 'bb_edibles', coords = vector3(378.43, -819.14, 29.3), length = 1.0, width = 2.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.5}},
        Clothing = {{name = 'bb_wardrobe', coords = vector3(374.82, -816.75, 29.3), length = 1.0, width = 1.5, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 1.0}},
        Garage = {{name = 'bb_garage', coords = vector3(369.66, -828.45, 29.29), length = 6.0, width = 6.0, heading = 0, debugPoly = false, minZ = 28.30, maxZ = 30.30, distance = 6.0}},
    },
    Harvest = {
        HarvestItem = 'drug_shears', -- Item required to harvest plants
        ProgressAnimationDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictionary for progress bar
        ProgressAnimation = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'v_ret_gc_scissors',
        Bone =  18905,
        Coords = vector3(0.13, 0.1, -0.03),
        Rotation = vector3(-15.0, 34.0, -30.0),
        SkillBarAnimationDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
        SkillBarAnimation = 'weed_spraybottle_crouch_idle_01_inspector',
        Strain1 = {
            Time = math.random(8,15), -- Time in (s) to harvest
            SkillBarAttempts = 2, -- Amount of successful skillbar attempts to harvest
            SkillBarDuration = math.random(2,4),
            SkillBarPosistion = math.random(10, 30),
            SkillBarWidth = math.random(10, 20),
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_skunk_cbd_crop',   label = 'CBD Skunk Crop',    amount = 3},
            }
        },
        Strain2 = {
            Time = math.random(8,15), -- Time in (s) to harvest
            SkillBarAttempts = 2, -- Amount of successful skillbar attempts to harvest
            SkillBarDuration = math.random(2,4),
            SkillBarPosistion = math.random(10, 30),
            SkillBarWidth = math.random(10, 20),
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_og-kush_cbd_crop',   label = 'CBD OG-Kush Crop',    amount = 3},
            }
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to harvest
            SkillBarAttempts = 2, -- Amount of successful skillbar attempts to harvest
            SkillBarDuration = math.random(2,4),
            SkillBarPosistion = math.random(10, 30),
            SkillBarWidth = math.random(10, 20),
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_white-widow_cbd_crop',   label = 'CBD White-Widow Crop',    amount = 3},
            }
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to harvest
            SkillBarAttempts = 2, -- Amount of successful skillbar attempts to harvest
            SkillBarDuration = math.random(2,4),
            SkillBarPosistion = math.random(10, 30),
            SkillBarWidth = math.random(10, 20),
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_ak47_cbd_crop',   label = 'CBD AK47 Crop',    amount = 3},
            }
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to harvest
            SkillBarAttempts = 2, -- Amount of successful skillbar attempts to harvest
            SkillBarDuration = math.random(2,4), -- Duration of skill bar
            SkillBarPosistion = math.random(10, 30), -- Start position of skill bar
            SkillBarWidth = math.random(10, 20), -- Width of skill bar
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_amnesia_cbd_crop',   label = 'CBD Amnesia Crop',    amount = 3},
            }
        }
    },
    Trimming = {
        ProgressAnimationDict = 'amb@prop_human_parking_meter@female@base',
        ProgressAnimation = 'base_female',
        ProgressFlags = 49,
        ProgressProp = 'h4_prop_h4_weed_bud_02b',
        ProgressBone =  28422,
        ProgressCoords = vector3(0.09, -0.075, 0.0),
        ProgressRotation = vector3(-90.0, 0.0, 0.0),
        Strain1 = {
            Time = math.random(6,11), -- Time in (s) to trim skunk crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weed_skunk_cbd',   label = 'CBD Skunk: 2g'},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'weed_skunk_cbd_crop',     label = 'CBD Skunk Crop',   amount = 3},
                ['3'] = { name = 'empty_weed_bag',          label = 'Resealable Bags',  amount = 14},
            }
        },
        Strain2 = {
            Time = math.random(6,11), -- Time in (s) to trim kush crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weed_og-kush_cbd',   label = 'CBD OG-Kush: 2g'},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'weed_og-kush_cbd_crop',   label = 'CBD OG-Kush Crop',   amount = 4},
                ['3'] = { name = 'empty_weed_bag',          label = 'Resealable Bags',  amount = 14},
            }
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to trim white-widow crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weed_white-widow_cbd',   label = 'CBD White-Widow: 2g'},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',                 label = 'Trimming Shears'},
                ['2'] = { name = 'weed_white-widow_cbd_crop',   label = 'CBD White-Widow Crop',   amount = 6},
                ['3'] = { name = 'empty_weed_bag',              label = 'Resealable Bags',  amount = 14},
            }
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to trim ak47 crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weed_ak47_cbd',   label = 'CBD AK47: 2g'},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'weed_ak47_cbd_crop',      label = 'CBD AK47 Crop',   amount = 8},
                ['3'] = { name = 'empty_weed_bag',          label = 'Resealable Bags',  amount = 14},
            }
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to trim ak47 crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weed_amnesia_cbd',   label = 'CBD Amnesia: 2g'},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'weed_amnesia_cbd_crop',   label = 'CBD Amnesia Crop',   amount = 3},
                ['3'] = { name = 'empty_weed_bag',          label = 'Resealable Bags',  amount = 14},
            }
        }
    },
    Rolling = {
        ProgressAnimationDict = 'amb@prop_human_parking_meter@female@base', -- Animation dictionary for progress bar
        ProgressAnimation = 'base_female', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'p_cs_papers_02',
        Bone =  57005,
        Coords = vector3(0.08, 0.0, -0.01),
        Rotation = vector3(182.0, -9.0, 56.0),
        Strain1 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 1, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_skunk_cbd_joint',   label = 'CBD Skunk: Joint', amount = 2},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 2},
            }
        },
        Strain2 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 1, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_og-kush_cbd_joint',   label = 'CBD OG-Kush: Joint', amount = 2},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 2},
            }
        },
        Strain3 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 1, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_white-widow_cbd_joint',   label = 'CBD White-Widow: Joint', amount = 2},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 2},
            }
        },
        Strain4 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 1, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_ak47_cbd_joint',   label = 'CBD AK47: Joint', amount = 2},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 2},
            }
        },
        Strain5 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 1, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weed_amnesia_cbd_joint',   label = 'CBD Amnesia: Joint', amount = 2},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 2},
            }
        }
    },
    Edibles = {
        ProgressAnimationDict = 'amb@prop_human_bbq@male@idle_a',
        ProgressAnimation = 'idle_b',
        ProgressFlags = 49,
        Strain1 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 1
            ReturnItem = {
                ['1'] = { name = 'gummy_skunk_cbd',   label = 'CBD Gummybear: Skunk', amount = 4},
            },
            RequiredItems = {
                ['1'] = { name = 'gummybearmould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 2},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 2},
            },
        },
        Strain2 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 2
            ReturnItem = {
                ['1'] = { name = 'gummy_og-kush_cbd',   label = 'CBD Gummybear: OG-Kush', amount = 4},
            },
            RequiredItems = {
                ['1'] = { name = 'gummybearmould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 1},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 1},
            },
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 3
            ReturnItem = {
                ['1'] = { name = 'gummy_white-widow_cbd',   label = 'CBD Gummybear: White-Widow', amount = 4},
            },
            RequiredItems = {
                ['1'] = { name = 'gummybearmould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 2},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 2},
            },
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 4
            ReturnItem = {
                ['1'] = { name = 'gummy_ak47_cbd',   label = 'CBD Gummybear: AK47', amount = 4},
            },
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles
            RequiredItems = {
                ['1'] = { name = 'gummybearmould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 2},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 2},
            },
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 1, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 5
            ReturnItem = {
                ['1'] = { name = 'gummy_amnesia_cbd',   label = 'CBD Gummybear: Amnesia', amount = 4},
            },
            RequiredItems = {
                ['1'] = { name = 'gummybearmould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 2},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 2},
            }, 
        },
    },
    Raid = {
        JobName = 'police', -- Name of your police job in your `qb-core/shared/
        ForceEntryTime = math.random(8,15), -- Time in (s) for police to force entry into storages
        ForceEntryAnimationDict = 'mini@safe_cracking',
        ForceEntryAnimation = 'door_open_succeed_stand',
        ForceEntryFlags = 49,
    },
    Garage = {
        MoneyType = 'bank', -- Money type used for vehicle deposits
        Vehicle = 'speedo', -- White widow company vehicle use any vehicle you want here
        Deposit = 100, -- Price to take out company van will return 50%
        Heading = 177.66, -- Vehicle spawn heading
        Spawn = vector4(369.45, -828.32, 29.29, 177.66) -- Vehicle spawn location    
    },
    Stores = {
        JobStore = {
            [1] = { name = 'lighter',           price = 1,  amount = 2000, info = {}, type = 'item', slot = 1 }, -- Required
            [2] = { name = 'rollingpapers',     price = 1,  amount = 1000, info = {}, type = 'item', slot = 2 }, -- Required     
            [3] = { name = 'drug_grinder',      price = 1,  amount = 1000, info = {}, type = 'item', slot = 3 }, -- Required
            [4] = { name = 'empty_weed_bag',    price = 1,  amount = 1000, info = {}, type = 'item', slot = 4 }, -- Required
            [5] = { name = 'drug_shears',       price = 50, amount = 1000, info = {}, type = 'item', slot = 5 }, -- Required
			[6] = { name = 'gelatine',       	price = 1, amount = 1000, info = {}, type = 'item', slot = 6 }, -- Required
			[7] = { name = 'rawhoney',       	price = 1, amount = 1000, info = {}, type = 'item', slot = 7 }, -- Required
			[8] = { name = 'bbmenu',       	    price = 0, amount = 1000, info = {}, type = 'item', slot = 8 }, -- Required
        },
        SnackTable = { -- Example food items not required for script to function change these to whatever food your city uses
            [1] = { name = 'cocacola',       	price = 5,  amount = 100,  info = {}, type = 'item', slot = 1 },
            [2] = { name = 'pepsi',             price = 5, 	amount = 100,  info = {}, type = 'item', slot = 2 },
            [3] = { name = 'drpepper',          price = 5,  amount = 100,  info = {}, type = 'item', slot = 3 },
            [4] = { name = 'mountaindew',       price = 5,  amount = 100,  info = {}, type = 'item', slot = 4 },
            [5] = { name = 'water',             price = 3,  amount = 100,  info = {}, type = 'item', slot = 5 },
            [6] = { name = 'hersheysbar',       price = 3,  amount = 100,  info = {}, type = 'item', slot = 6 },  
            [7] = { name = 'mandms',            price = 3,  amount = 100,  info = {}, type = 'item', slot = 7 }, 
            [8] = { name = 'chips',             price = 3,  amount = 100,  info = {}, type = 'item', slot = 8 },        
        }
    },
}
-- Drug settings
Config.DrugSettings = {
    Joints = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        SmokeItem = 'lighter', -- Item required to smoke joints
        ProgressAnimationDict = 'timetable@gardener@smoking_joint', -- Animation dictionary for progress bar
        ProgressAnimation = 'smoke_idle', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'prop_sh_joint_01',
        Bone =  57005,
        Coords = vector3(0.12, 0.03, -0.05),
        Rotation = vector3(0.0, 10.0, 70.0),
        Strain1 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = math.random(5,10), -- Amount of stress relived by smoking joints
            Armour = math.random(5,10), -- Amount of armour to gain by smoking joints
        },
        Strain2 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = math.random(5,10), -- Amount of stress relived by smoking joints
            Armour = math.random(5,10), -- Amount of armour to gain by smoking joints
        },
        Strain3 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = math.random(5,10), -- Amount of stress relived by smoking joints
            Armour = math.random(5,10), -- Amount of armour to gain by smoking joints
        },
        Strain4 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = math.random(5,10), -- Amount of stress relived by smoking joints
            Armour = math.random(5,10), -- Amount of armour to gain by smoking joints
        },
        Strain5 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = math.random(5,10), -- Amount of stress relived by smoking joints
            Armour = math.random(5,10), -- Amount of armour to gain by smoking joints
        }
    },
    BongTable = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        SmokeItem = 'lighter', -- Item required to smoke bongs
        Prop = 'prop_bong_01', -- Bong prop
        ProgressAnimationDict = 'anim@safehouse@bong', -- Animation dictionary for progress bar
        ProgressAnimation = 'bong_stage3', -- Animation for progress bar
        Strain1 = { 
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain2 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        }
    },
    Edibles = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        ProgressAnimationDict = 'mp_suicide', -- Animation dictionary for progress bar
        ProgressAnimation = 'pill', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Strain1 = { 
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = math.random(1,3), -- Amount of stress relived by consuming edibles
            Armour = math.random(1,3), -- Amount of armour to gain by consuming edibles
        },
        Strain2 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = math.random(1,3), -- Amount of stress relived by consuming edibles
            Armour = math.random(1,3), -- Amount of armour to gain by consuming edibles
        },
        Strain3 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = math.random(1,3), -- Amount of stress relived by consuming edibles
            Armour = math.random(1,3), -- Amount of armour to gain by consuming edibles
        },
        Strain4 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = math.random(1,3), -- Amount of stress relived by consuming edibles
            Armour = math.random(1,3), -- Amount of armour to gain by consuming edibles
        },
        Strain5 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = math.random(1,3), -- Amount of stress relived by consuming edibles
            Armour = math.random(1,3), -- Amount of armour to gain by consuming edibles
        }
    }
}

