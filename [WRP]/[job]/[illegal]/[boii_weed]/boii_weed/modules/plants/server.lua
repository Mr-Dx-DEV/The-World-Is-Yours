--- @section Variables

--- Stores the current environmental conditions globally.
local current_environment = { weather = "CLEAR" }

--- @section Utility Functions

--- Removes a plant.
--- @param plant_id number: ID for the plant.
function remove_plant(plant_id)
    MySQL.Async.execute("DELETE FROM drug_plants WHERE id = ?", { plant_id })
    TriggerClientEvent("boii_weed:cl:remove_object", -1, plant_id)
end

--- Saves a new plant.
--- @param source number: Players source ID who is saving the plant.
--- @param data table: Plant data to save.
function save_plant(source, data)
    local player_id = CORE.get_player_id(source)
    local result = MySQL.query.await("SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'drug_plants'")
    local plant_id = (result and result[1] and result[1].AUTO_INCREMENT) or 1
    data.id = plant_id

    MySQL.insert.await([[
        INSERT INTO drug_plants (id, owner, drug, strain, gender, coords, stage, growth, health, water, food, quality)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ]], {
        plant_id, player_id, data.additional.drug, data.additional.strain, data.additional.gender,
        json.encode(data.coords), data.additional.stage, data.additional.growth,
        data.additional.health, data.additional.water, data.additional.food, data.additional.quality
    })

    placed_objects.drug_plants[plant_id] = data
    TriggerClientEvent("boii_weed:cl:spawn_object", -1, data)
    TriggerClientEvent("boii_weed:cl:clear_is_placing", source)
    start_plant_cycle(plant_id)
end

--- Force update plants if set in config.
--- @param plant_id number: Unique ID for the plant.
--- @param updates table: The updates to apply.
local function update_plant_db(plant_id, updates)
    if not placed_objects.drug_plants[plant_id] then return end
    local set_clauses, params = {}, {}
    for key, value in pairs(updates) do
        if key == "pests" or key == "diseases" then
            value = json.encode(value or {})
        end
        table.insert(set_clauses, key .. " = ?")
        table.insert(params, value)
    end
    table.insert(params, plant_id)
    local query = string.format("UPDATE drug_plants SET %s WHERE id = ?", table.concat(set_clauses, ", "))
    MySQL.update(query, params)
end


--- @section Plant Cycle

--- Starts plant cycle on plants.
--- This may be changed down the line as its rather large to be running on the server with a lot of plants.
--- Time will tell how impactful this is.
--- @param plant_id number: Unique ID for the plant.
function start_plant_cycle(plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then print("Plant missing") return end
    local cycle_config = config.plants.cycle 
    if not cycle_config then print("Cycle config missing") return end
    local update_timer = tonumber(config.update_timer) * 60 * 1000

    CreateThread(function()
        while true do
            Wait(update_timer)
            if not placed_objects.drug_plants[plant_id] then print("Plant missing inside thread") break end

            local env = plant.additional.environment or {}
            local ground_material = env.ground_material or 1288448767
            local altitude = plant.coords.z
            local ground_mod = config.ground_modifiers[ground_material] or config.ground_modifiers[1288448767]
            local weather_mod = config.weather_modifiers[current_environment.weather] or config.weather_modifiers.CLEAR
            local strain_data = config.strains[plant.additional.strain]
            if not strain_data then break end

            local function round(val) return math.floor(val * 100) / 100 end

            local altitude_mod = { growth = 1.0, water = 1.0, food = 1.0, pests = 1.0, disease = 1.0 }
            for _, mod in ipairs(config.altitudes) do
                if altitude >= mod.min and altitude <= mod.max then
                    altitude_mod = mod
                    break
                end
            end

            local resistance = strain_data.resistances or { altitude = 1, disease = 1, pest = 1, soil = 1, weather = 1 }
            local soil_res, weather_res, disease_res, pest_res, altitude_res = resistance.soil or 1, resistance.weather or 1, resistance.disease or 1, resistance.pest or 1, resistance.altitude or 1
            local altitude_factor = 1 - (altitude_res * 0.1)
            local pest_factor = plant.additional.has_pests and 1.2 or 1.0
            local disease_factor = plant.additional.has_disease and 1.3 or 1.0
            local water_loss = (config.plants.degrade.water.min + math.random() * (config.plants.degrade.water.max - config.plants.degrade.water.min)) * weather_mod.water * ground_mod.water * altitude_mod.water * altitude_factor * pest_factor * disease_factor
            local food_loss = (config.plants.degrade.food.min + math.random() * (config.plants.degrade.food.max - config.plants.degrade.food.min)) * weather_mod.food * ground_mod.food * altitude_mod.food * altitude_factor * pest_factor * disease_factor
            local health_degrade = 0
            if plant.additional.water < cycle_config.start_death.water or plant.additional.food < cycle_config.start_death.food then
                health_degrade = (config.plants.degrade.quality.min + math.random() * (config.plants.degrade.quality.max - config.plants.degrade.quality.min))* weather_mod.growth * ground_mod.growth * altitude_mod.growth * altitude_factor * (1 - (disease_res * 0.1)) * pest_factor * disease_factor
            end

            plant.additional.water = math.max(0, round(plant.additional.water - water_loss))
            plant.additional.food = math.max(0, round(plant.additional.food - food_loss))
            plant.additional.health = math.max(0, round(plant.additional.health - health_degrade))

            if plant.additional.water > cycle_config.start_death.water and plant.additional.food > cycle_config.start_death.food then
                local base_growth = config.plants.growth.base_rate.min + math.random() * (config.plants.growth.base_rate.max - config.plants.growth.base_rate.min)
                local mod_growth = base_growth * weather_mod.growth * ground_mod.growth * altitude_mod.growth * altitude_factor * (1 + (weather_res * 0.1))
                plant.additional.growth = math.min(100, round(plant.additional.growth + mod_growth))
            end

            local growth_percentage = plant.additional.growth
            for _, stage in ipairs(strain_data.stages) do
                if growth_percentage >= stage.threshold then
                    plant.model = stage.model
                    TriggerClientEvent("boii_weed:cl:update_plant_model", -1, plant_id, plant.model)
                end
            end

            plant.additional.health = round(plant.additional.health)
            plant.additional.water = round(plant.additional.water)
            plant.additional.food = round(plant.additional.food)
            plant.additional.growth = round(plant.additional.growth)

            if config.update_plants_each_update then
                update_plant_db(plant_id, {
                    water = plant.additional.water,
                    food = plant.additional.food,
                    health = plant.additional.health,
                    growth = plant.additional.growth
                })
            end

            if plant.additional.health <= 0 then
                placed_objects.drug_plants[plant_id] = nil
                remove_plant(plant_id)
                break
            end

            TriggerClientEvent("boii_weed:cl:update_plant_status", -1, plant_id, plant.additional)
            TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { additional = plant.additional })
        end
    end)
end

--- @section Plant Spawning

--- Spawns a new plant.
--- @param source number: Players source id who is spawning the plant.
--- @param strain string: Straing name to spawn.
function spawn_plant(source, strain, gender)
    local strain_data = config.strains[strain]
    if not strain_data then return print(L("strain_missing")) end
    local player_id = CORE.get_player_id(source)
    local player_plant_count = 0
    for _, plant in pairs(placed_objects.drug_plants) do
        if plant.additional.owner == player_id then
            player_plant_count = player_plant_count + 1
        end
    end
    if player_plant_count >= config.plant_limit then
        notification.send(source, {
            type = "error",
            header = L("planting_header"),
            message = L("too_many_plants"),
            duration = 3500
        })
        return
    end
    local model = "weed_small_plant"
    for _, stage in ipairs(strain_data.stages) do
        if 0 >= stage.threshold then
            model = stage.model
        end
    end
    if not model then return end
    local plant_data = {
        object_type = "drug_plants",
        id = nil,
        model = model,
        coords = GetEntityCoords(GetPlayerPed(source)),
        header = strain_data.label,
        icon = "fa-solid fa-cannabis",
        keys = config.plants.actions,
        outline = true,
        additional = {
            owner = player_id, drug = "weed", strain = strain, gender = gender,
            stage = 1, growth = 0, health = 100, water = 20, food = 20, quality = 1.0,
            altitude_resistance = 1, disease_resistance = 1, pest_resistance = 1, soil_resistance = 1, weather_resistance = 1,
            has_disease = false, diseases = {}, has_pests = false, pests = {}, created = os.time()
        }
    }
    TriggerClientEvent("boii_weed:cl:start_object_placement", source, plant_data)
end


--- @section Events

--- Updates the environmental factors of a drug plant.
--- @param plant_id number: The unique ID of the plant.
--- @param environment table: The environmental conditions affecting the plant.
RegisterServerEvent("boii_weed:sv:update_plant_environment", function(plant_id, environment)
    if not placed_objects.drug_plants[plant_id] then return end
    placed_objects.drug_plants[plant_id].additional.environment = environment
end)

--- @section Plant Actions

--- Water & Feed

--- Triggered when the user calls to water a specific plant.
--- @param strain string The strain of the plant.
--- @param plant_id string The ID of the plant.
--- @return boolean Success status and message.
local function water_plant(source, strain, plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return false, L("plant_not_found") end
    local strain_data = config.strains[strain]
    if not strain_data then return false, L("invalid_strain") end
    for _, water in ipairs(config.items.waters) do
        if CORE.has_item(source, water.id) then
            local water_amount = math.random(water.restores.min, water.restores.max)
            local new_water = math.min(100, plant.additional.water + water_amount)
            plant.additional.water = new_water
            if config.update_plants_on_interaction then
                update_plant_db(plant_id, { water = new_water })
            end
            CORE.remove_item(source, water.id, 1)
            if water.return_item then CORE.add_item(source, water.return_item, 1) end
            local player_id = CORE.get_player_id(source)
            if strain_data.xp and strain_data.xp.water then
                local xp_amount = math.random(strain_data.xp.water.min, strain_data.xp.water.max)
                add_growing_xp(player_id, strain, xp_amount)
            end
            local message = L("watered_plant", water.label, water_amount)
            return true, message, water_amount
        end
    end
    return false, "No valid water item found in inventory"
end

--- Triggered when the user calls to feed a specific plant.
--- @param strain string The strain of the plant.
--- @param plant_id string The ID of the plant.
--- @return boolean Success status and message.
local function feed_plant(source, strain, plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return false, L("plant_not_found") end
    local strain_data = config.strains[strain]
    if not strain_data then return false, L("invalid_strain") end
    for _, feed in ipairs(config.items.feeds) do
        if CORE.has_item(source, feed.id) then
            local feed_amount = math.random(feed.restores.min, feed.restores.max)
            local new_food = math.min(100, plant.additional.food + feed_amount)
            plant.additional.food = new_food
            if config.update_plants_on_interaction then
                update_plant_db(plant_id, { food = new_food })
            end
            CORE.remove_item(source, feed.id, 1)
            local player_id = CORE.get_player_id(source)
            if strain_data.xp and strain_data.xp.feed then
                local xp_amount = math.random(strain_data.xp.feed.min, strain_data.xp.feed.max)
                add_growing_xp(player_id, strain, xp_amount)
            end
            local message = L("fed_plant", feed.label, feed_amount)
            return true, message, feed_amount
        end
    end
    return false, "No valid feed item found in inventory"
end

--- Event to water plants.
RegisterServerEvent("boii_weed:sv:water_plant")
AddEventHandler("boii_weed:sv:water_plant", function(plant_id)
    local src, plant = source, placed_objects.drug_plants[plant_id]
    if not plant then return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 }) end
    local success, message = water_plant(src, plant.additional.strain, plant_id)
    if success then
        TriggerClientEvent("boii_weed:cl:water_plant_animation", src)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { additional = plant.additional })
    end
    NOTIFICATIONS.send(src, { type = success and "success" or "error", header = L("planting_header"), message = message, duration = 3500 })
end)

--- Event to feed plants.
RegisterServerEvent("boii_weed:sv:feed_plant")
AddEventHandler("boii_weed:sv:feed_plant", function(plant_id)
    local src, plant = source, placed_objects.drug_plants[plant_id]
    if not plant then return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 })  end
    local success, message = feed_plant(src, plant.additional.strain, plant_id)
    if success then
        TriggerClientEvent("boii_weed:cl:feed_plant_animation", src)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { additional = plant.additional })
    end
    NOTIFICATIONS.send(src, { type = success and "success" or "error", header = L("planting_header"), message = message, duration = 3500 })
end)

--- Pests & Diseases

--- Triggered when the user calls to cure pests on a specific plant.
--- @param plant_id string The plants unique ID.
local function cure_pests(source, plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return false, L("plant_not_found") end
    local pests = plant.additional.pests
    if not pests or next(pests) == nil then return false, L("no_pests") end
    local strain = plant.additional.strain
    local strain_data = config.strains[strain]
    if not strain_data then return false, L("invalid_strain") end
    for pest, _ in pairs(pests) do
        local pest_config = config.plants.pests and config.plants.pests[pest]
        if pest_config and CORE.has_item(source, pest_config.cure.id) then
            pests[pest] = nil
            if next(pests) == nil then plant.additional.has_pests = false end
            if config.update_plants_on_interaction then
                update_plant_db(plant_id, { pests = pests, has_pests = plant.additional.has_pests })
            end
            CORE.remove_item(source, pest_config.cure.id, 1)
            local player_id = CORE.get_player_id(source)
            if strain_data.xp and strain_data.xp.cure then
                local xp_amount = math.random(strain_data.xp.cure.min, strain_data.xp.cure.max)
                add_growing_xp(player_id, strain, xp_amount)
            end
            local message = L("cured_plant", pest_config.label)
            return true, message
        end
    end
    return false, "No valid cure item found in inventory"
end

--- Triggered when the user calls to cure diseases on a specific plant.
--- @param plant_id string The plants unique ID.
local function cure_disease(source, plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return false, L("plant_not_found") end
    local diseases = plant.additional.diseases
    if not diseases or next(diseases) == nil then return false, L("no_diseases") end
    local strain = plant.additional.strain
    local strain_data = config.strains[strain]
    if not strain_data then return false, L("invalid_strain") end
    for disease, _ in pairs(diseases) do
        local disease_config = config.plants.diseases and config.plants.diseases[disease]
        if disease_config and CORE.has_item(source, disease_config.cure.id) then
            diseases[disease] = nil
            if next(diseases) == nil then plant.additional.has_disease = false end
            if config.update_plants_on_interaction then
                update_plant_db(plant_id, { diseases = diseases, has_disease = plant.additional.has_disease })
            end
            CORE.remove_item(source, disease_config.cure.id, 1)
            local player_id = CORE.get_player_id(source)
            if strain_data.xp and strain_data.xp.cure then
                local xp_amount = math.random(strain_data.xp.cure.min, strain_data.xp.cure.max)
                add_growing_xp(player_id, strain, xp_amount)
            end
            local message = L("cured_plant", disease_config.label)
            return true, message
        end
    end
    return false, "No valid cure item found in inventory"
end

--- Event to cure pests.
--- @param plant_id string The plants unique ID.
RegisterServerEvent("boii_weed:sv:cure_pests")
AddEventHandler("boii_weed:sv:cure_pests", function(plant_id)
    local src, plant = source, placed_objects.drug_plants[plant_id]
    if not plant then  return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 }) end
    local src, success, message = source, cure_pests(source, plant_id)
    if success then
        placed_objects.drug_plants[plant_id].additional.has_pests = false
        placed_objects.drug_plants[plant_id].additional.pests = {}
        TriggerClientEvent("boii_weed:cl:cure_plant_animation", src)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { additional = plant.additional })
    end
    NOTIFICATIONS.send(src, { type = success and "success" or "error", header = L("planting_header"), message = message, duration = 3500 })
end)

--- Event to cure diseases.
--- @param plant_id string The plants unique ID.
RegisterServerEvent("boii_weed:sv:cure_disease")
AddEventHandler("boii_weed:sv:cure_disease", function(plant_id)
    local src, plant = source, placed_objects.drug_plants[plant_id]
    if not plant then  return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 }) end
    local src, success, message = source, cure_disease(source, plant_id)
    if success then
        placed_objects.drug_plants[plant_id].additional.has_disease = false
        placed_objects.drug_plants[plant_id].additional.diseases = {}
        TriggerClientEvent("boii_weed:cl:cure_plant_animation", src)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { additional = plant.additional })
    end
    NOTIFICATIONS.send(src, { type = success and "success" or "error", header = L("planting_header"), message = message, duration = 3500 })
end)

--- Updates current weather for plant cycles.
RegisterServerEvent("boii_weed:sv:update_environment", function(environment_details)
    current_environment = environment_details
end)

--- Harvesting

--- Triggered when the user calls to harvest a specific plant.
--- @param source number The player ID.
--- @param strain string The strain of the plant.
--- @param plant_id number The ID of the plant.
--- @return boolean, string Returns success state and message.
local function harvest_plant(source, strain, plant_id)
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return false, L("plant_not_found") end
    local growth_percentage = plant.additional.growth or 0
    if growth_percentage < 90 then return false, L("not_mature_enough") end
    local strain_data = config.strains[strain]
    if not strain_data then return false, L("invalid_strain_or_yeild") end
    local gender = plant.additional.gender or "f"
    local yield = strain_data.yield[gender]
    if not yield then return false, L("invalid_strain_or_yeild") end
    local player_id = CORE.get_player_id(source)
    local grow_xp_data = get_strain_xp(player_id, strain)
    local player_level = math.min(grow_xp_data.level, 20)
    local yield_bonus = math.floor(player_level * 0.5)
    local harvested_amount = math.random(yield.min + yield_bonus, yield.max + yield_bonus)
    harvested_amount = math.max(yield.min, harvested_amount)
    local main_item_id = (gender == "f" and config.items.untrimmed[strain .. "_untrimmed"].id) or (strain .. "_seed_m")
    CORE.add_item(source, main_item_id, harvested_amount)
    if gender == "m" and math.random() < yield.f_seed_chance then
        local max_f_seeds = math.floor(harvested_amount * yield.f_seed_factor)
        local f_seed_amount = math.random(1, max_f_seeds)
        if f_seed_amount > 0 then
            CORE.add_item(source, strain .. "_seed_f", f_seed_amount)
        end
    end
    if strain_data.xp and strain_data.xp.harvest then
        local xp_amount = math.random(strain_data.xp.harvest.min, strain_data.xp.harvest.max)
        add_growing_xp(player_id, strain, xp_amount)
    end

    return true, L("harvested_plant", harvested_amount, strain)
end

--- Event to harvest plant.
--- @param plant_id string: ID for the plant.
RegisterServerEvent("boii_weed:sv:harvest_plant")
AddEventHandler("boii_weed:sv:harvest_plant", function(plant_id)
    local src, plant = source, placed_objects.drug_plants[plant_id]
    if not plant then  return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 }) end
    local success, message = harvest_plant(src, plant.additional.strain, plant_id)
    NOTIFICATIONS.send(src, { type = success and "success" or "error", header = L("planting_header"), message = message, duration = 3500 })
    if success then
        placed_objects.drug_plants[plant_id] = nil
        TriggerClientEvent("boii_weed:cl:harvest_plant_animation", src, plant_id)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { is_destroyed = true })
        SetTimeout(5000, function()
            remove_plant(plant_id)
        end)
    end
end)

--- Destroying

--- Event to destroy plant.
--- @param plant_id string: ID for the plant.
RegisterServerEvent("boii_weed:sv:destroy_plant")
AddEventHandler("boii_weed:sv:destroy_plant", function(plant_id)
    local src = source
    local has_job = CORE.player_has_job(src, config.police.jobs, config.police.require_on_duty)
    if not has_job then return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("no_permission"), duration = 3500 }) end
    local plant = placed_objects.drug_plants[plant_id]
    if not plant then return NOTIFICATIONS.send(src, { type = "error", header = L("planting_header"), message = L("plant_not_found"), duration = 3500 }) end
    placed_objects.drug_plants[plant_id] = nil
    TriggerClientEvent("boii_weed:cl:destroy_plant_animation", src, plant_id)
    TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, plant_id, { is_destroyed = true })
    SetTimeout(5000, function()
        remove_plant(plant_id)
    end)
end)

--- @section Items

--- Fill watering cans.
RegisterServerEvent("boii_weed:sv:fill_watering_can", function()
    local src = source
    local has_item = CORE.has_item(src, "watering_can_empty", 1)
    if not has_item then return end
    CORE.remove_item(source, "watering_can_empty", 1)
    Wait(50)
    CORE.add_item(source, "watering_can_full", 1)
end)
