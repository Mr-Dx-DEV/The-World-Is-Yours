--- @section Strain Settings

config.strains = {
    pink_runtz = {
        label = "Pink Runtz", -- Strain name displayed in UI
        stages = { -- Plant stages; props which change each stage when growth reaches the "threshold"
            { stage = 1, model = "weed_small_plant", threshold = 0 },
            { stage = 2, model = "weed_small_2_plant", threshold = 25 },
            { stage = 3, model = "weed_medium_plant", threshold = 50 },
            { stage = 4, model = "weed_medium_2_plant", threshold = 75 },
            { stage = 5, model = "weed_large_plant", threshold = 100 }
        },
        resistances = { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 }, -- Recommendation: Leave all strain resistances at 1 these are increased based on growing xp
        yield = { -- Recommendation: Keep yeilds low this is increased by growing xp
            f = { min = 2,  max = 8 }, -- Feminized plants only return "untrimmed" weed
            m = { -- Male plants return male seeds with a chance to return female seeds
                min = 2, 
                max = 5, 
                f_seed_chance = 0.2, -- Percentage chance for the plant to return female seeds; 0.2 = 20%
                f_seed_factor = 0.2 -- Factor of seeds that can be returned as female if chance is successful; 0.2 = 20% of yield can be f seeds
            }
        },
        xp = { 
            water = { min = 2, max = 8 },
            feed = { min = 2, max = 8 },
            harvest = { min = 2, max = 8 },
            plant = { min = 2, max = 8 },
            cure = { min = 2, max = 8 }
        }
    },

    zkittlez = {
        label = "Zkittlez",
        stages = {
            { stage = 1, model = "weed_small_plant", threshold = 0 },
            { stage = 2, model = "weed_small_2_plant", threshold = 25 },
            { stage = 3, model = "weed_medium_plant", threshold = 50 },
            { stage = 4, model = "weed_medium_2_plant", threshold = 75 },
            { stage = 5, model = "weed_large_plant", threshold = 100 }
        },
        resistances = { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 },
        yield = {
            f = { min = 2,  max = 8 },
            m = { min = 2,  max = 5,  f_seed_chance = 0.2, f_seed_factor = 0.2 }
        },
        xp = { 
            water = { min = 2, max = 8 },
            feed = { min = 2, max = 8 },
            harvest = { min = 2, max = 8 },
            plant = { min = 2, max = 8 },
            cure = { min = 2, max = 8 }
        }
    },

    gelato = {
        label = "Gelato",
        stages = {
            { stage = 1, model = "weed_small_plant", threshold = 0 },
            { stage = 2, model = "weed_small_2_plant", threshold = 25 },
            { stage = 3, model = "weed_medium_plant", threshold = 50 },
            { stage = 4, model = "weed_medium_2_plant", threshold = 75 },
            { stage = 5, model = "weed_large_plant", threshold = 100 }
        },
        resistances = { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 },
        yield = {
            f = { min = 2,  max = 8 },
            m = { min = 2,  max = 5,  f_seed_chance = 0.2, f_seed_factor = 0.2 }
        },
        xp = { 
            water = { min = 2, max = 8 },
            feed = { min = 2, max = 8 },
            harvest = { min = 2, max = 8 },
            plant = { min = 2, max = 8 },
            cure = { min = 2, max = 8 }
        }
    },

    melonade = {
        label = "Melonade",
        stages = {
            { stage = 1, model = "weed_small_plant", threshold = 0 },
            { stage = 2, model = "weed_small_2_plant", threshold = 25 },
            { stage = 3, model = "weed_medium_plant", threshold = 50 },
            { stage = 4, model = "weed_medium_2_plant", threshold = 75 },
            { stage = 5, model = "weed_large_plant", threshold = 100 }
        },
        resistances = { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 },
        yield = {
            f = { min = 2,  max = 8 },
            m = { min = 2,  max = 5,  f_seed_chance = 0.2, f_seed_factor = 0.2 }
        },
        xp = { 
            water = { min = 2, max = 8 },
            feed = { min = 2, max = 8 },
            harvest = { min = 2, max = 8 },
            plant = { min = 2, max = 8 },
            cure = { min = 2, max = 8 }
        }
    },

    blue_dream = {
        label = "Blue Dream",
        stages = {
            { stage = 1, model = "weed_small_plant", threshold = 0 },
            { stage = 2, model = "weed_small_2_plant", threshold = 25 },
            { stage = 3, model = "weed_medium_plant", threshold = 50 },
            { stage = 4, model = "weed_medium_2_plant", threshold = 75 },
            { stage = 5, model = "weed_large_plant", threshold = 100 }
        },
        resistances = { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 },
        yield = {
            f = { min = 2,  max = 8 },
            m = { min = 2,  max = 5,  f_seed_chance = 0.2, f_seed_factor = 0.2 }
        },
        xp = { 
            water = { min = 2, max = 8 },
            feed = { min = 2, max = 8 },
            harvest = { min = 2, max = 8 },
            plant = { min = 2, max = 8 },
            cure = { min = 2, max = 8 }
        }
    }
}
