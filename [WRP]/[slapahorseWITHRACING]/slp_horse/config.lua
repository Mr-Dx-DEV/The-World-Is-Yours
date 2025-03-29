Config = {}
Config.targetSystem = 'qb-target' -- 'qb-target' or 'ox_target'. Set to false to use prompts(higher resmon)
Config.commandToGetOffHorse = 'getoffhorse' --Set to false to use prompts(higher resmon)

Config.optimizationTest = false

Config.settings = {
    {
        horseRagdoll = false,  -- default: true
        displayRadar = true, -- default: true
    }
}

Config.Messages = {
    {
        -- you can change this texts for prompt translations
    
        enterHorseText = "Mount ~b~Horse",
        exitHorseText = "Exit ~b~Horse",
        lostHorseText = "~r~You have lost your horse, go to Stables to retrieve it.",
        horseAlreadySpawnedText = "~r~A horse is already spawned.",
        rideHorseToEnterRaceText = "You must be riding a ~b~Horse ~w~to enter the ~b~Race.",
        horseDiedText = "~r~Your Horse died, go to Stables to retrieve it.",
    }
}

Config.clothing = 'qb-clothing' --'qb-clothing','fivem-appearance_esx','fivem-appearance_qb','illenium-appearance' or 'skinchanger'.