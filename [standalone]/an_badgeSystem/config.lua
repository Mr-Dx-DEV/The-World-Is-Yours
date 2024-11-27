Config = {}

Config.Settings = {
    { -- LSPD Example
        itemName = "badge", -- item name -- you need to add this item on your qbcore/shared/items.lua
        design = "lspd-2.png", -- imagename.png
        job = "police", -- job name that will show this badge
        number = "#69", -- callsign department number - It shows before the officer callsign
    },
    { -- BCSO Example
        itemName = "sdbadge", -- you need to add this item on your qbcore/shared/items.lua
        design = "bcso-2.png",
        job = "sheriff",
        number = "#14",
    },
}

Config.Ranks = {
    ["police"] = { -- Job Name
        [0] = "Cdt.", -- Grade Level → Grade Name that you want to show before the name in the badge
        [1] = "Ofc.",
        [2] = "Sgt.",
        [3] = "Cpt.",
        [4] = "CoP.",
    },
    ["lspd"] = { -- LSPD
    [0] = "Rct.", -- Recruit
    [1] = "Ofc.", -- Officer
    [2] = "S.O.", -- Senior Officer
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Cmd.", -- Commander
    [8] = "D.C.", -- Deputy Chief
    [9] = "A.C.", -- Assistant Chief
    [10] = "CoP.", -- Chief of Police
    [11] = "D.Cmr.", -- Deputy Commissioner
    [12] = "Cmr.", -- Commissioner
},
["bcso"] = { -- BCSO
    [0] = "Rct.", -- Recruit
    [1] = "Dep.", -- Deputy
    [2] = "S.D.", -- Senior Deputy
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Maj.", -- Major
    [8] = "C.D.", -- Chief Deputy
    [9] = "U.S.", -- Under Sheriff
    [10] = "Shrf.", -- Sheriff
},
["sahp"] = { -- SAHP
    [0] = "Rct.", -- Recruit
    [1] = "Ofc.", -- Officer
    [2] = "S.O.", -- Senior Officer
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Cmd.", -- Commander
    [8] = "Maj.", -- Major
    [9] = "Lt. Col.", -- Lieutenant Colonel
    [10] = "Col.", -- Colonel
},
["lsso"] = { -- LSSO
    [0] = "Rct.", -- Recruit
    [1] = "Dep.", -- Deputy
    [2] = "S.D.", -- Senior Deputy
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Maj.", -- Major
    [8] = "C.D.", -- Chief Deputy
    [9] = "U.S.", -- Under Sheriff
    [10] = "Shrf.", -- Sheriff
},
["safw"] = { -- SAFW
    [0] = "Rct.", -- Recruit
    [1] = "Ofc.", -- Officer
    [2] = "S.O.", -- Senior Officer
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Cmd.", -- Commander
    [8] = "D.C.", -- Deputy Chief
    [9] = "A.C.", -- Assistant Chief
    [10] = "Chf.", -- Chief
},
["sadoc"] = { -- SADOC
    [0] = "C.R.", -- CO Recruit
    [1] = "C.O.", -- Correction Officer
    [2] = "S.C.O.", -- Senior Correction Officer
    [3] = "Cpl.", -- Corporal
    [4] = "Sgt.", -- Sergeant
    [5] = "Lt.", -- Lieutenant
    [6] = "Cpt.", -- Captain
    [7] = "Maj.", -- Major
    [8] = "Col.", -- Colonel
    [9] = "D.W.", -- Deputy Warden
    [10] = "Wrdn.", -- Warden
},
["usms"] = { -- USMS
    [0] = "R.M.", -- Recruit Marshal
    [1] = "Mshl.", -- Marshal
    [2] = "S.M.", -- Senior Marshal
    [3] = "MIC.", -- Marshal In Charge
    [4] = "T.O.", -- Tactical Opps Div
    [5] = "I.D.", -- Investigation Div
    [6] = "W.S.D.", -- Witness Security Div
    [7] = "J.S.D.", -- Judicial Security Div
    [8] = "A.D.", -- Associate Director
    [9] = "D.D.", -- Deputy Director
    [10] = "Dir.", -- Director
},
["fbi"] = { -- FBI
    [0] = "R.S.A.", -- Recruit Special Agent
    [1] = "S.A.", -- Special Agent
    [2] = "S.S.A.", -- Senior Special Agent
    [3] = "S.S.A.I.C.", -- Supervisory Special Agent
    [4] = "T.T.S.A.", -- Tactical/Training SAIC
    [5] = "C.I.S.A.", -- Criminal Investigation SAIC
    [6] = "L.F.S.A.", -- Labor/Finance SAIC
    [7] = "N.S.S.A.", -- National Security SAIC
    [8] = "A.D.D.", -- Associate Deputy Director
    [9] = "D.D.", -- Deputy Director
    [10] = "Dir.", -- Director
},
["dhs"] = { -- DHS
    [0] = "R.B.P.A.", -- Recruit BPA
    [1] = "S.A.", -- Senior Agent
    [2] = "L.A.", -- Lead Agent
    [3] = "S.A.", -- Supervisor Agent
    [4] = "F.O.S.", -- Field Opps Supervisor
    [5] = "S.O.S.", -- Special Operations Supervisor
    [6] = "S.A.I.C.", -- Special Agent in Charge
    [7] = "D.C.", -- Deputy Chief
    [8] = "Chf.", -- Chief
    [9] = "D.Dir.", -- Deputy Director
    [10] = "Dir.", -- Director
},
["ss"] = { -- Secret Service
    [0] = "Rct.", -- Recruit
    [1] = "Ofc.", -- Officer
    [2] = "Sgt.", -- Sergeant
    [3] = "Lt.", -- Lieutenant
    [4] = "A.I.", -- Agent IPO
    [5] = "Spc. Agt.", -- Special Agent
    [6] = "S.S.A.", -- Special Special Agent
    [7] = "D.S.A.I.C.", -- Deputy SAIC
    [8] = "S.A.I.C.", -- Special Agent in Charge
    [9] = "D.Dir.", -- Deputy Director
    [10] = "Dir.", -- Director
},

    ["sheriff"] = {
        [0] = "Cdt.",
        [1] = "Dep.",
        [2] = "Cpl.",
        [3] = "Lt.",
        [4] = "S.",
    },
}

Config.DefaultCallsign = "000" -- This will only be used if you don't have a callsign yet