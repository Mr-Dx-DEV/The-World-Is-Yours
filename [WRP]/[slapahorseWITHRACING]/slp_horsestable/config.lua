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
    {x = 1213.65, y = 333.76, z = 81.99, h = 144.2765 }, -- do not remove, this comes with animation, dont mind the h value if using drawText
    {x = 1203.2239, y = 1821.3937, z = 79.0171, h = 144.2765 }, --add more
}

Config.dealers = {
    {x = 1089.52, y = 51.29, z = 80.89, h = 348.4782}, 
    {x = 1216.3685, y = 1845.0482, z = 78.9087, h = 348.4782}, --add more
}

Config.blips = {
    {title="Horse Stable", colour=0, id=253, x = 1213.65, y = 333.76, z = 81.99},
    {title="Horse Dealer", colour=0, id=253, x = 1089.52, y = 51.29, z =  80.89},
    {title="Horse Stable", colour=0, id=253, x= 1203.2239,y= 1821.3937,z= 79.0171},
    {title="Horse Dealer", colour=0, id=253, x= 1216.3685,y= 1845.0482,z= 78.9087}, 
}

Config.horseShop = { -- STARTING WITH 4 VARIANTS, will add more variants in next update!
    [-1] = {
        ['currency'] = "USD", -- change prices currency
    },
    [0] = {
        ['price'] = 100,
        ['breed'] = "Filipino Dakila"
    },
    [1] = {
        ['price'] = 200,
        ['breed'] = "Filipino Sandoman"
    },
    [2] = {
        ['price'] = 100,
        ['breed'] = "Klasiko Romano"
    },
    [3] = {
        ['price'] = 100,
        ['breed'] = "Gilded Something"
    },
    [4] = {
        ['price'] = 100,
        ['breed'] = "Shadowman"
    },
    [5] = {
        ['price'] = 100,
        ['breed'] = "Blah Blah"
    },
    [6] = {
        ['price'] = 100,
        ['breed'] = "Classic"
    },
    [7] = {
        ['price'] = 100,
        ['breed'] = "Speed Turbo"
    },
    [8] = {
        ['price'] = 100,
        ['breed'] = "Tramas Day"
    },
    [9] = {
        ['price'] = 100,
        ['breed'] = "Tooth Silk"
    },
    [10] = {
        ['price'] = 100,
        ['breed'] = "Hoof Fire"
    },
    [11] = {
        ['price'] = 100,
        ['breed'] = "English Haruberd"
    },
    [12] = {
        ['price'] = 100,
        ['breed'] = "Filipino Tahimik"
    },
    [13] = {
        ['price'] = 100,
        ['breed'] = "Filipino Kidlat"
    },
    [14] = {
        ['price'] = 100,
        ['breed'] = "Filipino Slip"
    },
    [15] = {
        ['price'] = 100,
        ['breed'] = "Filipino Bilis"
    },
}

