Config = {}

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.MaxSpikes = 5

Config.HandCuffItem = 'handcuffs'
Config.CuffKeyItem = "cuffkeys"
Config.TieItem = 'ziptie'
Config.CutTieItem = 'flush_cutter'
Config.CutCuffItem = 'bolt_cutter'
Config.BrokenCuffItem = 'broken_handcuffs'
Config.BreakOutCuffing = {active = true, duration = math.random(2500,5000), pos = math.random(10, 30), width = math.random(10, 20)}
Config.BreakoutMinigame = 'qb-minigames' -- Choose the cuff breakout minigame : qb-skillbar / qb-minigames (skillbar) / ps-ui (circle) / ox_lib
Config.SkillbarConfig = {difficulty = 'medium', keys = 'wasd'} -- If minigame is qb-minigames then choose amount of tries
Config.PSUIConfig = {numcircle = 2, ms = 20} -- If minigame is ps-ui then choose number of circles and ms 
Config.OXLibConfig = {difficulty = 'medium', inputs = {'w', 'a', 's', 'd'}} -- If minigame is ox_lib then choose difficulty and input characters
Config.TargetSystem = 'qb-target' -- Target system you want to use : qb-target / qtarget / ox_target
Config.ContextSystem = 'qb-menu' -- Menu system you want to use : qb-menu / ox_lib
Config.DrawText = {sys = 'qb-core', position = 'left'} -- Drawtext system you want to use : qb-core / ox_lib  and position of the drawtext
Config.ProgressBar = 'progressbar' -- Progressbar system : progressbar / ox_lib
Config.Inventory = 'ox_inventory' -- Inventory system : qb-inventory / new-qb-inventory / ps-inventory / ox_inventory 
Config.StashSettings = {maxweight = 4000000, slots = 30,} -- Stash settings for qb / ps inventory
Config.Debug = false -- Enable / Disable debugpoly 
Config.CuffCooldown = 5 -- Sets a cooldown for cuffing, prevents cuff spamming
Config.DisableSprintJump = true -- Disables jumping and running while escorting a player
Config.AlcoholTesterName = "alcoholtester" -- Name of the alcohol tester item
Config.AlcoholReleaseInterval = {min = 5, promille = 0.02} -- Interval time in minutes to release alcohol per given promille
Config.EnableVersionCheck = true -- Enable or disable the version checking from github
Config.OwnedPoliceCars = true -- Do you want the spawned police cars to be owned ?

-- itemname = name of the item
-- propname = the prop used for cuffing
-- needkey = does the cuff needs a key to uncuff ? It will give a key when true
-- keyitem = what is the item used to uncuff
-- cufftype = the animation type. 19 - ped is freezed / 49 - ped can move with cuffs
Config.CuffItems = {
    ['handcuffs'] = {itemname = "handcuffs", propname = "p_cs_cuffs_02_s", needkey = true, keyitem = "cuffkeys", cufftype = 19 },
    ['ziptie'] = {itemname = "ziptie", propname = "ba_prop_battle_cuffs", needkey = false, keyitem = "flush_cutter", cufftype = 49}
}

Config.BlipColors = {
    ['police'] = 29, -- Dark Blue
    ['bcso'] = 47, -- Orange
    ['sasp'] = 2, -- Green
    ['ambulance'] = 1 -- Red
}

Config.FuelScript = 'LegacyFuel'
Config.LicenseRank = 2
Config.BlockWallThermals = true -- true/false; lowers thermal cam intensity to stop penetration through walls or tunnels
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.GaragePedModel = "s_m_y_hwaycop_01"
Config.Locations = {
    ["duty"] = {
        [1] = vector3(608.99, -14.48, 76.63), -- Vinewood PD
        [2] = vector3(1817.9554, 3672.185, 34.195335), --BSCO Sandy
        [3] = vector3(-446.86, 6012.61, 32.29), --BCSO Paleto
        [4] = vector3(384.75, 795.04, 187.46), -- Game Warden nat 
        [5] = vector3(1549.94, 838.89, 77.66), -- Highway Patrol 
        [6] = vector3(837.17, -1289.87, 28.24), -- Popular Secret Service
        [7] = vector3(115.34, -747.69, 45.76), -- FBI
        [8] = vector3(-819.44, -702.16, 28.06), -- US Marshalls
        [9] = vector3(428.2, -1090.18, 30.06), -- Training Center
        [10] = vector3(-1237.64, -2810.87, 14.3), -- DHS Airport
        [11] = vector3(1692.93, 4877.41, 42.3), -- Game Warden Grapeseed
        [12] = vector3(479.25, -996.3, 30.69), -- Mrpd DHS
        [13] = vector3(367.09, -1606.85, 29.29), -- Davis Street
        [14] = vector3(-1076.5, -817.15, 15.64), -- Vesp
        [15] = vector3(1840.28, 2579.26, 46.01), -- PRISON
    },
    ["vehicle"] = {
        [1] = vector4(442.1, -1013.92, 28.63, 184.47), -- LSPD
        [2] = vector4(-458.86, 6031.5, 31.34, 139.15), --BCSO
       -- [3] = vector4(1858.95, 3681.95, 33.83, 219.83), -- Sandy


        [3] = vector4(134.41, -732.76, 33.13, 247.69), -- FBI
        [4] = vector4(-471.55, 6012.96, 31.34, 313.09), -- BCSO Paleto
        --[5] = vector4(1541.7, 796.08, 76.74, 62.44), -- HIghway Patrol
        [5] = vector4(373.03, 788.16, 186.91, 183.18), -- Game Warden nat
        [6] = vector4(860.46, -1350.03, 26.07, 94.43), -- Popular Secret Service
        --[8] = vector4(386.82, -1632.23, 29.29, 309.09), -- Davis street 
       --[9] = vector4(1815.62, 3686.82, 33.97, 300.51), -- BCSO Sandy
        [7] = vector4(-831.66, -746.5, 23.38, 100.68), -- US Marshalls
        [8] = vector4(-1216.73, -2797.71, 13.95, 149.49), -- DHS Airport 
        --[12] = vector4(1702.23, 4855.61, 42.07, 184.09), -- Game Warden Grapeseed
        --[13] = vector4(442.82, -1014.86, 28.64, 98.96), -- MRPD DHS 
        --[14] = vector4(-1117.73, -846.68, 13.38, 126.02), -- Vesp
        [9] = vector4(-1308.35, -568.62, 20.8, 221.49), -- GOV Egress
        [10] = vector4(1864.1, 2558.63, 45.67, 337.86), -- Prison
    },
    ["vehspawn"] = { -- The numbers [1] must match the numbers in [vehicle]
        [1] = vector4(442.4, -1025.02, 28.29, 4.11), -- LSPD
        [2] = vector4(-474.63, 6030.38, 30.95, 226.12), -- BCSO
        [3] = vector4(1850.89, 3673.04, 33.37, 211.26), -- Sandy
    },
    ["stash"] = {
        [1] = vector3(605.19, -16.67, 76.63), -- Vinewood PD
        [2] = vector3(-445.44, 6019.05, 37.0), -- BCSO Paleto
        [3] = vector3(1548.9, 841.03, 77.66), -- Highway Patrol 
        [4] = vector3(387.72, 794.15, 190.49), -- Game Warden nat
        [5] = vector3(-814.91, -720.16, 22.96), -- US Marshalls
        [6] = vector3(433.04, -1076.54, 30.06), -- Training center
        [7] = vector3(1837.57, 3684.82, 34.19), -- BCSO Sandy
        [8] = vector3(-1241.74, -2811.83, 14.3), -- DHS Airport
        [9] = vector3(1691.13, 4864.91, 42.3), -- Game Warden Grapeseed
        [10] = vector3(486.5, -995.33, 30.69),-- MRPD DHS
        [11] = vector3(362.69, -1607.02, 29.29), --Davis Street
        [12] = vector3(857.87, -1294.59, 28.28), -- Popular Secret Service
        [13] = vector3(152.78, -752.02, 45.75), -- FBI
        [14] = vector3(-1067.79, -811.5, 15.64), -- Vesp
        [15] = vector3(-1303.06, -557.24, 30.57),-- Secret Service Gov Office
        [16] = vector3(1838.36, 2576.83, 46.36), -- Prison
    },
    ["impound"] = {
        [1] = vector3(479.08, -1022.54, 28.01),
        [2] = vector3(1822.14, 3689.16, 33.97),
    },
    ["helicopter"] = {
        [1] = vector4(460.24, -980.18, 43.69, 181.43), -- LSPD
        [2] = vector4(-462.15, 5994.77, 31.25, 134.84), -- BCSO
    },
    ["helispawn"] = { -- The numbers [1] must match the numbers in [helicopter]
        [1] = vector4(449.16, -981.23, 43.69, 165.79), -- LSPD
        [2] = vector4(-475.18, 5988.43, 31.72, 317.27), -- BCSO
    },
    ["armory"] = {
        [1] = vector3(607.92, -20.62, 76.63), -- Vinewood PD
        [2] = vector3(1836.2866, 3686.9396, 34.189239), -- BCSO Sandy
        [3] = vector3(-446.8, 6016.74, 37.0), -- BCSO Paleto
        [4] = vector3(1553.86, 839.99, 77.66), -- Highway Patrol
        [5] = vector3(386.97, 799.72, 187.46), -- Game Warden nat
        [6] = vector3(836.76, -1287.34, 28.24), -- Popular Secret Service 
        [7] = vector3(153.08, -757.41, 45.75), -- FBI
        [8] = vector3(-1070.35, -816.46, 15.64), -- Vesp
        [9] = vector3(-822.11, -717.56, 22.96), -- US Marshalls
        [10] = vector3(438.22, -1116.37, 30.06), -- Training Center
        [11] = vector3(-1238.59, -2813.7, 14.3), -- DHS Airport
        [12] = vector3(1696.53, 4876.39, 42.3), -- Game Warden Grapseed
        [13] = vector3(479.25, -996.3, 30.69), -- MRPD DHS
        [14] = vector3(365.58, -1609.6, 29.29), -- Davis Street
        [15] = vector3(-1300.77, -555.32, 30.57), -- Secret Service Gov office
        [16] = vector3(-1306.4, -564.77, 41.19), -- Gov Safe Room
        [17] = vector3(1841.63, 2573.82, 46.01), -- Prison
    },
    ["trash"] = {
        [1] = vector3(611.07, -8.68, 76.63), -- Vinewood PD 
        [2] = vector3(1830.0455, 3684.0603, 34.189182), -- BCSO Sandy
        [3] = vector3(598.58, 5.06, 76.63), -- Vinewood PD
        [4] = vector3(1689.39, 4864.45, 42.3), -- Game Warden Grapeseed
        [5] = vector3(479.02, -994.89, 30.69), -- MRPD DHS 
        [6] = vector3(368.51, -1605.04, 29.29), -- Davis Street
        [7] = vector3(-446.4, 6014.18, 37.0), -- BCSO Paleto 
        [8] = vector3(382.4, 795.99, 190.49), -- Game Warden nat 
        [9] = vector3(835.13, -1304.25, 28.24), -- Popular Secret Service 
        [10] = vector3(147.55, -755.02, 50.14), -- FBI
        [11] = vector3(-1074.76, -814.69, 15.64), -- Vesp
        [12] = vector3(-1087.78, -837.56, 34.28), -- Vesp
    },
    ["fingerprint"] = {
        [1] = vector3(603.37, -2.35, 76.63), -- Vinewood PD 
        [2] = vector3(1817.4641, 3665.893, 34.189239), -- BCSO Sandy 
        [3] = vector3(-452.39, 5997.86, 27.58), -- BCSO Paleto 
        [4] = vector3(386.45, 795.29, 187.46), -- Game Warden nat 
        [5] = vector3(835.35, -1300.7, 28.24), -- Popular Secret Service 
        [6] = vector3(1555.2, 834.96, 77.66), -- Highway Patrol
        [7] = vector3(360.64, -1613.27, 29.29), -- Davis Street 
        [8] = vector3(-817.41, -716.39, 22.96), -- US Marshalls 
        [9] = vector3(465.35, -1086.77, 35.45), -- Training Center 
        [10] = vector3(468.01, -1086.8, 35.45), -- Training Center 
        [11] = vector3(470.49, -1086.9, 35.45), -- Training Center 
        [12] = vector3(472.81, -1086.78, 35.45), -- Training Center 
        [13] = vector3(-1237.07, -2797.58, 20.05), -- DHS Airport 
        [14] = vector3(1684.83, 4865.01, 37.32), -- Game Warden Grapeseed
        [15] = vector3(474.43, -1013.37, 26.27), -- mrpd DHS
        [16] = vector3(132.93, -744.41, 42.17), -- FBI
        [17] = vector3(-1085.92, -830.4, 19.32), -- Vesp upper 
        [18] = vector3(-1080.21, -826.73, 15.64), -- Vesp Lower
    },
    ["evidence"] = {
        [1] = vector3(619.75, -10.31, 76.63), -- Vinewood PD
        [2] = vector3(616.34, -11.07, 76.63), -- Vinewood PD
        [3] = vector3(619.6, -14.32, 76.63), -- Vinewood PD
		[4] = vector3(1829.8619, 3679.2133, 38.859416), -- BCSO Sandy
        [5] = vector3(1831.3439, 3680.1469, 38.859416), -- BCSO Sandy 
        [6] = vector3(-452.89, 5999.62, 37.01), -- BCSO Paleto
        [7] = vector3(1547.84, 827.01, 82.13), -- Highway Patrol
        [8] = vector3(383.57, 799.86, 190.49), -- Game Warden nat 
        [9] = vector3(847.78, -1312.47, 28.24), -- Popular Secret Service 
        [10] = vector3(148.41, -762.34, 50.14), -- FBI
        [11] = vector3(147.27, -765.45, 50.14), -- FBI
        [12] = vector3(-815.35, -713.46, 22.96), -- US Marshalls
        [13] = vector3(-812.89, -710.27, 28.06), -- US Marshalls 
        [14] = vector3(-813.37, -705.64, 28.06), -- US Marshalls 
        [15] = vector3(438.92, -1076.52, 30.06), -- Training Center 
        [16] = vector3(1699.22, 4881.0, 42.3), -- Game Warden Grapeseed
        [17] = vector3(1695.51, 4880.54, 42.3), -- Game Warden Grapeseed 
        [18] = vector3(475.08, -996.53, 26.27), --MRPD DHS 1
        [19] = vector3(475.11, -993.59, 26.27), --MRPD DHS 2
        [20] = vector3(472.63, -997.27, 26.27), --MRPD DHS 3
        [21] = vector3(383.7, -1599.77, 33.36), -- Davis Street
        [22] = vector3(381.85, -1600.96, 33.36), -- Davis Street
        [23] = vector3(-1083.91, -833.77, 23.46), -- Vesp
        [24] = vector3(-1086.88, -833.56, 23.46), -- vesp
        [25] = vector3(1843.98, 2574.21, 46.01), -- prison
    },
    ["labs"] = {
        [1] = vector3(483.49, -988.62, 31.06), -- LSPD
    },
    --[[ ["stations"] = {
        [1] = {label = "Los Santos Police Department", coords = vector4(428.23, -984.28, 29.76, 3.5), sprite= 137, scale= 0.7, colour= 29},
        [2] = {label = "San Andreas State Prison", coords = vector4(1845.903, 2585.873, 45.672, 272.249), sprite= 137, scale= 0.7, colour= 1},
        [3] = {label = "Blaine County Sheriffs Office", coords = vector4(-448.26, 6007.83, 44.01, 225.93), sprite= 137, scale= 0.7, colour= 47},
    }, ]]
    ["stations"] = {
         [1] = {label = "Vinewood LSPD ", coords = vector4(601.13, -10.12, 70.63, 15.77), sprite= 137, scale= 0.7, colour= 29},
--         [2] = {label = "SADOC Prison", coords = vector4(1845.903, 2585.873, 45.672, 272.249), sprite= 137, scale= 0.7, colour= 29},
--         [3] = {label = "San Andreas Game Commission HQ", coords = vector4(1688.05, 4862.44, 42.3, 287.78), sprite= 137, scale= 0.7, colour= 29},
--         [4] = {label = "San Andreas Game Commission 2", coords = vector4(386.07,796.89, 187.46, 356.02), sprite= 137, scale= 0.7, colour= 29},
         [5] = {label = "San Andreas Highway Patrol", coords = vector4(1540.69, 817.67, 77.66, 12.06), sprite= 137, scale= 0.7, colour= 29},
--         [6] = {label = "Popular US Secret Service Department", coords = vector4(826.88, -1290.45, 28.23, 295.56), sprite= 137, scale= 0.7, colour= 29},
--         [7] = {label = "United States Marshal Services", coords = vector4(-831.12, -698.93, 27.36, 234.36), sprite= 137, scale= 0.7, colour= 29},
--         [8] = {label = "DHS CBP/PIA Airport", coords = vector4(-1237.07, -2797.58, 20.05, 64.93), sprite= 137, scale= 0.7, colour= 29},
--         [9] = {label = "DHS CBP/PIA HQ", coords = vector4(457.38, -984.78, 30.69, 174.19), sprite= 137, scale= 0.7, colour= 29},
--         [10] = {label = "Vespucci LSPD HQ", coords = vector4(-1087.69, -821.95, 31.26, 114.57), sprite= 137, scale= 0.7, colour= 29},
--         [11] = {label = "BCSO Paleto", coords = vector4(-443.01, 6005.9, 44.01, 121.9), sprite= 137, scale= 0.7, colour= 29},
         [12] = {label = "BCSO HQ Sandy", coords = vector4(1827.05, 3674.93, 42.87, 317.18), sprite= 137, scale= 0.7, colour= 29},
--         [13] = {label = "LSSO HQ Davis", coords = vector4(380.95, -1603.97, 39.85, 237.58), sprite= 137, scale= 0.7, colour= 29},
--         [14] = {label = "FBI", coords = vector4(135.61, -749.22, 266.6, 66.23), sprite= 137, scale= 0.7, colour= 29},
       },
}

Config.RepairStations = {
    enabled = true,
    withanim = false,
    locations = {
        [1] = {
            jobtype = 'leo', -- jobtype that can use this station or public to be used by everyone 
            pedhash = 's_m_m_fibsec_01', -- ped hash to be used as repair guy
            pedloc = vector4(480.39, -996.65, 30.69, 87.97), -- location where the ped will be spawned
            walkto = vector4(487.31, -996.93, 30.69, 274.41), -- location where the ped will walk to repair
        },
        [2] = {
            jobtype = 'public', -- jobtype that can use this station or public to be used by everyone 
            pedhash = 'u_m_y_gunvend_01', -- ped hash to be used as repair guy
            pedloc = vector4(16.37, -1111.51, 29.8, 254.8), -- location where the ped will be spawned
            walkto = vector4(15.32, -1105.86, 29.8, 215.82), -- location where the ped will walk to repair
        }
    }
}

Config.PoliceHelicopters = {
    -- Garage 1 helis (LSPD)
    [1] = {
        ['polmav'] =  {label = "Police Maverick", ranks = {3,4}, livery = 0, price = 10},
        ['buzzard2'] = {label = "Buzzard", ranks = {4}, livery = 1, price = 50},
    },
    -- Garage 2 helis (BCSO)
    [2] = {
        ['polmav'] =  {label = "Police Maverick", ranks = {3,4}, livery = 0, price = 10},
        ['buzzard2'] = {label = "Buzzard", ranks = {4}, livery = 1, price = 50},
    }
}

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", coords = vector3(257.45, 210.07, 109.08), r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", coords = vector3(232.86, 221.46, 107.83), r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", coords = vector3(252.27, 225.52, 103.99), r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", coords = vector3(-53.1433, -1746.714, 31.546), r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", coords = vector3(-718.153, -909.211, 21.49), r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", coords = vector3(23.885, -1342.441, 31.672), r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", coords = vector3(1151.93, -320.389, 71.33), r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", coords = vector3(383.402, 328.915, 105.541), r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", coords = vector3(-1832.057, 789.389, 140.436), r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", coords = vector3(-3046.749, 592.491, 9.808), r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", coords = vector3(-3246.489, 1010.408, 14.705), r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", coords = vector3(539.773, 2664.904, 44.056), r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", coords = vector3(2673.579, 3281.265, 57.541), r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", coords = vector3(1966.24, 3749.545, 34.143), r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", coords = vector3(1729.522, 6419.87, 37.262), r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", coords = vector3(309.341, -281.439, 55.88), r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", coords = vector3(144.871, -1043.044, 31.017), r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", coords = vector3(-355.7643, -52.506, 50.746), r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", coords = vector3(-1214.226, -335.86, 39.515), r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", coords = vector3(-2958.885, 478.983, 17.406), r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", coords = vector3(-102.939, 6467.668, 33.424), r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", coords = vector3(-163.75, 6323.45, 33.424), r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Jewelery CAM#1", coords = vector3(-627.54, -239.74, 40.33), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Jewelery CAM#2", coords = vector3(-627.51, -229.51, 40.24), r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Jewelery CAM#3", coords = vector3(-620.3, -224.31, 40.23), r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Jewelery CAM#4", coords = vector3(-622.57, -236.3, 40.31), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
    },
}
Config.EnableMods = true -- Enable the mods below to be applied
Config.CarMods = { -- Mods to be enabled / disabled for vehicles
    engine = true,
    brakes = true,
    gearbox = true,
    armour = false,
    turbo = true,
}
Config.EnableExtras = true
Config.CarExtras = { -- Extra options to be enabled / disabled
    ["extras"] = {
        ["1"] = true, -- on/off
        ["2"] = true,
        ["3"] = true,
        ["4"] = true,
        ["5"] = true,
        ["6"] = true,
        ["7"] = true,
        ["8"] = true,
        ["9"] = true,
        ["10"] = true,
        ["11"] = true,
        ["12"] = true,
        ["13"] = true,
    }
}
Config.AuthorizedVehicles = {
    -- Garage 1 vehicles (LSPD)
    [1] = {
        ["police"] = {label = "Police Car 1", ranks = {1,2}, livery = 1, price = 10},
        ["police2"] = {label = "Police Car 2", ranks = {1,2}, livery = 1, price = 10},
        ["police3"] = {label = "Police Car 3", ranks = {3}, livery = 1, price = 10},
        ["police4"] = {label = "Police Car 4", ranks = {3}, livery = 1, price = 10},
        ["policeb"] = {label = "Police Car 5", ranks = {3,4}, livery = 1, price = 10},
        ["policet"] = {label = "Police Car 6", ranks = {3,4}, livery = 1, price = nil},
        ["fbi"] = {label = "Unmarked FBI", ranks = {3,4}, livery = 1, price = 15},
        ["fbi2"] = {label = "Unmarked FBI2", ranks = {3,4}, livery = 1, price = nil},
    },
    -- Garage 2 vehicles (BCSO)
    [2] = {
        ["sheriff"] = {label = "Sheriff Car 1", ranks = {1,2}, livery = 1, price = 10},
        ["sheriff2"] = {label = "Sheriff Car 2", ranks = {2,3,4}, livery = 1, price = 10},
        ["fbi"] = {label = "Unmarked FBI", ranks = {3,4}, livery = 1, price = 10},
        ["fbi2"] = {label = "Unmarked FBI2", ranks = {3,4}, livery = 1, price = nil},
    },
    -- Garage 1 vehicles (Sandy)
    [3] = {
        ["sheriff"] = {label = "Sheriff Car 1", ranks = {1,2}, livery = 1, price = 10},
        ["sheriff2"] = {label = "Sheriff Car 2", ranks = {2,3,4}, livery = 1, price = 10},
        ["fbi"] = {label = "Unmarked FBI", ranks = {3,4}, livery = 1, price = 10},
        ["fbi2"] = {label = "Unmarked FBI2", ranks = {3,4}, livery = 1, price = nil},
    },
}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Large caliber bullet",
}

Config.Radars = {
    vector4(-623.44421386719, -823.08361816406, 25.25704574585, 145.0),
    vector4(-652.44421386719, -854.08361816406, 24.55704574585, 325.0),
    vector4(1623.0114746094, 1068.9924316406, 80.903594970703, 84.0),
    vector4(-2604.8994140625, 2996.3391113281, 27.528566360474, 175.0),
    vector4(2136.65234375, -591.81469726563, 94.272926330566, 318.0),
    vector4(2117.5764160156, -558.51013183594, 95.683128356934, 158.0),
    vector4(406.89505004883, -969.06286621094, 29.436267852783, 33.0),
    vector4(657.315, -218.819, 44.06, 320.0),
    vector4(2118.287, 6040.027, 50.928, 172.0),
    vector4(-106.304, -1127.5530, 30.778, 230.0),
    vector4(-823.3688, -1146.980, 8.0, 300.0),
}

Config.CarItems = {
    [1] = {name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1,},
    [2] = {name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2,},
    [3] = {name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3,},
}

Config.QuickEquip = false -- Set this to true if you want to give certain items automatically and configure the quick = {} part on each item
Config.Items = {
    label = "Police Armory",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [2] = {
            name = "weapon_stungun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [3] = {
            name = "weapon_pumpshotgun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [4] = {
            name = "weapon_smg",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 4,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [5] = {
            name = "weapon_carbinerifle",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "3x Scope"},
                }
            },
            type = "weapon",
            slot = 5,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [6] = {
            name = "weapon_nightstick",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 6,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [7] = {
            name = "pistol_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 5}
        },
        [8] = {
            name = "smg_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [9] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [10] = {
            name = "rifle_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [11] = {
            name = "handcuffs",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 11,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [12] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 12,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [13] = {
            name = "empty_evidence_bag",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [14] = {
            name = "police_stormram",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [15] = {
            name = "armor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [16] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        },
        [17] = {
            name = "heavyarmor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = false, amount = 1}
        },
        [18] = {
            name = "alcoholtester",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {0, 1, 2, 3, 4},
            quick = {equip = true, amount = 1}
        }
    }
}
