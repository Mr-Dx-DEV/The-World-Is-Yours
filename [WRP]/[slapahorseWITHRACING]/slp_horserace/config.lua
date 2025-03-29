Config = {}

Config.EnableBlip = true

Config.settings = {
    {
        devMode = false,  -- default: false --Starts the race automatically when entered
    }
}

Config.targetSystem = 'qb-target' -- 'qb-target' or 'ox_target'. Set to false to use drawText(higher resmon)

Config.horseRaceManage = {coords = vector3(1084.86, 89.46, 82.89), heading = 43.5227, model = "a_m_m_farmer_01"}
Config.horseRaceRegister = {coords = vector3(1104.02, 162.15, 82.02), heading = 54.4970, model = "a_m_m_farmer_01"}
Config.horseRaceEntrance = {coords = vector3(1093.72, 155.24, 81.85), heading = 331.3932, model = "a_m_m_farmer_01"}

Config.Messages = {
    {
        -- you can change this texts for prompt translations
    
        registerHorseText = "Register ~g~Horse",
        enterRaceText = "Enter ~b~Race",
        openHorseStationGateText = "Open Horse Station ~b~Gate",
        registerFirst = "Register your Horse first before entering the Race",
        gateOpensCounterText3 = "Gate opens in 3",
        gateOpensCounterText2 = "Gate opens in 2",
        gateOpensCounterText1 = "Gate opens in 1",
        gateClosesCounterText3 = "Gate closes in 3",
        gateClosesCounterText2 = "Gate closes in 2",
        gateClosesCounterText1 = "Gate closes in 1",
        
        -- Horse Race Monitor Text

        horseRaceWelcomeText = "HORSE RACE ~n~ Bienvenido a todos!",
        monitorRaceStartCounterText3 = "RACE STARTS IN 3",
        monitorRaceStartCounterText2 = "RACE STARTS IN 2",
        monitorRaceStartCounterText1 = "RACE STARTS IN 1",
        horseRaceCommencingText = "HORSE RACE COMMENCING!",
        monitorRaceStarted = "HORSE RACE HAS STARTED!",
    }
}