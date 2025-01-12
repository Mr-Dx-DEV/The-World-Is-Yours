Config.dealerships = Config.dealerships or {}

Config.dealerships.emergency = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'Emergency DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = 'emergencydealership', -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    useStock = true, -- When using job = false this will be ignored
    allowBuyCatalogue = true, -- If true players will be able to buy the vehicles on the catalogue
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue without job
    needsMission = false, -- Set to false or true to disable/disable the needing of going pick up the car
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(-12.99, -1639.37, 29.17, 234.6), -- Test drive spawn coords
    truck = 'phantom', -- The truck used on importation
    trailer = 'tr4', -- The trailer used on importation
    truckSpawn = vec4(-20.0, -1640.0, 29.0, 90.0), -- Importation truck spawn coords
    buySpawn = vec4(-12.99, -1639.37, 29.17, 234.6), -- Vehicle buy spawn coords
    comissions = { buyPercentage = 50, sellComission = 10 }, -- The dealership commissions
    blip = { enabled = true, coords = vec3(-38.8, -1671.42, 29.48), sprite = 523, color = 3, scale = 0.5, display = 4 }, -- Dealership map blip
    dashboards = { -- Dealership dashboards to import vehicles and see transactions
        { coords = vec3(-39.02, -1671.2, 30.29), radius = 0.5, includeBossMenu = true },
    },
    catalogues = { -- The catalogues to the players to see and employees to change vehicles on showroom
        { coords = vec3(-21.0, -1645.0, 29.0), radius = 0.4, vehicleCoords = vec4(-21.0, -1645.0, 29.0, 180.0), vehicle = 'ambulance', vehicleColor = 111 },
        { coords = vec3(-25.0, -1647.0, 29.48), radius = 0.4, vehicleCoords = vec4(-26.0, -1648.0, 29.0, 90.0), vehicle = 'firetruk', vehicleColor = 3 },
    },
    categories = { -- The categories that will show on the catalogue and dashboard
        { label = 'Emergency', id = 'emergency' },
       -- { label = 'Medical', id = 'medical' },
       -- { label = 'Fire Trucks', id = 'firetrucks' },
    },
    pickups = {
        vec4(-15.0, -1640.0, 29.0, 175.35)
    }
}
