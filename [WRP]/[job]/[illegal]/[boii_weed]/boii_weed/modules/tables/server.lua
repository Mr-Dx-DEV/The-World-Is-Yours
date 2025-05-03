--- @section Functions

function remove_table(id)
    MySQL.Async.execute("DELETE FROM drug_tables WHERE id = ?", { id })
    TriggerClientEvent("boii_weed:cl:remove_object", -1, id, true)
end

--- Saves a new drug processing table or updates an existing one.
--- @param source number: Players source ID.
--- @param data table: Table data to save.
function save_table(source, data)
    local player_id = data.additional.owner
    local drug_type = data.additional.drug
    local existing_table = MySQL.single.await("SELECT * FROM drug_tables WHERE owner = ? AND drug = ?", { player_id, drug_type })
    if existing_table then
        MySQL.update.await("UPDATE drug_tables SET is_out = 1, coords = ? WHERE id = ?", { json.encode(data.coords), existing_table.id })
        data.id = existing_table.id
        data.additional = {
            owner = existing_table.owner,
            drug = existing_table.drug,
            personal_xp = existing_table.personal_xp == 1,
            level = existing_table.level,
            xp = existing_table.xp,
            xp_required = existing_table.xp_required,
            contributors = json.decode(existing_table.contributors),
            created = existing_table.created,
            is_out = 1
        }
    else
        local inserted_id = MySQL.insert.await("INSERT INTO drug_tables (owner, drug, coords, personal_xp, level, xp, xp_required, contributors, is_out) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", { player_id, drug_type, json.encode(data.coords), 1, 1, 0, 1000, json.encode({}), 1 })
        if not inserted_id then
            print("Failed to insert new drug table.")
            return
        end
        data.id = inserted_id
    end
    placed_objects.drug_tables[data.id] = data
    TriggerClientEvent("boii_weed:cl:spawn_object", -1, data)
    TriggerClientEvent("boii_weed:cl:clear_is_placing", source)
end

--- @section Table Spawning

--- Spawns a new drug table (placement process only)
--- @param source number: Players source ID.
--- @param drug string: Drug type (e.g., "weed", "cocaine", "meth").
function spawn_table(source, drug)
    local player_id = CORE.get_player_id(source)
    MySQL.single("SELECT is_out FROM drug_tables WHERE owner = ? AND drug = ?", { player_id, drug }, function(existing_table)
        if existing_table and existing_table.is_out == 1 then
            return NOTIFICATIONS.send(source, { type = "error", header = L("processing_header"), message = L("too_many_tables"), duration = 3500 })
        end
        local table_info = {
            object_type = "drug_tables",
            id = nil,
            model = config.tables.model,
            coords = GetEntityCoords(GetPlayerPed(source)),
            header = L("processing_header"),
            icon = "fa-solid fa-cannabis",
            keys = config.tables.actions,
            outline = true,
            additional = { owner = player_id, drug = drug, personal_xp = true, level = 1, xp = 0, xp_required = 1000, contributors = {}, created = os.time(), is_out = 1 }
        }
        TriggerClientEvent("boii_weed:cl:start_object_placement", source, table_info)
    end)
end

--- @section Table Actions

--- Event to access tables
--- @param table_id string: ID for table.
RegisterServerEvent("boii_weed:sv:access_table")
AddEventHandler("boii_weed:sv:access_table", function(table_id)
    local src = source
    local player_id = CORE.get_player_id(src)
    if CORE.player_has_job(src, config.police.jobs, config.police.require_on_duty) then
        return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("no_permission"), duration = 3500 })
    end
    Wait(100)
    MySQL.single("SELECT * FROM drug_tables WHERE id = ? AND is_out = 1", { table_id }, function(drug_table)
        if not drug_table then
            return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("table_not_found"), duration = 3500 })
        end
        drug_table.is_owner = (drug_table.owner == player_id)
        MySQL.single("SELECT * FROM drug_processors WHERE player = ? AND drug = ?", { player_id, drug_table.drug }, function(player_xp)
            if not player_xp then
                MySQL.insert("INSERT INTO drug_processors (player, drug) VALUES (?, ?)", { player_id, drug_table.drug }, function()
                    player_xp = { drug = drug_table.drug, level = 1, xp = 0, xp_required = 1000 }
                    TriggerClientEvent("boii_weed:cl:open_table", src, { recipes = config.recipes, id = table_id, table_data = drug_table, player_xp = player_xp })
                end)
                return
            end
            TriggerClientEvent("boii_weed:cl:open_table", src, { recipes = config.recipes, id = table_id, table_data = drug_table, player_xp = player_xp })
        end)
    end)
end)

--- Destroying Table

--- Event to destroy tables
--- @param table_id string: ID for table.
RegisterServerEvent("boii_weed:sv:destroy_table")
AddEventHandler("boii_weed:sv:destroy_table", function(table_id)
    local src = source
    if not CORE.player_has_job(src, config.police.jobs, config.police.require_on_duty) then
        return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("no_permission"), duration = 3500 })
    end
    MySQL.single("SELECT * FROM drug_tables WHERE id = ?", { table_id }, function(table)
        if not table then return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("table_not_found"), duration = 3500 }) end
        remove_table(table_id)
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, table_id, { is_destroyed = true })
    end)
end)

--- Pick Up Table

--- Marks the table as picked up in the database and removes it from the world.
--- @param table_id string: ID of the table.
function pick_up_table(table_id)
    MySQL.update("UPDATE drug_tables SET is_out = 0 WHERE id = ?", { table_id }, function()
        TriggerClientEvent("boii_weed:cl:remove_object", -1, table_id)
    end)
end

--- Picks up a drug table, removing it from the world.
--- @param table_id string: ID of the table.
RegisterServerEvent("boii_weed:sv:pick_up_table")
AddEventHandler("boii_weed:sv:pick_up_table", function(table_id)
    local src = source
    local player_id = CORE.get_player_id(src)
    if CORE.player_has_job(src, config.police.jobs, config.police.require_on_duty) then
        return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("no_permission"), duration = 3500 })
    end
    MySQL.single("SELECT * FROM drug_tables WHERE id = ?", { table_id }, function(table_data)
        if not table_data then
            return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("table_not_found"), duration = 3500 })
        end
        if table_data.owner ~= player_id then
            return NOTIFICATIONS.send(src, { type = "error", header = L("processing_header"), message = L("no_permission"), duration = 3500 })
        end
        CORE.add_item(src, "weed_processing_table", 1) 
        TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, table_id, { is_hidden = true })
        pick_up_table(table_id)
        NOTIFICATIONS.send(src, { type = "success", header = L("processing_header"), message = L("table_picked_up"), duration = 3500 })
    end)
end)

--- @section Callbacks

--- Handles processing, inventory adjustments, notifications, and XP updates.
--- @param source number: The players source ID.
--- @param player_id string: The players unique ID.
--- @param table_id number: The table ID.
--- @param recipe table: The recipe data.
--- @param final_amount number: The adjusted yield amount.
function process_recipe(source, player_id, table_id, recipe, final_amount)
    TriggerClientEvent("boii_weed:cl:processing_animation", source, recipe.duration)
    SetTimeout(recipe.duration, function()
        CORE.add_item(source, recipe.returns.id, final_amount) 
        NOTIFICATIONS.send(source, { type = "success", header = L("processing_header"), message = L("processing_received", final_amount, recipe.returns.label), duration = 3500 })
        if recipe.xp then
            local xp_amount = math.random(recipe.xp.min, recipe.xp.max)
            add_processor_xp(player_id, xp_amount)
            add_table_xp(table_id, player_id, xp_amount)
        end
    end)
end

--- Callback to validate processing.
--- @param source number: Players source id.
--- @param data table: Data sent into callback.
--- @param cb function: Callback function.
CALLBACKS.register("boii_weed:sv:validate_processing", function(source, data, cb)
    local strain_recipes = config.recipes[data.strain]
    if not strain_recipes then
        return NOTIFICATIONS.send(source, { type = "error", header = L("processing_header"), message = L("invalid_strain"), duration = 3500 }), cb(false)
    end
    local recipe = nil
    for _, recipes in pairs(strain_recipes) do
        for _, r in ipairs(recipes) do
            if r.id == data.recipe_id then
                recipe = r
                break
            end
        end
        if recipe then break end
    end
    if not recipe then
        return NOTIFICATIONS.send(source, { type = "error", header = L("processing_header"), message = L("recipe_not_found"), duration = 3500 }), cb(false)
    end
    local missing_ingredients = {}
    for _, ingredient in pairs(recipe.ingredients) do
        if not CORE.has_item(source, ingredient.id, ingredient.amount) then
            missing_ingredients[#missing_ingredients + 1] = ingredient.label
        end
    end
    if #missing_ingredients > 0 then
        return NOTIFICATIONS.send(source, { type = "error", header = L("processing_header"), message = L("missing_ingredients", table.concat(missing_ingredients, ", ")), duration = 5000 }), cb(false)
    end
    Wait(100)
    local remove_items = {}
    for _, ingredient in pairs(recipe.ingredients) do
        if not ingredient.keep then
            CORE.remove_item(source, ingredient.id, ingredient.amount)
        end
    end
    local player_id = CORE.get_player_id(source)
    local table_data = placed_objects.drug_tables[data.table_id]
    if not table_data then
        return NOTIFICATIONS.send(source, { type = "error", header = L("processing_header"), message = L("table_not_found"), duration = 3500 }), cb(false)
    end
    local use_personal_xp = table_data.additional.personal_xp
    if use_personal_xp then
        MySQL.single("SELECT level FROM drug_processors WHERE player = ? AND drug = ?", { player_id, "weed" }, function(player_xp)
            local xp_level = player_xp and player_xp.level or 1
            local yield_bonus = 1.0 + math.min(xp_level * 0.15, 3.0)
            local final_amount = math.floor(recipe.returns.amount * yield_bonus)
            process_recipe(source, player_id, data.table_id, recipe, final_amount)
        end)
    else
        local xp_level = table_data.additional.level or 1
        local yield_bonus = 1.0 + math.min(xp_level * 0.15, 3.0)
        local final_amount = math.floor(recipe.returns.amount * yield_bonus)
        process_recipe(source, player_id, data.table_id, recipe, final_amount)
    end
    cb(true)
end)

--- Callback to toggle XP type (Personal/Public).
--- @param source number: Players source ID.
--- @param data table: Data sent from the UI.
--- @param cb function: Callback function.
CALLBACKS.register("boii_weed:sv:toggle_xp_type", function(source, data, cb)
    local player_id = CORE.get_player_id(source)
    local table_id = data.table_id
    local table_data = placed_objects.drug_tables[table_id]
    if not table_data then
        return cb(false)
    end
    if table_data.additional.owner ~= player_id then
        return cb(false)
    end
    local new_xp_type = table_data.additional.personal_xp and 0 or 1
    MySQL.update("UPDATE drug_tables SET personal_xp = ? WHERE id = ?", { new_xp_type, table_id }, function(affected_rows)
        if affected_rows and affected_rows > 0 then
            table_data.additional.personal_xp = (new_xp_type == 1)
            TriggerClientEvent("boii_weed:cl:sync_dui_data", -1, table_id, { personal_xp = new_xp_type })
            cb(true)
        else
            cb(false)
        end
    end)
end)
