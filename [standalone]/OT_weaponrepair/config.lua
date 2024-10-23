Config = {}

Config.useOTSkills = false -- requires our skills system, you can find here: https://forum.cfx.re/t/paid-ot-skills/4917372
Config.xpreward = 5

Config.requireditem = 'money'
Config.requireditemamount = 1000
Config.repairtime = 5000
Config.repairItem = 'weaponrepairkit'

Config.require = {
    ['WEAPON_COMBATPDW'] = {
        requireditem = 'money',
        requireditemamount = 2000,
        repairtime = 10000
    },
    -- Your added weapons
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
}

Config.locations = {
    {
        coords = vector3(-567.8292, -1696.3129, 19.0366),
        heading = 210.3678,
        spawnprop = true, -- spawns the workbench at the location 
        free = false -- allows weapons to be repaired for free at the location
    }
}