--- @section Functions

--- Handles smoking a joint.
--- @param source number: Players server ID.
--- @param item_id string: The ID of the joint item.
function smoke_joint(source, item_id)
    local item_data = config.consumables.joint[item_id]
    if not item_data then return end
    CORE.remove_item(source, item_id, 1)
    TriggerClientEvent("boii_weed:cl:smoke_joint", source)
    if item_data.statuses then 
        SetTimeout(5000, function()
            CORE.adjust_statuses(source, item_data.statuses)
        end)
    end
    if item_data.effects then
        SetTimeout(8000, function()
            TriggerClientEvent("boii_weed:cl:smoke_screen_effects", source, item_data.effects)
        end)
    end
end

--- Handles smoking a bang.
--- @param source number: Players server ID.
--- @param item_id string: The ID of the weed bag item.
function smoke_bong(source, item_id)
    local item_data = config.consumables.bag[item_id]
    if not item_data then return end
    CORE.remove_item(source, item_id, 1)
    TriggerClientEvent("boii_weed:cl:smoke_bong", source)
    if item_data.statuses then 
        SetTimeout(5000, function()
            CORE.adjust_statuses(source, item_data.statuses)
        end)
    end
    if item_data.effects then
        SetTimeout(10000, function()
            TriggerClientEvent("boii_weed:cl:smoke_screen_effects", source, item_data.effects)
        end)
    end
end

--- @section Events

--- Syncs the smoke effect for all players.
--- @param net_ped number: The network ID of the player ped.
RegisterServerEvent("boii_weed:sv:sync_smoke_effect", function(net_ped, duration)
    TriggerClientEvent("boii_weed:cl:apply_smoke_effect", -1, net_ped, duration)
end)