Config                       = {}

Config.Framework             = 'qb'       -- esx, oldesx, qb, oldqb

Config.CurrencyUnit          = '$'        -- '€' -- '₺'  '$'
Config.SQL                   = "oxmysql"
Config.ServeName             = "TWIY"   -- Server Name MAX 10
Config.MoneyType             = "$"        -- Money Type
Config.InteractionHandler    = 'ox-target' --  qb-target, drawtext,ox-target
Config.ExampleProfilePicture = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
Config.BucketSystem          = false
Config.ChangeClothesSystem   = true               -- true / false
Config.ClothingScript        = "illenium-appearance"      -- fivem-appearance / illenium-appearance  / esx_skin / qb-clothing
Config.JobResetCommand       = "jobresetgardener" -- Job Reset Command
Config.SinglePlayerEasyMode  = true               -- true / false -- if true, the job will be easier for single player
Config.Inventory             = "ox_inventory"                             -- qb_inventory / esx_inventory / ox_inventory / qs_inventory / need Config.missioncompletedItems

Config.Gardener              = {
    ['coords'] = {
        ['intreactionCoords'] = vector3(-661.64, -900.71, 24.61),
        ['ped'] = true,
        ['pedCoords'] = vector3(-661.64, -900.71, 24.61),
        ['pedHeading'] = 274.67,
        ['pedHash'] = 0x49EA5685,
    },
    ['job'] = 'all',
    ['blip'] = {
        show = true,
        blipName = 'Gardener Job',
        blipType = 631,
        blipColor = 2,
        blipScale = 0.55
    },
    ['missioncompletedItems'] = {
        giveItemPlayer = false, -- true / false
        itemList = {
            { item = "sandwich", count = math.random(1, 4) },
            { item = "sandwich", count = 1 },
        },
    },
    ['marker'] = {
        ['type'] = 1,
        ['size'] = vector3(1.5, 1.5, 1.5),
        ['color'] = { r = 0, g = 255, b = 0 },
    },
    ['drawtext'] = {
        ['text'] = "Press ~g~[E]~s~ to open the ~g~Gardener~s~",
        ['mowerup'] = "Mower UP - E",
        ['mowerdown'] = "Mower Down - E",
        ['deliveryVehicle'] = "Deliver Vehicle - E",
        ['grasscutt'] = "GRASS CUTT",
        ['grasscuttmarker'] = "Press ~g~[E]~s~ to cut the grass",
    },
    ['gardenerjobTruck'] = 'sadler',
    ['gardenerjobTrailler'] = 'trailersmall',
    ['gardenerjobLower'] = 'mower',
    ['GardenerSpawnCoords'] = {
        vector4(-680.98, -886.86, 24.33, 179),
        vector4(-685.36, -886.49, 24.33, 179),
    },
    ['gardenerjobTraillerCoords'] = {
        vector4(-680.67, -878.67, 23.95, 160),
        vector4(-684.52, -881.08, 23.89, 160),
    },
    ['jobDeliverTheVehicleCoords'] = vector3(-682.4, -883.44, 24.5),
    ['Mission'] = {
        {
            name = "gardener1",
            jobDescription1 =
            "You need to remove the overgrown grass in certain areas immediately with a mower and scissors, You need to start right away!",
            jobDescription2 = "Invite your friends and double your money",
            location = "Los Santos - Vinewood",
            minLevel = 0,
            jobTask = {
                { name = "grass",  label = "Grass" },
                { name = "puring", label = "Puring" }
            },
            image = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/Mask_group1.png",
            awards = {
                money = 10000,
                xp = 3000,
                onlinejobextra = 2 -- how many percent of the money will increase when a player enters onlinejob
            },
            lowerModel = {
                "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06", "prop_weeds_nxg07b",
                "prop_weeds_nxg08b"
            },
            lowerAnim = {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                time = 5000,
            },
            lowerArea = {
                { coords = vector4(-814.14, -928.32, 16.8, 55.24),   deleted = false },
                { coords = vector4(-770.52, -936.37, 17.7, 75.94),   deleted = false },
                { coords = vector4(-816.48, -923.64, 16.76, 19.6),   deleted = false },
                { coords = vector4(-817.25, -921.75, 16.77, 34.88),  deleted = false },
                { coords = vector4(-818.9, -918.8, 16.79, 13.05),    deleted = false },
                { coords = vector4(-822.08, -917.19, 16.87, 99.47),  deleted = false },
                { coords = vector4(-825.1, -917.29, 16.78, 112.54),  deleted = false },
                { coords = vector4(-828.06, -916.38, 16.66, 53.1),   deleted = false },
                { coords = vector4(-830.97, -914.87, 16.62, 64.96),  deleted = false },
                { coords = vector4(-832.68, -912.1, 16.81, 8.89),    deleted = false },
                { coords = vector4(-829.86, -910.93, 17.17, 277.3),  deleted = false },
                { coords = vector4(-825.51, -910.31, 17.59, 277.62), deleted = false },
                { coords = vector4(-820.76, -909.85, 18.06, 273.02), deleted = false },
                { coords = vector4(-837.56, -915.65, 15.94, 118.77), deleted = false },
                { coords = vector4(-838.73, -918.07, 15.94, 184.84), deleted = false },
                { coords = vector4(-836.62, -920.29, 16.13, 231.23), deleted = false },
                { coords = vector4(-834.05, -924.07, 16.36, 212.17), deleted = false },
                { coords = vector4(-835.07, -926.9, 16.22, 152.54),  deleted = false },
                { coords = vector4(-837.07, -930.76, 16.09, 127.83), deleted = false },
                { coords = vector4(-833.44, -933.78, 16.35, 237.58), deleted = false },
                { coords = vector4(-828.36, -934.16, 16.55, 224.74), deleted = false },
                { coords = vector4(-826.08, -936.49, 16.53, 224.12), deleted = false },
                { coords = vector4(-823.02, -935.21, 16.54, 298.09), deleted = false },
                { coords = vector4(-818.52, -934.97, 16.62, 269.48), deleted = false },
                { coords = vector4(-814.83, -936.44, 16.66, 236.3),  deleted = false },
                { coords = vector4(-809.83, -940.24, 16.34, 38.74),  deleted = false },
                { coords = vector4(-812.59, -941.84, 16.2, 143.27),  deleted = false },
                { coords = vector4(-818.38, -944.54, 16.04, 104.4),  deleted = false },
                { coords = vector4(-823.42, -944.07, 16.03, 65.37),  deleted = false },
                { coords = vector4(-827.11, -939.66, 16.34, 14.37),  deleted = false },
                { coords = vector4(-830.52, -936.8, 16.37, 56.67),   deleted = false },
                { coords = vector4(-836.98, -938.1, 16.02, 128.18),  deleted = false },
                { coords = vector4(-839.1, -940.94, 15.94, 184.88),  deleted = false },
                { coords = vector4(-837.78, -945.45, 15.96, 189.25), deleted = false },
                { coords = vector4(-836.57, -949.2, 15.78, 83.69),   deleted = false },
                { coords = vector4(-800.62, -944.69, 16.1, 254.38),  deleted = false },
                { coords = vector4(-797.29, -945.62, 16.22, 253.32), deleted = false },
                { coords = vector4(-793.07, -948.63, 16.12, 206.8),  deleted = false },
                { coords = vector4(-788.92, -951.34, 16.09, 302.01), deleted = false },
                { coords = vector4(-785.6, -949.29, 16.42, 300.83),  deleted = false },
                { coords = vector4(-781.81, -948.12, 16.66, 282.48), deleted = false },
                { coords = vector4(-779.92, -949.91, 16.5, 218.89),  deleted = false },
                { coords = vector4(-778.86, -952.5, 16.29, 239.01),  deleted = false },
                { coords = vector4(-777.1, -949.49, 16.57, 352.01),  deleted = false },
                { coords = vector4(-776.96, -945.75, 16.9, 359.06),  deleted = false },
                { coords = vector4(-778.63, -943.68, 17.03, 62.05),  deleted = false },
                { coords = vector4(-784.34, -939.38, 17.48, 283.92), deleted = false },
                { coords = vector4(-787.66, -939.12, 17.29, 70.09),  deleted = false },
                { coords = vector4(-790.32, -936.74, 17.59, 27.89),  deleted = false },
                { coords = vector4(-792.73, -932.08, 18.16, 27.14),  deleted = false },
                { coords = vector4(-796.77, -931.88, 18.18, 95.17),  deleted = false },
                { coords = vector4(-799.56, -935.16, 17.52, 155.04), deleted = false },
                { coords = vector4(-782.27, -931.75, 18.16, 277.08), deleted = false },
                { coords = vector4(-775.88, -932.87, 17.93, 278.63), deleted = false },
                { coords = vector4(-822.8, -939.68, 16.33, 182.56),  deleted = false },
                { coords = vector4(-818.97, -939.29, 16.38, 250.44), deleted = false },
                { coords = vector4(-816.77, -940.89, 16.29, 206.02), deleted = false },
                { coords = vector4(-815.38, -943.27, 16.2, 203.98),  deleted = false },
                { coords = vector4(-812.41, -939.74, 16.43, 346.1),  deleted = false },
                { coords = vector4(-808.23, -930.45, 17.64, 319.78), deleted = false },
                { coords = vector4(-809.58, -926.6, 17.7, 19.26),    deleted = false },
                { coords = vector4(-810.79, -922.73, 17.69, 16.82),  deleted = false },
                { coords = vector4(-812.44, -918.01, 17.56, 18.44),  deleted = false },
                { coords = vector4(-824.35, -914.13, 16.96, 327.16), deleted = false },
                { coords = vector4(-818.44, -913.93, 17.38, 260.94), deleted = false },
                { coords = vector4(-815.03, -914.24, 17.59, 262.63), deleted = false },
                { coords = vector4(-812.02, -916.21, 17.69, 237.69), deleted = false },
                { coords = vector4(-789.18, -929.92, 18.4, 245.54),  deleted = false },
                { coords = vector4(-786.95, -933.08, 18.04, 214.19), deleted = false },
                { coords = vector4(-780.54, -935.38, 17.73, 255.8),  deleted = false },
                { coords = vector4(-776.57, -938.01, 17.5, 239.61),  deleted = false },
                { coords = vector4(-772.97, -940.85, 17.35, 225.07), deleted = false },
                { coords = vector4(-783.67, -944.37, 16.93, 114.83), deleted = false },
                { coords = vector4(-787.27, -944.36, 16.73, 80.11),  deleted = false },
                { coords = vector4(-792.43, -942.93, 16.62, 84.73),  deleted = false },
                { coords = vector4(-796.09, -941.82, 16.59, 71.65),  deleted = false },
                { coords = vector4(-799.56, -940.68, 16.61, 69.79),  deleted = false },
                { coords = vector4(-831.85, -919.4, 16.32, 201.06),  deleted = false },

            },
            pruningModel = "prop_bush_neat_04",
            pruningArea = {
                { coords = vector4(-836.19, -950.79, 15.74, 108.99), deleted = false },
                { coords = vector4(-832.88, -949.39, 15.77, 108.99), deleted = false },
                { coords = vector4(-829.7, -948.92, 15.81, 108.99),  deleted = false },
                { coords = vector4(-825.93, -948.55, 15.83, 108.99), deleted = false },
                { coords = vector4(-821.65, -948.06, 15.86, 108.99), deleted = false },
                { coords = vector4(-817.25, -947.54, 15.87, 95.5),   deleted = false },
                { coords = vector4(-813.77, -946.92, 15.78, 93.17),  deleted = false },
                { coords = vector4(-834.89, -945.26, 16.8, 35.89),   deleted = false },
                { coords = vector4(-836.33, -941.54, 16.82, 353.79), deleted = false },
                { coords = vector4(-834.28, -939.09, 17.04, 280.39), deleted = false },
                { coords = vector4(-830.71, -939.66, 17.13, 219.88), deleted = false },
                { coords = vector4(-829.56, -942.19, 17.02, 178.2),  deleted = false },
                { coords = vector4(-839.06, -948.39, 15.82, 3.85),   deleted = false },
                { coords = vector4(-839.51, -945.84, 15.85, 359.86), deleted = false },
                { coords = vector4(-839.69, -943.12, 15.82, 6.26),   deleted = false },
                { coords = vector4(-839.99, -940.08, 15.81, 3.71),   deleted = false },
                { coords = vector4(-840.16, -937.39, 15.81, 3.08),   deleted = false },
                { coords = vector4(-840.32, -934.62, 15.86, 3.1),    deleted = false },
                { coords = vector4(-840.45, -932.3, 15.88, 3.13),    deleted = false },
                { coords = vector4(-840.65, -928.33, 15.89, 1.87),   deleted = false },
                { coords = vector4(-840.77, -924.57, 15.85, 1.79),   deleted = false },
                { coords = vector4(-840.89, -920.93, 15.83, 1.83),   deleted = false },
                { coords = vector4(-841.07, -917.62, 15.84, 355.93), deleted = false },
                { coords = vector4(-840.98, -915.03, 15.83, 357.92), deleted = false },
            },
        },
        {
            name = "gardener2",
            jobDescription1 =
            "You need to remove the overgrown grass in certain areas immediately with a mower and scissors, You need to start right away!",
            jobDescription2 = "Invite your friends and double your money",
            location = "Los Santos - Vinewood",
            minLevel = 2,
            jobTask = {
                { name = "grass",  label = "Grass" },
                { name = "puring", label = "Puring" }
            },
            awards = {
                money = 8000,
                xp = 3000,
                onlinejobextra = 2.0 -- how many percent of the money will increase when a player enters onlinejob
            },
            image = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/2region.png",
            lowerModel = {
                "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06", "prop_weeds_nxg07b",
                "prop_weeds_nxg08b"
            },
            lowerAnim = {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                time = 5000,
            },

            lowerArea = {
                { coords = vector4(-541.68, -237.28, 36.76, 211.56), deleted = false },
                { coords = vector4(-540.89, -236.64, 36.73, 212.58), deleted = false },
                { coords = vector4(-542.2, -242.28, 36.52, 187.89),  deleted = false },
                { coords = vector4(-536.99, -242.53, 36.1, 268.78),  deleted = false },
                { coords = vector4(-534.29, -244.78, 35.87, 218.01), deleted = false },
                { coords = vector4(-536.19, -248.3, 35.89, 130.01),  deleted = false },
                { coords = vector4(-538.13, -253.1, 35.91, 222.48),  deleted = false },
                { coords = vector4(-533.7, -254.38, 35.73, 258.97),  deleted = false },
                { coords = vector4(-531.45, -251.04, 35.77, 338.25), deleted = false },
                { coords = vector4(-531.03, -257.2, 35.68, 151.94),  deleted = false },
                { coords = vector4(-531.27, -262.37, 35.5, 204.27),  deleted = false },
                { coords = vector4(-535.9, -264.27, 35.48, 108.32),  deleted = false },
                { coords = vector4(-539.85, -262.22, 35.65, 80.48),  deleted = false },
                { coords = vector4(-543.82, -264.29, 35.58, 179.16), deleted = false },
                { coords = vector4(-546.13, -268.08, 35.4, 154.45),  deleted = false },
                { coords = vector4(-548.66, -265.61, 35.56, 30.76),  deleted = false },
                { coords = vector4(-548.73, -261.27, 35.8, 328.36),  deleted = false },
                { coords = vector4(-547.49, -258.29, 36.01, 349.83), deleted = false },
                { coords = vector4(-549.35, -255.32, 36.28, 83.79),  deleted = false },
                { coords = vector4(-548.06, -252.24, 36.33, 46.16),  deleted = false },
                { coords = vector4(-548.08, -248.67, 36.48, 359.64), deleted = false },
                { coords = vector4(-552.16, -248.12, 36.64, 83.88),  deleted = false },
                { coords = vector4(-555.3, -249.6, 36.71, 119.81),   deleted = false },
                { coords = vector4(-557.5, -252.26, 36.59, 121.57),  deleted = false },
                { coords = vector4(-559.22, -253.99, 36.47, 126.19), deleted = false },
                { coords = vector4(-558.4, -257.32, 36.24, 193.9),   deleted = false },
                { coords = vector4(-555.10, -260.4, 36.01, 267.89),  deleted = false },
                { coords = vector4(-552.23, -259.16, 36.13, 278.78), deleted = false },
                { coords = vector4(-550.31, -262.10, 35.77, 220.89), deleted = false },
                { coords = vector4(-547.04, -261.58, 35.75, 270.78), deleted = false },
                { coords = vector4(-552.97, -254.43, 36.55, 357.55), deleted = false },
                { coords = vector4(-552.04, -251.92, 36.57, 299.81), deleted = false },
                { coords = vector4(-549.81, -245.49, 36.68, 327.43), deleted = false },
                { coords = vector4(-546.35, -243.81, 36.64, 278.13), deleted = false },
                { coords = vector4(-544.63, -239.48, 36.78, 224.64), deleted = false },
                { coords = vector4(-540.29, -240.3, 36.53, 273.86),  deleted = false },
                { coords = vector4(-540.08, -244.11, 36.28, 178.33), deleted = false },
                { coords = vector4(-543.08, -247.3, 36.33, 132.28),  deleted = false },
                { coords = vector4(-544.7, -249.53, 36.29, 160.24),  deleted = false },
                { coords = vector4(-545.02, -252.57, 36.17, 200.1),  deleted = false },
                { coords = vector4(-544.56, -255.93, 36.1, 192.61),  deleted = false },
                { coords = vector4(-543.8, -258.97, 35.84, 205.36),  deleted = false },
                { coords = vector4(-541.16, -258.95, 35.8, 313.54),  deleted = false },
                { coords = vector4(-541.69, -256.51, 35.91, 356.69), deleted = false },
                { coords = vector4(-538.69, -256.57, 35.84, 262.88), deleted = false },
                { coords = vector4(-537.31, -257.97, 35.77, 231.88), deleted = false },
                { coords = vector4(-534.79, -257.88, 35.72, 252.25), deleted = false },
                { coords = vector4(-529.94, -254.25, 35.74, 305.95), deleted = false },
                { coords = vector4(-532.46, -248.65, 35.81, 19.36),  deleted = false },
                { coords = vector4(-541.47, -252.73, 36.04, 349.74), deleted = false },
                { coords = vector4(-540.6, -249.05, 36.11, 344.2),   deleted = false },
                { coords = vector4(-518.26, -224.1, 36.73, 66.98),   deleted = false },
                { coords = vector4(-515.10, -224.19, 36.72, 241.16), deleted = false },
                { coords = vector4(-515.91, -227.7, 36.22, 165.1),   deleted = false },
                { coords = vector4(-516.19, -230.3, 35.88, 189.42),  deleted = false },
                { coords = vector4(-515.64, -232.36, 35.88, 206.65), deleted = false },
                { coords = vector4(-512.82, -233.47, 35.99, 270.3),  deleted = false },
                { coords = vector4(-509.78, -233.93, 36.19, 296.77), deleted = false },
                { coords = vector4(-506.98, -230.58, 36.47, 346.51), deleted = false },
                { coords = vector4(-507.58, -226.18, 36.58, 313.73), deleted = false },
                { coords = vector4(-504.18, -224.15, 36.56, 250.57), deleted = false },
                { coords = vector4(-501.38, -225.7, 36.51, 219.19),  deleted = false },
                { coords = vector4(-497.51, -227.78, 36.4, 234.48),  deleted = false },
                { coords = vector4(-499.55, -232.17, 36.34, 214.33), deleted = false },
                { coords = vector4(-496.44, -234.78, 36.24, 246.95), deleted = false },
                { coords = vector4(-494.92, -238.5, 36.1, 188.11),   deleted = false },
                { coords = vector4(-497.85, -241.9, 35.94, 157.63),  deleted = false },
                { coords = vector4(-500.74, -243.89, 35.86, 125.13), deleted = false },
                { coords = vector4(-502.03, -248.29, 35.72, 246.18), deleted = false },
                { coords = vector4(-498.36, -249.71, 35.72, 282.19), deleted = false },
                { coords = vector4(-496.49, -248.66, 35.74, 283.88), deleted = false },
                { coords = vector4(-493.45, -246.56, 35.88, 297.1),  deleted = false },
                { coords = vector4(-489.9, -245.65, 35.88, 279.53),  deleted = false },
                { coords = vector4(-482.2, -242.91, 35.94, 72.87),   deleted = false },
                { coords = vector4(-483.77, -240.49, 36.01, 348.65), deleted = false },
                { coords = vector4(-483.42, -236.81, 36.15, 354.72), deleted = false },
                { coords = vector4(-486.75, -232.92, 36.2, 100.6),   deleted = false },
                { coords = vector4(-489.65, -230.08, 36.41, 355.38), deleted = false },
                { coords = vector4(-492.66, -226.24, 36.38, 54.77),  deleted = false },
                { coords = vector4(-494.61, -221.47, 36.46, 14.55),  deleted = false },
                { coords = vector4(-495.26, -217.85, 36.53, 12.8),   deleted = false },
                { coords = vector4(-494.06, -215.44, 36.62, 307.92), deleted = false },
                { coords = vector4(-491.31, -212.62, 36.72, 318.1),  deleted = false },
                { coords = vector4(-491.33, -208.85, 36.84, 12.4),   deleted = false },
                { coords = vector4(-490.35, -206.52, 36.95, 348.58), deleted = false },
                { coords = vector4(-487.91, -209.47, 36.88, 206.69), deleted = false },
                { coords = vector4(-485.88, -213.17, 36.77, 208.64), deleted = false },
                { coords = vector4(-483.61, -217.48, 36.65, 206.57), deleted = false },
                { coords = vector4(-484.4, -221.76, 36.48, 162.59),  deleted = false },
                { coords = vector4(-498.47, -216.58, 36.62, 194.86), deleted = false },
                { coords = vector4(-506.71, -221.29, 36.62, 117.84), deleted = false },
                { coords = vector4(-510.61, -224.54, 36.68, 128.94), deleted = false },
                { coords = vector4(-511.18, -228.03, 36.42, 178.67), deleted = false },
                { coords = vector4(-503.31, -228.47, 36.47, 239.41), deleted = false },
                { coords = vector4(-503.87, -232.08, 36.4, 181.98),  deleted = false },
                { coords = vector4(-500.9, -235.11, 36.32, 233.79),  deleted = false },
                { coords = vector4(-501.75, -237.67, 36.29, 155.38), deleted = false },
                { coords = vector4(-504.47, -238.69, 36.25, 121.99), deleted = false },
                { coords = vector4(-509.37, -239.52, 35.96, 91.65),  deleted = false },
                { coords = vector4(-509.71, -241.91, 35.87, 180.61), deleted = false },
                { coords = vector4(-504.92, -243.96, 35.86, 264.53), deleted = false },
                { coords = vector4(-497.36, -245.41, 35.76, 47.2),   deleted = false },
                { coords = vector4(-495.10, -243.31, 35.92, 301.9),  deleted = false },
                { coords = vector4(-493.11, -242.18, 35.99, 301.87), deleted = false },
                { coords = vector4(-487.63, -238.44, 36.06, 111.79), deleted = false },
                { coords = vector4(-489.10, -236.59, 36.11, 31.33),  deleted = false },
                { coords = vector4(-484.49, -234.5, 36.17, 285.57),  deleted = false },
                { coords = vector4(-481.11, -238.06, 36.08, 209.43), deleted = false },
                { coords = vector4(-479.78, -240.32, 36.01, 211.73), deleted = false },
                { coords = vector4(-477.35, -239.33, 36.03, 322.1),  deleted = false },
                { coords = vector4(-476.33, -236.3, 36.12, 2.79),    deleted = false },
                { coords = vector4(-478.89, -234.95, 36.17, 67.05),  deleted = false },
                { coords = vector4(-478.65, -232.91, 36.22, 346.68), deleted = false },
                { coords = vector4(-481.44, -231.72, 36.25, 82.5),   deleted = false },
                { coords = vector4(-483.24, -230.39, 36.27, 49.71),  deleted = false },
                { coords = vector4(-481.91, -227.56, 36.35, 303.18), deleted = false },
                { coords = vector4(-480.99, -224.34, 36.44, 3.93),   deleted = false },
                { coords = vector4(-485.08, -224.79, 36.41, 108.25), deleted = false },
                { coords = vector4(-487.77, -223.7, 36.46, 62.62),   deleted = false },
                { coords = vector4(-489.6, -221.39, 36.44, 39.88),   deleted = false },
                { coords = vector4(-489.25, -218.87, 36.53, 340.81), deleted = false },
                { coords = vector4(-488.78, -215.63, 36.63, 2.15),   deleted = false },
                { coords = vector4(-491.25, -216.86, 36.58, 172.03), deleted = false },

            },
            pruningModel = "prop_bush_neat_04",
            pruningArea = {
                { coords = vector4(-568.94, -252.27, 36.55, 210.74),                             deleted = false },
                { coords = vector4(-567.45920881497, -254.87907214663, 36.466837376868, 211.07), deleted = false },
                { coords = vector4(-565.97841762994, -257.48814429327, 36.383674753735, 211.23), deleted = false },
                { coords = vector4(-564.49762644491, -260.0972164399, 36.300512130603, 211.27),  deleted = false },
                { coords = vector4(-563.01683525988, -262.70628858653, 36.21734950747, 211.22),  deleted = false },
                { coords = vector4(-561.53604407485, -265.31536073317, 36.134186884338, 211.27), deleted = false },
                { coords = vector4(-560.05525288982, -267.9244328798, 36.051024261205, 211.27),  deleted = false },
                { coords = vector4(-558.57446170479, -270.53350502643, 36.967861638073, 211.27), deleted = false },
                { coords = vector4(-557.09367051976, -273.14257717307, 36.88469901494, 211.27),  deleted = false },
            },
        },
        {
            name = "gardener3",
            jobDescription1 =
            "You need to remove the overgrown grass in certain areas immediately with a mower and scissors, You need to start right away!",
            jobDescription2 = "Invite your friends and double your money",
            location = "Los Santos - Vinewood",
            minLevel = 4,
            jobTask = {
                { name = "grass",  label = "Grass" },
                { name = "puring", label = "Puring" }
            },
            image = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/3region (1).png",
            awards = {
                money = 12000,
                xp = 3000,
                onlinejobextra = 2.0 -- how many percent of the money will increase when a player enters onlinejob
            },
            lowerModel = {
                "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06", "prop_weeds_nxg07b",
                "prop_weeds_nxg08b"
            },
            lowerAnim = {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                time = 5000,

            },
            lowerArea = {
                { coords = vector4(-1333.84, 182.95, 58.6, 285.74),  deleted = false },
                { coords = vector4(-1332.24, 180.05, 58.57, 205.45), deleted = false },
                { coords = vector4(-1327.53, 177.24, 58.58, 249.55), deleted = false },
                { coords = vector4(-1325.34, 180.22, 58.65, 324.54), deleted = false },
                { coords = vector4(-1325.88, 184.45, 58.73, 20.49),  deleted = false },
                { coords = vector4(-1319.91, 184.66, 58.84, 246.56), deleted = false },
                { coords = vector4(-1320.24, 181.67, 58.75, 144.23), deleted = false },
                { coords = vector4(-1317.28, 177.09, 58.72, 234.46), deleted = false },
                { coords = vector4(-1313.52, 178.19, 58.81, 301.6),  deleted = false },
                { coords = vector4(-1310.14, 183.81, 59.02, 344.31), deleted = false },
                { coords = vector4(-1305.54, 179.49, 59.07, 213.85), deleted = false },
                { coords = vector4(-1304.86, 175.62, 59.08, 177.81), deleted = false },
                { coords = vector4(-1300.56, 176.09, 59.35, 290.45), deleted = false },
                { coords = vector4(-1298.89, 182.16, 59.38, 1.47),   deleted = false },
                { coords = vector4(-1301.06, 186.25, 59.41, 40.1),   deleted = false },
                { coords = vector4(-1295.75, 184.65, 59.58, 235.95), deleted = false },
                { coords = vector4(-1294.71, 180.48, 59.48, 175.3),  deleted = false },
                { coords = vector4(-1296.39, 176.91, 59.36, 143.12), deleted = false },
                { coords = vector4(-1291.91, 177.57, 59.5, 294.49),  deleted = false },
                { coords = vector4(-1289.83, 180.78, 59.64, 340.5),  deleted = false },
                { coords = vector4(-1291.58, 184.81, 59.72, 43.61),  deleted = false },
                { coords = vector4(-1284.87, 182.77, 59.88, 187.56), deleted = false },
                { coords = vector4(-1286.13, 178.68, 59.73, 134.9),  deleted = false },
                { coords = vector4(-1281.53, 179.49, 59.93, 43.46),  deleted = false },
                { coords = vector4(-1284.51, 181.22, 59.85, 54.48),  deleted = false },
                { coords = vector4(-1284.33, 184.39, 59.96, 321.99), deleted = false },
                { coords = vector4(-1279.4, 187.14, 60.32, 311.31),  deleted = false },
                { coords = vector4(-1277.48, 184.82, 60.3, 210.89),  deleted = false },
                { coords = vector4(-1275.3, 180.37, 60.29, 223.71),  deleted = false },
                { coords = vector4(-1272.59, 182.41, 60.54, 316.99), deleted = false },
                { coords = vector4(-1271.72, 186.86, 60.77, 12.95),  deleted = false },
                { coords = vector4(-1268.01, 189.26, 61.13, 82.86),  deleted = false },
                { coords = vector4(-1269.75, 184.44, 60.8, 158.36),  deleted = false },
                { coords = vector4(-1268.51, 180.93, 60.75, 219.71), deleted = false },
                { coords = vector4(-1264.77, 182.64, 61.1, 322.75),  deleted = false },
                { coords = vector4(-1264.54, 187.81, 61.35, 11.61),  deleted = false },
                { coords = vector4(-1259.92, 190.63, 61.91, 292.03), deleted = false },
                { coords = vector4(-1257.19, 187.71, 62.12, 219.59), deleted = false },
                { coords = vector4(-1256.7, 182.23, 61.81, 165.19),  deleted = false },
                { coords = vector4(-1260.57, 179.54, 61.25, 98.3),   deleted = false },
                { coords = vector4(-1254.96, 179.26, 61.66, 263.56), deleted = false },
                { coords = vector4(-1250.78, 181.7, 62.42, 322.27),  deleted = false },
                { coords = vector4(-1251.47, 186.73, 63.12, 6.7),    deleted = false },
                { coords = vector4(-1254.35, 192.36, 62.65, 59.13),  deleted = false },
                { coords = vector4(-1320.27, 166.73, 57.8, 92.84),   deleted = false },
                { coords = vector4(-1323.99, 168.61, 57.8, 60.45),   deleted = false },
                { coords = vector4(-1328.6, 168.09, 57.8, 109.43),   deleted = false },
                { coords = vector4(-1332.95, 169.08, 57.8, 63.57),   deleted = false },
                { coords = vector4(-1336.05, 165.95, 57.81, 148.37), deleted = false },
                { coords = vector4(-1335.01, 162.27, 57.8, 218.17),  deleted = false },
                { coords = vector4(-1331.35, 165.56, 57.8, 350.22),  deleted = false },
                { coords = vector4(-1328.05, 167.06, 57.8, 274.66),  deleted = false },
                { coords = vector4(-1322.95, 166.27, 57.8, 260.32),  deleted = false },
                { coords = vector4(-1318.34, 163.64, 57.82, 227.71), deleted = false },
                { coords = vector4(-1318.75, 160.52, 57.8, 126.48),  deleted = false },
                { coords = vector4(-1321.62, 160.48, 57.8, 64.4),    deleted = false },
                { coords = vector4(-1326.55, 163.11, 57.81, 55.27),  deleted = false },
                { coords = vector4(-1329.47, 162.16, 57.8, 153.28),  deleted = false },
                { coords = vector4(-1331.09, 157.71, 57.8, 172.45),  deleted = false },
                { coords = vector4(-1328.44, 155.55, 57.8, 231.73),  deleted = false },
                { coords = vector4(-1323.39, 155.13, 57.8, 282.84),  deleted = false },
                { coords = vector4(-1319.58, 157.46, 57.81, 317.47), deleted = false },
                { coords = vector4(-1318.72, 161.71, 57.81, 354.88), deleted = false },
                { coords = vector4(-1330.04, 183.92, 58.66, 343.14), deleted = false },
                { coords = vector4(-1321.99, 178.25, 58.66, 239.02), deleted = false },
                { coords = vector4(-1315.7, 181.11, 58.82, 304.88),  deleted = false },
                { coords = vector4(-1311.83, 181.07, 58.89, 245.76), deleted = false },
                { coords = vector4(-1310.56, 176.76, 58.86, 182.34), deleted = false },
                { coords = vector4(-1304.43, 183.2, 59.19, 298.57),  deleted = false },
                { coords = vector4(-1306.32, 185.5, 59.2, 28.59),    deleted = false },
                { coords = vector4(-1300.17, 179.17, 59.31, 255.66), deleted = false },
                { coords = vector4(-1288.31, 185.08, 59.84, 302.09), deleted = false },
                { coords = vector4(-1280.76, 183.22, 60.06, 251.37), deleted = false },
                { coords = vector4(-1278.72, 180.9, 60.1, 223.5),    deleted = false },
                { coords = vector4(-1274.42, 185.96, 60.55, 353.28), deleted = false },
                { coords = vector4(-1267.74, 186.19, 61.02, 265.62), deleted = false },
                { coords = vector4(-1243.13, 181.4, 62.82, 278.56),  deleted = false },
                { coords = vector4(-1234.31, 178.52, 62.91, 53.62),  deleted = false },
                { coords = vector4(-1236.82, 178.93, 62.77, 77.26),  deleted = false },
                { coords = vector4(-1228.18, 185.47, 64.14, 305.32), deleted = false },
                { coords = vector4(-1231.2, 183.13, 63.83, 106.54),  deleted = false },
                { coords = vector4(-1227.78, 181.55, 63.6, 256.13),  deleted = false },
                { coords = vector4(-1225.52, 178.74, 63.28, 285.93), deleted = false },
                { coords = vector4(-1223.24, 179.99, 63.49, 301.07), deleted = false },
                { coords = vector4(-1222.05, 183.15, 63.82, 336.41), deleted = false },
                { coords = vector4(-1220.81, 187.21, 64.22, 328.06), deleted = false },
                { coords = vector4(-1217.3, 185.56, 64.22, 217.07),  deleted = false },
                { coords = vector4(-1216.04, 182.67, 64.02, 204.26), deleted = false },
                { coords = vector4(-1213.07, 180.18, 63.94, 264.93), deleted = false },
                { coords = vector4(-1210.36, 180.11, 64.06, 300.55), deleted = false },
                { coords = vector4(-1208.39, 183.06, 64.41, 332.85), deleted = false },
                { coords = vector4(-1208.25, 186.53, 64.69, 354.79), deleted = false },
                { coords = vector4(-1208.63, 189.46, 64.96, 0.04),   deleted = false },
                { coords = vector4(-1204.36, 190.62, 65.22, 272.07), deleted = false },
                { coords = vector4(-1202.48, 188.21, 65.04, 230.96), deleted = false },
                { coords = vector4(-1198.87, 185.76, 64.9, 233.89),  deleted = false },
                { coords = vector4(-1195.38, 186.47, 65.03, 257.99), deleted = false },
                { coords = vector4(-1193.22, 189.62, 65.25, 314.4),  deleted = false },
                { coords = vector4(-1193.4, 193.16, 65.56, 8.99),    deleted = false },
                { coords = vector4(-1191.69, 196.3, 65.8, 330.5),    deleted = false },
                { coords = vector4(-1188.89, 196.24, 65.77, 276.01), deleted = false },
                { coords = vector4(-1186.12, 193.83, 65.51, 235.83), deleted = false },
                { coords = vector4(-1184.61, 190.94, 65.26, 218.45), deleted = false },
                { coords = vector4(-1183.46, 187.97, 65.05, 187.9),  deleted = false },
                { coords = vector4(-1180.39, 188.8, 65.04, 313.29),  deleted = false },
                { coords = vector4(-1179.54, 192.15, 65.23, 349.64), deleted = false },
                { coords = vector4(-1179.81, 195.63, 65.49, 345.53), deleted = false },
                { coords = vector4(-1176.74, 198.76, 65.64, 280.97), deleted = false },
                { coords = vector4(-1174.03, 197.26, 65.4, 247.33),  deleted = false },
                { coords = vector4(-1171.53, 195.15, 65.17, 226.8),  deleted = false },
                { coords = vector4(-1168.48, 192.66, 64.89, 276.34), deleted = false },
                { coords = vector4(-1166.07, 189.89, 64.68, 236.5),  deleted = false },
                { coords = vector4(-1164.5, 193.29, 64.75, 262.87),  deleted = false },
                { coords = vector4(-1162.69, 196.04, 64.97, 317.17), deleted = false },
                { coords = vector4(-1162.45, 198.27, 65.07, 348.92), deleted = false },
                { coords = vector4(-1162.89, 202.35, 65.29, 18.99),  deleted = false },
                { coords = vector4(-1164.53, 205.03, 65.5, 5.86),    deleted = false },
                { coords = vector4(-1167.17, 209.21, 65.99, 21.41),  deleted = false },
                { coords = vector4(-1167.58, 212.96, 66.55, 344.04), deleted = false },
                { coords = vector4(-1163.93, 215.21, 66.57, 283.39), deleted = false },
                { coords = vector4(-1159.81, 214.76, 66.21, 261.23), deleted = false },
                { coords = vector4(-1157.55, 211.94, 65.76, 211.1),  deleted = false },
                { coords = vector4(-1152.9, 213.47, 65.65, 304.24),  deleted = false },
                { coords = vector4(-1150.96, 209.81, 65.45, 221.75), deleted = false },
                { coords = vector4(-1150.4, 205.49, 65.25, 183.42),  deleted = false },
                { coords = vector4(-1150.18, 200.28, 65.29, 229.47), deleted = false },
                { coords = vector4(-1144.64, 203.28, 65.3, 313.14),  deleted = false },
                { coords = vector4(-1142.56, 205.99, 65.28, 321.79), deleted = false },
                { coords = vector4(-1142.9, 210.45, 65.28, 344.32),  deleted = false },
                { coords = vector4(-1145.8, 214.15, 65.44, 64.03),   deleted = false },
                { coords = vector4(-1246.56, 180.48, 62.6, 216.89),  deleted = false },
                { coords = vector4(-1241.75, 183.14, 63.06, 299.04), deleted = false },
                { coords = vector4(-1240.45, 180.26, 62.72, 234.43), deleted = false },
                { coords = vector4(-1236.91, 182.25, 63.22, 302.85), deleted = false },
                { coords = vector4(-1230.86, 179.5, 63.33, 241.09),  deleted = false },
                { coords = vector4(-1225.06, 185.75, 64.1, 339.02),  deleted = false },
                { coords = vector4(-1219.41, 181.06, 63.72, 182.71), deleted = false },
                { coords = vector4(-1217.2, 179.84, 63.7, 272.93),   deleted = false },
                { coords = vector4(-1212.44, 183.88, 64.3, 324.67),  deleted = false },
                { coords = vector4(-1213.23, 188.25, 64.65, 15.89),  deleted = false },
                { coords = vector4(-1204.82, 184.29, 64.65, 244.25), deleted = false },
                { coords = vector4(-1201.73, 182.18, 64.57, 260.53), deleted = false },
                { coords = vector4(-1191.14, 184.47, 64.9, 288.29),  deleted = false },
                { coords = vector4(-1189.43, 188.12, 65.13, 357.81), deleted = false },
                { coords = vector4(-1190.01, 192.41, 65.46, 14.27),  deleted = false },
                { coords = vector4(-1196.38, 191.59, 65.43, 97.86),  deleted = false },
                { coords = vector4(-1200.08, 191.57, 65.37, 62.82),  deleted = false },
                { coords = vector4(-1200.19, 195.64, 65.67, 312.73), deleted = false },
                { coords = vector4(-1184.53, 198.43, 65.87, 256.84), deleted = false },
                { coords = vector4(-1175.37, 191.79, 65.1, 346.66),  deleted = false },
                { coords = vector4(-1172.49, 199.07, 65.47, 342.65), deleted = false },
                { coords = vector4(-1168.31, 199.19, 65.3, 237.33),  deleted = false },
                { coords = vector4(-1159.78, 195.29, 64.94, 244.58), deleted = false },
                { coords = vector4(-1155.19, 193.94, 65.01, 255.47), deleted = false },
                { coords = vector4(-1152.55, 195.67, 65.21, 343.27), deleted = false },
                { coords = vector4(-1153.81, 199.2, 65.22, 25.17),   deleted = false },
                { coords = vector4(-1157.33, 200.62, 65.24, 72.42),  deleted = false },
                { coords = vector4(-1159.05, 204.5, 65.33, 7.59),    deleted = false },
                { coords = vector4(-1161.59, 208.86, 65.68, 28.62),  deleted = false },
                { coords = vector4(-1155.98, 216.26, 66.16, 310.47), deleted = false },
                { coords = vector4(-1147.51, 211.35, 65.45, 238.29), deleted = false },
                { coords = vector4(-1147.34, 207.54, 65.33, 202.11), deleted = false },
                { coords = vector4(-1147.7, 203.25, 65.29, 195.77),  deleted = false },
                { coords = vector4(-1151.83, 196.23, 65.26, 157.64), deleted = false },
            },
            pruningModel = "prop_bush_neat_04",
            pruningArea = {
                { coords = vector4(-1300.04, 171.18, 59.04, 279.3),  deleted = false },
                { coords = vector4(-1296.12, 172.32, 59.1, 285.4),   deleted = false },
                { coords = vector4(-1292.09, 173.01, 59.21, 276.69), deleted = false },
                { coords = vector4(-1287.53, 172.97, 59.36, 266.87), deleted = false },
                { coords = vector4(-1283.56, 172.73, 59.57, 268.85), deleted = false },
                { coords = vector4(-1278.76, 172.86, 59.69, 272.38), deleted = false },
                { coords = vector4(-1274.15, 173.41, 59.8, 276.18),  deleted = false },
                { coords = vector4(-1269.57, 173.21, 59.88, 264.94), deleted = false },
                { coords = vector4(-1265.35, 172.47, 59.88, 259.22), deleted = false },
                { coords = vector4(-1335.69, 156.94, 57.95, 230.08), deleted = false },
                { coords = vector4(-1332.66, 154.02, 57.95, 224.63), deleted = false },
                { coords = vector4(-1329.95, 151.24, 57.95, 250.05), deleted = false },
                { coords = vector4(-1325.7, 149.94, 57.94, 278.29),  deleted = false },
                { coords = vector4(-1321.56, 151.02, 57.93, 311.2),  deleted = false },
                { coords = vector4(-1261.61, 176.37, 60.67, 272.31), deleted = false },
                { coords = vector4(-1258.96, 176.49, 60.91, 267.92), deleted = false },
                { coords = vector4(-1255.4, 176.28, 61.19, 263.78),  deleted = false },
                { coords = vector4(-1252.4, 175.92, 61.39, 257.4),   deleted = false },
                { coords = vector4(-1249.43, 175.26, 61.4, 257.65),  deleted = false },
                { coords = vector4(-1246.64, 174.92, 61.42, 261.9),  deleted = false },
                { coords = vector4(-1243.69, 174.71, 61.52, 266.91), deleted = false },
                { coords = vector4(-1240.84, 174.67, 61.74, 273.52), deleted = false },
                { coords = vector4(-1237.39, 174.88, 62.02, 272.98), deleted = false },
                { coords = vector4(-1234.18, 175.08, 62.27, 269.18), deleted = false },
                { coords = vector4(-1231.04, 175.09, 62.53, 272.44), deleted = false },
                { coords = vector4(-1229.64, 175.16, 62.62, 271.86), deleted = false },
                { coords = vector4(-1227.78, 175.18, 62.71, 269.25), deleted = false },
                { coords = vector4(-1223.85, 175.08, 62.89, 269.26), deleted = false },
                { coords = vector4(-1220.24, 175.12, 63.07, 272.44), deleted = false },
                { coords = vector4(-1217.48, 175.25, 63.23, 272.48), deleted = false },
                { coords = vector4(-1214.47, 175.41, 63.42, 276.75), deleted = false },
                { coords = vector4(-1211.54, 175.8, 63.62, 277.48),  deleted = false },
                { coords = vector4(-1208.88, 176.16, 63.78, 277.51), deleted = false },
                { coords = vector4(-1205.98, 176.53, 63.96, 276.26), deleted = false },
                { coords = vector4(-1202.37, 176.86, 64.14, 273.88), deleted = false },
                { coords = vector4(-1199.3, 177.13, 64.24, 281.81),  deleted = false },
                { coords = vector4(-1195.59, 177.96, 64.37, 283.25), deleted = false },
                { coords = vector4(-1191.81, 178.93, 64.53, 285.86), deleted = false },
                { coords = vector4(-1188.54, 179.92, 64.58, 287.69), deleted = false },
                { coords = vector4(-1185.67, 180.86, 64.63, 291.2),  deleted = false },
                { coords = vector4(-1182.92, 181.94, 64.67, 291.11), deleted = false },
                { coords = vector4(-1179.6, 183.32, 64.69, 294.15),  deleted = false },
                { coords = vector4(-1176.34, 184.84, 64.7, 289.67),  deleted = false },
                { coords = vector4(-1173.15, 185.94, 64.69, 290.36), deleted = false },
                { coords = vector4(-1169.37, 187.18, 64.64, 284.03), deleted = false },
                { coords = vector4(-1165.91, 187.32, 64.52, 268.09), deleted = false },
                { coords = vector4(-1162.52, 187.28, 64.33, 268.54), deleted = false },
                { coords = vector4(-1159.77, 187.21, 64.16, 270.78), deleted = false },
                { coords = vector4(-1156.82, 187.34, 64.29, 274.18), deleted = false },
                { coords = vector4(-1153.27, 187.67, 64.59, 277.31), deleted = false },
                { coords = vector4(-1150.18, 188.53, 64.89, 297.47), deleted = false },
            },
        },
    }
}

Config.RandomModel           = {
    "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02"
}

Config.JobClothes            = {
    male = {
        { jacket = 97,   texture = 0 },
        { shirt = 59,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 9,      texture = 6 },
        { shoes = 12,    texture = 3 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    },
    female = {
        { jacket = 97,   texture = 0 },
        { shirt = 59,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 9,      texture = 6 },
        { shoes = 12,    texture = 3 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    }
}

Config.Vehiclekey            = true
Config.VehicleSystem         = "qb-vehiclekeys" -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys
Config.Removekeys            = false
Config.RemoveVehicleSystem   =
"qb-vehiclekeys"                                               -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys

Config.GiveVehicleKey        = function(plate, model, vehicle) -- you can change vehiclekeys export if you use another vehicle key system
    if Config.Vehiclekey then
        if Config.VehicleSystem == 'cd_garage' then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleSystem == 'qs-vehiclekeys' then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
        elseif Config.VehicleSystem == 'wasabi-carlock' then
            exports.wasabi_carlock:GiveKey(plate)
            local playerId = GetPlayerServerId(PlayerId())
            exports["wx_carlock"]:shareKey(playerId, plate)
        elseif Config.VehicleSystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        end
    end
end

Config.RemoveVehiclekey      = function(plate, model, vehicle)
    if Config.Removekeys then
        if Config.RemoveVehicleSystem == 'cd_garage' then
            TriggerServerEvent('cd_garage:RemovePersistentVehicles', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.RemoveVehicleSystem == 'qs-vehiclekeys' then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:RemoveKeys(plate, model)
        elseif Config.RemoveVehicleSystem == 'wasabi-carlock' then
            exports.wasabi_carlock:RemoveKey(plate)
        elseif Config.RemoveVehicleSystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        end
    end
end

Config.FuelSystem            = "rcore_fuel"                  -- LegacyFuel / ox-fuel / cdn-fuel

Config.SetVehicleFuel        = function(vehicle, fuel_level) -- you can change LegacyFuel export if you use another fuel system
    if Config.FuelSystem == 'LegacyFuel' then
        return exports["LegacyFuel"]:SetFuel(vehicle, fuel_level)
    elseif Config.FuelSystem == 'ox-fuel' then
        return SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
    elseif Config.FuelSystem == 'rcore_fuel ' then
        return exports['rcore_fuel ']:SetFuel(vehicle, fuel_level)
    else
        return SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
    end
end

Config.AttachFunction        = function(vehicle, truck)
    AttachEntityToEntity(vehicle, truck, 0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0,
        false, false, true, false, 2, true)
end

Config.NotificationText      = {
    ['beforewait'] = {
        text = "Please wait before sending another request.",
        type = "error"
    },
    ['enoughmnoney'] = {
        text = "Not enough money for the purchase",
        type = "error"
    },
    ['gotoside'] = {
        text = "Pick up the vehicle and go to the site",
        type = "success"
    },
    ['alcarmusthere'] = {
        text = "All cars must be here",
        type = "error"
    },
    ['deliveryVehicle'] = {
        text = "Deliver the vehicle",
        type = "success"
    },
    ['notenoughitem'] = {
        text = "Not enough %s to sell.",
        type = "error"
    },
    ['lobbyfull'] = {
        text = "The lobby is full.",
        type = "success"
    },
    ['jobnotstarted'] = {
        text = "You have not started the job yet.",
        type = "error"
    },
    ['jobalreadystarted'] = {
        text = "You have already started the job.",
        type = "error"
    },
    ['maxlevel'] = {
        text = "You have reached the maximum level.",
        type = "error"
    },
    ['playeralreadyinlobby'] = {
        text = "You are already in the lobby.",
        type = "error"
    },
    ['missionnotselected'] = {
        text = "You have not selected a mission.",
        type = "error"
    },
    ['playerleftlobby'] = {
        text = "The mission is terminated because the lobbyist is out of the game.",
        type = "error"
    },
    ['resetJob'] = {
        text = "You have reset the job.",
        type = "error"
    },
    ['playerfaraway'] = {
        text = "The person you invited is far away",
        type = "error"
    },
    ['vehicleexist'] = {
        text = "You cannot start a mission because the vehicle is a vehicle in the Spawn Zone",
        type = "error"
    },
    ['getoutvehicle'] = {
        text = "Get out of the vehicle",
        type = "error"
    }
}

Config.Notification          = function(message, type, isServer, src)
    if isServer then
        if Config.Framework == "esx" then
            TriggerClientEvent("esx:showNotification", src, message)
        else
            TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
        end
    else
        if Config.Framework == "esx" then
            TriggerEvent("esx:showNotification", message)
        else
            TriggerEvent('QBCore:Notify', message, type, 1500)
        end
    end
end



Config.RequiredXP = {
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25500,
    [51] = 26500,
    [52] = 27500,
    [53] = 28500,
    [54] = 29500,
    [55] = 30500,
    [56] = 31500,
    [57] = 32500,
    [58] = 33500,
    [59] = 34500,
    [60] = 35500,
    [61] = 36500,
    [62] = 37500,
    [63] = 38500,
    [64] = 39500,
    [65] = 40500,
    [66] = 41500,
    [67] = 42500,
    [68] = 43500,
    [69] = 44500,
    [70] = 45500,

}
