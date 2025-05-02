Config = {}

Config.Settings = {
    { -- LSPD Example
        itemName = "badge", -- item name -- you need to add this item on your qbcore/shared/items.lua
        design = "lspd-2.png", -- imagename.png
        job = "lspd", -- job name that will show this badge
        number = "#100", -- callsign department number - It shows before the officer callsign
    },
    { -- BCSO Example
        itemName = "sdbadge", -- you need to add this item on your qbcore/shared/items.lua
        design = "bcso-2.png",
        job = "bcso",
        number = "#200",
    },
    { -- BCSO Example
    itemName = "salsabadge", -- you need to add this item on your qbcore/shared/items.lua
    design = "lifestock.png",
    job = "salsa",
    number = "#Alpha",
    },
    { -- ems Example
    itemName = "emsbadge", -- item name -- you need to add this item on your qbcore/shared/items.lua
    design = "ems.png", -- imagename.png
    job = "ambulance", -- job name that will show this badge
    number = "#69", -- callsign department number - It shows before the officer callsign
    },
}

Config.Ranks = {
    ["lspd"] = { -- Job Name
        [0] = "Recruit.", -- Grade Level → Grade Name that you want to show before the name in the badge
        [1] = "Ofc.",
        [2] = "Sgt.",
        [3] = "Cpt.",
        [4] = "CoP.",
        [5] = "CoP.",
        [6] = "CoP.",
        [7] = "CoP.",
        [8] = "CoP.",
        [9] = "CoP.",
        [10] = "CoP.",
    },
    ["bcso"] = {
        [0] = "Cdt.",
        [1] = "Dep.",
        [2] = "sd.",
        [3] = "cp.",
        [4] = "sg.",
        [5] = "lt.",
        [6] = "ct.",
        [7] = "major.",
        [8] = "Cd.",
        [9] = "USheriff.",
        [10] = "Sheriff.",
    },
    ["salsa"] = {
        [0] = "Recruit Agent.",
        [1] = "Agent.",
        [2] = "Senior Agent.",
        [3] = "Inspector.",
        [4] = "Deputy Commissionerdge.",
        [5] = "Commissioner.",
    },
    ["ambulance"] = {
       [0] = "Recruit.",
       [1] = "Paramedic.",
       [2] = "Doctor.",
       [3] = "Surgeon.",
       [4] = "Chief.",
    },
}

Config.DefaultCallsign = "000" -- This will only be used if you don't have a callsign yet