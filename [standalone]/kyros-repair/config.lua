
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

    require = {
        ['WEAPON_PISTOL'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_BLOODSGLOCK'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_CRIPSGLOCK'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_CARTELGLOCK'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_BMGLOCK'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_FAMILIASGLOCK'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        
        ['WEAPON_BLOODSARP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 10000},
        ['WEAPON_CRIPSARP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 10000},
        ['WEAPON_CARTELARP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 10000},
        ['WEAPON_BMARP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 10000},
        ['WEAPON_FAMILIASARP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 10000},
    
        ['WEAPON_PDBATON'] = { requireditem = 'money', requireditemamount = 500, repairtime = 5000},
        ['WEAPON_BTASER'] = { requireditem = 'money', requireditemamount = 1000, repairtime = 5000},
        ['WEAPON_YTASER'] = { requireditem = 'money', requireditemamount = 1000, repairtime = 5000},
        ['WEAPON_PDG19'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8000},
        ['WEAPON_PD870'] = { requireditem = 'money', requireditemamount = 1600, repairtime = 9000},
        ['WEAPON_PDM700'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_HK417'] = { requireditem = 'money', requireditemamount = 2500, repairtime = 11000},
        ['WEAPON_PDCM607'] = { requireditem = 'money', requireditemamount = 2300, repairtime = 10000},
        ['WEAPON_PDC7'] = { requireditem = 'money', requireditemamount = 2200, repairtime = 10000},
        ['WEAPON_PDG22'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8000},
        ['WEAPON_PDBM3'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 9000},
        ['WEAPON_PDP88'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_PDHK45'] = { requireditem = 'money', requireditemamount = 1400, repairtime = 8500},
        ['WEAPON_PDHK33'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 9500},
        ['WEAPON_PDHKUSP'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 9000},
    
        ['WEAPON_ILLGLOCK17'] = { requireditem = 'money', requireditemamount = 1250, repairtime = 8000},
        ['WEAPON_MIDASGLOCK'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8500},
        ['WEAPON_BLUEGLOCKS'] = { requireditem = 'money', requireditemamount = 1200, repairtime = 8000},
        ['WEAPON_GLOCK21'] = { requireditem = 'money', requireditemamount = 1250, repairtime = 8000},
        ['WEAPON_P210'] = { requireditem = 'money', requireditemamount = 1100, repairtime = 7500},
        ['WEAPON_GLOCKBEAMS'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8500},
        ['WEAPON_SR40'] = { requireditem = 'money', requireditemamount = 1250, repairtime = 8500},
        ['WEAPON_T1911'] = { requireditem = 'money', requireditemamount = 1100, repairtime = 7500},
        ['WEAPON_MGGLOCK'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8000},
        ['WEAPON_TGLOCK19'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8000},
        ['WEAPON_GLOCK41'] = { requireditem = 'money', requireditemamount = 1300, repairtime = 8000},
        ['WEAPON_FN57'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 8500},
        ['WEAPON_P30L'] = { requireditem = 'money', requireditemamount = 1400, repairtime = 8500},
        
        ['WEAPON_CHAIR'] = { requireditem = 'money', requireditemamount = 500, repairtime = 4000},
        ['WEAPON_AXE'] = { requireditem = 'money', requireditemamount = 800, repairtime = 6000},
        ['WEAPON_TEC9S'] = { requireditem = 'money', requireditemamount = 1500, repairtime = 9000},
        ['WEAPON_KRISSVECTOR'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_REDM4A1'] = { requireditem = 'money', requireditemamount = 2200, repairtime = 11000},
        ['WEAPON_R590'] = { requireditem = 'money', requireditemamount = 1800, repairtime = 10000},
        ['WEAPON_M500'] = { requireditem = 'money', requireditemamount = 1800, repairtime = 10000},
        ['WEAPON_LBTARP'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_BLACKARP'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_REDARP'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_TARP'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_WOARP'] = { requireditem = 'money', requireditemamount = 2000, repairtime = 10000},
        ['WEAPON_RAM7'] = { requireditem = 'money', requireditemamount = 2200, repairtime = 11000},
        ['WEAPON_THOMPSON'] = { requireditem = 'money', requireditemamount = 2500, repairtime = 12000},
        ['WEAPON_BAR15'] = { requireditem = 'money', requireditemamount = 2500, repairtime = 12000},
        ['WEAPON_BSCAR'] = { requireditem = 'money', requireditemamount = 2500, repairtime = 12000},
        ['WEAPON_DMK18'] = { requireditem = 'money', requireditemamount = 2500, repairtime = 12000}
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
