Config = {}

Config.Core = "qb-core" -- Your qb-core folder name
Config.TargetName = "qb-target" -- If you use ox, ignore this
Config.Target = "ox" -- "qb" or "ox"
Config.Inventory = "ox" -- "qb" or "ox"
Config.MenuName = "qb-menu" -- If you use ox, ignore this
Config.Menu = "ox" -- "qb" or "ox"
Config.EmoteMenu = "rp" -- "rp" or "dp" or "scully" or "aty_emote" or "cylex_animmenuv2"
Config.SpacePlate = false -- If true if your plate has space | Example: QQS 224
Config.Debug = false -- If true, some prints happen on console
Config.TargetDistances = 3.0 -- Distance of targets
Config.TargetOption = "ped" -- "zone" or "ped" ( If zone, the ped dont appear )

Config.Societys = {
    enable = true, -- If true the money of insurance goes to society
    management = "qb-management", -- "qb-management" or "qb-banking" or "okokBanking"
    carInsurance = "mechanic", -- Society name for car insurance
    healthInsurance = "hospital", -- Society name for health insurance
    homeInsurance = "realestate", -- Society name for home insurance
}

Config.SpecialVehicles = {
    ["police"] = {
        { modelVeh = "police", nameCard = "Police" },
    },
    ["ambulance"] = {
        { modelVeh = "ambulance", nameCard = "Ambulance" },
    },
    ["mechanic"] = {
        { modelVeh = "towtruck", nameCard = "Towtruck" },
    },
}

-- Insurance & Registration Settings
Config.InsuranceSettings = {
    Blip = { 
        [1] = { enable = true, coords = vector3(834.99, -813.01, 26.33), sprite = 89, colour = 5, scale = 0.8, name = "Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(834.99, -813.01, 26.33), pedModel = "s_m_m_fiboffice_01", heading = 90.62},
    }
}

Config.InsuranceTypePayment = "cash" -- "cash" or "bank"
Config.RegistrationPrice = 500 -- Price of registration vehicle
Config.InsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Health Insurance
Config.HealthInsuranceSettings = {
    Blip = { 
        [1] = { enable = false, coords = vector3(311.38, -594.21, 43.28), sprite = 107, colour = 5, scale = 0.8, name = "Health Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(-495.39, -342.65, 42.32), pedModel = "s_m_m_doctor_01", heading = 353.47},
    }
}

Config.HealthInsurancePayment = "cash" -- "cash" or "bank"
Config.HealthInsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Home Insurance
Config.HomeInsuranceSettings = {
    Blip = { 
        [1] = { enable = true, coords = vector3(-709.71, 271.72, 83.15), sprite = 107, colour = 5, scale = 0.8, name = "Home Insurance" },
    },
    Peds = {
        [1] = { coords = vector3(-709.16, 272.15, 83.15), pedModel = "s_m_m_strpreach_01", heading = 203.3},
    }
}
Config.HomeInsurancePayment = "cash" -- "cash" or "bank"
Config.HomeInsurancePrice = {
    [1] = 500, -- 1 Month
    [2] = 1000, -- 2 Month
    [3] = 1500, -- 3 Month
}

-- Commands
Config.Commands = {
    checkInsurance = {
        command = "checkinsurance",  -- Command to check insurance on specific plate
        description = "Check insurance by plate", -- Description of the command
        help = "Write the plate of vehicle", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeInsurance = {
        command = "removeinsurance", -- Command to remove insurance on specific plate
        description = "Remove insurance by plate", -- Description of the command
        help = "Write the plate of vehicle", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    checkHealthInsurance = {
        command = "checkhealthinsurance",  -- Command to check health insurance on specific citizenid
        description = "Check health insurance by citizenid", -- Description of the command
        help = "Write the citizen ID", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeHealthInsurance = {
        command = "removehealthinsurance", -- Command to remove health insurance on specific citizenid
        description = "Remove health insurance by citizenid", -- Description of the command
        help = "Write the citizen ID", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    checkHomeInsurance = {
        command = "checkhomeinsurance", -- Command to check home insurance on specific citizenid
        description = "Check home insurance by citizenid", -- Description of the command
        help = "Write the citizen ID", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
    removeHomeInsurance = {
        command = "removehomeinsurance", -- Command to remove home insurance on specific citizenid
        description = "Remove home insurance by citizenid", -- Description of the command
        help = "Write the citizen ID", -- Help on chat
        needJob = true, -- Need job to execute the command?
        jobs = { -- List of jobs can execute the command
            "police",
            "lspd"
        },
    },
}

-- Settings Repairs
Config.QuasarGaragesRepairs = false -- You use qs-advancedgarages?
Config.RepairsEnable = false -- Enable repairs?
Config.Repairs = {
    [1] = {
        blipRepair = { enable = true, sprite = 402, colour = 5, scale = 0.8, name = "Car Repair" },
        pedCoords = vector3(-209.95, -1331.48, 30.89),
        pedHeading = 111.22,
        pedModel = "s_m_m_autoshop_02",
        repairType = "all", -- "engine", "body", "all"
        repairCost = 500, -- Cost of repair vehicle
        costType = "bank", -- "cash" or "bank"
        withInsurance = true, -- Only can use if have car insurance    
        repairTime = 5000, -- Time of progressbar
    },
    [2] = {
        blipRepair = { enable = true, sprite = 402, colour = 5, scale = 0.8, name = "Car Repair" },
        pedCoords = vector3(454.21, -563.03, 28.55),
        pedHeading = 173.14,
        pedModel = "s_m_m_ccrew_01",
        repairType = "all", -- "engine", "body", "all"
        repairCost = 500, -- Cost of repair vehicle
        costType = "bank", -- "cash" or "bank"
        withInsurance = true, -- Only can use if have car insurance    
        repairTime = 5000, -- Time of progressbar
    },
    [3] = {
        blipRepair = { enable = false, sprite = 402, colour = 5, scale = 0.8, name = "Boat Repair" },
        pedCoords = vector3(-802.14, -1512.49, 1.6),
        pedHeading = 111.22,
        pedModel = "s_m_m_cntrybar_01",
        repairType = "all", -- "engine", "body", "all"
        repairCost = 2000, -- Cost of repair vehicle
        costType = "bank", -- "cash" or "bank"
        withInsurance = true, -- Only can use if have car insurance   
        repairTime = 5000, -- Time of progressbar
    },
    [4] = {
        blipRepair = { enable = false, sprite = 402, colour = 5, scale = 0.8, name = "Airport Repair" },
        pedCoords = vector3(-1272.23, -3338.03, 13.95),
        pedHeading = 235.12,
        pedModel = "s_m_m_gentransport",
        repairType = "all", -- "engine", "body", "all"
        repairCost = 5000, -- Cost of repair vehicle
        costType = "bank", -- "cash" or "bank"
        withInsurance = true, -- Only can use if have car insurance
        repairTime = 5000, -- Time of progressbar
    }
}