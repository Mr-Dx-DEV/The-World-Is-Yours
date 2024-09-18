Config = {}

Config.DefaultLiterPrice = 2.5
Config.MaxFuelStorageLimit = 200000 -- Liter
Config.StarterFuelLevel = 100000

Config.SellingBlipColor = 1
Config.NotSellingBlipColor = 0

Config.BuyStationMoneyType = "cash" -- || or "bank"
Config.WhenSellingStationAddMoneyType = "cash" -- || or "bank"

Config.OxLib = true

Config.SalaryIntervalTime = 5 -- Minute

Config.DefaultStationSalaryData = {
    active = 1,
    payminute = 15,
    ranks = {
        [1] = 50, -- Worker
        [2] = 75, -- Station Manager
        [3] = 100, -- Owner
    }
}

Config.SalaryPayUseStationCase = true
Config.SalaryPayMoneyType = "bank"
Config.SalaryPayNotifs = true

Config.ManageMenuSettings = {
    OpenMenuAccess = {
        [1] = true, -- Worker
        [2] = true, -- Station Manager
        [3] = true, -- Owner
    },
    ManageEmploessAccess = {
        [1] = false, -- Worker
        [2] = true, -- Station Manager
        [3] = true, -- Owner
    },
    ManageCompanyCaseAccess = {
        [1] = false, -- Worker
        [2] = true, -- Station Manager
        [3] = true, -- Owner
    },
    CompanySettingsAccess = {
        [1] = false, -- Worker
        [2] = false, -- Station Manager
        [3] = true, -- Owner
    },
    FuelSettingsAccess = {
        [1] = true, -- Worker
        [2] = true, -- Station Manager
        [3] = true, -- Owner
    },
    ManageSalarySystemAccess = {
        [1] = false, -- Worker
        [2] = false, -- Station Manager
        [3] = true, -- Owner
    },
}

Config.SellPercent = 70 -- ( % ) What percent of the station's buy price will get when sells it?

Config.PassiveIncome = false -- If you activate this, passive income will be paid to the station per hour according to the values ​​you set in the table below. 
--It helps you think it is used by npc's in the city
Config.PassiveIncomeMinute = 60 -- 1 Hour

Config.FuelStations = {
    [1] = {
        ped_coord = vector4(-2073.88, -327.27, 13.32, 87.66),
        ped_model = "s_m_m_dockwork_01",
        ped_scenario = nil, -- If you want add scenario animation
        blip_coord = vector4(-2096.72, -319.16, 13.17, 184.13),
        blip_sprite = 361,
        blip_scale = 0.5,
        station_poly_center = vector3(-2096.72, -319.16, 13.17),
        station_poly_size = 30,
        buy_price = 1000000,
        passive_income_min = 1000,
        passive_income_max = 3000,
        garage = {
            coord = vector4(-2066.32, -312.42, 13.26, 357.72),
            spawncoord = vector4(-2079.82, -304.43, 13.08, 83.9),
            area = {
                poly_coord = vector3(-2068.41, -305.31, 13.15),
                length = 10.0,
                width = 17.2,
                heading = 355,
                minZ = 12.15,
                maxZ = 16.15
            }
        },
        reloadfuel = {
            coord = vector3(-2092.44, -319.86, 13.02),
            length = 19.2,
            height = 7.0,
            heading=354,
        },
    },
    
    [2] = {
        ped_coord = vector4(-1428.25, -268.59, 46.22, 133.93),
        ped_model = "s_m_m_dockwork_01",
        ped_scenario = nil, -- If you want add scenario animation
        blip_coord = vector4(-1436.33, -277.4, 46.21, 222.41),
        blip_sprite = 361,
        blip_scale = 0.5,
        station_poly_center = vector3(-1436.33, -277.4, 46.21),
        station_poly_size = 30,
        buy_price = 1000000,
        passive_income_min = 1000,
        passive_income_max = 3000,
        garage = {
            coord = vector4(-1409.7, -276.61, 46.37, 136.25),
            spawncoord = vector4(-1421.33, -286.75, 46.26, 129.55),
            area = {
                poly_coord = vector3(-1409.76, -276.84, 46.28),
                length = 7.6,
                width = 16.0,
                heading = 42,
                minZ = 44.28,
                maxZ = 50.28
            }
        },
        reloadfuel = {
            coord = vector3(-1437.15, -276.43, 46.22),
            length = 6.8,
            height = 21.0,
            heading=311,
        },
    },

    [3] = {
        ped_coord = vector4(-342.09, -1475.11, 30.75, 270.28),
        ped_model = "s_m_m_dockwork_01",
        ped_scenario = nil, -- If you want add scenario animation
        blip_coord = vector4(-323.0, -1473.78, 30.55, 152.37),
        blip_sprite = 361,
        blip_scale = 0.5,
        station_poly_center = vector3(-323.0, -1473.78, 30.55),
        station_poly_size = 30,
        buy_price = 1000000,
        passive_income_min = 1000,
        passive_income_max = 3000,
        garage = {
            coord = vector4(-358.86, -1484.94, 30.01, 185.8),
            spawncoord = vector4(-359.17, -1479.47, 29.92, 2.41),
            area = {
                poly_coord = vector3(-358.68, -1485.81, 29.84),
                length = 9.2,
                width = 6.0,
                heading = 0,
                minZ = 25.84,
                maxZ = 34.84
            }
        },
        reloadfuel = {
            coord = vector3(-316.08, -1469.64, 30.49),
            length = 19.8,
            height = 7.0,
            heading=30,
        },
    },

    [4] = {
        ped_coord = vector4(641.96, 260.59, 103.3, 61.71),
        ped_model = "s_m_m_dockwork_01",
        ped_scenario = nil, -- If you want add scenario animation
        blip_coord = vector4(624.92, 266.57, 103.09, 186.18),
        blip_sprite = 361,
        blip_scale = 0.5,
        station_poly_center = vector3(624.92, 266.57, 103.09),
        station_poly_size = 30,
        buy_price = 1000000,
        passive_income_min = 1000,
        passive_income_max = 3000,
        garage = {
            coord = vector4(634.36, 253.18, 103.14, 281.06),
            spawncoord = vector4(623.54, 251.9, 103.03, 64.96),
            area = {
                poly_coord = vector3(632.93, 252.83, 103.14),
                length = 13.2,
                width = 10.2,
                heading = 330,
                minZ = 99.14,
                maxZ = 108.14
            }
        },
        reloadfuel = {
            coord = vector3(616.6, 269.12, 103.08),
            length = 21.4,
            height = 7.0,
            heading = 1,
        },
    },
}

Config.TruckShopBuyMoneyType = "bank"
Config.TruckShop = {
    coord = vector4(-182.42, -594.11, 48.22, 191.68),
    model = "cs_solomon",
    targetlabel = "Truck Shop",
    targeticon = "fa-solid fa-laptop",
    blip_sprite = 477,
    blip_scale = 0.5,
    blip_color = 47,
    blip_text = "Truck Shop",
    vehicles = {
        {model = "hauler", label = "Hauler", price = 100000, image = "https://docs.fivem.net/vehicles/hauler.webp"},
        {model = "hauler2", label = "Hauler 2", price = 200000, image = "https://docs.fivem.net/vehicles/hauler2.webp"},
        {model = "phantom", label = "Phantom", price = 150000, image = "https://docs.fivem.net/vehicles/phantom.webp"},
        {model = "phantom3", label = "Phantom 3", price = 100000, image = "https://docs.fivem.net/vehicles/phantom3.webp"},
        {model = "packer", label = "Packer", price = 100000, image = "https://docs.fivem.net/vehicles/packer.webp"},
        {model = "tanker", label = "Tanker", price = 50000, image = "https://docs.fivem.net/vehicles/tanker.webp"},
    },
}

-- !IMPORTANT For the warp into ped
Config.TankerModels = {
    ["tanker"] = `tanker`,
}

Config.GarageDepotPrice = 500
Config.GarageDepotMoneyType = "cash"

Config.RefineryCraftFuelTime = 30 -- Minute
Config.RefienerySellRate = 70 -- ( % ) What percent of the station's buy price will get when sells it?
Config.RefineryWithdrawMinute = 15 -- Indicates how many minutes the refinery payouts will reach player

Config.RefineryLtPrice = 10 -- 1 Lt $

Config.BuyRefineryMoneyType = "bank"
Config.SellRefineryMoneyType = "bank"
Config.RefineryWithdrawMoneyType = "bank"
Config.RefineryJobBuyMoneyType = "bank"

Config.ProgressBarTimes = {
    ["load-fuel"] = 15000,
    ["reload-fuel"] = 15000
}

Config.RefineryNpcs = {
    {
        coord = vector4(1709.81, -1503.49, 113.95, 76.03),
        blip_color = 47,
        blip_sprite = 648,
        blip_text = "Refinery Manager",
        blip_scale = 0.8,
        ped_model = "mp_m_weapwork_01",
    }
}

Config.RefineryBlip = {
    text = "My Refinery",
    sprite = 317,
    color = 40,
    scale = 0.8,
}

Config.Refinery = {
    ["refinery-1"] = {
        coord = vector4(1775.95, -1316.95, 94.94, 70.06),
        targetSettings = {
            target_coord = vector3(1773.4, -1320.16, 94.55),
            target_sizea = 12.4,
            target_sizeb = 4.2,
            target_heading = 320,
            target_minz = 86.0,
            target_maxz = 108.94,
            target_debugpoly = false,
        },
        buy_price = 1000000,
        fuel_generation_rate = 1000, -- 30 Minute, 1000Lt
    },
    ["refinery-2"] = {
        coord = vector4(1794.75, -1347.54, 100.55, 19.94),
        targetSettings = {
            target_coord = vector3(1791.67, -1347.68, 98.71),
            target_sizea = 6.0,
            target_sizeb = 15.6,
            target_heading = 335,
            target_minz = 92.0,
            target_maxz = 110.55,
            target_debugpoly = false,
        },
        buy_price = 1000000,
        fuel_generation_rate = 1000, -- 30 Minute, 1000Lt
    },
    ["refinery-3"] = {
        coord = vector4(1692.73, -1432.53, 112.91, 90.65),
        targetSettings = {
            target_coord = vector3(1691.4, -1433.91, 112.71),
            target_sizea = 13.6,
            target_sizeb = 7.4,
            target_heading = 0,
            target_minz = 105.0,
            target_maxz = 120.21,
            target_debugpoly = false,
        },
        buy_price = 1000000,
        fuel_generation_rate = 1000, -- 30 Minute, 1000Lt
    },
    ["refinery-4"] = {
        coord = vector4(1681.01, -1452.66, 112.51, 213.81),
        targetSettings = {
            target_coord = vector3(1682.35, -1450.6, 112.21),
            target_sizea = 6.4,
            target_sizeb = 14.0,
            target_heading = 0,
            target_minz = 105.0,
            target_maxz = 120.21,
            target_debugpoly = false,
        },
        buy_price = 1000000,
        fuel_generation_rate = 1000, -- 30 Minute, 1000Lt
    },
    ["refinery-5"] = {
        coord = vector4(1664.53, -1521.99, 112.71, 69.96),
        targetSettings = {
            target_coord = vector3(1661.57, -1521.51, 112.75),
            target_sizea = 12.6,
            target_sizeb = 4.6,
            target_heading = 335,
            target_minz = 105.0,
            target_maxz = 120.21,
            target_debugpoly = false,
        },
        buy_price = 1000000,
        fuel_generation_rate = 1000, -- 30 Minute, 1000Lt
    },
}