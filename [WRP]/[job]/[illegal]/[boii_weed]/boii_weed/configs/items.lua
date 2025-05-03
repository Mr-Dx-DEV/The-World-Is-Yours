--- Most items are created dynamically based on the strains. 
--- You can add custom items if required.

--- @section Items

--- Table

CORE.register_item("weed_processing_table", function(source) 
    spawn_table(source, "weed") 
end)

--- Waters

config.items.waters = { 
    {
        id = "watering_can_full", 
        label = "Watering Can (Full)",
        restores = { min = 20, max = 38 },
        return_item = "watering_can_empty" --- Any water items with this new section will return a 1 for 1 item when used e.g. using a full can to fill returns a empty can.
    }
}

CORE.register_item("watering_can_empty", function(source) 
    TriggerClientEvent("boii_weed:cl:fill_watering_can", source)
end)

--- Feeds

config.items.feeds = { 
    {
        id = "liquid_fertilizer", 
        label = "Liquid Fertilizer",
        restores = { min = 5, max = 18 }
    },
    {
        id = "organic_fertilizer", 
        label = "Organic Fertilizer",
        restores = { min = 10, max = 30 }
    }
}

--- Seed Items

for strain, info in pairs(config.strains) do
    config.items.seeds = config.items.seeds or {}

    for _, gender in ipairs({ "m", "f" }) do
        local item = strain .. "_seed_" .. gender
        local label_suffix = gender == "m" and " Seed (M)" or " Seed (F)"
        
        config.items.seeds[item] = { id = item, label = info.label .. label_suffix, strain = strain, gender = gender }

        CORE.register_item(item, function(source)
            spawn_plant(source, strain, gender)
        end)
    end
end


--- Untrimmed 

for strain, info in pairs(config.strains) do
    local item = strain .. "_untrimmed"
    config.items.untrimmed = config.items.untrimmed or {}

    config.items.untrimmed[item] = { id = item, label = info.label .. " (Untrimmed)" }
end

--- Trimmed

for strain, info in pairs(config.strains) do
    local item = strain .. "_trimmed"
    config.items.trimmed = config.items.trimmed or {}

    config.items.trimmed[item] = { id = item, label = info.label .. " (Trimmed)" }
end

--- Ounces

for strain, info in pairs(config.strains) do
    local item = strain .. "_ounce"
    config.items.ounce = config.items.ounce or {}

    config.items.ounce[item] = { id = item, label = info.label .. " (Ounce)" }
end

--- Bags

for strain, info in pairs(config.strains) do
    local item = strain .. "_bag"
    config.items.bag = config.items.bag or {}

    config.items.bag[item] = { id = item, label = info.label .. " (Bag)" }
end

--- Joints

for strain, info in pairs(config.strains) do
    local item = strain .. "_joint"
    config.items.joint = config.items.joint or {}

    config.items.joint[item] = { id = item, label = info.label .. " (Joint)" }
end

--- Guide Book

CORE.register_item("weed_guide_book", function(source) 
    local player_id = CORE.get_player_id(source)
    if not player_id then return end
    local growing_xp = get_growing_xp(player_id, "weed")
    if not growing_xp then return end
    local processing_xp = get_processor_xp(player_id, "weed")
    if not processing_xp then return end
    TriggerClientEvent("boii_weed:cl:open_guide", source, growing_xp, processing_xp)
end)