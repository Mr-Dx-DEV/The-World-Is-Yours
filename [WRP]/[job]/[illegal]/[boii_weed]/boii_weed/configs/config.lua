--- This file only stores some general config options.
--- All drug specific configs are within the plants/** and tables/** sub folders.
--- All configs are entirely server side.

placed_objects = {} -- Don"t touch, stores all objects.

config = config or {}

config.items = config.items or {}
config.plants = config.plants or {}
config.tables = config.tables or {}
config.recipes = config.recipes or {}
config.strains = config.strains or {}
config.tables = config.tables or {}
config.consumables = config.consumables or {}

--- @section General 

config.debug = false -- Enable/disable debug prints.

--- @section Database

config.save_periodically = true -- If true saves all objects periodically.
config.save_timer = 5 -- If save_periodically = true then uses timer to save objects periodically in minutes (default 5 mins)
config.save_on_resource_stop = true -- If true saves all objects on resource stop.
config.update_plants_each_update = true -- If true plants will be updated in database each update cycle *(less efficient)*
config.update_plants_on_interaction = true -- If true plants will be updated in database each time player interacts *(less efficient)* 

--- @section Police settings

--- Police jobs.
--- If require_on_duty then only on duty officers are affected.
config.police = {
    jobs = { "police", "fib", "lspd", "bcso", "sahp", "lsso", "safw", "sadoc", "usms", "fbi", "dhs", "ss", "police", "salsa" },
    require_on_duty = true
}

--- @section Plant Settings

--- Maximum amount of plants a player can have down at any given time.
--- This is for all plants combined e.g, 2 weed, 2 coke, 2 opium or 5 weed etc.
--- Not 5 weed & 5 coke. Keep this value relatively low. 
config.plant_limit = 5

--- Maximum range plants can be from each other.
config.plant_range = 2.0

--- Plant update timer in minutes; 1 = 1minute
config.update_timer = 1

--- Altitude Modifiers.
config.altitudes = {
    { min = 0, max = 100, growth = 1.2, water = 1.0, food = 1.0, pests = 1.0, disease = 1.0 }, 
    { min = 101, max = 500, growth = 1.0, water = 1.1, food = 1.1, pests = 1.1, disease = 1.1 },
    { min = 501, max = 1000, growth = 0.9, water = 1.2, food = 1.2, pests = 1.2, disease = 1.2 },
    { min = 1001, max = 1500, growth = 0.8, water = 1.3, food = 1.3, pests = 1.3, disease = 1.4 },
    { min = 1501, max = 2500, growth = 0.6, water = 1.5, food = 1.5, pests = 1.5, disease = 1.7 }
}

--- Weather Modifiers.
--- If `weather_effects = true` then plants will be dynamically modified depending on the current game"s weather.
--- These are global for all plant types.
config.weather_modifiers = {
    CLEAR = {
        growth = 1.0, -- Growth rate multiplier; higher number = faster, lower = slower.
        water = 1.0, -- Water loss multiplier; higher number = faster, lower = slower.
        food = 1.0, -- Food consumption multiplier; higher number = faster, lower = slower.
        pests = 1.0, -- Pest chance multiplier; higher number = more chance, lower = less chance.
        disease = 1.0 -- Disease chance multiplier; higher number = more chance, lower = less chance.
    },
    EXTRASUNNY = { growth = 1.2, water = 1.8, food = 1.0, pests = 1.2, disease = 0.8 },
    CLOUDS = { growth = 1.0, water = 0.9, food = 1.0, pests = 1.0, disease = 1.1 },
    OVERCAST = { growth = 0.9, water = 0.8, food = 1.0, pests = 0.9, disease = 1.2 },
    RAIN = { growth = 0.9, water = 0.5, food = 1.0, pests = 0.8, disease = 1.3 },
    CLEARING = { growth = 1.0, water = 1.0, food = 1.0, pests = 1.0, disease = 1.0 },
    THUNDER = { growth = 0.8, water = 0.4, food = 1.1, pests = 0.7, disease = 1.5 },
    SMOG = { growth = 0.8, water = 1.2, food = 1.1, pests = 1.0, disease = 1.3 },
    FOGGY = { growth = 0.9, water = 0.7, food = 1.0, pests = 1.0, disease = 1.4 },
    XMAS = { growth = 0.7, water = 0.6, food = 1.0, pests = 0.5, disease = 1.2 },
    SNOW = { growth = 0.6, water = 0.5, food = 1.2, pests = 0.4, disease = 1.5 },
    SNOWLIGHT = { growth = 0.7, water = 0.6, food = 1.1, pests = 0.6, disease = 1.3 },
    BLIZZARD = { growth = 0.5, water = 0.3, food = 1.5, pests = 0.2, disease = 1.8 },
    HALLOWEEN = { growth = 1.0, water = 1.0, food = 1.0, pests = 1.5, disease = 1.2 },
    NEUTRAL = { growth = 1.0, water = 1.0, food = 1.0, pests = 1.0, disease = 1.0 }
}

--- Ground type modifiers.
--- This should cover all relevant ground types. 
config.ground_modifiers = {
    [1288448767] = { name = "GRASS", growth = 1.2, water = 1.2, food = 1.0, pests = 1.2, disease = 1.1 },
    [1109728704] = { name = "MUD", growth = 1.0, water = 1.5, food = 1.0, pests = 1.0, disease = 1.3 },
    [223086562]  = { name = "SOIL", growth = 1.3, water = 1.3, food = 1.0, pests = 1.0, disease = 1.0 }, 
    [2128369009] = { name = "SAND", growth = 0.7, water = 0.5, food = 1.2, pests = 0.8, disease = 0.9 },
    [2461440131] = { name = "CLAY", growth = 0.9, water = 1.4, food = 1.1, pests = 1.1, disease = 1.3 }, 
    [3594309083] = { name = "ROCK", growth = 0.6, water = 0.3, food = 1.2, pests = 0.9, disease = 0.8 }, 
    [1144315879] = { name = "SNOW", growth = 0.5, water = 0.4, food = 1.3, pests = 0.5, disease = 1.5 },  
    [4170197704] = { name = "GRAVEL", growth = 0.8, water = 0.6, food = 1.1, pests = 1.0, disease = 1.0 },
    [3008270349] = { name = "CONCRETE", growth = 0.3, water = 0.2, food = 1.5, pests = 0.5, disease = 0.7 },  
    [951832588]  = { name = "ASPHALT", growth = 0.2, water = 0.1, food = 1.5, pests = 0.3, disease = 0.6 },
    [2409420175] = { name = "WOOD", growth = 0.5, water = 0.5, food = 1.0, pests = 0.8, disease = 0.9 },
    [1333033863] = { name = "LEAVES", growth = 1.1, water = 1.2, food = 1.0, pests = 1.3, disease = 1.2 },
    [2352068586] = { name = "MARSH", growth = 1.0, water = 1.8, food = 1.1, pests = 1.2, disease = 1.4 },
    [581794674]  = { name = "TUNDRA", growth = 0.6, water = 0.7, food = 1.2, pests = 0.7, disease = 1.3 },
    [3833216577] = { name = "FARM_SOIL", growth = 1.5, water = 1.2, food = 1.0, pests = 1.0, disease = 1.0 }
}