-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'false' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(460.74, -985.61, 30.73),
    },
    ['ambulance'] = {
        vector3(-504.448, -298.596, 42.321),
    },
    ['urbanmechanic'] = {
        vector3(81.87, -1734.17, 29.61),
    },
    ['countymechanic'] = {
        vector3(1073.45, 2717.52, 38.79),
    },
    ['realestate'] = {
        vector3(-715.9677, 261.2268, 85.0583),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-27.47, -1107.13, 27.27),
    },
    ['vanilla'] = {
        vector3(98.07, -1298.10, 35.58),
    },
    ['catcafe'] = {
        vector3(-578.23, -1067.65, 26.12),
    },
    ['burgershot'] = {
        vector3(-1202.11, -896.00, 13.88),
    },
    ['club77'] = {
        vector3(244.21, -3151.25, 3.33),
    },
    ['doj'] = {
        vector3(-587.92, -204.58, 38.23),
    },
    ['cityhall'] = {
        vector3(-528.28, -188.14, 43.37),
    },
    ['atoms'] = {
        vector3(81.60, 296.23, 110.24),
    },
    ['towing'] = {
        vector3(-185.5, -1165.18, 23.67),
    },
    ['bcso'] = {
        vector3(1824.78, 3672.23, 38.85)
    },
    ['bahamas'] = {
        vector3(-1369.23, -626.16, 30.35),
    },
    ['bennys'] = {
        vector3(-194.98, -1315.84, 31.3),
    },
    ['galaxy'] = {
        vector3(390.75, 270.0, 94.99),
    },
    ['pizzeria'] = {
        vector3(798.56, -750.7, 31.27),
    },
    ['skyclub'] = {
        vector3(-907.94, -444.82, 160.98),
    },
    
    ['mechanichayes'] = {
        vector3(-1600.9527587891, -1000.6383056641, 13.021187782288),
    },
    ['ppp'] = {
        vector3(-1565.43, -449.05, 35.89),
    },
    ['coffeecontainer'] = {
        vector3(1967.12, 3771.18, 32.19),
    },
    ['blazeit'] = {
        vector3(363.02, -1259.51, 32.59),
    },
    ['whitewidow'] = {
        vector3(-1335.94, -1239.96, 9.73),
    },
    ['tequilala'] = {
        vector3(-574.57, 290.24, 79.18),
    },
    ['mechanicautos'] = {
        vector3(559.28, -197.50, 58.15)
    },
    ['lustresort'] = {
        vector3(-570.33, 207.53, 83.29)
    },
    ['upnatom'] = {
        vector3(81.69, 296.27, 110.24)
    },
    ['hornys'] = {
        vector3(1238.30, -348.89, 69.08)
    },
    ['noodle'] = {
        vector3(-1241.17, -272.14, 37.76)
    },
    ['mechanicnos'] = {
        vector3(21.10, 6528.92, 42.97)
    },
    ['mechanictuner'] = {
        vector3(124.8240, -3014.1294, 7.0409)
    },
    ['customcaffe'] = {
        vector3(297.02, -926.06, 58.37)
    },
    ['mechanicamotors'] = {
        vector3(1075.2876, 2717.4453, 38.8688)
    },
    ['rexdiner'] = {
        vector3(2543.5493, 2585.2988, 38.6561)
    },
    ['mechanical'] = {
        vector3(2532.9021, 2639.6106, 37.9454)
    },
    ['mechanicredline'] = {
        vector3(-605.6078, -920.1747, 23.8866)
    },
    ['beanmachine'] = {
        vector3(122.37, -1045.54, 29.27)
    },
    ['pkart'] = {
        vector3(-2269.18, 218.39, 169.60)
    },
    ['vending'] = {
        vector3(249.03, -1745.44, 29.28)
    },
    ['lplucker'] = {
        vector3(146.23, -1476.35, 29.30)
    },
    ['vapeshop'] = {
        vector3(-499.17, 295.87, 83.31)
    },
    ['collectors'] = {
        vector3(-145.42, 218.72, 94.98)
    },
    ['radioshop'] = {
        vector3(716.37, 2526.86, 73.50)
    },
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(461.45, -986.2, 30.73), length = 0.35, width = 0.45, heading = 351.0, minZ = 30.58, maxZ = 30.68 } ,
    },
    ['ambulance'] = {
        { coords = vector3(-504.448, -298.596, 42.321), length = 1.2, width = 0.6, heading = 213.533, minZ = 42.02, maxZ = 42.83 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67 },
    },
    ['urbanmechanic'] = {
        { coords = vector3(81.87, -1734.17, 29.61), length = 1.15, width = 2.6, heading = 153.35, minZ = 29.50, maxZ = 31.00 },
    },
    ['countymechanic'] = {
        { coords = vector3(1073.45, 2717.52, 38.79), length = 1.15, width = 2.6, heading = 237.05, minZ = 38.00, maxZ = 39.00 },
    },
}    

Config.GangMenus = {
    ['rollin60s'] = {
        vector3(-1135.65, -195.88, 37.99)
    },
    ['jd'] = {
        vector3(-2820.31, 1433.45, 104.99)
    },
    ['tsaintsmc'] = {
        vector3(-1490.3641, -926.3775, 13.2891)
    },
    ['gb'] = {
        vector3(-1528.52, 150.14, 60.8)
    },
    ['thequantum'] = {
        vector3(-657.73, -884.55, 32.33)
    },
    ['pinkpanthers'] = {
        vector3(531.78, -1929.49, 28.97)
    },
}

Config.GangMenuZones = {
     --[[ ['alcapone'] = {
         { coords = vector3(-1529.14, 149.61, 61.28), length = 1.0, width = 1.0, heading = 45.0, minZ = 58.0, maxZ = 63.0 },
     },
     ['yakuza'] = {
         { coords = vector3(-1877.59, 2059.48, 145.57), length = 1.0, width = 1.0, heading = 1.0, minZ = 142.97, maxZ = 146.97 },
     }, ]]
    -- ['families'] = {
    --     { coords = vector3(-138.12, -1608.25, 35.03), length = 2.0, width = 2.0, heading = 340.0, minZ = 32.23, maxZ = 36.23 },
    -- },
    -- ['lostmc'] = {
    --     { coords = vector3(917.79, 3577.56, 29.92), length = 5.0, width = 1.0, heading = 0.0, minZ = 26.32, maxZ = 30.32 },
    -- },
    -- ['marabunta'] = {
    --     { coords = vector3(1440.01, -1489.83, 66.62), length = 2.0, width = 2.0, heading = 160.0, minZ = 64.02, maxZ = 68.02 },
    -- },
    -- ['bloods'] = {
    --     { coords = vector3(-1566.25, -409.02, 51.49), length = 1.5, width = 1.5, heading = 320.0, minZ = 46.69, maxZ = 53.69 },
    -- },
}
