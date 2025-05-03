--- Triggers the plant destruction animation and removes the plant entity.
--- @param plant_id number The unique identifier of the plant to be destroyed.
RegisterNetEvent("boii_weed:cl:destroy_plant_animation", function(plant_id)
    local plant = placed_objects[plant_id]
    if not plant or not plant.object then return end
    local coords = GetEntityCoords(plant.object)
    local particle_dict = "scr_mp_house"
    local particle_effect = "scr_mp_int_fireplace_sml"
    local anim_dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local anim = "weed_spraybottle_crouch_base_inspector"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("destroying_plant")
        }
    }
    PLAYER.play_animation(PlayerPedId(), options, function()
        RequestNamedPtfxAsset(particle_dict)
        while not HasNamedPtfxAssetLoaded(particle_dict) do 
            Wait(10) 
        end
        SetPtfxAssetNextCall(particle_dict)
        local particle = StartParticleFxLoopedAtCoord(particle_effect, coords.x, coords.y, coords.z, 0.0, 0.0, 0.2, 1.5, false, false, false)
        Wait(5000)
        StopParticleFxLooped(particle, false)
        plant.is_destroyed = true
        remove_object(plant_id)
    end)
end)

--- Triggers the animation for feeding a plant.
RegisterNetEvent("boii_weed:cl:feed_plant_animation", function()
    local anim_dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local anim = "weed_spraybottle_crouch_base_inspector"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("feeding_plant")
        }
    }
    PLAYER.play_animation(PlayerPedId(), options, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

--- Triggers the animation for watering a plant.
RegisterNetEvent("boii_weed:cl:water_plant_animation", function()
    local anim_dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local anim = "weed_spraybottle_crouch_base_inspector"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("watering_plant")
        }
    }
    PLAYER.play_animation(PlayerPedId(), options, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

--- Triggers the animation for curing a diseased plant.
RegisterNetEvent("boii_weed:cl:cure_plant_animation", function()
    local anim_dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local anim = "weed_spraybottle_crouch_base_inspector"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("curing_plant")
        }
    }
    PLAYER.play_animation(PlayerPedId(), options, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

--- Triggers the animation for harvesting a plant.
RegisterNetEvent("boii_weed:cl:harvest_plant_animation", function(plant_id)
    local plant = placed_objects[plant_id]
    if not plant or not plant.object then return end
    local coords = GetEntityCoords(plant.object)
    local anim_dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    local anim = "weed_spraybottle_crouch_base_inspector"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("harvesting_plant")
        }
    }
    PLAYER.play_animation(PlayerPedId(), options, function()
        plant.is_destroyed = true
        remove_object(plant_id)
    end)
end)

--- Handles filling watering cans
RegisterNetEvent("boii_weed:cl:fill_watering_can", function()
    local player_ped = PlayerPedId()
    local player_coords = GetEntityCoords(player_ped)
    if not IsEntityInWater(player_ped) then
        NOTIFICATIONS.send({ type = "error", header = L("watering_can_header"), message = L("not_near_water"), duration = 3500 })
        return
    end
    local anim_dict = "timetable@gardener@filling_can"
    local anim = "gar_ig_5_filling_can"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 9,
        duration = 5000,
        freeze = true,
        progress = {
            type = "circle",
            message = L("filling_watering_can")
        }
    }
    PLAYER.play_animation(player_ped, options, function()
        TriggerServerEvent("boii_weed:sv:fill_watering_can")
    end)
end)

--- @section Threads

CreateThread(function()
    while true do
        Wait(30000)
        local environment_details = exports.boii_utils:get_environment_details()
        if environment_details then
            TriggerServerEvent("boii_weed:sv:update_environment", environment_details)
        end
    end
end)