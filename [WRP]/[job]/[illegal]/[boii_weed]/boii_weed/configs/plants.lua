
--- @section Plant Actions

--- Actions available for interacting with plants via DUI.
config.plants.actions = {
    { 
        key = "E",
        label = "Water Plant",
        action_type = "server",
        action = "boii_weed:sv:water_plant"
    },
    { 
        key = "F",
        label = "Feed Plant",
        action_type = "server",
        action = "boii_weed:sv:feed_plant"
    },
    { 
        key = "G",
        label = "Cure Pests",
        action_type = "server",
        action = "boii_weed:sv:cure_pests"
    },
    { 
        key = "K",
        label = "Cure Disease",
        action_type = "server",
        action = "boii_weed:sv:cure_disease"
    },
    { 
        key = "H",
        label = "Harvest Plant",
        action_type = "server",
        action = "boii_weed:sv:harvest_plant"
    },
    { 
        key = "Z",
        label = "Destroy Plant",
        action_type = "server",
        action = "boii_weed:sv:destroy_plant"
    }
    
}

--- @section Environment Settings

config.plants.weather_effects = true -- Toggle weather based plant modifiers
config.plants.ground_effects = true -- Toggle ground type based plant modifiers

--- @section Plant Growth

config.plants.growth = {
    base_rate = { min = 0.5, max = 2.0 }, -- Base growth per tick, affected by weather/effects
}

--- @section Plant Degrade

--- Determines how much config.plants degrade per update cycle.
--- These values are dynamically modified if `weather_effects` is enabled.
config.plants.degrade = {
    water = { min = 0.5, max = 2.0 }, -- Water loss per update cycle
    food = { min = 0.2, max = 1.0 }, -- Food consumption per update cycle
    quality = { min = 0.1, max = 0.5 } -- Quality degradation per update cycle
}

--- @section Plant Cycle 

config.plants.cycle = {
    start_death = { water = 10, food = 10 }, -- When plants start dying from lack of resources.
    transfer_distance = 4.0, -- Plants within this range will transfer pests, diseases, and pollinate.
    pest_transfer_chance = 0.1, -- Low base chance, scales dynamically.
    disease_transfer_chance = 0.1, -- Low base chance, scales dynamically.
    polination_chance = 10, -- 10% chance for male plants to pollinate female plants.
    pest_chance = 0.1, -- Low base chance, scales dynamically.
    disease_chance = 0.1, -- Low base chance, scales dynamically.
}

--- @section Diseases

config.plants.diseases = {
    powdery_mildew = {
        label = "Powdery Mildew", -- Name displayed in UI
        severity = "low", -- Initial severity level (low/medium/high)
        effects = { -- Effects scale with severity
            low = { quality = 2, health = 1 },
            medium = { quality = 4, health = 2 },
            high = { quality = 6, health = 3 }
        },
        cure = { id = "foliar_spray", label = "Foliar Spray", amount = 1 },
        increase_rate = 5 -- Updates required before severity increases
    },
    root_rot = {
        label = "Root Rot", 
        severity = "low",
        effects = {
            low = { quality = 3, health = 2 },
            medium = { quality = 5, health = 4 },
            high = { quality = 7, health = 6 }
        },
        cure = { id = "hydrogen_peroxide", label = "Hydrogen Peroxide", amount = 1 },
        increase_rate = 4
    },
    bud_rot = {
        label = "Bud Rot", 
        severity = "low",
        effects = {
            low = { quality = 4, health = 2 },
            medium = { quality = 6, health = 4 },
            high = { quality = 8, health = 6 }
        },
        cure = { id = "organic_fungicide", label = "Organic Fungicide", amount = 1 },
        increase_rate = 6
    }
}

--- @section Pests

config.plants.pests = {
    spider_mites = {
        label = "Spider Mites", 
        severity = "low",
        effects = {
            low = { quality = 2, health = 1 },
            medium = { quality = 4, health = 2 },
            high = { quality = 6, health = 3 }
        },
        cure = { id = "foliar_spray", label = "Foliar Spray", amount = 1 },
        increase_rate = 5
    },
    fungus_gnats = {
        label = "Fungus Gnats", 
        severity = "low",
        effects = {
            low = { quality = 2, health = 1 },
            medium = { quality = 5, health = 3 },
            high = { quality = 7, health = 5 }
        },
        cure = { id = "neem_oil", label = "Neem Oil", amount = 1 },
        increase_rate = 4
    },
    thrips = {
        label = "Thrips", 
        severity = "low",
        effects = {
            low = { quality = 3, health = 2 },
            medium = { quality = 5, health = 4 },
            high = { quality = 7, health = 6 }
        },
        cure = { id = "insecticidal_soap", label = "Insecticidal Soap", amount = 1 },
        increase_rate = 6
    }
}

--- XP
config.plants.xp_growth_factor = 1.5