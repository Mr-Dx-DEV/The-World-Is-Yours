Config.dealerships = Config.dealerships or {}

Config.dealerships.boats = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'Boats DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = false, -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    useStock = true, -- When using job = false this will be ignored
    allowBuyCatalogue = true, -- If true players will be able to buy the vehicles on the catalogue
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue without job
    needsMission = false, -- Set to false or true to disable/disable the needing of going pick up the boat
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(-714.42, -1340.01, -0.18, 139.38), -- Test drive spawn coords
    truck = 'docktug', -- The vehicle used on importation (optional for boats)
    trailer = 'boattrailer', -- The trailer used on importation
    truckSpawn = vec4(-720.0, -1345.0, 0.0, 90.0), -- Importation truck spawn coords
    buySpawn = vec4(-714.42, -1340.01, -0.18, 139.38), -- Vehicle buy spawn coords
    comissions = { buyPercentage = 50, sellComission = 10 }, -- The dealership commissions
    blip = { enabled = true, coords = vec3(-714.42, -1340.01, -0.18), sprite = 410, color = 3, scale = 0.6, display = 4 }, -- Dealership map blip
    dashboards = { -- Dealership dashboards to import vehicles and see transactions
        { coords = vec3(-718.38, -1327.83, 1.49), radius = 0.5, includeBossMenu = true },
    },
    catalogues = { -- The catalogues to the players to see and employees to change vehicles on showroom
        --   { coords = vec3(-724.583, -1334.244, 1.596), radius = 0.4, vehicleCoords = vec4(-716.0, -1342.0, -0.18, 140.0), vehicle = 'speeder', vehicleColor = 111 },
        --    { coords = vec3(-718.0, -1345.0, -0.18), radius = 0.4, vehicleCoords = vec4(-719.0, -1346.5, -0.18, 150.0), vehicle = 'dinghy', vehicleColor = 0 },
        { coords = vec3(-723.83, -1324.16, 1.09), radius = 0.4, vehicleCoords = vec4(-723.46, -1326.24, 1.2, 241.42), vehicle = 'frogger', vehicleColor = 0 },


    },
    categories = { -- The categories that will show on the catalogue and dashboard
        { label = 'Boats', id = 'boats' },
       -- { label = 'Yachts', id = 'yachts' },
      --  { label = 'Jet Skis', id = 'jetskis' },
    },
    pickups = {
        vec4(-714.0, -1340.0, -0.5, 175.35)
    }
}
