Config.dealerships = Config.dealerships or {}

Config.dealerships.truck = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'Truck DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = 'truck', -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    useStock = true, -- When using job = false this will be ignored
    allowBuyCatalogue = true, -- If true players will be able to buy the vehicles on the catalogue
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue without job
    needsMission = false, -- Set to false or true to disable/disable the needing of going pick up the car
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(1196.73, -3205.27, 6.0, 80.27), -- Test drive spawn coords
    truck = 'phantom', -- The truck used on importation
    trailer = 'tr4', -- The trailer used on importation
    truckSpawn = vec4(1200.0, -3210.0, 6.0, 90.0), -- Importation truck spawn coords
    buySpawn = vec4(1196.73, -3205.27, 6.0, 80.27), -- Vehicle buy spawn coords
    comissions = { buyPercentage = 50, sellComission = 10 }, -- The dealership commissions
    blip = { enabled = true, coords = vec3(1196.73, -3205.27, 6.0), sprite = 523, color = 3, scale = 0.5, display = 4 }, -- Dealership map blip
    dashboards = { -- Dealership dashboards to import vehicles and see transactions
        { coords = vec3(1195.0, -3200.0, 6.0), radius = 0.5, includeBossMenu = true },
    },
    catalogues = { -- The catalogues to the players to see and employees to change vehicles on showroom
        { coords = vec3(1196.73, -3205.27, 6.0), radius = 0.4, vehicleCoords = vec4(1198.0, -3207.0, 6.0, 270.0), vehicle = 'packer', vehicleColor = 0 },
        { coords = vec3(1193.5, -3203.5, 6.0), radius = 0.4, vehicleCoords = vec4(1195.0, -3204.5, 6.0, 90.0), vehicle = 'hauler', vehicleColor = 3 },
    },
    categories = { -- The categories that will show on the catalogue and dashboard
        { label = 'Industrial', id = 'industrial' },
        { label = 'Commercial', id = 'commercial' },
        { label = 'Vans', id = 'vans' },
    },
    pickups = {
        vec4(1201.35, -3187.03, 5.98, 175.35)
    }
}
