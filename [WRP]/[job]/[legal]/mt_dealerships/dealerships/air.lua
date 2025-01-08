Config.dealerships = Config.dealerships or {}

Config.dealerships.air = { -- Dealership ID, NEEDS TO BE THE SAME AS THE JOB!!!
    enabled = true, -- true or false to enable or disable the dealership
    label = 'Air DealerShip', -- Dealership label
    logo = 'https://i.ibb.co/nkBN3bs/logo.png', -- Dealership logo that'll show on UI
    job = 'airdealership', -- Dealership job or false to not player owned dealerships, NEEDS TO BE THE SAME AS THE ID!!!
    lockCatalogueJob = false, -- can be false for everyone to open the catalogue or a job if you want to lock it to some job
    currency = 'bank', -- bank, cash or money to ESX (Also to QBCore you can choose other currency like crypto and etc)
    testDriveRoutingBucket = true, -- Set this to false if you don't want the test drive to be inside of a Routing Bucket
    allowChangeVehicle = true, -- If true players will be able to change the vehicles on the catalogue witout job
    testDriveTime = 50, -- Test drive time in seconds
    testDriveSpawn = vec4(-1654.9, -3147.58, 13.99, 324.78), -- Test drive spawn coords
    buySpawn = vec4(-1654.9, -3147.58, 13.99, 324.78), -- Vehicle buy spawn coords
    blip = { enabled = true, coords = vec3(-1654.9, -3147.58, 13.99), sprite = 326, color = 3, scale = 0.5, display = 4 }, -- Dealership map blip
    catalogues = { -- The catalogues to the players see the vehicle and emplooyes change the vehicle on showrrom
        { coords = vec3(-1654.9, -3147.58, 13.99), radius = 0.4 },
      --  { coords = vec3(-49.66, -1084.05, 26.3), radius = 0.4 },
      --  { coords = vec3(-47.44, -1091.66, 26.3), radius = 0.4 },
     --   { coords = vec3(-54.2, -1097.1, 26.3), radius = 0.4 },
     --   { coords = vec3(-42.51, -1101.42, 26.3), radius = 0.4 },
    },
    categories = { -- The categories that will show on the catalogue and dashboard (need to add the shop with the job name to the vehicles.lua too on the shops field otherwise it'll not show the vehicles!!)
            { label = 'Planes', id = 'planes' },
            { label = 'Helicopters', id = 'helicopters' },
            
        
    
   
       
    }
}