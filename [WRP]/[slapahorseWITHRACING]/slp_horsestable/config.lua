Config = {}

Config.Messages = {
    {
        -- you can change this texts for prompt translations
        noHorsesYet = "You have no horses yet.",
        purchaseHorse = "Purchase ~y~Horse",
        retrieveHorse = "Retrieve ~b~Horse",
        storeHorse = "Store ~r~Horse",
        horseStillOutside = "~r~Your horse is still outside, please store it first before buying.",
    }
}

Config.Menu = {
    {
        -- you can change this texts for prompt translations
    
        menuTitle = "Horse Dealer",
        menuBuyText = "Buy Horse",
        menuBuyDesc = "Buy a Horse",
        menuSelectionText = "Horse Selection",
        menuSelectionDesc = "Pick a Horse Breed",
        menuColorText = "Hair Color",
    }
}

Config.FrameworkUsed = 'qb' --'qb' or 'esx'
Config.EnableBlip = true
Config.targetSystem = 'ox_target' -- 'qb-target' or 'ox_target'. Set to false to use drawText(higher resmon)
Config.targetModel = 'a_m_m_farmer_01'


Config.parkNearStable = false -- set to false if you want to park your horse anywhere (only for targets)

Config.stables = {
    {x = 1213.65, y = 333.76, z = 81.99, h = 144.2765 }, -- Racetrack do not remove, this comes with animation, dont mind the h value if using drawText
    --{x = 1203.2239, y = 1821.3937, z = 79.0171, h = 144.2765 },
    {x = 1461.464, y = 1132.028, z = 114.326, h = 192.315},  -- Dutton Ranch  --add more
    {x = 2385.891, y = 5030.72, z = 45.996, h = 311.578},    -- Grapeseed
    {x = 430.444, y = 6463.42, z = 28.762, h = 318.483},    -- Paleato
    {x = 1631.957, y = 4848.091, z = 41.907, h = 195.732},  -- SALSA station G.S.
}

Config.dealers = {
    {x = 1089.52, y = 51.29, z = 80.89, h = 348.4782},     -- Track 
    {x = 1474.697, y = 1046.183, z = 114.334, h = 3.413}, -- Dutton Ranch add more
    {x = 2410.401, y = 5026.263, z = 46.184, h = 53.438},  --grapeseed
    {x = 419.086, y = 6470.431, z = 28.815, h = 232.828},  --Paleato 
}

Config.blips = {
    {title="Horse Stable", colour=0, id=253, x = 1213.65, y = 333.76, z = 81.99}, --Track
    {title="Horse Dealer", colour=0, id=253, x = 1089.52, y = 51.29, z =  80.89},
    {title="Horse Stable", colour=0, id=253, x = 2385.891, y = 5030.72, z = 45.996},   --grapeseed
    {title="Horse Dealer", colour=0, id=253, x = 2410.401, y = 5026.263, z = 46.184},  -- grapeseed
    {title="Horse Stable", colour=0, id=253, x = 430.444, y = 6463.42, z = 28.762},   -- paleato
    {title="Horse Dealer", colour=0, id=253, x = 419.086, y = 6470.431, z = 28.815},  --paleato
}

Config.horseShop = { -- STARTING WITH 4 VARIANTS, will add more variants in next update!
[-1] = {
    ['currency'] = "USD", -- change prices currency
},
[0] = {
    ['price'] = 15000,
    ['breed'] = "Filipino Dakila"
},
[1] = {
    ['price'] = 30000,
    ['breed'] = "Filipino Sandoman"
},
[2] = {
    ['price'] = 15000,
    ['breed'] = "Klasiko Romano"
},
[3] = {
    ['price'] = 12000,
    ['breed'] = "Gilded Something"
},
[4] = {
    ['price'] = 20000,
    ['breed'] = "Shadowman"
},
[5] = {
    ['price'] = 30000,
    ['breed'] = "Blah Blah"
},
[6] = {
    ['price'] = 25000,
    ['breed'] = "Classic"
},
[7] = {
    ['price'] = 10000,
    ['breed'] = "Speed Turbo"
},
[8] = {
    ['price'] = 10000,
    ['breed'] = "Tramas Day"
},
[9] = {
    ['price'] = 20000,
    ['breed'] = "Tooth Silk"
},
[10] = {
    ['price'] = 50000,
    ['breed'] = "Hoof Fire"
},
[11] = {
    ['price'] = 25000,
    ['breed'] = "English Haruberd"
},
[12] = {
    ['price'] = 30000,
    ['breed'] = "Filipino Tahimik"
},
[13] = {
    ['price'] = 5000,
    ['breed'] = "Filipino Kidlat"
},
[14] = {
    ['price'] = 35000,
    ['breed'] = "Filipino Slip"
},
[15] = {
    ['price'] = 28000,
    ['breed'] = "Filipino Bilis"
},
}

