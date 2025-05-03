--- Trimmed
for strain, info in pairs(config.strains) do
    config.recipes[strain] = config.recipes[strain] or {}

    config.recipes[strain].trimmed = {
        {
            id = strain .. "trimmed_1",
            duration = 5000,
            ingredients = {
                { id = "trimming_shears", label = "Trimming Shears", amount = 1, image = "trimming_shears.png", keep = true },
                { id = strain .. "_untrimmed", label = info.label .. " (Untrimmed)", amount = 10, image = strain .. "_untrimmed.png" }
            },
            returns = { id = strain .. "_trimmed", label = info.label .. " (Trimmed)", amount = 7, image = strain .. "_trimmed.png" },
            xp = { min = 5, max = 10 }
        }
    }
end

--- Ounces
for strain, info in pairs(config.strains) do
    config.recipes[strain] = config.recipes[strain] or {}

    config.recipes[strain].ounce = {
        {
            id = strain .. "_ounce_1",
            duration = 5000,
            ingredients = {
                { id = strain .. "_trimmed", label = info.label .. " (Trimmed)", amount = 28, image = strain .. "_trimmed.png" },
                { id = "large_resealable_bag", label = "Resealable Bag (Large)", amount = 1, image = "large_resealable_bag.png" },
                { id = "drug_scales", label = "Scales", amount = 1, image = "drug_scales.png", keep = true }
            },
            returns = { id = strain .. "_ounce", label = info.label .. " (Ounce)", amount = 1, image = strain .. "_ounce.png" },
            xp = { min = 10, max = 15 }
        }
    }
end

--- Bags
for strain, info in pairs(config.strains) do
    config.recipes[strain] = config.recipes[strain] or {}

    config.recipes[strain].bag = {
        {
            id = strain .. "_bag_1",
            duration = 5000,
            ingredients = {
                { id = strain .. "_trimmed", label = info.label .. " (Trimmed)", amount = 4, image = strain .. "_trimmed.png" },
                { id = "small_resealable_bag", label = "Resealable Bag (Small)", amount = 1, image = "small_resealable_bag.png" },
                { id = "drug_scales", label = "Scales", amount = 1, image = "drug_scales.png", keep = true }
            },
            returns = { id = strain .. "_bag", label = info.label .. " (Bag)", amount = 1, image = strain .. "_bag.png" },
            xp = { min = 5, max = 8 }
        },
        {
            id = strain .. "_bag_2",
            duration = 5000,
            ingredients = {
                { id = strain .. "_ounce", label = info.label .. " (Ounce)", amount = 1, image = strain .. "_ounce.png" },
                { id = "small_resealable_bag", label = "Resealable Bag (Small)", amount = 8, image = "small_resealable_bag.png" },
                { id = "drug_scales", label = "Scales", amount = 1, image = "drug_scales.png", keep = true }
            },
            returns = { id = strain .. "_bag", label = info.label .. " (Bag)", amount = 8, image = strain .. "_bag.png" },
            xp = { min = 10, max = 12 }
        }
    }
end

--- Joint
for strain, info in pairs(config.strains) do
    config.recipes[strain] = config.recipes[strain] or {}

    config.recipes[strain].joint = {
        {
            id = strain .. "_joint_1",
            duration = 5000,
            ingredients = {
                { id = strain .. "_trimmed", label = info.label .. " (Trimmed)", amount = 1, image = strain .. "_trimmed.png" },
                { id = "rolling_paper", label = "Rolling Paper", amount = 1, image = "rolling_paper.png" },
                { id = "drug_grinder", label = "Grinder", amount = 1, image = "drug_grinder.png", keep = true }
            },
            returns = { id = strain .. "_joint", label = info.label .. " (Joint)", amount = 1, image = "joint.png" },
            xp = { min = 3, max = 6 }
        }
    }
end
