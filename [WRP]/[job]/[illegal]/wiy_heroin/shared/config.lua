Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


-- Thank you for downloading this script!

-- Below you can change multiple options to suit your server needs.


Config.CoreSettings = {
    DrugScripts = {
        Enabled = false, 
        -- the following scripts: lusty94_cocaine, lusty94_heroin and lusty94_ketamine ALL share target models for hydrochloric acid, ether, lime and cement
        -- if you are using other scripts that clash with each other enable this setting to disable the target models for this script that are used in my other drug scripts
        -- then make sure the item name matches across all scripts to prevent any issues and use 1 target model option to collect said items
    },
    EventNames = {
        Stress = 'hud:server:RelieveStress', -- name of stress removal event
        Evidence = 'evidence:client:SetStatus', -- name of evidence event to set widepupils status when taking drugs
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for -x_lib notify
    },    
    Target = {
        Type = 'ox', -- target script name support for qb-target and ox_target        
        --use 'qb' for qb-target
        --use 'ox' for ox_target 
    },
    Inventory = {
        Type = 'ox' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Police = {
        MinCops = 1, -- minimum amount of cops required on duty to request mission
        Type = 'qb' -- support for qb-policejob and ps_dispatch
        --use 'qb' for qb-policejob
        --use 'ps' for ps-dispatch
    },
    Phone = {
        Type = 'qb' -- support for qb-phone and qs-smartphone
        --use 'qb' for qb-phone
        --use 'qs' for qs-smartphone
        --use 'custom' for your own phone script and then make sure to add the emails snippet required for the supply mission
    },
    ProgressBar = {
		PickOpiumPlants = 5000, -- time it takes to pick opium plants
		GetEther = 5000, -- time it takes to get ether
		GetLime = 5000, -- time it takes to get lime
		GetHydrochloricAcid = 5000, -- time it takes to get acid
		ProcessHeroinBase = 5000, -- time it takes to process all ingredients required to make heroin_base
		ProcessPureHeroin = 5000, -- time it takes to process all ingredients required to make pure_heroin
		ProcessHeroinVial = 5000, -- time it takes to process all ingredients required to make heroin_vial
		TakeHeroin = 5000, -- time it takes to consume heroin
        CreateOverDoseCure = 10000, -- time it takes to create overdose cure -- THIS IS PURPOSELY SET HIGH TO SIMULATE BREWING INGREDIENTS
		TakeOverDoseCure = 5000, -- time it takes to take overdose cure
		SearchGuards = 5000, -- time it takes to take search guards for chemical supply mission
    },
    CoolDownTimers = {
        Lime = 1000, -- cooldown timer in MS for getting lime
        Ether = 2000, -- cooldown timer in MS for getting ether
        HydrochloricAcid = 3000, -- cooldown timer in MS for getting hydrochloric acid
        Mission = 60000, -- cooldown timer in MS for getting chemicals mission
        RespawnPlants = 1 * 1000 * 60 -- timer to respawn opium plants - 30 mins by default - EDIT THE FIRST NUMBER TO CHANGE THE RESPAWN TIMER DURATOIN
    }, 
    Chances = { -- chances for individual events
        CallPolice = 90, -- chance to call police when searching for items
        GetOpium = 90, -- chance to get coca leaves
        GetLime = 90, -- chance to get cement
        GetEther = 90, -- chance to get gasoline
        GetHydro = 90, -- chance to get hydrochloric acid
        SearchBody = 90, -- chance to get items from searching chemicals mission peds
        ProcessSuccess = 100, -- chance to process drugs successfuly
    }, 
    Props = { 
        -- Name  = prop name 
        -- RequiredItem = item needed to activate target 
        -- ItemChance = chance of finding item 
        -- PoliceChance = chance of police notify if failed / found nothing 
        -- TargetIcon = icon for target 
        -- TargetLabel = label for target 
        -- TargetDistance = distance for target
        OpiumPlants = {
            Name = 'prop_plant_01b',
            RequiredItem = 'trowel',
            ItemChance = 90,
            PoliceChance = 90,
            TargetIcon = 'fa-brands fa-pagelines',
            TargetLabel = 'Pick Opium Plants',
            TargetDistance = 2.0,
        },
        Lime = {
            Name = 'prop_cons_cements01',
            ItemChance = 90,
            PoliceChance = 90,
            TargetIcon = 'fa-solid fa-hand-point-up',
            TargetLabel = 'Search Pallets', 
            TargetDistance = 2.0,
        },
        Ether = {
            Name = 'prop_barrel_exp_01a',
            RequiredItem = 'plasticjerrycan',
            ItemChance = 90,
            PoliceChance = 90,
            TargetIcon = 'fa-solid fa-gas-pump',
            TargetLabel = 'Siphon Ether',
            TargetDistance = 2.0,
        },
        HydrochloricAcid = {
            Name = 'prop_ind_mech_01c',
            RequiredItem = 'plasticjerrycan',
            ItemChance = 90,
            PoliceChance = 90,
            TargetIcon = 'fa-solid fa-jug-detergent',
            TargetLabel = 'Siphon Hydrochloric Acid',
            TargetDistance = 2.0,
        },
        ProcessingTable = {
            Name = 'v_ret_ml_tablea',
            TargetIconOpen = 'fa-solid fa-bars',
            TargetLabelOpen = 'Open Processing Table',
            TargetIconRemove = 'fas fa-xmark',
            TargetLabelRemove = 'Remove Processing Table',
            TargetDistance = 2.0,
        },
    },
}

Config.Blips = {
    {
        useblip = false,
        title = 'Opium Plants', 
        colour = 5, 
        id = 270, 
        coords = vector3(242.67, 3574.86, 34.18), 
        scale = 0.8, 
    },
    {
        useblip = false,
        title = 'Ether Barrels', 
        colour = 5, 
        id = 648, 
        coords = vector3(463.64, -578.81, 28.50), 
        scale = 0.8, 
    },
    {
        useblip = false,
        title = 'Construction Site', 
        colour = 5, 
        id = 478, 
        coords = vector3(-489.18, -990.85, 29.13), 
        scale = 0.8, 
    },
    {
        useblip = false,
        title = 'Hydrochloric Acid', 
        colour = 5, 
        id = 415, 
        coords = vector3(2710.09, 1532.11, 20.82), 
        scale = 0.8, 
    },
}


Config.Peds = {
    {
        useped = true,  -- use ped?
        name = 'heroinSupplyPed',  --must be unique
        coords = vector4(962.00, -2189.64, 30.51, 85.25), -- coords
        model = 'g_m_y_salvagoon_01', -- ped model
        targeticon = 'fa-solid fa-boxes-packing', -- target icon
        targetlabel = 'Speak With Supplier', -- target label
        targetdistance = 2.0, -- target distance
        playanim = true, -- play animation?
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- scenario name 
        useblip = false, -- use blip?
        title = 'Supplier', -- blip name
        colour = 5, -- blip colour
        id = 51, -- blip id
        scale = 0.8, -- blip scale
    },
}


Config.OpiumPlants = { -- add or remove plants as you wish
     --item is required item to target
     --label is target label
     --icon is target icon
     --coords are plant locations
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(248.96, 3572.38, 34.2), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(243.02, 3571.44, 34.4), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(241.18, 3566.24, 34.69), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(241.11, 3561.16, 34.94), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(244.56, 3557.8, 34.75), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(249.66, 3558.23, 34.57), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(252.53, 3562.4, 34.27), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(255.53, 3567.92, 34.05), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(258.14, 3571.69, 33.89), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(260.69, 3579.44, 34.08), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(259.51, 3584.84, 34.33), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(263.94, 3591.21, 34.5), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(263.36, 3597.33, 34.49), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(267.59, 3601.26, 34.31), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(267.6, 3609.96, 33.9), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(263.54, 3615.41, 33.63), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(256.72, 3615.26, 33.79), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(255.8, 3622.42, 33.73), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(251.12, 3623.35, 33.65), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(243.54, 3621.21, 33.43), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(235.98, 3616.59, 33.2), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(233.8, 3609.4, 33.22), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(228.23, 3600.72, 33.03), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(229.63, 3592.61, 33.35), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(227.62, 3583.72, 33.47), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(232.05, 3576.71, 33.94), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(243.86, 3578.99, 33.96), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(251.55, 3578.97, 33.94), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(254.61, 3585.45, 34.29), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(256.28, 3592.44, 34.48), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(253.6, 3598.0, 34.44), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(245.95, 3602.72, 34.09), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(247.96, 3609.61, 33.92), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(241.38, 3609.38, 33.67), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(246.38, 3596.99, 34.22), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(242.12, 3589.61, 33.94), },
    { item = 'trowel', label = 'Pick Opium Plant', icon = 'fa-solid fa-hand-point-up', coords = vector3(235.3, 3586.5, 33.73), },
}


-- XP settings
Config.XP = { -- use xp
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /drugxp or whatever you have named the metadata
    xpChance = 75, -- if enabled what chance does the player have to earn xp from events
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line you added into qb-core/server/player.lua
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8) if changing amounts dont forget to edit server file also where raw_mushroom is given to match new xp amounts
        150, -- level 2 
        250, -- level 3 
        500, -- level 4
        750, -- level 5
        1000, -- level 6
        1250, -- level 6
        1500, -- level 7
        1750, -- level 8
        2200, -- level 9
        2500, -- level 10  
    }
}



Config.Processing = { -- ItemName and ItemLabel MUST MATCH with items and labels in qb-core/shared/items.lua to work properly
    Mission = {
        DelayTime = 30 * 1000, -- delay time in minutes before getting the email with information so 1000 ms * 30 becomes 30 seconds - you could also use 60000 for MS or math.random(30000,60000) for MS instead
        ItemChance = 80, -- the chance to get chemicals when searching guards
        PoliceChance = 100, -- the chance to notify police when searching guards
        FindCash = true, -- set to true for a chance to find cash when searching guards
        CashChance = 75, -- the chance to find cash when searching guards
        CashAmount = math.random(100,500), -- amount of cash found if set to true and chance value is met
        Vehicle = { 
            { 
                model = 'gburrito2', -- vehicle spawn name
                driverweapon = 'weapon_combatshotgun', -- drivers weapon name
                drivermodel = 'g_m_y_lost_02', -- driver ped model
                passengerweapon = 'weapon_microsmg', -- passenger weapon name
                passengermodel = 'g_m_y_salvaboss_01', -- passenger ped model
                targeticon = 'fa-solid fa-users', -- target icon
                targetlabel = 'Search Body', -- target label
                targetdistance = 2.0, -- target distance
            },
        },
        StartLocations = { -- locations for the van to spawn at - must be vector4
            vector4(-1471.0, -682.72, 26.61, 123.0),
            vector4(-1319.66, -1217.99, 4.81, 17.33),
            vector4(-522.41, -874.0, 28.5, 268.81),
            vector4(-282.93, -1029.92, 30.38, 337.89),
            vector4(-174.25, -1366.58, 30.38, 214.85),
            vector4(-97.44, -1585.17, 31.41, 318.08),
            vector4(473.64, -1582.05, 29.11, 328.34),
        },
        DestinationLocations = { -- locations for the van to drive to - must be vector3
            vector3(346.57, -1101.39, 29.42),
            vector3(-174.98, 6.39, 57.0),
            vector3(122.31, -116.49, 54.84),
            vector3(693.22, -1004.51, 22.94),
            vector3(879.69, -1657.76, 30.27),
            vector3(1025.37, -2198.03, 30.6),
            vector3(437.12, -1837.61, 27.96),
            vector3(-196.65, -1695.32, 33.37),
            vector3(-95.95, -1465.69, 33.15),
            vector3(329.83, -1280.96, 31.72),
            vector3(1369.81, -1537.0, 55.99),
            vector3(203.96, 778.94, 205.72),
        },     
    },
    HeroinBase = {  
        RequiredItemName = 'opiumsap',  -- required item name
        RequiredItemLabel = 'Opium Sap', -- required item label
        RequiredItemAmount = 10, -- required item amount
        RequiredItem2Name = 'ether',  -- required item name
        RequiredItem2Label = 'Ether', -- required item label
        RequiredItem2Amount = 3, -- required item amount
        RequiredItem3Name = 'limepowder',  -- required item name
        RequiredItem3Label = 'Lime Powder', -- required item label
        RequiredItem3Amount = 3, -- required item amount
        RequiredItem4Name = 'hydrochloricacid',  -- required item name
        RequiredItem4Label = 'Hydrochloric Acid', -- required item label
        RequiredItem4Amount = 3, -- required item amount
        ProcessedItemName = 'heroin_base', -- given item name
        ProcessedItemLabel = 'Heroin Base', -- given item label
    },
    PureHeroin = {  
        RequiredItemName = 'heroin_base',  -- required item name
        RequiredItemLabel = 'Heroin Base', -- required item label
        RequiredItemAmount = 1, -- required item amount
        RequiredItem2Name = 'acetone',  -- required item name
        RequiredItem2Label = 'Acetone', -- required item label
        RequiredItem2Amount = 1, -- required item amount
        RequiredItem3Name = 'noscapine',  -- required item name
        RequiredItem3Label = 'Noscapine', -- required item label
        RequiredItem3Amount = 1, -- required item amount
        ProcessedItemName = 'pure_heroin', -- given item name
        ProcessedItemLabel = 'Pure Heroin', -- given item label
    },
    Bagging = {
        HeroinVial = {
            RequiredItemName = 'pure_heroin', -- required item name
            RequiredItemLabel = 'Pure Heroin', -- required item label
            RequiredItemAmount = 3, -- required item amount
            RequiredItem2Name = 'scales', -- required item name
            RequiredItem2Label = 'Scales', -- required item label [SCALES DOESNT NEED AN ITEM AMOUNT AS ITS JUST A CHECK FOR THE ITEM ITSELF IN THE PLAYERS INVENTORY - IT DOESNT GET REMOVED WHEN BAGGING]
            RequiredItem3Name = 'emptyvial', -- required item name
            RequiredItem3Label = 'Empty Vial', -- required item label
            RequiredItem3Amount = 1, -- required item amount
            BaggedItemName = 'heroin_vial', -- given item name
            BaggedItemLabel = 'Vial of Heroin', -- given item label
        },
    },
    Curing = {
        RequiredItemName = 'acetone',  -- required item name
        RequiredItemLabel = 'Acetone', -- required item label
        RequiredItemAmount = 2, -- required item amount
        RequiredItem2Name = 'papaverine',  -- required item name
        RequiredItem2Label = 'Papaverine', -- required item label
        RequiredItem2Amount = 2, -- required item amount
        RequiredItem3Name = 'noscapine',  -- required item name
        RequiredItem3Label = 'Noscapine', -- required item label
        RequiredItem3Amount = 2, -- required item amount
        ProcessedItemName = 'heroinoverdosecure', -- given item name
        ProcessedItemLabel = 'Overdose Cure', -- given item label
    },
    TakeDrugs = {
        RequiredItemName = 'heroin_vial',  -- required item name
        RequiredItemLabel = 'Vial of Heroin', -- required item label
        RequiredItemAmount = 1, -- required item amount
        RequiredItem2Name = 'dirtyneedle',  -- required item name
        RequiredItem2Label = 'Dirty Needle', -- required item label
    },
}



Config.DrugSettings = {
    Effects = {
        Enabled = true, -- enables screen visuals and armour, health and stress effects setting to false will disable everything
        EffectsTimer = 10000, -- timer for drug effects when consumed before wearing off - perfect time is around 10000 ms {10 seconds}
        GiveArmour = true, -- enables the player to gain armour when consuming coke and crack
        ArmourGained = math.random(20,30), -- amount of armour gained SET TO 0 FOR NOTHING
        ReduceStress = true, -- enables the player to get stress relief when consuming coke and crack
        StressReduced = math.random(20,30), -- amount of stress reduced SET TO 0 FOR NOTHING
        OverDose = false, -- set to true for a chance for the player to become overdosed after a certain amount of times taking magic mushrooms
        OverDoseMetaDataName = 'overdose', -- The name of your overdose metadata if you edit this make sure to also edit the line you added into qb-core/server/player.lua --USE /overdose TO CHECK YOUR OVERDOSE LEVEL if OverDose is set to true above
        OverDoseAmount = math.random(5,10), -- overdose counter each time cocaine and crack is consumed if OverDose is set to true -- this will eventually add up to the number you specify below as the minimum level required to overdose
        OverDoseLevel = 2500, -- minimum level needed to overdose - set fairly high to prevent constant overdoses or match your highest level stated in the OverDoseLevels table below
        HealthRemoved = 50, -- amount of health to be removed when overdosing
        OverDoseCureAmount = math.random(3,5), -- amount of overdose metadata is removed when consuming overdose_cure
    },
    OverDoseLevels = { -- Change your overdose requirements here to suit your server set these as high as you want preset overdose increase -  if changing amounts dont forget to edit server file also where overdose values are
        150, -- level 2 
        250, -- level 3 
        500, -- level 4
        750, -- level 5
        1000, -- level 6
        1250, -- level 6
        1500, -- level 7
        1750, -- level 8
        2000, -- level 9
        2500, -- level 10  
    },
}


Config.Animations = { -- change animations below for various tasks
    PickOpiumPlants = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetEther = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
    },
    GetLime = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetHydrochloricAcid = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
    },
    SearchGuards = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
    },
    PlaceProcessingTable = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
    },
    UseProcessingTable = {
        AnimDict = 'anim@amb@board_room@supervising@',
        Anim = 'think_01_hi_amy_skater_01',
        Flags = 41,
    },
    TakeHeroin = {
        AnimDict = 'rcmpaparazzo1ig_4',
        Anim = 'miranda_shooting_up',
        Flags = 49,
        Prop = 'prop_syringe_01',
        Bone = 28422,
        Pos = vec3(0.0, 0.0, 0.0),
        Rot = vec3(0.0, 0.0, 0.0),
    },
    TakOverdoseCure = {
        AnimDict = "amb@world_human_drinking@coffee@male@idle_a",
        Anim = "idle_c", 
        Flags = 49,
        Prop = 'p_ing_coffeecup_02',
        Bone = 28422,
        Pos = vec3(0.01, -0.01, 0.0),
        Rot = vec3(0.0, 0.0, 0.0),
    },
}



Config.Language = {
    ProgressBar = { 
        PickOpiumPlants = 'Picking opium plants',
        GetLime = 'Searching pallet',
        GetEther = 'Siphoning ether',
        GetHydrochloricAcid = 'Siphoning hydrochloric acid',
        SearchGuards = 'Searching guards',
        PlaceProcessingTable = 'Placing processing table',
        ProcessHeroinBase = 'Processing heroin base',
        ProcessPureHeroin = 'Processing pure heroin',
        ProcessHeroinVial = 'Processing vial of heroin',
        CreateOverDoseCure = 'Creating overdose cure',
        TakeHeroin = 'Injecting heroin',
        TakeOverDoseCure = 'Taking overdose cure',
    },
	Notifications = {
        Failed = 'Action Failed!',
        Busy = 'You Are Already Doing Something!',
        PoliceNotified = 'The Police Have Been Called!',
        AlreadyCured = 'You Are Not Close To Overdosing Any Time Soon, You Dont Need This At The Moment!',
        OverDosed = 'You Have Overdosed Go See A Doctor Immediately!',
        OverDoseWarning = 'Careful You Dont Overdose If You Take Too Many Drugs!',
        OverDoseCured = 'You Start To Feel Better And Less Likely To Overdose!',
        EarnedXp = 'You Earned Some XP!',
        Cancelled = 'Cancelled',
        NothingFound = 'You Found Nothing This Time!',
        DrugEffects = 'Holy Shit That Stuff Is Strong!',
        EmailWait = 'Chemical Run Requested - You Will Receive An Email Shortly!',
        WrongPhone = 'You Cant Receive Emails Without The Correct Phone!',
        AlreadySpawned = 'Truck Is Already Spawned!',
        PropError = 'You Cant Spawn Another Processing Table Without Removing The Other One First!',
        NoItems = 'You Are Missing Items',
        NotEnough = 'You Dont Have Enough Of The Required Item(s) To Do That!',
        NoCops = 'Not Enough Police On Duty!',
    },
}


