config.consumables.joint = {}
config.consumables.bag = {}

--- @section Joints

--- Loops through config.items.joint list and assigns default values.
for item, joint in pairs(config.items.joint) do
    config.consumables.joint[item] = {
        id = item,
        label = joint.label,
        effects = { screen = true, motion = false }, -- Disable screen effects for smoking here; for motion sickness etc.
        statuses = {
            health = { add = { min = 5, max = 10 } },
            armour = { add = { min = 5, max = 10 } },
            hunger = { remove = { min = 5, max = 10 } },
            thirst = { remove = { min = 5, max = 10 } },
            stress = { remove = { min = 5, max = 10 } }
        }
    }

    CORE.register_item(item, function(source)
        if not CORE.has_item(source, "lighter", 1) then
            return NOTIFICATIONS.send(source, { type = "error", header = L("consumables_header"), message = L("no_lighter"), duration = 3500 })
        end
        smoke_joint(source, item) 
    end)
end

--- You can manually override specific items like so if you prefer variation to your consumables.
if config.consumables.joint["pink_runtz_joint"] then
    config.consumables.joint["pink_runtz_joint"].statuses.health = { add = { min = 10, max = 20 } }
    config.consumables.joint["pink_runtz_joint"].statuses.armour = { add = { min = 7, max = 15 } }
    config.consumables.joint["pink_runtz_joint"].statuses.hunger = { remove = { min = 28, max = 32 } }
    config.consumables.joint["pink_runtz_joint"].statuses.thirst = { remove = { min = 25, max = 30 } }
    config.consumables.joint["pink_runtz_joint"].statuses.stress = { remove = { min = 5, max = 10 } }
end

--- @section Bags

--- Loops through config.items.bag list and assigns default values.
for item, bag in pairs(config.items.bag) do
    config.consumables.bag[item] = {
        id = item,
        label = bag.label,
        effects = { screen = true, motion = false }, -- Disable screen effects for smoking here; for motion sickness etc.
        statuses = {
            health = { add = { min = 5, max = 10 } },
            armour = { add = { min = 5, max = 10 } },
            hunger = { remove = { min = 5, max = 10 } },
            thirst = { remove = { min = 5, max = 10 } },
            stress = { remove = { min = 5, max = 10 } }
        }
    }

    CORE.register_item(item, function(source)
        if not CORE.has_item(source, "bong", 1) then
            return NOTIFICATIONS.send(source, { type = "error", header = L("consumables_header"), message = L("no_bong"), duration = 3500 })
        end
        if not CORE.has_item(source, "lighter", 1) then
            return NOTIFICATIONS.send(source, { type = "error", header = L("consumables_header"), message = L("no_lighter"), duration = 3500 })
        end
        smoke_bong(source, item) 
    end)
end

--- You can manually override specific items like so if you prefer variation to your consumables.
if config.consumables.bag["pink_runtz_bag"] then
    config.consumables.bag["pink_runtz_bag"].statuses.health = { add = { min = 10, max = 20 } }
    config.consumables.bag["pink_runtz_bag"].statuses.armour = { add = { min = 7, max = 15 } }
    config.consumables.bag["pink_runtz_bag"].statuses.hunger = { remove = { min = 28, max = 32 } }
    config.consumables.bag["pink_runtz_bag"].statuses.thirst = { remove = { min = 25, max = 30 } }
    config.consumables.bag["pink_runtz_bag"].statuses.stress = { remove = { min = 5, max = 10 } }
end