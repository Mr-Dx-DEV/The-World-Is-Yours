Config = {}

Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,
    -- Whether or not to use the new ESX export method
    useNewESXExport = false
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it
}


-- Set a whitelist to only allow specific jobs to use the detective tools
Config.whitelist = {
    enabled = false,
    jobs = {
        'police',
        'ambulance',
    }
}

Config.target = {
    enabled = true,
    system = 'qb-target' -- 'qtarget', 'qb-target' or 'ox_target'  (Other systems might work as well)
}

-- Keybinds
Config.keybinds = {
    investigate = 'E'
}


-- Animations used while investigating
Config.animation = {
    enabled = true,
    dict = 'amb@medic@standing@tendtodead@idle_a',
    anim = 'idle_a',
}

-- System to detect dead players based on their animation (for scripts such as qb-ambulance)
Config.deadAnimations = {
    enabled = true,
    animations = {
        {
            dict = 'misslamar1dead_body',
            anim = 'dead_idle',
        },
        {
            dict = 'veh@low@front_ps@idle_duck',
            anim = 'sit',
        },
        {
            dict = 'dead',
            anim = 'dead_a',
        },
    }
}
