Config.dealerships = Config.dealerships or {}

Config.dealerships.wiy = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'WIY DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = 'wiy', -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    useStock = true, -- When using job = false this will be ignored
    allowBuyCatalogue = true, -- If true players will be able to buy the vehicles on the catalogue
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue without job
    needsMission = false, -- Set to false or true to disable/disable the needing of going pick up the car
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(-68.36, 82.67, 71.52, 65.74), -- Test drive spawn coords
    truck = 'packer', -- The truck used on importation
    trailer = 'tr4', -- The trailer used on importation
    truckSpawn = vec4(-75.0, 80.0, 70.0, 90.0), -- Importation truck spawn coords
    buySpawn = vec4(-68.36, 82.67, 71.52, 65.74), -- Vehicle buy spawn coords
    comissions = { buyPercentage = 50, sellComission = 10 }, -- The dealership commissions
    blip = { enabled = true, coords = vec3(-64.04, 73.81, 71.62), sprite = 523, color = 3, scale = 0.5, display = 4 }, -- Dealership map blip
    dashboards = { -- Dealership dashboards to import vehicles and see transactions
        { coords = vec3(-64.04, 73.81, 71.62), radius = 0.5, includeBossMenu = true },
    },
    catalogues = { -- The catalogues to the players to see and employees to change vehicles on showroom
        { coords = vec3(-76.48, 75.18, 71.63), radius = 0.4, vehicleCoords = vec4(-76.48, 75.18, 71.63, 250.0), vehicle = 'adder', vehicleColor = 111 },
    },
    categories = { -- The categories that will show on the catalogue and dashboard
        { label = 'One of One', id = 'oneofone' },
        { label = 'One of Five', id = 'oneoffive' },
        { label = 'One of Ten', id = 'oneoften' },
        { label = 'Dealership', id = 'dealership' },
        { label = 'Import', id = 'import' },
        { label = 'Gang', id = 'gang' },
        { label = 'Admin Only', id = 'adminonly' },
    },
    pickups = {
        vec4(1201.35, -3187.03, 5.98, 175.35)
    }
}
