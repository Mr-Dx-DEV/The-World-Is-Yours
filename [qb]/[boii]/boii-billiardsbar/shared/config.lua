----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

-- Core settings you can ignore these if you have not renamed your core
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    InputName = 'qb-input', -- The name of your input menu for billing. Default; qb-input
    SkillBarName = 'qb-skillbar', -- The name of your skillbar. Default; qb-skillbar
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    DutyEvent = 'QBCore:ToggleDuty', -- The name of your duty event. Default; 'QBCore:ToggleDuty'
    AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    ManagementEvent = 'qb-bossmenu:client:OpenMenu', -- Name of your boss menu event. Default; 'qb-bossmenu:client:OpenMenu'
    PhoneEvent = 'qb-phone:RefreshPhone', -- The name of your phone event this is needed for billing. Default; 'qb-phone:RefreshPhone'
    ClothingEvent = 'qb-clothing:client:openOutfitMenu', -- The name of your clothing event this is needed to open outfit menu. Default; 'qb-clothing:client:OpenOutfitMenu'
    FuelScript = 'LegacyFuel', -- The name of your fuel scribbar. Default; LegacyFuel
    PlayerLoad = 'QBCore:Client:OnPlayerLoaded' -- Name of player load event
}

-- Blip settings
Config.Blips = {
    {title='Billiards Bar', colour=5, id=52, x = -1596.43, y = -991.23, z = 48.66, scale = 0.6}
}

-- Job settings
Config.JobSettings = {
    Job = 'billiards', -- The name of your job in shared.lua
    Raid = { 
        Job = 'police', -- The name of your job in shared.lua that is allowed to raid storage locations
        Time = math.random(8,15), -- Time required to raid storages
        Animations = {
            Dict = 'mini@safe_cracking',
            Anim = 'door_open_succeed_stand',
            Flags = 49
        }
    },
    MenuItem = 'bbarmenu', -- Item used to display pizza menu *(will be added in future update)*
    Locations = {
        Duty = {{name = 'bbar_duty', coords = vector3(-1582.58, -986.42, 12.89), length = 0.8, width = 0.8, heading = 52.31, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        EPOS = {{name = 'bbar_epos', coords = vector3(-1587.48, -995.81, 12.45), length = 0.8, width = 0.8, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        Store = {
            Drinks = {
                {name = 'bbar_drinkstore', coords = vector3(-1585.17, -995.33, 12.27), length = 0.6, width = 1.0, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.02, distance = 1.5}
            },
            Food = {
                {name = 'bbar_foodstore', coords = vector3(-1585.9, -996.05, 12.10), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.10, distance = 1.5}
            },
            Wine = {
                {name = 'bbar_winestore', coords = vector3(-1585.17, -995.33, 12.27), length = 0.6, width = 1.0, heading = 50.99, debugPoly = false, minZ = 13.75, maxZ = 14.15, distance = 1.5}
            }
        },
        Pumps = {
            {name = 'bbar_pumps', coords = vector3(-1583.83, -990.23, 12.48), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.55, distance = 1.5},
            {name = 'bbar_pumps2', coords = vector3(-1585.66, -992.29, 12.55), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.55, distance = 1.5}
        }, 
        Pumps2 = {{name = 'bbar_pumps3', coords = vector3(-1584.81, -991.36, 12.64), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.55, distance = 1.5}}, 
        Liquor = {{name = 'bbar_liquor', coords = vector3(-1583.37, -992.95, 13.08), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 13.75, maxZ = 14.15, distance = 1.5}},
        Cocktails = {{name = 'bbar_cocktails', coords = vector3(-1584.05, -993.78, 13.0), length = 0.5, width = 0.6, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}},
        HotDrinks = {{name = 'bbar_hotdrinks', coords = vector3(-1582.95, -992.44, 13.05), length = 0.5, width = 0.5, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}},
        Microwave = {{name = 'bbar_microwave', coords = vector3(-1582.44, -991.97, 12.67), length = 0.5, width = 0.5, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}},
        Tray = {{name = 'bbar_tray', coords = vector3(-1586.79, -993.84, 13.05), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        Tray2 = {{name = 'bbar_tray2', coords = vector3(-1586.78, -996.26, 12.51), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        Clothing = {{name = 'bbar_clothing', coords = vector3(-1582.19, -984.65, 12.67), length = 0.8, width = 0.8, heading = 140.66, debugPoly = false, minZ = 12.00, maxZ = 14.50, distance = 1.5}},
        JobStorage = {{name = 'bbar_jobstorage', coords = vector3(-1581.25, -990.68, 12.10), length = 0.8, width = 0.8, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 14.50, distance = 1.5}},
        BossStorage = {{name = 'bbar_bossstorage', coords = vector3(-1574.48, -982.27, 12.48), length = 1.2, width = 1.2, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        JobManagement = {{name = 'bbar_jobmanagement', coords = vector3(-1577.98, -983.38, 12.48), length = 1.2, width = 1.2, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        Snake = {{name = 'bbar_snake', coords = vector3(-1582.16, -980.17, 13.11), length = 1.2, width = 1.2, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.50, distance = 1.5}},
        Wash = {
            {name = 'bbar_sink', coords = vector3(-1584.26, -991.76, 13.08), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.02, distance = 1.5},
            {name = 'bbar_sink2', coords = vector3(-1585.08, -992.78, 13.08), length = 0.6, width = 0.6, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.02, distance = 1.5},
            {name = 'bbar_sink3', coords = vector3(-1589.88, -977.74, 13.83), length = 1.0, width = 1.0, heading = 50.99, debugPoly = false, minZ = 12.00, maxZ = 13.02, distance = 1.5}
        },
        Dishes = {
            Glasses = {
                {name = 'bbar_glasses', coords = vector3(-1583.37, -992.95, 13.08), length = 0.5, width = 0.5, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}
            },
            Glasses2 = {
                {name = 'bbar_glasses2', coords = vector3(-1585.05, -995.1, 12.88), length = 0.6, width = 1.0, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}
            },
            Cups = {
                {name = 'bbar_cups', coords = vector3(-1584.46, -994.55, 13.77), length = 0.5, width = 0.5, heading = 50.99, debugPoly = false, minZ = 13.75, maxZ = 14.15, distance = 1.5}
            },
            Plates = {
                {name = 'bbar_plates', coords = vector3(-1584.46, -994.55, 13.17), length = 0.5, width = 0.5, heading = 50.99, debugPoly = false, minZ = 13.08, maxZ = 13.45, distance = 1.5}
            }
        }
    }
}

-- Store settings
Config.Store = {
    Drinks = {
        Items = {
            [1] = {name = 'water', price = 1, amount = 1000, info = {}, type = 'item', slot = 1},
            [2] = {name = 'cocacola', price = 1, amount = 1000, info = {}, type = 'item', slot = 2},
            [3] = {name = 'pepsi', price = 1, amount = 1000, info = {}, type = 'item', slot = 3},
            [4] = {name = 'drpepper', price = 1, amount = 1000, info = {}, type = 'item', slot = 4},
            [5] = {name = 'mountaindew', price = 1, amount = 1000, info = {}, type = 'item', slot = 5},
            [6] = {name = 'lemonade', price = 1, amount = 1000, info = {}, type = 'item', slot = 6},
        }
    },
    Food = {
        Items = {
            [1] = {name = 'cherry', price = 1, amount = 1000, info = {}, type = 'item', slot = 1},
            [2] = {name = 'lime', price = 1, amount = 1000, info = {}, type = 'item', slot = 2},
            [3] = {name = 'lemon', price = 1, amount = 1000, info = {}, type = 'item', slot = 3},
            [4] = {name = 'pineapple', price = 1, amount = 1000, info = {}, type = 'item', slot = 4},
            [5] = {name = 'coconut', price = 1, amount = 1000, info = {}, type = 'item', slot = 5},
            [6] = {name = 'cranberry', price = 1, amount = 1000, info = {}, type = 'item', slot = 6},
            [7] = {name = 'apple', price = 1, amount = 1000, info = {}, type = 'item', slot = 7},
            [8] = {name = 'orange', price = 1, amount = 1000, info = {}, type = 'item', slot = 8},
            [9] = {name = 'tomato', price = 1, amount = 1000, info = {}, type = 'item', slot = 9},
            [10] = {name = 'steakpie', price = 1, amount = 1000, info = {}, type = 'item', slot = 10},
            [11] = {name = 'chickenpie', price = 1, amount = 1000, info = {}, type = 'item', slot = 11},
            [12] = {name = 'meatpie', price = 1, amount = 1000, info = {}, type = 'item', slot = 12},
            [13] = {name = 'cheesepie', price = 1, amount = 1000, info = {}, type = 'item', slot = 13},
            [14] = {name = 'mwburger', price = 1, amount = 1000, info = {}, type = 'item', slot = 14},
            [15] = {name = 'mwcburger', price = 1, amount = 1000, info = {}, type = 'item', slot = 15},
            [16] = {name = 'mwbcburger', price = 1, amount = 1000, info = {}, type = 'item', slot = 16},
        }
    },
    Wine = {
        Items = {
            [1] = {name = 'chardonnay', price = 5, amount = 1000, info = {}, type = 'item', slot = 1},
            [2] = {name = 'barolo', price = 35, amount = 1000, info = {}, type = 'item', slot = 2},
            [3] = {name = 'pinotgrigio', price = 18, amount = 1000, info = {}, type = 'item', slot = 3},
            [4] = {name = 'pinotnoir', price = 18, amount = 1000, info = {}, type = 'item', slot = 4},
        }
    }
}

-- Storage settings
Config.Storage = {
    Boss = {
        Name = 'bbar_boss_storage',
        Size = 1000000,
        Slots = 41
    },
    Job = {
        Name = 'bbar_job_storage',
        Size = 2000000,
        Slots = 41
    },
    Tray = {
        Name1 = 'bbar_tray1',
        Name2 = 'bbar_tray2',
        Size = 50000,
        Slots = 5
    }
}

-- Wash settings
Config.Wash = {
    Self = {
        Face = {
            Animations = {
                -- Animation used when washing face
                Dict = 'switch@michael@wash_face',
                Anim = 'exit_michael',
                Flags = 49
            },
            Time = math.random(3,7), -- Time in (s) to wash face
            Stress = math.random(1,5), -- Amount of stress removed when washing face
        },
        Hands = {
            Animations = {
                -- Animation used when washing hands
                Dict = 'mp_arresting',
                Anim = 'a_uncuff',
                Flags = 49
            },
            Time = math.random(3,7), -- Time in (s) to wash hands
            Stress = math.random(1,5), -- Amount of stress removed when washing hands
        },
    },
    Dishes = {
        Animations = {
            Wash = {
                -- Animation used when washing dishes
                Dict = 'mp_arresting',
                Anim = 'a_uncuff',
                Flags = 49
            },
            Store = {
                -- Animation used when storing/taking
                Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
                Anim = 'weed_spraybottle_crouch_idle_01_inspector',
                Flags = 49
            },
        },
        Plate = {
            Time = math.random(3,7), -- Time in (s) to wash plates
            Time2 = math.random(2,4), -- Time in (s) to take plates
            Time3 = math.random(2,4), -- Time in (s) to store plates
            Required = {name = 'dirty_plate', label = 'Dirty Plate'},
            Return = {name = 'clean_plate', label = 'Clean Plate'}
        },
        Cup = {
            Time = math.random(3,7), -- Time in (s) to wash cups
            Time2 = math.random(2,4), -- Time in (s) to take cups
            Time3 = math.random(2,4), -- Time in (s) to store cups
            Required = {name = 'dirty_cup', label = 'Dirty Cup'},
            Return = {name = 'clean_cup', label = 'Clean Cup'} 
        },
        Glass = {
            Time = math.random(3,7), -- Time in (s) to wash glasses
            Time2 = math.random(2,4), -- Time in (s) to take glasses
            Time3 = math.random(2,4), -- Time in (s) to store glasses
            Required = {name = 'dirty_glass', label = 'Dirty Glass'},
            Return = {name = 'clean_glass', label = 'Clean Glass'} 
        },
        PintGlass = {
            Time = math.random(3,7), -- Time in (s) to wash pint glasses
            Time2 = math.random(2,4), -- Time in (s) to take pint glasses
            Time3 = math.random(2,4), -- Time in (s) to store pint glasses
            Required = {name = 'dirty_pintglass', label = 'Dirty Pint Glass'},
            Return = {name = 'clean_pintglass', label = 'Clean Pint Glass'}
        },
        SmallGlass = {
            Time = math.random(3,7), -- Time in (s) to wash small glasses
            Time2 = math.random(2,4), -- Time in (s) to take small glasses
            Time3 = math.random(2,4), -- Time in (s) to store small glasses
            Required = {name = 'dirty_smallglass', label = 'Dirty Small Glass'},
            Return = {name = 'clean_smallglass', label = 'Clean Small Glass'}  
        },
        WineGlass = {
            Time = math.random(3,7), -- Time in (s) to wash wine glasses
            Time2 = math.random(2,4), -- Time in (s) to take wine glasses
            Time3 = math.random(2,4), -- Time in (s) to store wine glasses
            Required = {name = 'dirty_wineglass', label = 'Dirty Wine Glass'},
            Return = {name = 'clean_wineglass', label = 'Clean Wine Glass'}  
        },
        CocktailGlass = {
            Time = math.random(3,7), -- Time in (s) to wash cocktail glasses
            Time2 = math.random(2,4), -- Time in (s) to take cocktail glasses
            Time3 = math.random(2,4), -- Time in (s) to store cocktail glasses
            Required = {name = 'dirty_cocktailglass', label = 'Dirty Cocktail Glass'},
            Return = {name = 'clean_cocktailglass', label = 'Clean Cocktail Glass'}  
        }       
    }
}

-- Drinks settings
Config.Drinks = {
    Pint = {
        Animations = {
            -- Animation used when using mixer
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_idle_01_inspector',
            Flags = 49
        },
        Required = {name = 'clean_pintglass', label = 'Clean Pint Glass'},
        AMBeer = {
            Time = math.random(8,15), -- Time in (s) to pull pint
            Return = {name = 'pint_ambeer', label = 'Pint of AM Beer'}
        },
        Piswasser = {
            Time = math.random(8,15), -- Time in (s) to pull pint
            Return = {name = 'pint_piswasser', label = 'Pint of Piswasser'}
        },
        Logger = {
            Time = math.random(8,15), -- Time in (s) to pull pint
            Return = {name = 'pint_logger', label = 'Pint of Logger'}
        },
        Dusche = {
            Time = math.random(8,15), -- Time in (s) to pull pint
            Return = {name = 'pint_dusche', label = 'Pint of Dusche Gold'}
        }
    },
    Liquor = {
        Animations = {
            -- Animation used when using mixer
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_idle_01_inspector',
            Flags = 49
        },
        Required = {name = 'clean_smallglass', label = 'Clean Small Glass'},
        Rum = {
            Time = math.random(8,15), -- Time in (s) to pull liquor
            Return = {name = 'glass_rum', label = 'Glass of Rum'}
        },
        Whiskey = {
            Time = math.random(8,15), -- Time in (s) to pull liquor
            Return = {name = 'glass_whiskey', label = 'Glass of Whiskey'}
        },
        Vodka = {
            Time = math.random(8,15), -- Time in (s) to pull liquor
            Return = {name = 'glass_vodka', label = 'Glass of Vodka'}
        }
    },
    Wine = {
        Animations = {
            -- Animation used when using mixer
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_idle_01_inspector',
            Flags = 49
        },
        Required = {name = 'clean_wineglass', label = 'Clean Wine Glass'},
        Chardonnay = {
            Time = math.random(8,15), -- Time in (s) to pour wine
            Required = {name = 'chardonnay', label = 'Bottle Of Chardonnay'},
            Return = {name = 'glass_chardonnay', label = 'Glass of Chardonnay'}
        },
        Barolo = {
            Time = math.random(8,15), -- Time in (s) to pour wine
            Required = {name = 'barolo', label = 'Bottle Of Barolo'},
            Return = {name = 'glass_barolo', label = 'Glass of Barolo'}
        },
        PinotGrigio = {
            Time = math.random(8,15), -- Time in (s) to pour wine
            Required = {name = 'pinotgrigio', label = 'Bottle Of Pinot Grigio'},
            Return = {name = 'glass_pinotgrigio', label = 'Glass of Pinot Grigio'}
        },
        PinotNoir = {
            Time = math.random(8,15), -- Time in (s) to pour wine
            Required = {name = 'pinotnoir', label = 'Bottle Of Pinot Noir'},
            Return = {name = 'glass_pinotnoir', label = 'Glass of Pinot Noir'}
        }
    },
    Hot = {
        Animations = {
            -- Animation used when using mixer
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_idle_01_inspector',
            Flags = 49
        },
        Required = {name = 'clean_cup', label = 'Clean Cup'},
        Coffee = {
            Time = math.random(5,9), -- Time in (s) to make a cup of coffee
            Return = {name = 'cup_coffee', label = 'Cup of Coffee'}
        },
        Tea = {
            Time = math.random(5,9), -- Time in (s) to make a cup of tea
            Return = {name = 'cup_tea', label = 'Cup of Tea'}
        }
    },
    Cocktails = {
        Animations = {
            -- Animation used when mixing cocktails
            Dict = 'mp_arresting',
            Anim = 'a_uncuff',
            Flags = 49
        },
        Required = {name = 'clean_cocktailglass', label = 'Clean Cocktail Glass'},
        WhiskeySour = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_whiskey', label = 'Glass of Whiskey', amount = 1},
                ['2'] = {name = 'lemon', label = 'Lemon', amount = 1},
                ['3'] = {name = 'orange', label = 'Orange', amount = 1}
            },
            Return = {name = 'whiskeysour', label = 'Whiskey Sour'}
        },
        WhiskeySmash = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_whiskey', label = 'Glass of Whiskey', amount = 1},
                ['2'] = {name = 'lemon', label = 'Lemon', amount = 1},
                ['3'] = {name = 'apple', label = 'Apple', amount = 1}
            },
            Return = {name = 'whiskeysmash', label = 'Whiskey Smash'}
        },
        BloodSand = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_whiskey', label = 'Glass of Whiskey', amount = 1},
                ['2'] = {name = 'cherry', label = 'Cherry', amount = 3},
                ['3'] = {name = 'orange', label = 'Orange', amount = 1}
            },
            Return = {name = 'bloodandsand', label = 'Blood and Sand'}
        },
        PinaColada = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_rum', label = 'Glass of Rum', amount = 1},
                ['2'] = {name = 'pineapple', label = 'Pineapple', amount = 1},
                ['3'] = {name = 'coconut', label = 'Coconut', amount = 1}
            },
            Return = {name = 'pinacolada', label = 'Pina Colada'}
        },
        Zombie = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_rum', label = 'Glass of Rum', amount = 1},
                ['2'] = {name = 'pineapple', label = 'Pineapple', amount = 1},
                ['3'] = {name = 'orange', label = 'Orange', amount = 2}
            },
            Return = {name = 'pinacolada', label = 'Pina Colada'}
        },
        MaiTai = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_rum', label = 'Glass of Rum', amount = 1},
                ['2'] = {name = 'lime', label = 'Lime', amount = 2},
                ['3'] = {name = 'orange', label = 'Orange', amount = 1}
            },
            Return = {name = 'maitai', label = 'Mai Tai'}
        },
        Appletini = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_vodka', label = 'Glass of Vodka', amount = 1},
                ['2'] = {name = 'lemon', label = 'Lemon', amount = 1},
                ['3'] = {name = 'apple', label = 'Apple', amount = 2}
            },
            Return = {name = 'appletini', label = 'Appletini'}
        },
        Cosmopolitan = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_vodka', label = 'Glass of Vodka', amount = 1},
                ['2'] = {name = 'lime', label = 'Lime', amount = 1},
                ['3'] = {name = 'cranberry', label = 'Cranberry', amount = 3}
            },
            Return = {name = 'cosmopolitan', label = 'Cosmopolitan'}
        },
        BloodyMary = {
            Time = math.random(5, 10), -- Time in (s) to make a cocktail
            Required = {
                -- Do not use more than 3 items unless you know what you are doing, editing code is required!
                ['1'] = {name = 'glass_vodka', label = 'Glass of Vodka', amount = 1},
                ['2'] = {name = 'lemon', label = 'Lemon', amount = 1},
                ['3'] = {name = 'tomato', label = 'Tomato', amount = 3}
            },
            Return = {name = 'bloodymary', label = 'Bloody Mary'}
        }
    }
}

Config.Microwave = {
    Animations = {
        -- Animation used when putting food in microwave
        Dict = 'amb@prop_human_parking_meter@female@base', 
        Anim = 'base_female',
        Flags = 49,
        -- Animation used when waiting for microwave
        Dict2 = 'anim@amb@board_room@supervising@',
        Anim2 = 'think_01_hi_amy_skater_01',
        Flags2 = 49
    },
    Time = math.random(1,2), -- Time in (s) to put food in microwave
    Time2 = math.random(8,15), -- Time in (s) to wait for microwave
    Required = {name = 'clean_plate', label = 'Clean Plate'},
    Pie = {
        Cheese = {
            Required = {name = 'cheesepie', label = 'Microwavable Cheese Pie'},
            Return = {name = 'cookedcheesepie', label = 'Cooked Cheese Pie'},
        },
        Meat = {
            Required = {name = 'meatpie', label = 'Microwavable Meat Pie'},
            Return = {name = 'cookedmeatpie', label = 'Cooked Meat Pie'},
        },
        Steak = {
            Required = {name = 'steakpie', label = 'Microwavable Steak Pie'},
            Return = {name = 'cookedsteakpie', label = 'Cooked Steak Pie'},
        },
        Chicken = {
            Required = {name = 'chickenpie', label = 'Microwavable Chicken Pie'},
            Return = {name = 'cookedchickenpie', label = 'Cooked Chicken Pie'},
        }
    },
    Burger = {
        Burger = {
            Required = {name = 'mwburger', label = 'Microwavable Burger'},
            Return = {name = 'cookedmwburger', label = 'Cooked Microwave Burger'}
        },
        Cheese = {
            Required = {name = 'mwcburger', label = 'Microwavable Cheeseburger'},
            Return = {name = 'cookedmwcburger', label = 'Cooked Microwave Cheeseburger'}
        },
        Bacon = {
            Required = {name = 'mwbcburger', label = 'Microwavable Bacon Burger'},
            Return = {name = 'cookedmwbcburger', label = 'Cooked Microwave Bacon Burger'}
        }
    }
}

-- Snake settings
Config.Snake = {
    Item = {name = 'livemouse', label = 'Live Mouse'}, -- Item required to feed mouse
    Stress = math.random(1,5) -- Amount of stress removed by feeding mouse
}

-- Garage settings
Config.Garage = {
    MoneyType = 'bank', -- Money type used for vehicle deposits
    Vehicle = 'speedo', -- White widow company vehicle use any vehicle you want here
    Deposit = 100, -- Price to take out company van will return 50%
    Heading = 256.19, -- Vehicle spawn heading
    Spawn = vector4(-1592.23, -1010.04, 13.02, 256.19), -- Vehicle spawn location
    Ped = {
        {name = 'bbar_garage', x = -1590.64, y = -1004.29, z = 13.02, h = 167.18, hash = 0xF06B849D, model = 's_m_m_autoshop_02', scenario = 'WORLD_HUMAN_CLIPBOARD'}
    }   
}