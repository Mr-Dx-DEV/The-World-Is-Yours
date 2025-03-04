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
        -- you must make sure you have this setting disabled in one script so that target models are added and you can get items - THIS IS PURELY TO PREVENT DUPLICATIONS FROM OTHER SCRIPTS
        -- then make sure the item name matches across all scripts to prevent any issues and use 1 target model option to collect said items
    },
    EventNames = {
        Stress = 'hud:server:RelieveStress', -- name of stress removal event
        Evidence = 'evidence:client:SetStatus', -- name of evidence event to set widepupils status when taking cocaine and crack
    },
    Target = {
        Type = 'ox', -- target script name support for qb-target and ox_target        
        --use 'qb' for qb-target
        --use 'ox' for ox_target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'ox' for -x_lib notify
    },    
    Inventory = {
        Type = 'ox' -- support for qb-inventory & ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Police = {
        Type = 'ps' -- support for qb-policejob and ps_dispatch
        --use 'qb' for qb-policejob
        --use 'ps' for ps-dispatch
    },
    Props = {
         -- NAME  = prop name
         -- ITEM = item needed to activate target- plasticjerrycan is an item required to collect gasoline and hydro acid
         -- ICON = icon for target
         -- LABEL = label for target
         -- DISTANCE = distance for target
        CocaLeaves = {
            Name = 'prop_plant_fern_02a',
            Item = 'trowel',
            Icon = 'fa-brands fa-pagelines',
            Label = 'Pick Coca Leaves',
            Distance = 2.0,
        },
        Cement = {
            Name = 'prop_cons_cements01', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            Icon = 'fa-solid fa-hand-point-up',
            Label = 'Get Cement',
            Distance = 2.0,
        },
        Gasoline = {
            Name = 'prop_barrel_exp_01a', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            Item = 'plasticjerrycan',
            Icon = 'fa-solid fa-gas-pump',
            Label = 'Siphon Gasoline',
            Distance = 2.0,
        },
        HydrochloricAcid = {
            Name = 'prop_storagetank_02b', -- uses same prop as other drug scripts - if causing issues then change prop model or use 1 item for all recipes
            Item = 'plasticjerrycan',
            Icon = 'fa-solid fa-jug-detergent',
            Label = 'Siphon Hydrochloric Acid',
            Distance = 2.0,
        },
        ProcessingTable = {
            Name = 'v_ret_ml_tableb',
            Locations = { -- define random spawn locations for processing tables below MUST BE VECTOR4
                vector4(382.12, 3565.6, 33.29, 169.91),
                vector4(2939.37, 4623.81, 48.72, 228.55),
                vector4(2355.65, 2549.04, 46.67, 284.74),
                vector4(517.95, 169.16, 99.37, 68.07),
                vector4(-1559.82, -234.36, 49.48, 223.11),
            },
            Icon = 'fa-solid fa-bars',
            Label = 'Use Processing Table',
            Distance = 2.0,
        },
    },
    CoolDownTimers = {
        Cement = 500, -- cooldown timer in MS for getting cement
        Gasoline = 500, -- cooldown timer in MS for getting gasoline
        HydrochloricAcid = 500, -- cooldown timer in MS for getting hydrochloric acid
        RespawnLeaves = 1 * 1000 * 60 -- timer to respawn coke leaves - 30 mins by default - EDIT THE FIRST NUMBER TO CHANGE THE RESPAWN TIMER DURATOIN
    }, 
    Chances = { -- chances for individual events
        CallPolice = 90, -- chance to call police when searching for items
        GetLeaves = 90, -- chance to get coca leaves
        GetCement = 90, -- chance to get cement
        GetGas = 90, -- chance to get gasoline
        GetHydro = 90, -- chance to get hydrochloric acid
        ProcessSuccess = 100, -- chance to process drugs successfuly
    },
    Timers = {
        ProcessItems = 5000, -- time it takes to process items - this is multiplied by the amount the player chooses
		PickCocaLeaves = 5000, -- time it takes to pick coca leaves
		GetCement = 10000, -- time it takes to get cement
		GetGasoline = 5000, -- time it takes to get gasoline
		GetHydrochloricAcid = 5000, -- time it takes to get acid
		TakeCocaine = 5000, -- time it takes to consume cocaine
		TakeCrack = 5000, -- time it takes to consume crack
    },   
}

Config.Blips = {
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
        coords = vector3(1688.40, -1666.45, 111.49),
        scale = 0.8,
    },
    {
        useblip = false,
        title = 'Gasoline Barrels',
        colour = 5,
        id = 648,
        coords = vector3(463.64, -578.81, 28.50),
        scale = 0.8,
    },
}



Config.Peds = {
    -- if setting useped to false make sure to set useblip to false also and add your own methods of obtaining the items for the supplier store
    {
        name = 'supplies_ped',  
        useped = true, 
        coords = vector4(91.11, -1604.26, 30.9, 233.24),   
        model = 'g_m_m_chicold_01',   
        playanim = true,  
        scenario = 'WORLD_HUMAN_CLIPBOARD', 
        useblip = false, 
        title = 'Supplier', 
        colour = 5, 
        id = 51, 
        scale = 0.8, 
        targeticon = 'fa-solid fa-boxes-packing', 
        targetlabel = 'Speak With Supplier', 
        targetdistance = 2.0,
    },
}



Config.Plants = { -- add or remove plants as you wish
     --item is required item to target
     --label is target label
     --icon is target icon
     --coords are plant locations
     --distance is target distance
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1937.94, 4535.57, 10.56), distance = 2.0, },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1931.42, 4532.3, 11.05), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1940.55, 4540.43, 10.22), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1939.57, 4543.84, 9.87), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1934.64, 4545.18, 9.93), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1930.71, 4543.22, 10.44), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1926.92, 4535.39, 11.6), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1922.0, 4539.74, 11.53), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1914.72, 4541.63, 11.61), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1916.13, 4548.66, 9.56), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1918.18, 4553.98, 8.08), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1921.54, 4557.79, 7.36), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1926.16, 4560.36, 7.2), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1932.84, 4562.26, 6.68), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1942.21, 4567.03, 5.4), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1947.69, 4567.06, 5.11), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.78, 4559.63, 5.89), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.27, 4555.43, 6.65), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.17, 4547.96, 7.83), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1951.94, 4539.66, 8.28), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1947.66, 4534.37, 9.51), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1942.3, 4529.29, 10.52), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1936.96, 4525.56, 12.33), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1932.68, 4525.13, 12.89), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1927.96, 4527.63, 12.3), distance = 2.0,  },
    { item = 'trowel', label = 'Pick Coca Leaves', icon = 'fa-solid fa-hand-point-up', coords = vector3(-1918.34, 4530.86, 12.94), distance = 2.0,  },
}

-- XP settings
Config.XP = { -- use xp for various tasks
    Enabled = false, -- Toggles xp system on or off; true = on, false = off
    Command = false, -- Toggles commands on or off use /drugxp or whatever you have named the metadata
    XPChance = math.random(10,20), -- how much xp is gained in various interactions if xp is enabled?
    XPGain = math.random(10,20), -- how much xp is gained in various interactions if xp is enabled?
    MetaDataName = 'drugxp', -- The name of your xp if you edit this make sure to also edit the line you added into qb-core/config.lua
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8) if changing amounts dont forget to edit server file also
        500, -- level 2 
        750, -- level 3 
        1000, -- level 4
        2000, -- level 5
    }
}

Config.Processing = {
    --['pure_cocaine'] = item name
    --required = table of items required to process
    --amount = amount of that item that is required to process
    --returns = amount of processed item given
    ['pure_cocaine'] = { 
        required = { -- item names and amounts required to process 'pure_cocaine'
            {item = 'cocaleaf', amount = 10,},
            {item = 'cement',   amount = 3,},
            {item = 'gasoline', amount = 2,},
        },
        returns = { -- given amount of processed item
            amount = math.random(1,3),
        },
    },
    ['pure_crack'] = { -- item names and amounts required to process 'pure_crack'
        required = {
            {item = 'pure_cocaine', amount = 3,},
            {item = 'sodiumcarbonate',   amount = 1,},
            {item = 'water_bottle', amount = 1,},
        },
        returns = { -- given amount of processed item
            amount = math.random(1,3),
        },
    },
    ['coke_baggy'] = { -- item names and amounts required to process 'coke_baggy'
        required = {
            {item = 'pure_cocaine', amount = 1,},
            {item = 'emptybaggies', amount = 3,},
        },
        returns = { -- given amount of processed item
            amount = math.random(1,3),
        },
    },
    ['crack_baggy'] = { -- item names and amounts required to process 'crack_baggy'
        required = {
            {item = 'pure_crack', amount = 1,},
            {item = 'emptybaggies', amount = 3,},
        },
        returns = { -- given amount of processed item
            amount = math.random(1,3),
        },
    },
}


Config.Drugs = {
    ---- <| IMPORTANT NOTES |> ----    
--ADD OR REMVOVE ITEMS BELOW THAT YOU WANT TO BE CONSUMABLE

--['coke_baggy'] = string value - item name - this must be in your items.lua
--cancel = boolean value if the event can be cancelled or not
--canmove = boolean value for preventing movement during consumption - usually false
--duration = number value- duration of progress event in MS
--label = string value - label for progress
--requireditem = string value - item required to use specific item, example: a lighter for a joint set to nil for nothing
--requireditemlabel = string value for the notification of missing the required item - this is just a label for display - if requireditem is nil then just set this to nil also
--stress = number value - amount of stress to reduce - set to 0 for nothing - can also use math.random() to determine random amounts
--armour - number value - amount of armour to add - set to 0 for nothing - can also use math.random() to determine random amounts
--dict = string value - animation dictionary name
--anim = string value - animation name
--flag = number value - animation flag
--prop - string value - prop for animation - set to nil for no prop
--bone - player bone index for prop - if prop is set to nil this can be ignored
--pos = vec3 value for prop position - if prop is set to nil this can be ignored 
--rot = vec3 value for prop rotation - if prop is set to nil this can be ignored
--effect = string value for effect type - set to 'coke' for coke_baggy and 'crack' for crack_baggy

    ['coke_baggy'] = { 
        cancel = true,
        canmove = true,
        duration = 5000, 
        label = 'Snorting Cocaine', 
        requireditem = nil,
        requireditemlabel = '',
        stress = 25, 
        armour = 25,
        dict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flag = 49,
        prop = nil,
        bone = 57005,
        pos = vec3(0.13, 0.0, -0.01),
        rot = vec3(-0.07, -3.36, 0.47),
        effect = 'coke',
    },
    ['crack_baggy'] = { 
        cancel = true,
        canmove = true,
        duration = 5000, 
        label = 'Smoking Crack', 
        requireditem = 'lighter',
        requireditemlabel = 'lighter',
        stress = 25, 
        armour = 25,
        dict = 'switch@trevor@trev_smoking_meth',
        anim = 'trev_smoking_meth_loop',
        flag = 49,
        prop = 'prop_cs_meth_pipe',
        bone = 57005,
        pos = vec3(0.13, 0.0, -0.01),
        rot = vec3(-0.07, -3.36, 0.47),
        effect = 'crack',
    },

}


Config.Animations = { -- change animations below for various tasks
    PickCocaLeaves = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetCement = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_cs_trowel',
        Bone = 18905,
        Pos = vec3(0.12, 0.0, 0.02),
        Rot = vec3(76.0, 188.0, 34.0),
    },
    GetGasoline = {
        AnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        Anim = 'machinic_loop_mechandplayer',
        Flags = 41,
        Prop = 'prop_ld_jerrycan_01',
        Bone = 60309,
        Pos = vec3(0.06, 0.04, 0.02),
        Rot = vec3(194.0, 0.0, 0.0),
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
    UseProcessingTable = {
        AnimDict = 'anim@amb@board_room@supervising@',
        Anim = 'think_01_hi_amy_skater_01',
        Flags = 41,
    },
}



Config.Language = {
	Notifications = { 
        Busy = 'You are already doing something!',
        Failed = 'Action failed!',
        EarnedXp = 'You earned some XP!',
        Cancelled = 'Cancelled',
        NothingFound = 'You didnt find anything!',
        NoItems = 'You are missing items or dont have enough!',
        Cooldown = 'You must wait a short while before doing that again!',
        PropError = 'You Cant Spawn Another Processing Table Without Removing The Other One First!',
    },
}
