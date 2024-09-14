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
    EventNames = {
        Stress = 'hud:server:RelieveStress', -- name of stress removal event
        Evidence = 'evidence:client:SetStatus', -- name of evidence event to set widepupils status when taking ketamine
    },
    Target = {
        Type = 'ox', -- target script name support for qb-target and ox_target        
        --use 'qb' for qb-target
        --use 'ox' for ox_target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for -x_lib notify
    },
    Inventory = {
        Type = 'ox' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Police = {
        MinCops = 1, -- minimum amount of cops required on duty to request mission
        Type = 'ps' -- support for qb-policejob and ps_dispatch
        --use 'qb' for qb-policejob
        --use 'ps' for ps-dispatch
    },
    Phone = {
        Type = 'qs' -- support for qb-phone and qs-smartphone
        --use 'qb' for qb-phone
        --use 'qs' for qs-smartphone
        --use 'custom' for another phone resoruce but you will need to add support for getting the mission emails yourself
    },
    Props = {
        ProcessingTable = { 
            model = 'v_ret_ml_tablec', -- prop name
            icon = 'fa-solid fa-bars', -- target icon
            label = 'Use Processing Table', -- target label
            closeicon = 'fas fa-xmark', -- target icon
            closelabel = 'Remove Processing Table', -- target label
            distance = 2.5, -- target distance
        },
        TargetModels = {
            { 
                model = 'prop_ind_mech_01c', -- prop name
                item = 'plasticjerrycan', -- required item to target
                icon = 'fa-solid fa-jug-detergent',  -- target icon
                label = 'Siphon Hydrochloric Acid', -- target label
                distance = 2.5, -- target distance
                event = 'lusty94_ketamine:client:SiphonHydroAcid',
            },
            { 
                model = 'prop_barrel_exp_01a', -- prop name
                item = 'plasticjerrycan', -- required item to target
                icon = 'fa-solid fa-gas-pump',  -- target icon
                label = 'Siphon Ether', -- target label
                distance = 1.5, -- target distance
                event = 'lusty94_ketamine:client:SiphonEther',
            },
        },
    },
    Timers = {
        MineQuartz = 5000, -- time to mine quartz rock
        CollectEther = 5000, -- time to siphon ether
        CollectHydro = 5000, -- time to siphon hydrochloric acid
        ProcessItems = 5000, -- this is per item if processing multiple then this number is multiplied by the amount the player inputs
        Consume = 5000, -- time to take drugs or overdose cure
        SearchBody = 5000, -- time to search bodies for items
        SearchCooldown = 1 * 1000, -- searching objects cooldown
        RequestMission = 10 * 1000 * 60, -- requesting mission cooldown -- 30 minutes by default change the first number in the sequence to increase or decrease the amount of minutes you have to wait
        RespawnObjects = 1 * 1000 * 60, -- time in minutes for objects to respawn
    },
    Chances = {
        MineQuartz = 75, -- chance to collect quartz
        CollectEther = 75, -- chance to collect ether
        CollectHydro = 75, -- chance to collect hydrochloric acid
        ProcessItems = 75, -- chance to process items successfully
        SearchBody = 75, -- chance to get items when searching bodies
        AlertPolice = 100, -- chance to alert police when searching objects and bodies
    },   
}


Config.SupplyPeds = {
    { 
        useped = true,
        coords = vector4(97.96, 3682.12, 39.74, 1.30),
        model = 'a_m_m_hillbilly_01',
        playanim = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        useblip = true, 
        title = 'Supplier', 
        colour = 5, 
        id = 51, 
        scale = 0.8, 
        icon = 'fa-solid fa-boxes-packing', 
        label = 'Open Supply Shop', 
        distance = 2.0,
        event = 'lusty94_ketamine:client:PharmacyShop',
    },
}

Config.InteractionLocations = { 
    Rocks = {
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-871.61, -1789.7, 23.68, 328.3), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-863.05, -1792.8, 24.19, 52.52), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-863.02, -1787.41, 24.03, 322.81), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-849.35, -1779.86, 24.75, 327.93), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-851.37, -1774.54, 24.39, 22.53), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-856.66, -1773.05, 24.25, 90.65), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-858.14, -1778.49, 24.2, 185.68), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-855.97, -1785.2, 24.4, 200.8), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-848.26, -1791.95, 24.96, 215.03), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-843.41, -1791.92, 24.99, 266.83), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-841.61, -1783.42, 25.42, 5.36), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-839.06, -1777.04, 25.52, 328.48), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-830.32, -1780.2, 26.66, 254.23), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-824.64, -1774.7, 27.82, 69.66), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-826.04, -1769.51, 27.19, 43.47), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-834.31, -1769.49, 25.13, 52.21), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-837.24, -1763.01, 24.7, 11.75), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-843.13, -1763.88, 23.81, 168.28), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-844.74, -1772.18, 24.49, 27.25), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-847.52, -1762.43, 23.23, 356.44), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-848.39, -1753.43, 22.94, 352.93), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-877.61, -1779.66, 22.21, 216.74), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-881.89, -1786.28, 22.39, 159.76), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-875.96, -1794.85, 23.77, 301.63), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-872.2, -1798.45, 24.07, 228.28), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
        { model = 'csx_coastsmalrock_02_', item = 'pickaxe', coords = vector4(-880.31, -1800.4, 23.94, 86.12), icon = 'fa-solid fa-hand-point-up', label = 'Mine Quartz Rock', distance = 1.5,},
    },
}

-- XP settings
Config.XP = { -- use xp
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /drugxp or whatever you have named the metadata
    XPChance = 75, -- chance to earn xp
    XPAmount = math.random(10,20), -- xp reward amount if earnt xp
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line you added into qb-core/server/player.lua or config inf newest core
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8) if changing amounts dont forget to edit server file also where items are given to match new xp amounts
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

Config.Processing = {
    Mission = {
        DelayTime = 0, -- delay time in minutes before getting the email with information so 1000 ms * 30 becomes 30 seconds - you could also use 60000 for MS or math.random(30000,60000) for MS instead
        ItemChance = 100, -- the chance to get items when searching guards
        PoliceChance = 100, -- the chance to notify police when searching guards
        FindCash = true, -- set to true for a chance to find cash when searching guards
        CashChance = 100, -- the chance to find cash when searching guards
        CashAmount = math.random(100,500), -- amount of cash found if set to true and chance value is met
        Vehicle = { 
            { 
                model = 'gburrito2',
                driverweapon = 'weapon_combatshotgun',
                drivermodel = 'g_m_y_lost_02',
                passengerweapon = 'weapon_microsmg',
                passengermodel = 'g_m_y_salvaboss_01',
                targeticon = 'fa-solid fa-users',
                targetlabel = 'Search Body',
                targetdistance = 2.0,
            },
        },        
        Spawns = { -- spawn locations for supply truck - it will select one of the locations below at random to sapwn at
            {x = -685.96, y = 293.48, z = 82.37, h = 240.95},
            {x = -1066.86, y = 437.18, z = 73.86, h = 79.01},				   
            {x = -1633.63, y = -811.25, z = 10.16, h = 138.50},
            {x = -1021.19, y = -1519.81, z = 5.59, h = 120.74},
            {x = -1210.65, y = -364.27, z = 37.29, h = 293.86},
            {x = -112.84, y = 6569.60, z = 29.52, h = 57.66},
        },
        Destinations = {  -- destination locations for supply truck -- it will select one of the locations below at random to drive to
            {x = 1044.96, y = -2137.94, z = 32.72, h = 79.15},
            {x = 121.77, y = -2580.84, z = 6.00, h = 352.00},
            {x = 1005.92, y = -520.76, z = 60.71, h = 19.93},
            {x = 2360.37, y = 2526.61, z = 46.67, h = 63.56},
            {x = 2389.55, y = 3296.66, z = 47.45, h = 338.69},            
        },
    },
    Silica = {  
        Item1 = 'quartz',  -- required item name
        Item1Label = 'Quartz', -- required item label
        Item2 = 'ether',  -- required item name
        Item2Label = 'Ether', -- required item label
        Item3 = 'hydrochloricacid',  -- required item name
        Item3Label = 'Hydrochloric Acid', -- required item label
        Item4 = 'mortarpestle',  -- required item name
        Item4Label = 'Mortar & Pestle', -- required item label
        Given = 'silica', -- given item name
        GivenLabel = 'Silica', -- given item label
    },
    LiquidKetamine = {  
        Item1 = 'silica',  -- required item name
        Item1Label = 'Silica', -- required item label
        Item2 = 'steviapowder',  -- required item name
        Item2Label = 'Stevia Powder', -- required item label
        Item3 = 'painkillers',  -- required item name
        Item3Label = 'Pain Killers', -- required item label
        Item4 = 'citricacid',  -- required item name
        Item4Label = 'Citric Acid', -- required item label
        Item5 = 'polyethyleneglycol',  -- required item name
        Item5Label = 'Polyethylene Glycol', -- required item label
        Given = 'liquidketamine', -- given item name
        GivenLabel = 'Liquid Ketamine', -- given item label
    },
    Ketamine = {  
        Item1 = 'liquidketamine',  -- required item name
        Item1Label = 'Liquid Ketamine', -- required item label
        Item2 = 'pressurecooker',  -- required item name
        Item2Label = 'Pressure Cooker', -- required item label
        Item3 = 'butane_gas',  -- required item name
        Item3Label = 'Butane Gas', -- required item label
        Given = 'ketamine', -- given item name
        GivenLabel = 'Ketamine', -- given item label
    },
    Curing = {
        Item1 = 'citricacid',  -- required item name
        Item1Label = 'Citric Acid', -- required item label
        Item2 = 'papaverine',  -- required item name
        Item2Label = 'Papaverine', -- required item label
        Item3 = 'noscapine',  -- required item name
        Item3Label = 'Noscapine', -- required item label
        Given = 'overdosecure', -- given item name
        GivenLabel = 'Overdose Cure', -- given item label
    },    
    TakeDrugs = {
        Item = 'ketamine',  -- required item name
        ItemLabel = 'Ketamine', -- required item label
    },
    
}

Config.DrugSettings = {
    Effects = {
        Enabled = true, -- enables screen visuals and armour, health and stress effects setting to false will disable everything
        EffectsTimer = 10000, -- timer for drug effects when consumed before wearing off - perfect time is around 10000 ms {10 seconds}
        GiveArmour = true, -- enables the player to gain armour when consuming coke and crack
        ArmourGained = math.random(20,40), -- amount of armour gained SET TO 0 FOR NOTHING
        ReduceStress = true, -- enables the player to get stress relief when consuming coke and crack
        StressReduced = math.random(20,40), -- amount of stress reduced SET TO 0 FOR NOTHING
        OverDose = false, -- set to true for a chance for the player to become overdosed after a certain amount of times taking magic mushrooms
        OverDoseMetaDataName = 'overdose', -- The name of your overdose metadata if you edit this make sure to also edit the line you added into qb-core/server/player.lua --USE /overdose TO CHECK YOUR OVERDOSE LEVEL if OverDose is set to true above
        OverDoseAmount = math.random(10,200), -- overdose counter each time ketamine is consumed if OverDose is set to true -- this will eventually add up to the number you specify below as the minimum level required to overdose
        OverDoseLevel = 2000, -- minimum level needed to overdose - set fairly high to prevent constant overdoses or match your highest level stated in the OverDoseLevels table below
        HealthRemoved = 50, -- amount of health to be removed when overdosing
        OverDoseCureAmount = math.random(30,50), -- amount of overdose metadata is removed when consuming overdose_cure
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
    MineQuartz = {
        AnimDict = 'melee@large_wpn@streamed_core',
        Anim = 'ground_attack_on_spot',
        Flag = 49,
        Prop = 'prop_tool_pickaxe',
        Bone = 57005,
        Pos = vec3(0.08, -0.4, -0.1),
        Rot = vec3(80.0, -20.0, 175.0),
    },
    CollectEther = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
    },
    CollectHydro = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
    },
    SearchBody = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
    },
    PlaceProcessingTable = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
    },
    ProcessItems = {
        AnimDict = 'anim@amb@board_room@supervising@',
        Anim = 'think_01_hi_amy_skater_01',
        Flags = 41,
    },
    TakeDrugs = {
        AnimDict = 'mp_suicide',
        Anim = 'pill',
        Flags = 49,
    },
}



Config.Language = {
    ProgressBar = {
        MineQuartz = 'Mining quartz rock',
        CollectEther = 'Siphoning ether',
        CollectHydro = 'Siphoning hydrochloric acid',
        PlaceProcessingTable = 'Placing processing table',
        SearchBody = 'Searching body',
        ProcessItems = 'Processing items',
        TakeKetamine = 'Taking ketamine',
        TakeOverdoseCure = 'Taking overdose cure',        
    },
    Notifications = {
        Cancelled = 'Action cancelled!',
        Busy = 'You are already doing something!',
        Failed = 'Action failed!',
        PropError = 'You must remove your processing table before trying to place another one!',
        EarnedXP = 'You earned some XP!',
        NothingFound = 'You found nothing this time!',
        CantCarry = 'You cant carry anymore of this item!',
        AlreadySpawned = 'There is already a vehicle out, go find it!',
        NoPick = 'You are missing a pickaxe!',
        SendMessage = 'You will recieve a text with more information shortly!',
        NoItems = 'You are missing items!',
        NotEnough = 'You dont have enough to do that!',
        WrongPhone = 'you dont have a compatible phone!',
        NoCops = 'Not enough cops on duty!',
        OverDoseWarning = 'Be careful you dont overdose if you take too many drugs!',
        Overdosed = 'You have overdose, go seek medical attention immediately!',
        OverDoseCured = 'You start to feel less likely to overdose!',
        AlreadyCured = 'You are not likely to overdose any time soon!',
        BatchFailed = 'This batch failed and caused an explosion!',
        InvalidAmount = 'You have entered an invalid amount!',
        Cooldown = 'You must wait 10 seconds before doing that again!',
        NoLighter = 'You cant smoke meth without a lighter!',
    },
}

