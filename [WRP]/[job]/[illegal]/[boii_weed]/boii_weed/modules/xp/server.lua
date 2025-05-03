--- Retrieves all growing XP and resistances for a player by drug type.
--- @param player string The player identifier.
--- @param drug string The drug type (e.g., "weed", "cocaine", etc.).
--- @return table A list of all XP and resistance data for the players strains under the specified drug.
function get_growing_xp(player, drug)
    local result = MySQL.query.await("SELECT * FROM drug_growers WHERE player = ? AND drug = ?", { player, drug }) or {}
    local xp_data = {}
    local missing_strains = {}
    for _, row in ipairs(result) do
        xp_data[row.strain] = row
    end
    for strain, strain_data in pairs(config.strains) do
        if not xp_data[strain] then
            missing_strains[#missing_strains + 1] = strain
        end
    end
    if #missing_strains > 0 then
        local values = {}
        local params = {}
        for _, strain in ipairs(missing_strains) do
            local s_data = config.strains[strain] or {}
            local resistances = s_data.resistances or {}
            values[#values + 1] = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            params[#params + 1] = player
            params[#params + 1] = drug
            params[#params + 1] = strain
            params[#params + 1] = 1
            params[#params + 1] = 0
            params[#params + 1] = 1000
            params[#params + 1] = resistances.altitude or 1
            params[#params + 1] = resistances.disease or 1
            params[#params + 1] = resistances.pest or 1
            params[#params + 1] = resistances.soil or 1
            params[#params + 1] = resistances.weather or 1
            params[#params + 1] = json.encode({})
        end
        MySQL.transaction({
            {
                string.format(
                    [[
                        INSERT INTO drug_growers 
                        (player, drug, strain, level, xp, xp_required, altitude_resistance, disease_resistance, pest_resistance, soil_resistance, weather_resistance, metadata)
                        VALUES %s
                        ON DUPLICATE KEY UPDATE 
                        level = VALUES(level), xp = VALUES(xp), xp_required = VALUES(xp_required), altitude_resistance = VALUES(altitude_resistance), disease_resistance = VALUES(disease_resistance),pest_resistance = VALUES(pest_resistance), soil_resistance = VALUES(soil_resistance), weather_resistance = VALUES(weather_resistance), metadata = VALUES(metadata)
                    ]], table.concat(values, ", ")
                ), params
            }
        })
        for _, row in ipairs(MySQL.query.await("SELECT * FROM drug_growers WHERE player = ? AND drug = ?", { player, drug }) or {}) do
            xp_data[row.strain] = row
        end
    end
    return xp_data
end

--- Retrieves the current growing XP and resistances for a player and strain.
--- If strain data does not exist, it will insert it and return the inserted data.
--- @param player string The player identifier.
--- @param strain string The strain type.
--- @return table The XP data and resistances.
function get_strain_xp(player, strain)
    local result = MySQL.query.await("SELECT * FROM drug_growers WHERE player = ? AND strain = ?", { player, strain })
    if result and result[1] then return result[1] end
    local strain_data = config.strains[strain] or {}
    local new_data = {
        player = player,
        drug = strain_data.drug or "weed",
        strain = strain,
        level = 1,
        xp = 0,
        xp_required = 1000,
        altitude_resistance = strain_data.resistances and strain_data.resistances.altitude or 1,
        disease_resistance = strain_data.resistances and strain_data.resistances.disease or 1,
        pest_resistance = strain_data.resistances and strain_data.resistances.pest or 1,
        soil_resistance = strain_data.resistances and strain_data.resistances.soil or 1,
        weather_resistance = strain_data.resistances and strain_data.resistances.weather or 1,
        metadata = json.encode({})
    }
    local insert_id = MySQL.insert.await("INSERT INTO drug_growers (player, drug, strain, level, xp, xp_required, altitude_resistance, disease_resistance, pest_resistance, soil_resistance, weather_resistance, metadata) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        player, new_data.drug, strain, 1, 0, 1000,
        new_data.altitude_resistance,
        new_data.disease_resistance,
        new_data.pest_resistance,
        new_data.soil_resistance,
        new_data.weather_resistance,
        new_data.metadata
    })
    new_data.id = insert_id
    return new_data
end

--- Adds XP to the players growing XP for a specific strain and increases resistances if applicable.
--- @param player string The player identifier.
--- @param strain string The strain type.
--- @param amount number The amount of XP to add.
function add_growing_xp(player, strain, amount)
    local data = get_strain_xp(player, strain)
    local new_xp = data.xp + amount
    local level_up = false
    if new_xp >= data.xp_required then
        data.level = data.level + 1
        new_xp = new_xp - data.xp_required
        data.xp_required = math.floor(data.xp_required * config.plants.xp_growth_factor)
        level_up = true
    end
    if level_up then
        local resistances = { "altitude_resistance", "disease_resistance", "pest_resistance", "soil_resistance", "weather_resistance" }
        local boost_type = resistances[math.random(#resistances)]
        data[boost_type] = math.min(5, data[boost_type] + 1)
    end
    local query = [[
        INSERT INTO drug_growers 
        (player, drug, strain, level, xp, xp_required, altitude_resistance, disease_resistance, pest_resistance, soil_resistance, weather_resistance) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) 
        ON DUPLICATE KEY UPDATE 
        level = VALUES(level), xp = VALUES(xp), xp_required = VALUES(xp_required), altitude_resistance = VALUES(altitude_resistance), disease_resistance = VALUES(disease_resistance),pest_resistance = VALUES(pest_resistance), soil_resistance = VALUES(soil_resistance), weather_resistance = VALUES(weather_resistance)
    ]]
    local params = { player, "weed", strain, data.level, new_xp, data.xp_required, data.altitude_resistance, data.disease_resistance, data.pest_resistance, data.soil_resistance, data.weather_resistance }
    MySQL.query.await(query, params)
end


--- Retrieves the processing XP for a player for "weed".
--- If the player does not have an entry, it inserts a default one before returning the data.
--- @param player string The player identifier.
--- @return table The XP data containing level, xp, xp_required, and metadata.
function get_processor_xp(player)
    local result = MySQL.query.await("SELECT * FROM drug_processors WHERE player = ? AND drug = 'weed'", { player })
    if result and result[1] then
        result[1].xp = tonumber(result[1].xp) or 0
        result[1].xp_required = tonumber(result[1].xp_required) or 1000
        result[1].level = tonumber(result[1].level) or 1
        return result[1]
    end
    local insert_id = MySQL.insert.await("INSERT INTO drug_processors (player, drug, level, xp, xp_required) VALUES (?, 'weed', ?, ?, ?)", { player, 1, 0, 1000 })
    return {
        id = insert_id,
        player = player,
        drug = "weed",
        level = 1,
        xp = 0,
        xp_required = 1000,
        metadata = {}
    }
end

--- Adds XP to the player"s processing XP for "weed".
--- @param player string The player identifier.
--- @param amount number The amount of XP to add.
function add_processor_xp(player, amount)
    local data = get_processor_xp(player)
    data.xp = tonumber(data.xp) or 0
    data.xp_required = tonumber(data.xp_required) or 1000
    data.level = tonumber(data.level) or 1
    local current_xp = data.xp
    local xp_needed = data.xp_required
    local level = data.level
    local new_xp = current_xp + tonumber(amount)
    local level_up = false
    if new_xp >= xp_needed then
        level = level + 1
        new_xp = new_xp - xp_needed
        xp_needed = math.floor(xp_needed * config.tables.xp_growth_factor)
        level_up = true
    end
    MySQL.query.await("UPDATE drug_processors SET level = ?, xp = ?, xp_required = ? WHERE player = ? AND drug = 'weed'", { level, new_xp, xp_needed, player })
end

--- Retrieves all data for a drug processing table.
--- @param table_id number The ID of the processing table.
--- @return table The full table data including owner, coords, XP, contributors, and status.
function get_table_xp(table_id)
    local result = MySQL.query.await("SELECT * FROM drug_tables WHERE id = ?", { table_id })
    return result[1] or {
        id = table_id,
        owner = nil,
        drug = "weed",
        coords = json.encode({}),
        personal_xp = 0,
        level = 1,
        xp = 0,
        xp_required = 1000,
        is_out = 0,
        contributors = json.encode({}),
        created = os.date("%Y-%m-%d %H:%M:%S")
    }
end

--- Adds XP to a drug processing table and tracks contributors.
--- @param table_id number The ID of the processing table.
--- @param player string The player identifier.
--- @param amount number The amount of XP to add.
function add_table_xp(table_id, player, amount)
    local table_data = placed_objects.drug_tables[table_id]
    if not table_data then return end
    local additional = table_data.additional
    local contributors = additional.contributors or {}
    contributors[player] = (contributors[player] or 0) + amount
    local new_xp = additional.xp + amount
    local level_up = false
    if new_xp >= additional.xp_required then
        additional.level = additional.level + 1
        new_xp = new_xp - additional.xp_required
        additional.xp_required = math.floor(additional.xp_required * config.tables.xp_growth_factor)
        level_up = true
    end
    additional.xp = new_xp
    additional.contributors = contributors
    MySQL.query.await("UPDATE drug_tables SET level = ?, xp = ?, xp_required = ?, contributors = ? WHERE id = ?", { additional.level, new_xp, additional.xp_required, json.encode(contributors), table_id })
    TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, table_id, { additional = additional })
end