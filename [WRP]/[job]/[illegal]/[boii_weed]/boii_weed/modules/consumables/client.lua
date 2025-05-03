--- @section Events

--- Triggers the smoking animation for the player.
RegisterNetEvent("boii_weed:cl:smoke_joint", function()
    local ped = PlayerPedId()
    local net_ped = PedToNet(ped)
    local particle_dict = "core"
    local particle_effect = "exp_grd_bzgas_smoke"
    local anim_dict = "timetable@gardener@smoking_joint"
    local anim = "smoke_idle"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 49,
        duration = 5000,
        freeze = false,
        props = {
            { model = "prop_sh_joint_01", bone = 57005, coords = vector3(0.12, 0.03, -0.05), rotation = vector3(0.0, 10.0, 70.0), is_ped = true, rot_order = 1, sync_rot = true }
        }
    }
    PLAYER.play_animation(ped, options, function()
        TriggerServerEvent("boii_weed:sv:sync_smoke_effect", net_ped, 3000)
    end)
end)

--- Triggers the smoking animation for the player.
RegisterNetEvent("boii_weed:cl:smoke_bong", function()
    local ped = PlayerPedId()
    local net_ped = PedToNet(ped)
    local particle_dict = "core"
    local particle_effect = "exp_grd_bzgas_smoke"
    local anim_dict = "anim@safehouse@bong"
    local anim = "bong_stage3"
    local options = {
        dict = anim_dict,
        anim = anim,
        flags = 49,
        duration = 8000,
        freeze = false,
        props = {
            { model = "prop_bong_01", bone = 18905, coords = vector3(0.1, -0.2, 0.08), rotation = vector3(256.0, 0.0, 0.0), is_ped = true, rot_order = 1, sync_rot = true }
        }
    }
    PLAYER.play_animation(ped, options, function()
        TriggerServerEvent("boii_weed:sv:sync_smoke_effect", net_ped, 6000)
    end)
end)

--- Runs synced smoke effect on player.
--- @param net_ped: Player net
RegisterNetEvent("boii_weed:cl:apply_smoke_effect", function(net_ped, duration)
    local ped = NetToPed(net_ped)
    if not DoesEntityExist(ped) then return end
    local particle_dict = "core"
    local particle_effect = "exp_grd_bzgas_smoke"
    RequestNamedPtfxAsset(particle_dict)
    while not HasNamedPtfxAssetLoaded(particle_dict) do 
        Wait(10)
    end
    SetPtfxAssetNextCall(particle_dict)
    local bone_index = GetPedBoneIndex(ped, 31086)
    if bone_index == -1 then return end
    local smoke_particle = StartParticleFxLoopedOnEntityBone(particle_effect, ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, bone_index, 1.5, 0.0, 0.0, 0.0)
    SetParticleFxLoopedAlpha(smoke_particle, 1.0)
    SetTimeout(duration, function()
        StopParticleFxLooped(smoke_particle, 0.3)
        RemoveParticleFxFromEntity(ped)
        RemoveParticleFx(particle_effect, true)
    end)
end)

--- Applies visual screen effects when smoking a joint.
--- @param effects table: Effect toggles.
RegisterNetEvent("boii_weed:cl:smoke_screen_effects", function(effects)
    local ped = PlayerPedId()
    if effects.screen then
        StartScreenEffect("DrugsMichaelAliensFight", 0, true)
        SetTimecycleModifier("spectator5")
    end
    if effects.motion then
        SetPedMotionBlur(ped, true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.7)
    end
    local duration = 15000
    local step = 500
    local fade_out_steps = duration / step
    local shake_intensity = 0.7
    local blur_strength = 1.0
    for i = 1, fade_out_steps do
        Wait(step)
        if effects.motion then
            shake_intensity = shake_intensity - (0.7 / fade_out_steps)
            ShakeGameplayCam("DRUNK_SHAKE", shake_intensity)
        end
    end
    if effects.screen then
        StopScreenEffect("DrugsMichaelAliensFight")
        SetTimecycleModifier("")
    end
    if effects.motion then
        SetPedMotionBlur(ped, false)
        StopGameplayCamShaking(true)
    end
end)

