--- @section NUI Callbacks

--- NUI Callback to process items.
--- @param data table: UI data received.
--- @param cb function: Callback to UI.
RegisterNUICallback("start_processing", function(data, cb)
    CALLBACKS.trigger("boii_weed:sv:validate_processing", { strain = data.strain, recipe_id = data.recipe_id, table_id = data.table_id }, function(success)
        print("callback response received?")
        cb({ success = success })
    end)
end)

--- NUI Callback to process items.
--- @param data table: UI data received.
--- @param cb function: Callback to UI.
RegisterNUICallback("toggle_xp_type", function(data, cb)
    CALLBACKS.trigger("boii_weed:sv:toggle_xp_type", { table_id = data.table_id }, function(success)
        cb({ success = success })
    end)
end)

--- @section Events

--- Opens a processing table with received server data.
--- @param data table: Table data.
RegisterNetEvent("boii_weed:cl:open_table", function(data)
    if not data or not data.id or not data.table_data or not data.player_xp then return end
    if not placed_objects or not placed_objects[data.id] then return end
    if dui_locations[data.id] then
        dui_locations[data.id].is_hidden = true
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open_processing_ui",
        recipes = data.recipes,
        id = data.id,
        table_data = data.table_data,
        player_xp = data.player_xp
    })
end)

--- Triggers the animation for harvesting a plant.
RegisterNetEvent("boii_weed:cl:processing_animation", function(duration)
    local anim_dict = "amb@prop_human_parking_meter@female@base"
    local anim = "base_female"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 49,
        duration = tonumber(duration),
        freeze = true
    }
    PLAYER.play_animation(PlayerPedId(), options)
end)