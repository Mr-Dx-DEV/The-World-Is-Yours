
-- ██╗  ██╗██╗   ██╗██████╗  █████╗  ██████╗  ██████╗ ███████╗██████╗  █████╗ ██╗██████╗ 
-- ██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗
-- █████═╝  ╚████╔╝ ██████╔╝██║  ██║╚█████╗   ██████╔╝█████╗  ██████╔╝███████║██║██████╔╝
-- ██╔═██╗   ╚██╔╝  ██╔══██╗██║  ██║ ╚═══██╗  ██╔══██╗██╔══╝  ██╔═══╝ ██╔══██║██║██╔══██╗
-- ██║ ╚██╗   ██║   ██║  ██║╚█████╔╝██████╔╝  ██║  ██║███████╗██║     ██║  ██║██║██║  ██║
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ ╚═════╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝

Config = {
    -- General Settings
    requireditem = 'money',
    requireditemamount = 1000,
    repairtime = 5000,
    repairItem = 'gunrepairkit',
    
    requireGunRepairKit = true, -- Require weapon repair kit for repairs

    progressType = 'circle', -- 'bar' or 'circle'
    progressPosition = 'middle', -- Only applies if progressType == 'circle', 'middle' or 'bottom'

    targetUI = 'ox_target', -- Choose between 'ox_target' and 'text_ui'

    notificationSystem = 'ox', -- Choose between 'esx' and 'ox'

    languages = {
        ['en'] = {
            repairingWeapon = 'Repairing Weapon',
            missingItems = 'Missing Required Items',
            notEnoughItems = 'You don\'t have enough %s',
            noRepairKit = 'You need a weapon repair kit to repair this weapon.',
            repairComplete = 'Weapon Repaired Successfully!',
            cheatingAttempt = 'Player ID: %s attempting to repair away from the bench, probably cheating.'
        },
        ['es'] = {
            repairingWeapon = 'Reparando Arma',
            missingItems = 'Faltan Artículos Requeridos',
            notEnoughItems = 'No tienes suficiente %s',
            noRepairKit = 'Necesitas un kit de reparación de armas para reparar esta arma.',
            repairComplete = '¡Arma Reparada con Éxito!',
            cheatingAttempt = 'ID del jugador: %s intentando reparar fuera del banco, probablemente haciendo trampa.'
        }
        -- Add more languages as needed
    },

    currentLanguage = 'en', -- Change this to the desired language (e.g., 'es' for Spanish)

    require = { -- Add certain prices and repair time for specific weapons
        ['WEAPON_PISTOL'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
    },

    locations = {
        {   -- Airport Hanger
            coords = vector3(-922.4052, -2989.9075, 18.8454),
            heading = 239.3186,
            spawnprop = true, -- Spawns workbench prop at the location!
            free = false -- Weapons repaired for free at the location when (true)
        },
        {   -- VineWood Sign
            coords = vector3(771.8860, 1282.8911, 359.2965),
            heading = 269.2231,
            spawnprop = true, -- Spawns workbench prop at the location!
            free = false -- Weapons repaired for free at the location when (true)
        },
        {   -- Sandy Shores liquor Store
            coords = vector3(1398.9952, 3602.4443, 37.9419),
            heading = 199.5334,
            spawnprop = true, -- Spawns workbench prop at the location!
            free = false --  Weapons repaired for free at the location when (true)
        },
        {   -- Blaine County abandoned shed
            coords = vector3(-474.9931, 6285.8203, 12.6090),
            heading = 145.9320, 
            spawnprop = true, -- Spawns workbench prop at the location!
            free = false --  Weapons repaired for free at the location when (true)
        },
    }
}
