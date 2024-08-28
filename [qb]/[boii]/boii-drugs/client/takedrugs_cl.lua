----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local RemoveStressEvent = Config.CoreSettings.RemoveStressEvent
local EvidenceEvent = Config.CoreSettings.EvidenceEvent
local istakingdrugs = false
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- DRUG EFFECTS --<!>--
-- Joints
local function JointEffects(player, timer)
    Wait(2000)
    TriggerEvent(EvidenceEvent, 'weedsmell', 300) 
    if Config.Plants.Outdoor.Actions.Smoking.Effects then
        Wait(1000)
        SetTimecycleModifier('spectator9')
        SetPedMotionBlur(player, true)
    end     
    Wait(timer*60000)
    ClearTimecycleModifier()
    SetPedMotionBlur(player, false)
end
-- Ketamine
local function KetamineEffect(player, timer)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    if Config.Ketamine.Take.Effects then
        SetFlash(0, 0, 500, 7000, 500)
        ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
        Wait(2000)
        ShakeGameplayCam('DRUNK_SHAKE', 1.10)
        Wait(3000) 
        SetTimecycleModifier('spectator4')
        SetPedMotionBlur(player, true)           
    end
    if 95 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(3000, 8000), math.random(3000, 8000), 3, 0, 0, 0)
        if Config.Ketamine.Take.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.50)
            Wait(2000)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)     
        end
        Wait(8000)
        SetPedToRagdoll(player, math.random(3000, 6000), math.random(3000, 6000), 3, 0, 0, 0)
    end
    Wait(timer*60000)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 0.00)
    Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(player, 1.0)
    StopGameplayCamShaking(player, true)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
    ClearPedTasks(player)
end
-- Morphine
local function MorphineEffect(player, timer)
    if Config.TakeDrugs.Heroin.Morphine.Effects then
        StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
        SetFlash(0, 0, 500, 7000, 500)
        SetTimecycleModifier("spectator8")
        SetPedMotionBlur(player, true)  
        Wait(5600)
        StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
        SetFlash(0, 0, 500, 7000, 500)
        Wait(3000)
        StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
        SetFlash(0, 0, 500, 7000, 500)
    end
    Wait(timer*60000)
    SetPedArmour(player, 0.0)
	StopScreenEffect("DrugsMichaelAliensFight")
	StopScreenEffect("DrugsMichaelAliensFightIn")
	StopScreenEffect("DrugsMichaelAliensFightOut")
    ClearTimecycleModifier()
end
-- Heroin
local function HeroinEffect(player, timer)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    if Config.TakeDrugs.Heroin.Heroin.Effects then
        SetFlash(0, 0, 500, 7000, 500)
        ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
        Wait(2000)
        ShakeGameplayCam('DRUNK_SHAKE', 1.10)
        Wait(3000) 
        SetTimecycleModifier('spectator5')
        SetPedMotionBlur(player, true)           
    end
    if 95 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(3000, 8000), math.random(3000, 8000), 3, 0, 0, 0)
        if Config.TakeDrugs.Heroin.Heroin.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.50)
            Wait(2000)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)     
        end
        Wait(8000)
        SetPedToRagdoll(player, math.random(3000, 6000), math.random(3000, 6000), 3, 0, 0, 0)
    end
    Wait(timer*60000)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 0.00)
    Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(player, 1.0)
    StopGameplayCamShaking(player, true)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
    ClearPedTasks(player)
end
-- Crack
local function CrackEffect(player, timer)
    Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(player, 1.49)
    SetPedIsDrunk(player, true)
    if Config.TakeDrugs.Cocaine.Crack.Effects then
        SetFlash(0, 0, 500, 7000, 500)
        ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
        Wait(2000)
        ShakeGameplayCam('DRUNK_SHAKE', 1.10)
        Wait(3000) 
        SetTimecycleModifier('spectator6')
        SetPedMotionBlur(player, true)           
    end
    if 80 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
        if Config.TakeDrugs.Cocaine.Crack.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
            Wait(2000)
            ShakeGameplayCam('DRUNK_SHAKE', 1.10)
            Wait(3000)      
        end
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
        if Config.TakeDrugs.Cocaine.Crack.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
            Wait(8000)      
        end
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 4000), 3, 0, 0, 0)
        if Config.TakeDrugs.Cocaine.Crack.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
            Wait(2000)
            ShakeGameplayCam('DRUNK_SHAKE', 1.10)
            Wait(3000)       
        end
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
    end
    Wait(8500)
    if 50 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
        if Config.TakeDrugs.Cocaine.Crack.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
            Wait(2000)
            ShakeGameplayCam('DRUNK_SHAKE', 1.10)
            Wait(3000)       
        end
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        if Config.TakeDrugs.Cocaine.Crack.Effects then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
            Wait(3000)      
        end
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
    end
    Wait(timer*60000)
    SetFlash(0, 0, 500, 7000, 500)
    ShakeGameplayCam('DRUNK_SHAKE', 0.00)
    Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(player, 1.0)
    StopGameplayCamShaking(player, true)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
    ClearPedTasks(player)
end
-- Meth
local function MethEffect(player, timer)
    Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
	TriggerEvent(EvidenceEvent, 'agitated', 300)
    SetRunSprintMultiplierForPlayer(player, 1.3)
    if Config.TakeDrugs.Meth.Meth.Effects then
        Wait(1000)
        SetTimecycleModifier('spectator6')
        Wait(5000)
        SetTimecycleModifier('spectator4')
        SetPedMotionBlur(player, true)           
    end
    if 80 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
    end
    Wait(10000)
    if 65 > math.random(1,100) and IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 4000), math.random(1000, 4000), 3, 0, 0, 0)
    end
    Wait(timer*60000)
    SetRunSprintMultiplierForPlayer(player, 1.0)
    ClearTimecycleModifier()
    SetPedMotionBlur(player, false)
    ClearPedTasks(player)
end
-- Cocaine
local function CocaineEffect(player, timer)
    Wait(2000)
    TriggerEvent(EvidenceEvent, 'widepupils', 300)
    SetRunSprintMultiplierForPlayer(player, 1.49)
    if Config.TakeDrugs.Cocaine.Cocaine.Effects then
        Wait(1000)
        SetTimecycleModifier('spectator1')
        Wait(5000)
        SetTimecycleModifier('spectator5')
        SetPedMotionBlur(player, true)           
    end
    Wait(timer*60000)
    SetRunSprintMultiplierForPlayer(player, 1.0)
    ClearTimecycleModifier()
    SetPedMotionBlur(player, false)
    ClearPedTasks(player)
end
--<!>-- DRUG EFFECTS --<!>--

--<!>-- SMOKE JOINT --<!>--
-- Event
RegisterNetEvent('boii-drugs:cl:Smoke', function(itemname, armour, stress, timer)
    local player = PlayerPedId()
    Core.Functions.Progressbar('drugs_smokejoints', Language.Weed.Smoking['smokejoint'], Config.Plants.Outdoor.Actions.Smoking.Time*1000, false, true,{
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Plants.Outdoor.Actions.Smoking.Animations.Dict,
        anim = Config.Plants.Outdoor.Actions.Smoking.Animations.Anim,
        flags = Config.Plants.Outdoor.Actions.Smoking.Animations.Flags,
    }, {
        model = Config.Plants.Outdoor.Actions.Smoking.Animations.Prop,
        bone = Config.Plants.Outdoor.Actions.Smoking.Animations.Bone,
        coords = Config.Plants.Outdoor.Actions.Smoking.Animations.Coords,
        rotation = Config.Plants.Outdoor.Actions.Smoking.Animations.Rotation,
    }, {}, function() 
        TriggerServerEvent('boii-drugs:sv:RemoveItem', itemname, 1)
        AddArmourToPed(player, armour)
        TriggerServerEvent(RemoveStressEvent, stress)
        JointEffects(player, timer)
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-drugs:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)
--<!>-- SMOKE JOINT --<!>--

--<!>-- TAKE DRUGS --<!>--
RegisterNetEvent('boii-drugs:cl:TakeDrugs', function(itemname, drugtype, armour, stress, timer)
    local timer = tonumber(timer)
    local args = tonumber(args)
    local player = PlayerPedId()
    if istakingdrugs then
        TriggerEvent('boii-drugs:notify', Language.TakeDrugs['busy'], 'error')
        return
    end
    if drugtype == 'Ketamine' then
        lang = Language.Ketamine.Take['take']
        bartime = Config.Ketamine.Take.Time
        animdict = Config.Animations.Take.Dict
        anims = Config.Animations.Take.Anim
        flag = Config.Animations.Take.Flags
    elseif drugtype == 'Morphine' then
        lang = Language.TakeDrugs.Heroin.Morphine['takedrug']
        bartime = Config.TakeDrugs.Heroin.Morphine.Time
        animdict = Config.TakeDrugs.Heroin.Morphine.Animations.Dict
        anims = Config.TakeDrugs.Heroin.Morphine.Animations.Anim
        flag = Config.TakeDrugs.Heroin.Morphine.Animations.Flags
    elseif drugtype == 'Heroin' then
        lang = Language.TakeDrugs.Heroin.Heroin['takedrug']
        bartime = Config.TakeDrugs.Heroin.Heroin.Time
        animdict = Config.TakeDrugs.Heroin.Heroin.Animations.Dict
        anims = Config.TakeDrugs.Heroin.Heroin.Animations.Anim
        flag = Config.TakeDrugs.Heroin.Heroin.Animations.Flags
    elseif drugtype == 'Crack' then
        lang = Language.TakeDrugs.Cocaine.Crack['takedrug']
        bartime = Config.TakeDrugs.Cocaine.Crack.Time
        animdict = Config.TakeDrugs.Cocaine.Crack.Animations.Dict
        anims = Config.TakeDrugs.Cocaine.Crack.Animations.Anim
        flag = Config.TakeDrugs.Cocaine.Crack.Animations.Flags
    elseif drugtype == 'Meth' then
        lang = Language.TakeDrugs.Meth.Meth['takedrug']
        bartime = Config.TakeDrugs.Meth.Meth.Time
        animdict = Config.TakeDrugs.Meth.Meth.Animations.Dict
        anims = Config.TakeDrugs.Meth.Meth.Animations.Anim
        flag = Config.TakeDrugs.Meth.Meth.Animations.Flags
    elseif drugtype == 'Cocaine' then
        lang = Language.TakeDrugs.Cocaine.Cocaine['takedrug']
        bartime = Config.TakeDrugs.Cocaine.Cocaine.Time
        animdict = Config.TakeDrugs.Cocaine.Cocaine.Animations.Dict
        anims = Config.TakeDrugs.Cocaine.Cocaine.Animations.Anim
        flag = Config.TakeDrugs.Cocaine.Cocaine.Animations.Flags
    end
    istakingdrugs = true
    Core.Functions.Progressbar('drugs_takedrugs', lang, bartime*1000, false, true, {
        disableMovement = false, 
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animdict,
        anim = anims,
        flags = flag
    }, {}, {}, function()
        TriggerServerEvent('boii-drugs:sv:RemoveItem', itemname, 1)
        AddArmourToPed(player, armour)
        TriggerServerEvent(RemoveStressEvent, stress) 
        istakingdrugs = false
        if drugtype == 'Ketamine' then
            KetamineEffect(player, timer)
        end
        if drugtype == 'Morphine' then
            MorphineEffect(player, timer)
        end
        if drugtype == 'Heroin' then
            HeroinEffect(player, timer)
        end
        if drugtype == 'Crack' then
            CrackEffect(player, timer)
        end
        if drugtype == 'Meth' then
            MethEffect(player, timer)
        end
        if drugtype == 'Cocaine' then
            CocaineEffect(player, timer)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-drugs:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
        istakingdrugs = false
    end)
end)
--<!>-- TAKE DRUGS --<!>--