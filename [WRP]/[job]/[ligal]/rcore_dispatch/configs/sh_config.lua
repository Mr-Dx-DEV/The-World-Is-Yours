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
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Senior Officer',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Commander',
            [8] = 'Deputy Chief',
            [9] = 'Asst. Chief',
            [10] = 'Chief',
            [11] = 'Deputy Commissioner',
            [12] = 'Commissioner',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    ['lspd'] = {
        Jobname = 'lspd',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Senior Officer',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Commander',
            [8] = 'Deputy Chief',
            [9] = 'Asst. Chief',
            [10] = 'Chief',
            [11] = 'Deputy Commissioner',
            [12] = 'Commissioner',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    ['bcso'] = {
        Jobname = 'bcso',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Deputy',
            [2] = 'Senior Deputy',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Major',
            [8] = 'Chief Deputy',
            [9] = 'Under Sheriff',
            [10] = 'Sheriff',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['sahp'] = {
        Jobname = 'sahp',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Senior Officer',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Commander',
            [8] = 'Major',
            [9] = 'Lt Colonel',
            [10] = 'Colonel',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['lsso'] = {
        Jobname = 'lsso',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Deputy',
            [2] = 'Senior Deputy',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Major',
            [8] = 'Chief Deputy',
            [9] = 'Under Sheriff',
            [10] = 'Sheriff',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['safw'] = {
        Jobname = 'safw',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Senior Officer',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Commander',
            [8] = 'Deputy Chief',
            [9] = 'Asst. Chief',
            [10] = 'Chief',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['sadoc'] = {
        Jobname = 'sadoc',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'CO Recruit',
            [1] = 'Correction Officer',
            [2] = 'Senior Correction Officer',
            [3] = 'Corporal',
            [4] = 'Sergeant',
            [5] = 'Lieutenant',
            [6] = 'Captain',
            [7] = 'Major',
            [8] = 'Colonel',
            [9] = 'Deputy Warden',
            [10] = 'Warden',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['usms'] = {
        Jobname = 'usms',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit Marshal',
            [1] = 'Marshal',
            [2] = 'Senior Marshal',
            [3] = 'Marshal In Charge',
            [4] = 'Tactical Opps Div',
            [5] = 'Investigation Div',
            [6] = 'Witness Security Div',
            [7] = 'Judicial Security Div',
            [8] = 'Associate Director',
            [9] = 'Deputy Director',
            [10] = 'Director',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['fbi'] = {
        Jobname = 'fbi',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit Special Agent',
            [1] = 'Special Agent',
            [2] = 'Senior Special Agent',
            [3] = 'Supervisory Special Agent',
            [4] = 'Tactical/Training SAIC',
            [5] = 'Criminal Investigation SAIC',
            [6] = 'Labor/Finance SAIC',
            [7] = 'National Security SAIC',
            [8] = 'Associate Deputy Director',
            [9] = 'Deputy Director',
            [10] = 'Director',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['dhs'] = {
        Jobname = 'dhs',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit BPA',
            [1] = 'Senior Agent',
            [2] = 'Lead Agent',
            [3] = 'Supervisor Agent',
            [4] = 'Field Opps Super',
            [5] = 'Special Operations Supervisor',
            [6] = 'Special Agent in Charge',
            [7] = 'Deputy Chief',
            [8] = 'Chief',
            [9] = 'Deputy Director',
            [10] = 'Director',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
        }
    },
    
    ['ss'] = {
        Jobname = 'ss',
        SharedBlips = { 'ambulance' },
        GlobalFrequency = 900,
        Ispolice = true,
        Ranks = {
            [0] = 'Recruit',
            [1] = 'Officer',
            [2] = 'Sergeant',
            [3] = 'Lieutenant',
            [4] = 'Agent IPO',
            [5] = 'Special Agent',
            [6] = 'Special special Agent',
            [7] = 'Deputy SAiC',
            [8] = 'Special Agent in Charge',
            [9] = 'Deputy Director',
            [10] = 'Director',
        },
        Blips = {
            ['automobile'] = './assets/police-car.svg',
            ['bike'] = './assets/motorbike.svg',
            ['heli'] = './assets/helicopter.svg',
            ['none'] = './assets/police-hat.svg',
        },
        Perms = {
            ['Captain'] = true
        },
        Units = {
            { 'Command', 805, false, { 'ambulance' } },
            { 'Adam-10', 805, false },
            { 'Adam-20', 805, false },
            { 'TAC', 805, true },
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
