--- @section Functions

--- Initializes saved objects from the database when the server starts.
local function load_saved_objects()
    placed_objects = { drug_plants = {}, drug_tables = {} }

    --- Load plants from the database.
    local plants = MySQL.query.await("SELECT * FROM drug_plants WHERE drug = 'weed'")
    if plants and #plants > 0 then
        for _, plant in ipairs(plants) do
            local strain_data = config.strains[plant.strain]
            local model = "weed_small_plant"
            if strain_data then
                for _, stage in ipairs(strain_data.stages) do
                    if plant.growth >= stage.threshold then model = stage.model end
                end
            end
            local plant_data = {
                object_type = "drug_plants",
                id = plant.id,
                model = model,
                coords = json.decode(plant.coords),
                header = strain_data and strain_data.label or "Unknown Strain",
                icon = "fa-solid fa-cannabis",
                keys = config.plants.actions,
                outline = true,
                additional = {
                    id = plant.id,
                    owner = plant.owner,
                    drug = plant.drug,
                    strain = plant.strain,
                    gender = plant.gender,
                    stage = plant.stage,
                    growth = plant.growth,
                    health = plant.health,
                    water = plant.water,
                    food = plant.food,
                    quality = plant.quality,
                    altitude_resistance = plant.altitude_resistance,
                    disease_resistance = plant.disease_resistance,
                    pest_resistance = plant.pest_resistance,
                    soil_resistance = plant.soil_resistance,
                    weather_resistance = plant.weather_resistance,
                    has_disease = plant.has_disease == 1,
                    diseases = json.decode(plant.diseases),
                    has_pests = plant.has_pests == 1,
                    pests = json.decode(plant.pests)
                }
            }
            placed_objects.drug_plants[plant.id] = plant_data
            start_plant_cycle(plant.id)
        end
    end

    --- Load tables from the database.
    local tables = MySQL.query.await("SELECT * FROM drug_tables WHERE is_out = 1")
    if tables and #tables > 0 then
        for _, table in ipairs(tables) do
            local table_data = {
                object_type = "drug_tables",
                id = table.id,
                model = config.tables.model,
                coords = json.decode(table.coords),
                header = "PROCESSING",
                icon = "fa-solid fa-cannabis",
                keys = config.tables.actions,
                outline = true,
                additional = {
                    owner = table.owner,
                    drug = table.drug,
                    personal_xp = table.personal_xp == 1,
                    level = table.level,
                    xp = table.xp,
                    xp_required = table.xp_required,
                    contributors = json.decode(table.contributors),
                    created = table.created,
                    is_out = table.is_out
                }
            }
            placed_objects.drug_tables[table.id] = table_data
        end
    end
end

--- @section Events

--- Requests all stored objects from the server for a player.
RegisterServerEvent("boii_weed:sv:request_objects", function()
    local source = source
    for _, plant in pairs(placed_objects.drug_plants) do
        TriggerClientEvent("boii_weed:cl:spawn_object", source, plant)
    end
    for _, table in pairs(placed_objects.drug_tables) do
        TriggerClientEvent("boii_weed:cl:spawn_object", source, table)
    end
end)

--- Saves an object to the database when a player places a new one.
--- @param data table: The object data to be saved.
RegisterServerEvent("boii_weed:sv:save_object", function(data)
    local source = source
    if not data then return end
    placed_objects[data.object_type] = placed_objects[data.object_type] or {}
    if data.object_type == "drug_plants" then
        for _, plant in pairs(placed_objects.drug_plants) do
            local dist = #(vector3(data.coords.x, data.coords.y, data.coords.z) - vector3(plant.coords.x, plant.coords.y, plant.coords.z))
            if dist < config.plant_range then
                TriggerClientEvent("boii_weed:cl:clear_is_placing", source)
                return NOTIFICATIONS.send(source, {
                    type = "error",
                    header = L("planting_header"),
                    message = L("too_close_to_plant"),
                    duration = 3500
                })
            end
        end
    end
    local handlers = {
        drug_plants = function() save_plant(source, data) end,
        drug_tables = function() save_table(source, data) end
    }
    if handlers[data.object_type] then
        handlers[data.object_type]()
    end
    local inventory_handlers = {
        drug_plants = function()
            local seed_item = data.additional.strain .. "_seed_" .. data.additional.gender
            CORE.remove_item(source, seed_item, 1)
        end,
        drug_tables = function()
            CORE.remove_item(source, "weed_processing_table", 1)
        end
    }
    if inventory_handlers[data.object_type] then
        inventory_handlers[data.object_type]()
    end
end)


--- @section Event Handlers

--- Load objects on resource start
AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        load_saved_objects()
    end
end)

--- @section Object Saving

--- Saves all placed drug plants to the database.
local function save_drug_plants_to_db()
    if not placed_objects or not placed_objects.drug_plants or next(placed_objects.drug_plants) == nil then return end

    CreateThread(function()
        local values, params = {}, {}

        local function clamp(value, min, max, default)
            return math.max(min, math.min(max, tonumber(value) or default))
        end

        for _, plant in pairs(placed_objects.drug_plants) do
            local p = plant.additional or {}

            local id = p.id or 0
            local owner = p.owner or "unknown"
            local drug = p.drug or "unknown"
            local strain = p.strain or "unknown"
            local gender = p.gender == "m" and "m" or "f"
            local coords = json.encode(plant.coords or {})
            local stage = p.stage or 1
            local growth = p.growth or 0
            local health = p.health or 100
            local water = p.water or 0
            local food = p.food or 0
            local quality = p.quality or 0

            local altitude_resistance = clamp(p.altitude_resistance, 1, 5, 1)
            local disease_resistance = clamp(p.disease_resistance, 1, 5, 1)
            local pest_resistance = clamp(p.pest_resistance, 1, 5, 1)
            local soil_resistance = clamp(p.soil_resistance, 1, 5, 1)
            local weather_resistance = clamp(p.weather_resistance, 1, 5, 1)

            local has_disease = p.has_disease and 1 or 0
            local diseases = json.encode(p.diseases or {})

            local has_pests = p.has_pests and 1 or 0
            local pests = json.encode(p.pests or {})

            values[#values + 1] = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            params[#params + 1] = id
            params[#params + 1] = owner
            params[#params + 1] = drug
            params[#params + 1] = strain
            params[#params + 1] = gender
            params[#params + 1] = coords
            params[#params + 1] = stage
            params[#params + 1] = growth
            params[#params + 1] = health
            params[#params + 1] = water
            params[#params + 1] = food
            params[#params + 1] = quality
            params[#params + 1] = altitude_resistance
            params[#params + 1] = disease_resistance
            params[#params + 1] = pest_resistance
            params[#params + 1] = soil_resistance
            params[#params + 1] = weather_resistance
            params[#params + 1] = has_disease
            params[#params + 1] = diseases
            params[#params + 1] = has_pests
            params[#params + 1] = pests
        end

        if #values == 0 then return end

        local query = string.format([[
            INSERT INTO drug_plants (id, owner, drug, strain, gender, coords, stage, growth, health, water, food, quality, altitude_resistance, disease_resistance, pest_resistance, soil_resistance, weather_resistance, has_disease, diseases, has_pests, pests)
            VALUES %s
            ON DUPLICATE KEY UPDATE
            owner = VALUES(owner), drug = VALUES(drug), strain = VALUES(strain), gender = VALUES(gender), coords = VALUES(coords), stage = VALUES(stage), growth = VALUES(growth), health = VALUES(health), water = VALUES(water), food = VALUES(food), quality = VALUES(quality), altitude_resistance = VALUES(altitude_resistance), disease_resistance = VALUES(disease_resistance), pest_resistance = VALUES(pest_resistance), soil_resistance = VALUES(soil_resistance), weather_resistance = VALUES(weather_resistance), has_disease = VALUES(has_disease), diseases = VALUES(diseases), has_pests = VALUES(has_pests), pests = VALUES(pests)
        ]], table.concat(values, ", "))

        local success, err = pcall(function() MySQL.prepare(query, params) end)
        if not success then
            debug_log("error", "Failed to save drug plants: " .. tostring(err))
        end
    end)
end

if config.save_periodically then
    CreateThread(function()
        local save_interval = config.save_timer * 60 * 1000
        while true do
            Wait(save_interval)
            save_drug_plants_to_db()
        end
    end)
end

AddEventHandler("onResourceStop", function(resource_name)
    if resource_name ~= GetCurrentResourceName() or not config.save_on_resource_stop then return end
    save_drug_plants_to_db()
end)