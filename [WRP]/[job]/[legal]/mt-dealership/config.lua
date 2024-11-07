Config = Config or {}

Config.LogsWebhook = '' -- Discord webhook to receive logs

Config.Core = 'qb' -- qb or esx
Config.CoreName = 'qb-core' -- qb-core, qbx_core, es_extended, ...
Config.Fuel = 'LegacyFuel' -- LegacyFuel, cc-fuel, ps-fuel, ox_fuel, qs-fuelstations, Renewed-Fuel, pb-fuel ...
Config.Target = 'ox_target' -- qb-target, ox_target, ...
Config.Management = 'qb-management' -- (only for qb-core or qbx_core not esx) qb-banking, Renewed-Banking, qb-management ...
Config.VehicleKeys = 'qb-vehiclekeys' -- qb-vehiclekeys, qs-vehiclekeys, ... (can change export at editable.lua)
Config.BossGradeESX = 4 -- The boss grade for job (only for esx, qb use the isboss value)
Config.Debug = false

Config.mInsurance = {
    enable = true, -- Enable use m-Insurance?
    inventory = "ox", -- "qb" or "ox" | If you use esx leave this "ox"
}

Config.priceLocale = 'en'
Config.dateFormat = "%d/%m/%Y - %X"

Config.importPercentage = 50 -- The percentage of the vehicle price that dealership owner needs to pay to import a vehicle
Config.importEmailTime = 60 -- The time to wait until receive the importation email and spawn truck
Config.sellPercentage = 10 -- The percentage that employee will receive of vehicle price on its sell
Config.containerProp = 'prop_contr_03b_ld' -- Don't recommend to change!
Config.useEmail = false -- Only active this if you have qb-phone or any other phone using qb-phone emails

Config.truckName = 'phantom'
Config.trailerName = 'trflat'

Config.testDriveTime = 60 -- Time that a test drive will take (it can be canceled any time)
Config.testDriveInstance = false -- If true the palyers that start a test drive will entry a new instance only with other people and test drive

Config.Commands = {
    SellVehiclePlayer = { -- Command to sell vehicle to players
        enabled = true,
        command = 'sellvehicle',
        decription = 'Sell current vehicle to a player'
    },
    SellVehiclePDM = { -- Command for dealership to buy vehicles
        enabled = true,
        command = 'sellvehiclepdm',
        description = 'Buy a vehicle to PDM'
    }
}


Config.importLocs = {
    { container = vec4(1170.08, -2968.15, 5.9, 269.96), handler = vec4(1203.32, -2957.28, 6.06, 119.0) },
    { container = vec4(534.86, -2932.17, 6.04, 90.63), handler = vec4(566.65, -2933.18, 6.24, 178.83) },
}

Config.vehicleCategories = {
    { label = 'Planes', id = 'planes' },
    { label = 'Helicopters', id = 'helicopters' },
    { label = 'Sports Classics', id = 'sportsclassics' },
    { label = 'Sedans', id = 'sedans' },
    { label = 'Compacts', id = 'compacts' },
    { label = 'Motorcycles', id = 'motorcycles' },
    { label = 'Super', id = 'super' },
    { label = 'Offroad', id = 'offroad' },
    { label = 'Coupes', id = 'coupes' },
    { label = 'Muscle', id = 'muscle' },
    { label = 'Boats', id = 'boats' },
    { label = 'Vans', id = 'vans' },
    { label = 'Sports', id = 'sports' },
    { label = 'SUVs', id = 'suvs' },
    { label = 'Commercial', id = 'commercial' },
    { label = 'Cycles', id = 'cycles' },
    { label = 'Industrial', id = 'industrial' },
    { label = 'Custom PDM', id = 'customspdm' },
    { label = 'DEALERSHIP', id = 'dealership' },
    { label = 'oneofone', id = 'oneofone' },
    { label = 'one of five', id = 'oneoffive' },
    { label = 'one of ten', id = 'oneoften' },
    { label = 'one of ten bikes', id = 'oneoftenbikes' },
    { label = 'GANG', id = 'gang' },
    { label = 'IMPORT', id = 'import' },
    { label = 'ADMINONLY', id = 'adminonly' },
    { label = 'emergency', id = 'emergency' }
}


Config.managementMenus = {
    --[[ {
        coords = vec3(-26.4, -1104.9, 27.3),
        size = vec3(0.6, 0.7, 0.95),
        rotation = 340.0,
        job = 'pdm',
        truckSpawnCoords = vec4(-69.8, -1084.68, 26.73, 161.65),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        
        sellVehicleCoords = vec4(-23.64, -1094.87, 27.30, 340.59),
    },
    {
        coords = vec3(-27.2, -1107.45, 27.4),
        size = vec3(0.6, 0.75, 0.95),
        rotation = 340.0,
        job = 'pdm',
        truckSpawnCoords = vec4(-69.8, -1084.68, 26.73, 161.65),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        sellVehicleCoords = vec4(-23.64, -1094.87, 27.30, 340.59),
    },
 ]]

    {
        coords = vec3(1201.2, -3178.27, 5.61),               --- truck
        size = vec3(0.6, 0.75, 0.95),
        rotation = 80.27,
        job = 'truckdealership',
        truckSpawnCoords = vec4(1196.73, -3205.27, 6.0, 80.27),
        vehicleCategories = {
            { label = 'Industrial', id = 'industrial' },
            { label = 'Commercial', id = 'commercial' },
            { label = 'Vans', id = 'vans' }
        },
        sellVehicleCoords = vec4(1196.73, -3205.27, 6.0, 80.27),
    },
    {
        coords = vec3(-1629.99, -3163.14, 13.99),               --- air
        size = vec3(0.6, 0.75, 0.95),
        rotation = 324.78,
        job = 'airdealership',
        truckSpawnCoords = vec4(-1654.9, -3147.58, 13.99, 324.78),
        vehicleCategories = {
            { label = 'Planes', id = 'planes' },
            { label = 'Helicopters', id = 'helicopters' }
        },
        sellVehicleCoords = vec4(-1654.9, -3147.58, 13.99, 324.78),
    },
    {
        coords = vec3(-731.37, -1310.35, 5.0),               --- boat
        size = vec3(0.6, 0.75, 0.95),
        rotation = 139.38,
        job = 'boatdealership',
        truckSpawnCoords = vec4(-714.42, -1340.01, -0.18, 139.38),
        vehicleCategories = {
            { label = 'Boats', id = 'boats' }
        },
        sellVehicleCoords = vec4(-714.42, -1340.01, -0.18, 139.38),
    },




    {
        coords = vec3(-71.38, 76.99, 71.62),               --- WIY
        size = vec3(0.6, 0.75, 0.95),
        rotation = 250.0,
        job = 'wiydealership',
        truckSpawnCoords = vec4(-100.66, 92.726, 71.784, 53.984),
        vehicleCategories = {
            { label = 'oneofone', id = 'oneofone' },
            { label = 'one of five', id = 'oneoffive' },
            { label = 'one of ten', id = 'oneoften' },
            { label = 'one of ten bikes', id = 'oneoftenbikes' },
            { label = 'DEALERSHIP', id = 'dealership' },
            { label = 'GANG', id = 'gang' },
            { label = 'IMPORT', id = 'import' },
            { label = 'ADMINONLY', id = 'adminonly' }
        },
        sellVehicleCoords = vec4(-68.36, 82.67, 71.52, 65.74),
    },



    {
        coords = vec3(-21.55, -1661.68, 29.48),               --- Emergency
        size = vec3(0.6, 0.75, 0.95),
        rotation = 320.0,
        job = 'emergencydealership',
        truckSpawnCoords = vec4(-6.323, -1640.733, 29.251, 230.1),
        vehicleCategories = {
            { label = 'emergency', id = 'emergency' }
        },
        sellVehicleCoords = vec4(-12.99, -1639.37, 29.17, 234.67),
    },
}


Config.catalogueLocations = {
    --[[ {
        coords = vec3(-38.9, -1100.3, 27.6), -- Catalogue interaction target location
        size = vec3(0.8, 1.0, 0.9), -- Catalogue interaction target size
        rotation = 19.0, -- Catalogue interaction target rotation
        vehicleLoc = vec4(-42.17, -1101.54, 26.3, 292.13), -- Showroom vehicle
        vehicle = 'asea', -- Vehicle showing at showroom
        vehicleColor = 27, -- Vehicle color (This is just to the vehicle be synced with the same color to all players)
        vehicleID = 'PDMVehicle1', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-69.76, -1104.64, 26.2, 69.0), -- Location where vehicle will spawn to test drive
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },  -- All the vehicle categories that will show at catalogue
        job = 'pdm', -- Job that will be able to change the showroom vehicle
    },
    {
        coords = vec3(-40.25, -1094.5, 27.55),
        size = vec3(0.8, 1.0, 0.9),
        rotation = 23.0,
        vehicleLoc = vec4(-37.24, -1093.33, 26.3, 116.82),
        vehicle = 'rumpo',
        vehicleColor = 0,
        vehicleID = 'PDMVehicle2', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-69.76, -1104.64, 26.2, 69.0),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        job = 'pdm',
    },
    {
        coords = vec3(-46.95, -1095.25, 27.5),
        size = vec3(0.8, 1.0, 0.9),
        rotation = 100.75,
        vehicleLoc = vec4(-47.83, -1091.99, 26.3, 194.32),
        vehicle = 'nero2',
        vehicleColor = 5,
        vehicleID = 'PDMVehicle3', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-69.76, -1104.64, 26.2, 69.0),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        job = 'pdm',
    },
    {
        coords = vec3(-51.8, -1095.05, 27.45),
        size = vec3(0.8, 1.0, 0.9),
        rotation = 25.75,
        vehicleLoc = vec4(-55.03, -1097.04, 26.3, 301.7),
        vehicle = 'reaper',
        vehicleColor = 27,
        vehicleID = 'PDMVehicle4', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-69.76, -1104.64, 26.2, 69.0),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        job = 'pdm',
    },
    {
        coords = vec3(-51.05, -1086.9, 27.6),
        size = vec3(0.8, 1.0, 0.9),
        rotation = 66.75,
        vehicleLoc = vec4(-49.71, -1083.62, 25.8, 158.79),
        vehicle = 'zeno',
        vehicleColor = 134,
        vehicleID = 'PDMVehicle5', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-69.76, -1104.64, 26.2, 69.0),
        vehicleCategories = {
            { label = 'Custom PDM', id = 'customspdm' },
            { label = 'Sedans', id = 'sedans' },
            { label = 'Compacts', id = 'compacts' },
            { label = 'Motorcycles', id = 'motorcycles' },
            { label = 'Offroad', id = 'offroad' },
            { label = 'Coupes', id = 'coupes' },
            { label = 'Muscle', id = 'muscle' },
            { label = 'SUVs', id = 'suvs' },
            { label = 'Sports Classics', id = 'sportsclassics' },
            { label = 'Super', id = 'super' },
            { label = 'Sports', id = 'sports' },
            { label = 'Cycles', id = 'cycles' },
            { label = 'Vans', id = 'vans' }
            
        },
        job = 'pdm',
    }, ]]






    {
        coords = vec3(-64.04, 73.81, 71.62),      -- WIY
        size = vec3(0.8, 1.0, 0.9),
        rotation = 330,
        vehicleLoc = vec4(-75.48, 74.18, 71.63, 121.42),
        vehicle = 't20',
        vehicleColor = 134,
        vehicleID = 'WIYVehicle5', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-68.36, 82.67, 71.52, 65.74),
        vehicleCategories = {
            { label = 'oneofone', id = 'oneofone' },
            { label = 'one of five', id = 'oneoffive' },
            { label = 'one of ten', id = 'oneoften' },
            { label = 'one of ten bikes', id = 'oneoftenbikes' },
            { label = 'DEALERSHIP', id = 'dealership' },
            { label = 'GANG', id = 'gang' },
            { label = 'IMPORT', id = 'import' },
            { label = 'ADMINONLY', id = 'adminonly' }
        },
        job = 'wiydealership',
    },

    {
        coords = vec3(-1654.9, -3147.58, 13.99),      -- air
        size = vec3(0.8, 1.0, 0.9),
        rotation = 327.78,
        vehicleLoc = vec4(-1654.9, -3147.58, 13.99, 324.78),
        vehicle = 't20',
        vehicleColor = 134,
        vehicleID = 'airdealership', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-1654.9, -3147.58, 13.99, 324.78),
        vehicleCategories = {
            { label = 'Planes', id = 'planes' },
            { label = 'Helicopters', id = 'helicopters' }
        },
        job = 'airdealership',
    },
    {
        coords = vec3(1196.73, -3205.27, 6.0),      -- truck
        size = vec3(0.8, 1.0, 0.9),
        rotation = 320,
        vehicleLoc = vec4(1196.73, -3205.27, 6.0, 80.27),
        vehicle = 't20',
        vehicleColor = 134,
        vehicleID = 'TruckVehicle', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(1196.73, -3205.27, 6.0, 80.27),
        vehicleCategories = {
            { label = 'Industrial', id = 'industrial' },
            { label = 'Commercial', id = 'commercial' },
            { label = 'Vans', id = 'vans' }
        },
        job = 'truckdealership',
    },

    
    {
        coords = vec3(-714.42, -1340.01, -0.18),      -- boat
        size = vec3(0.8, 1.0, 0.9),
        rotation = 139.38,
        vehicleLoc = vec4(-714.42, -1340.01, -0.18, 139.38),
        vehicle = 't20',
        vehicleColor = 134,
        vehicleID = 'EmergencyVehicle', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-714.42, -1340.01, -0.18, 139.38),
        vehicleCategories = {
            { label = 'Boats', id = 'boats' }
        },
        job = 'boatdealership',
    },
    {
        coords = vec3(-38.8, -1671.42, 29.48),      -- Emergency
        size = vec3(0.8, 1.0, 0.9),
        rotation = 320,
        vehicleLoc = vec4(-20.59, -1644.26, 29.48, 48.26),
        vehicle = 't20',
        vehicleColor = 134,
        vehicleID = 'EmergencyVehicle', -- THIS NEEDS TO BE UNIQUE!!!!
        testDriveLoc = vec4(-12.99, -1639.37, 29.17, 234.67),
        vehicleCategories = {
            { label = 'emergency', id = 'emergency' }
        },
        job = 'emergencydealership',
    },
}

Config.blips = {
  --  { label = 'Premium Deluxe Motorsports', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(-47.89, -1105.21, 27.26) },
    { label = 'WIY DealerShip', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(-64.04, 73.81, 71.62) },
    { label = 'Emergency DealerShip', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(-38.8, -1671.42, 29.48) },

    { label = 'Boats DealerShip', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(-714.42, -1340.01, -0.18) },
    { label = 'Truck DealerShip', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(1196.73, -3205.27, 6.0) },
    { label = 'Air DealerShip', color = 12, sprite = 326, display = 4, scale = 0.6, coords = vec3(-1654.9, -3147.58, 13.99) },
}
