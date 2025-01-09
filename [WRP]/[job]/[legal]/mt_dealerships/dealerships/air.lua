Config.dealerships = Config.dealerships or {}

Config.dealerships.air = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'Air DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = 'airdealership', -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    useStock = true, -- When using job = false this will be ignored
    allowBuyCatalogue = true, -- If true players will be able to buy the vehicles on the catalogue
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue without job
    needsMission = false, -- Set to false or true to disable/disable the needing of going pick up the aircraft
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(-1654.9, -3147.58, 13.99, 324.78), -- Test drive spawn coords
    truck = 'mammatus', -- Placeholder aircraft for testing (optional)
    buySpawn = vec4(-1654.9, -3147.58, 13.99, 324.78), -- Vehicle buy spawn coords
    comissions = { buyPercentage = 50, sellComission = 10 }, -- The dealership commissions
    blip = { enabled = true, coords = vec3(-1654.9, -3147.58, 13.99), sprite = 326, color = 3, scale = 0.6, display = 4 }, -- Dealership map blip
    dashboards = { -- Dealership dashboards to import vehicles and see transactions
        { coords = vec3(-1655.5, -3150.0, 14.0), radius = 0.5, includeBossMenu = true },
    },
    catalogues = { -- The catalogues to the players to see and employees to change vehicles on showroom
        { coords = vec3(-1654.9, -3147.58, 13.99), radius = 0.4, vehicleCoords = vec4(-1656.0, -3148.5, 14.0, 320.0), vehicle = 'dodo', vehicleColor = 111 },
        { coords = vec3(-1652.0, -3145.0, 13.99), radius = 0.4, vehicleCoords = vec4(-1653.5, -3146.5, 14.0, 310.0), vehicle = 'frogger', vehicleColor = 0 },
    },
    categories = { -- The categories that will show on the catalogue and dashboard
        { label = 'Planes', id = 'planes' },
        { label = 'Helicopters', id = 'helicopters' },
      --  { label = 'Military', id = 'military' },
    },
    pickups = {
        vec4(-1655.0, -3149.0, 13.5, 175.35)
    }
}
