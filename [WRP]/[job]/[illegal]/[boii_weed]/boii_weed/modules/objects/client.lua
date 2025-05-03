--- Max distance from player you can place a new washer.
--- Increase this if you want to place them further away from your current standing position. 
local MAX_PLACEMENT_DISTANCE = 10.0

--- Stores all active objects.
placed_objects = {}

--- Stores current preview object and data.
local preview_object = nil
local preview_data = nil

--- Gets key list from utils.
local KEYS = KEYS.get_keys()

--- Hang until client locale is ready.
while next(client_locale) == nil do
    Wait(10)
end

--- Ground type modifiers.
--- This should cover all relevant ground types. 
local ground_modifiers = {
    [1288448767] = { name = "GRASS", growth = 1.2, water = 1.2, food = 1.0, pests = 1.2, disease = 1.1 },
    [1109728704] = { name = "MUD", growth = 1.0, water = 1.5, food = 1.0, pests = 1.0, disease = 1.3 },
    [223086562]  = { name = "SOIL", growth = 1.3, water = 1.3, food = 1.0, pests = 1.0, disease = 1.0 }, 
    [2128369009] = { name = "SAND", growth = 0.7, water = 0.5, food = 1.2, pests = 0.8, disease = 0.9 },
    [2461440131] = { name = "CLAY", growth = 0.9, water = 1.4, food = 1.1, pests = 1.1, disease = 1.3 }, 
    [3594309083] = { name = "ROCK", growth = 0.6, water = 0.3, food = 1.2, pests = 0.9, disease = 0.8 }, 
    [1144315879] = { name = "SNOW", growth = 0.5, water = 0.4, food = 1.3, pests = 0.5, disease = 1.5 },  
    [4170197704] = { name = "GRAVEL", growth = 0.8, water = 0.6, food = 1.1, pests = 1.0, disease = 1.0 },
    [3008270349] = { name = "CONCRETE", growth = 0.3, water = 0.2, food = 1.5, pests = 0.5, disease = 0.7 },  
    [951832588]  = { name = "ASPHALT", growth = 0.2, water = 0.1, food = 1.5, pests = 0.3, disease = 0.6 },
    [2409420175] = { name = "WOOD", growth = 0.5, water = 0.5, food = 1.0, pests = 0.8, disease = 0.9 },
    [1333033863] = { name = "LEAVES", growth = 1.1, water = 1.2, food = 1.0, pests = 1.3, disease = 1.2 },
    [2352068586] = { name = "MARSH", growth = 1.0, water = 1.8, food = 1.1, pests = 1.2, disease = 1.4 },
    [581794674]  = { name = "TUNDRA", growth = 0.6, water = 0.7, food = 1.2, pests = 0.7, disease = 1.3 },
    [3833216577] = { name = "FARM_SOIL", growth = 1.5, water = 1.2, food = 1.0, pests = 1.0, disease = 1.0 }
}

local key_list = {
    enter = { name = "Enter", label = "Confirm" },
    backspace = { name = "Backspace", label = "Cancel" },
    w = { name = "W", label = "Move Forward" },
    s = { name = "S", label = "Move Backward" },
    a = { name = "A", label = "Move Left" },
    d = { name = "D", label = "Move Right" },
    g = { name = "G", label = "Rotate Left" },
    h = { name = "H", label = "Rotate Right" },
    arrowup = { name = "Arrow Up", label = "Camera Up" },
    arrowdown = { name = "Arrow Down", label = "Camera Down" },
    arrowleft = { name = "Arrow Left", label = "Camera Left" },
    arrowright = { name = "Arrow Right", label = "Camera Right" },
}

local placement_actions = {}

for key, data in pairs(key_list) do
    placement_actions[#placement_actions + 1] = {
        key = KEYS[key],
        name = data.name,
        label = data.label,
        action = function(params)
            if key == "enter" and preview_data then confirm_object_placement(preview_data) end
            if key == "backspace" then cancel_object_placement() end
            if key == "w" then
                local new_coords = params.object_coords - params.cam_forward * 0.02
                if #(new_coords - GetEntityCoords(PlayerPedId())) <= MAX_PLACEMENT_DISTANCE then
                    params.object_coords = new_coords
                end
            end
            if key == "s" then
                local new_coords = params.object_coords + params.cam_forward * 0.02
                if #(new_coords - GetEntityCoords(PlayerPedId())) <= MAX_PLACEMENT_DISTANCE then
                    params.object_coords = new_coords
                end
            end
            if key == "a" then
                local new_coords = params.object_coords - params.cam_right * 0.02
                if #(new_coords - GetEntityCoords(PlayerPedId())) <= MAX_PLACEMENT_DISTANCE then
                    params.object_coords = new_coords
                end
            end
            if key == "d" then
                local new_coords = params.object_coords + params.cam_right * 0.02
                if #(new_coords - GetEntityCoords(PlayerPedId())) <= MAX_PLACEMENT_DISTANCE then
                    params.object_coords = new_coords
                end
            end
            if key == "g" then params.heading = params.heading - 0.25 end
            if key == "h" then params.heading = params.heading + 0.25 end
            if key == "arrowup" then params.camera_angle_vertical = math.min(params.camera_angle_vertical + 0.5, 89.0) end
            if key == "arrowdown" then params.camera_angle_vertical = math.max(params.camera_angle_vertical - 0.5, -89.0) end
            if key == "arrowleft" then params.camera_angle_horizontal = params.camera_angle_horizontal - 1.0 end
            if key == "arrowright" then params.camera_angle_horizontal = params.camera_angle_horizontal + 1.0 end
        end
    }
end

--- @section Functions

--- Requests updated washers on load.
local function request_objects()
    TriggerServerEvent("boii_weed:sv:request_objects")
end
request_objects()

--- Gets the current ground material hash
--- @param coords: Current player coords.
local function get_ground_hash(coords)
    local shape_test = StartShapeTestCapsule(coords.x, coords.y, coords.z + 1.0, coords.x, coords.y, coords.z - 2.0, 2, 1, PlayerPedId(), 7)
    local _, _, _, _, material_hash = GetShapeTestResultEx(shape_test)
    return material_hash
end

--- Disable all controls except those needed for placement.
local function disable_all_controls()
    DisableAllControlActions(0)
    for _, action in ipairs(placement_actions) do
        EnableControlAction(0, action.key, true)
    end
end

--- Attach a camera to the object with an offset.
local function attach_placement_camera(object)
    if DoesCamExist(placement_camera) then
        DestroyCam(placement_camera, false)
    end
    placement_camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local obj_coords = GetEntityCoords(object)
    SetCamCoord(placement_camera, obj_coords.x - 2.0, obj_coords.y - 2.0, obj_coords.z + 1.5)
    PointCamAtEntity(placement_camera, object)
    SetCamActive(placement_camera, true)
    RenderScriptCams(true, false, 0, true, false)
end

--- Destroy the placement camera.
local function destroy_placement_camera()
    if DoesCamExist(placement_camera) then
        RenderScriptCams(false, false, 0, true, false)
        DestroyCam(placement_camera, false)
        placement_camera = nil
    end
end

--- Function to display UI instructions.
local function show_placement_ui()
    local filtered_controls = {}
    for _, action in ipairs(placement_actions) do
        filtered_controls[#filtered_controls + 1] = { label = action.label, name = action.name }
    end
    SendNUIMessage({ action = "open_prop_placer", controls = filtered_controls })
end

--- Function to hide UI instructions.
local function hide_placement_ui()
    SendNUIMessage({ action = "close_prop_placer" })
end

--- Create and manage an object in the world.
--- @param data table: Object configuration data.
--- @param is_placing boolean: Whether the object is in placement mode.
--- @param callback function: Function to call once the process is complete.
local function create_object(data, is_placing, callback)
    local model = (type(data.model) == "number" and data.model or GetHashKey(data.model))
    REQUESTS.model(model)
    local object_id = data.id
    local ground_z = data.coords.z
    local found_ground, z = GetGroundZFor_3dCoord(data.coords.x, data.coords.y, data.coords.z, false)
    if found_ground then
        ground_z = z
    end
    local obj = CreateObject(model, data.coords.x, data.coords.y, ground_z, false, false, data.networked or false)
    SetEntityHeading(obj, data.coords.w or 0.0)
    if is_placing then
        SetEntityAlpha(obj, 204, false)
        SetEntityCollision(obj, false, false)
        placed_objects[object_id] = { object = obj, data = data, is_placing = true }
    else
        FreezeEntityPosition(obj, true)
        placed_objects[object_id] = { object = obj, data = data, is_placing = false }
        add_zone(data)
        if data.object_type == "drug_plants" and not data.environment then
            local environment_details = exports.boii_utils:get_environment_details()
            if environment_details then
                data.environment = environment_details
                TriggerServerEvent("boii_weed:sv:update_plant_environment", data.id, environment_details)
            end
        end
    end
    if callback then
        callback(object_id)
    end
    return obj
end

--- Remove an object by its ID.
--- @param id string: Object ID.
function remove_object(id, keep_cache)
    if placed_objects[id] then
        DeleteObject(placed_objects[id].object)
        if not keep_cache then
            placed_objects[id] = nil
        end
    end
end

--- @section Global Functions

--- Start placing an object in preview mode.
--- @param data table: Object data for placement.
function start_object_placement(data)
    if is_placing then return end
    local player_id = GetPlayerServerId(PlayerId())
    local temp_id = ("preview_%s_%d"):format(player_id, math.random(1000, 9999))
    data.id = temp_id
    FreezeEntityPosition(PlayerPedId(), true)
    preview_object = create_object(data, true)
    preview_data = data
    is_placing = true
    show_placement_ui()
    attach_placement_camera(preview_object)
end

--- Cancel object placement.
function cancel_object_placement()
    if not is_placing then return end
    if DoesEntityExist(preview_object) then
        DeleteObject(preview_object)
    end
    FreezeEntityPosition(PlayerPedId(), false)
    preview_object = nil
    preview_data = nil
    is_placing = false
    hide_placement_ui()
    destroy_placement_camera()
end

--- Confirm and place the object with appropriate animation.
--- @param data table: Object data for placement.
function confirm_object_placement(data)
    if not is_placing or not preview_object then return end
    local player_ped = PlayerPedId()
    local coords = GetEntityCoords(preview_object)
    local heading = GetEntityHeading(preview_object)
    DeleteObject(preview_object)
    FreezeEntityPosition(player_ped, false)
    preview_object = nil
    preview_data = nil
    hide_placement_ui()
    destroy_placement_camera()
    TaskGoStraightToCoord(player_ped, coords.x, coords.y, coords.z, 1.0, -1, heading, 0.1)
    CreateThread(function()
        while true do
            Wait(100)
            local player_coords = GetEntityCoords(player_ped)
            if #(player_coords - coords) <= 1.2 then
                local anim_dict = data.object_type == "drug_plants" and "amb@world_human_gardener_plant@male@base" or "amb@world_human_hammering@male@base"
                local anim_name = "base"
                REQUESTS.anim(anim_dict)
                TaskPlayAnim(player_ped, anim_dict, anim_name, 8.0, -8.0, 3000, 1, 0, false, false, false)
                Wait(3000)
                data.id = nil
                data.coords = { x = coords.x, y = coords.y, z = coords.z, w = heading }
                data.alpha = nil
                data.networked = true
                TriggerServerEvent("boii_weed:sv:save_object", data)
                break
            end
        end
    end)
end

--- @section Events

--- Event to spawn an new washer.
--- @param data table: Object data to spawn.
RegisterNetEvent("boii_weed:cl:spawn_object", function(data, source_player)
    create_object(data, false)
end)

--- Clears is placing flag after time out to stop dui bugs.
RegisterNetEvent("boii_weed:cl:clear_is_placing", function()
    SetTimeout(1000, function()
        is_placing = false
    end)
end)

--- Handle server-triggered object removal.
RegisterNetEvent("boii_weed:cl:remove_object", function(id, keep_cache)
    remove_object(id, keep_cache)
end)

--- Handle server triggered object placement.
--- @param data table: Object data for placement.
RegisterNetEvent("boii_weed:cl:start_object_placement", function(data)
    start_object_placement(data)
end)

--- Updates plant data on the client when received from the server.
RegisterNetEvent("boii_weed:cl:update_plant_status", function(plant_id, updated_data)
    if placed_objects[plant_id] then
        placed_objects[plant_id].data.additional = updated_data
    end
end)

--- Updates plant to a new model.
--- @param plant_id number: ID for the plant.
--- @param new_model string: New plant model name.
RegisterNetEvent("boii_weed:cl:update_plant_model")
AddEventHandler("boii_weed:cl:update_plant_model", function(plant_id, new_model)
    local plant = placed_objects[plant_id]
    if plant then
        if plant.object then
            DeleteObject(plant.object)
            plant.object = nil
        end
        local ground_z = plant.data.coords.z
        local found_ground, z = GetGroundZFor_3dCoord(plant.data.coords.x, plant.data.coords.y, plant.data.coords.z, false)
        if found_ground then
            ground_z = z
        end
        plant.object = CreateObject(new_model, plant.data.coords.x, plant.data.coords.y, ground_z, false, false, false)
        SetEntityHeading(plant.object, plant.heading)
        FreezeEntityPosition(plant.object, true)
    end
end)

--- @section Threads

--- Handles object placement.
CreateThread(function()
    local camera_radius = 3.0
    local camera_angle_horizontal = 0.0
    local camera_angle_vertical = 15.0
    local last_can_place = nil
    while true do
        Wait(0)
        if is_placing and DoesEntityExist(preview_object) then
            disable_all_controls()
            local object_coords = GetEntityCoords(preview_object)
            local heading = GetEntityHeading(preview_object)
            local cam_forward = vector3(math.cos(math.rad(camera_angle_horizontal)) * math.cos(math.rad(camera_angle_vertical)), math.sin(math.rad(camera_angle_horizontal)) * math.cos(math.rad(camera_angle_vertical)), 0)
            local cam_right = vector3(-math.sin(math.rad(camera_angle_horizontal)), math.cos(math.rad(camera_angle_horizontal)), 0)
            cam_forward = cam_forward / #cam_forward
            cam_right = cam_right / #cam_right
            local ground_z = object_coords.z
            local found_ground, z = GetGroundZFor_3dCoord(object_coords.x, object_coords.y, object_coords.z - 1.0, false)
            if found_ground then
                ground_z = z
            end
            object_coords = vector3(object_coords.x, object_coords.y, ground_z)
            local ground_hash = get_ground_hash(object_coords)
            local ground_data = ground_modifiers[ground_hash]
            local can_place = ground_data ~= nil
            if last_can_place ~= can_place then
                --SendNUIMessage({ action = "update_can_place", can_place = can_place }) -- was bugging will fix asap.
                last_can_place = can_place
            end

            local params = { object_coords = object_coords, heading = heading, cam_forward = cam_forward, cam_right = cam_right, camera_angle_horizontal = camera_angle_horizontal, camera_angle_vertical = camera_angle_vertical }
            for _, action in ipairs(placement_actions) do
                if IsDisabledControlPressed(0, action.key) and action.action then
                    action.action(params)
                    break
                end
            end
            camera_angle_horizontal = params.camera_angle_horizontal
            camera_angle_vertical = params.camera_angle_vertical
            SetEntityCoords(preview_object, params.object_coords.x, params.object_coords.y, params.object_coords.z, false, false, false, false)
            SetEntityHeading(preview_object, params.heading)
            if DoesCamExist(placement_camera) then
                local cam_x = params.object_coords.x + camera_radius * math.cos(math.rad(camera_angle_horizontal)) * math.cos(math.rad(camera_angle_vertical))
                local cam_y = params.object_coords.y + camera_radius * math.sin(math.rad(camera_angle_horizontal)) * math.cos(math.rad(camera_angle_vertical))
                local cam_z = params.object_coords.z + camera_radius * math.sin(math.rad(camera_angle_vertical))
                SetCamCoord(placement_camera, cam_x, cam_y, cam_z)
                PointCamAtEntity(placement_camera, preview_object)
            end
        end
    end
end)

--- @section Clean Up

--- Clean up objects on resource stop.
AddEventHandler("onResourceStop", function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for id, obj in pairs(placed_objects) do
        if DoesEntityExist(obj.object) then
            DeleteObject(obj.object)
        end
    end
    preview_object = nil
    placed_objects = {}
    is_placing = false
end)