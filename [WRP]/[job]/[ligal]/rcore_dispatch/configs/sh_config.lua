CONFIG = {}
CONFIG.Locale = 'en'
Framework = {
    ESX = 'esx',
    QBCore = 'qbcore',
    Custom = 'custom',
}
CONFIG.Framework = Framework.QBCore -- esx or qbcore or custom
CONFIG.AlertIcon = './assets/siren.svg'
CONFIG.Debug = false
CONFIG.RCoreStatsIntegration = false

CONFIG.Features = {
    ['radio'] = true
}

--- The key of each job should be the name of the job
CONFIG.JOBS = {
    ['police'] = {
        Jobname = 'police',
        SharedBlips = { 'ambulance' }, -- Jobs that will share the map blips
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Sergeant',
            [3] = 'Lieutenant',
            [4] = 'Captain',
        },
        Blips = { -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg'
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC',     805, true },
        }
    },
    ['ambulance'] = {
        Jobname = 'ambulance',
        Ispolice = false,
        GlobalFrequency = 901,
        SharedBlips = { 'police' }, -- Jobs that will share the map blips
        Ranks = {
            [0] = 'Jr. EMT',
            [1] = 'EMT',
            [2] = 'SR. EMT',
            [3] = 'EMT Supervisor',
        },
        Blips = {                     -- Each vehicle type has a blip, and no vehicle is equals to 'none'
            ['automobile'] =
            './assets/ambulance.svg', -- The path of the image, you can use a link or a local path
            ['bike'] = './assets/ambulance.svg',
            ['heli'] = './assets/ambulance.svg',
            ['none'] = './assets/ambulance.svg'
        },
        Perms = {
            ['EMT Supervisor'] = true
        },
        Units = {
            { 'Command', 805, false, { 'police' } }, -- At the right side, add the jobs which aren't the same job that you want to share unit
            { 'Alfa',    806, false },
            { 'Bravo',   807, false },
            { 'Charlie', 808, false },
        }
    },

}

print('hola')

CONFIG.EnableCallsigns = true

CONFIG.EnableOwnUnitChange = true -- If you want to enable the change of unit for the own player without permissions

CONFIG.RelatedJobs = {            -- Jobs that will share the GLOBAL RADIO
    --[[     {t
        {
            job = 'police',
            label = 'Police',
        },
        {
            job = 'ambulance',
            label = 'EMS',
        }
    }, ]]
}
