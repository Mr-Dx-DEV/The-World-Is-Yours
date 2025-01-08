Config = {
	language = 'en', -- the language you use in locales.lua
	InventoryType = 'ox_inventory', -- ox_inventory, qb-inventory
	Time = {
		conditionscheck = 10 * 60, -- 10 minutes the time will decrease hunger and drink rate
		healthcheck = 2, -- check health rate every 2 seconds - DO NOT TOUCH IF YOU DONT KNOW
		revive = 2, -- check revive rate every 2 seconds - DO NOT TOUCH IF YOU DONT KNOW
		heal = 2, -- check heal rate every 2 seconds - DO NOT TOUCH IF YOU DONT KNOW
	},
	Amount = {
		hunger = 2, -- how much decrease hunger rate of k9 in  conditionscheck time it means in 10 minutes it will decrease 2/100
		thirst = 2, -- how much decrease thirst rate of k9 in  conditionscheck time it means in 10 minutes it will decrease 2/100
		healthLossPerTick = 5, -- how much decrease health rate of k9 if thirst and hunger is = 0
		foundweedincrease = math.random(5, 10), -- The amount of increasing smell attribute when your k9 find the weed
		notfoundweedincrease = math.random(5, 10), -- The amount of increasing smell attribute when your k9 could't find the weed
		increaseattack = math.random(5, 10), -- The amount of increasing attack attribute when your k9 attacked the target in train system
		increasestamina = math.random(5, 10), -- The amount of increasing stamina attribute when your k9 finished the train
	},
	Shop = {
		Items = {
			{ name = "k9food", label = "Dog Food", price = 50 }, -- Dog food
			{ name = "k9drink", label = "Dog Water", price = 30 }, -- Dog drink
			{ name = "k9revivekit", label = "Revive Kit", price = 100 }, -- Revive kit for K9
			{ name = "k9glowstick", label = "Glow Stick", price = 20 }, -- Glow stick for K9
			{ name = "k9cage", label = "Dog Cage", price = 100 }, -- K9 cage
			{ name = "k9cage2", label = "Dog Cage 2", price = 100 }, -- K9 cage
			{ name = "k9weed", label = "Dog Weed", price = 75 } -- Weed for K9
		}
	},
	K9Spawns = {
		['policeDept'] = {
			Coords = vector3(642.49, 8.12, 82.79), -- vector4(642.49, 8.12, 82.79, 248.28)
			Heading = 72.32,
			cameraDistance = -8.0, -- Distance from the dog to the camera
			cameraHeight = 1.0, -- Height of the camera relative to the dog
			dogSpawnDistance = 2.0, -- Distance in front of the house to spawn the dog 0.0 is inside 
			FOV = 20.0, -- Camera Field of View
			house = "evok9_doghouse-p-a" -- Object name
		},
		['bcsosheriffDept'] = {
			Coords = vector3(1837.787, 3696.508, 33.977), -- vector4(1837.787, 3696.508, 33.977, 300.906)
			Heading = 30.32,
			cameraDistance = -8.0,
			cameraHeight = 0.7,
			dogSpawnDistance = 0.9,
			FOV = 14.0,
			house = "evo_dog-house" -- Object name
		},
		['SALivestockAgency'] = {
			Coords = vector3(1638.491, 4848.579, 42.011), -- vector4(1638.491, 4848.579, 42.011, 193.986)
			Heading = 5.32,
			cameraDistance = -8.0, -- Distance from the dog to the camera
			cameraHeight = 1.0, -- Height of the camera relative to the dog
			dogSpawnDistance = 2.0, -- Distance in front of the house to spawn the dog 0.0 is inside 
			FOV = 20.0, -- Camera Field of View
			house = "evok9_doghouse-p-a" -- Object name
		},
		['lssosheriffDept'] = {
			Coords = vector3(367.522, -1615.377, 29.28), -- vector4(367.522, -1615.377, 29.28, 46.235)
			Heading = 240.00,
			cameraDistance = -8.0,
			cameraHeight = 0.7,
			dogSpawnDistance = 0.9,
			FOV = 14.0,
			house = "evo_dog-house" -- Object name
		},
		-- Add more locations here if needed
	},
	K9Food = {
        hungerIncrease = 20,  -- Increase hunger by 20
        thirstIncrease = 0,   -- No change in thirst
    },
    K9Drink = {
        hungerIncrease = 0,   -- No change in hunger
        thirstIncrease = 20,  -- Increase thirst by 20
    },
    AnimationTime = 5000,    -- Time taken for the dog to consume the item (5 seconds)
	Blips = {
		enable = true,
		colour = 1, 
		scale = 0.8,
		sprite = 442
	},
	Color = {
        lineColor = { r = 173, g = 216, b = 230, a = 200 }, -- Light Blue
        markerColor = { r = 255, g = 0, b = 0, a = 200 },  -- Red
        textColor = { r = 255, g = 255, b = 255, a = 255 }  -- White
    },
	Dogs = {
        Betterfollow = true,
        Onesync = "teleport", -- This is the config what happens if players distance with dog is more than 70 for onesync problems {follow, despawn, despawnandmenu, teleport}
        -- follow = the dog will go to players last location he whistles
        -- despawn = the dog will despawn
        -- despawnandmenu = the dog will despawn and the player will have a menu to spawn the dog
        -- teleport = the dog will teleport to players coords
        -- BE ADVICE ALL OF THESE WILL HAPPEN IF THE PLAYER WHISTLES ELSE THE DOG WILL STAY IN ITS POSITION
        AnimationCategories = {
            owner = {
                search = {
                    [1] = {"gestures@m@standing@casual", "gesture_bring_it_on", 900},
                    [2] = {"gestures@m@standing@casual", "gesture_point", 800},
                    [3] = {"amb@world_human_binoculars@male@idle_a", "idle_a", 1500},
                },
                order = {
                    [1] = {"rcmnigel1c", "hailing_whistle_waive_a", 2000},
                    [2] = {"gestures@m@standing@casual", "gesture_bring_it_on", 900},
                    [3] = {"amb@world_human_cop_idles@male@idle_b", "idle_d", 3000},
                },
                call = {
                    [1] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", 3000},
                    [2] = {"rcmnigel1c", "hailing_whistle_waive_a", 2000},
                    [3] = {"missfra0_chop_find", "call_chop_r", 2000},
                    [4] = {"missfra0_chop_find", "call_chop_l", 2000},
                    [5] = {"gestures@m@standing@casual", "gesture_point", 800},
                    [6] = {"anim@mp_player_intcelebrationmale@wave", "wave", 2000},
                }
            },
            dog = {
                alert = {
                    [1] = {"creatures@rottweiler@indication@", "indicate_high", 3000},
                    [2] = {"creatures@rottweiler@indication@", "indicate_low", 2500},
                    [3] = {"creatures@rottweiler@amb@sleep_in_kennel@", "sleep_in_kennel", 0},
                    [4] = {"creatures@rottweiler@amb@world_dog_sitting@base", "base", 0},
                    [5] = {"creatures@rottweiler@amb@world_dog_sitting@idle_a", "idle_a", 0},
                }
            }
        }
    },
	Removeitem = { -- remove items after use
		attacktrain = true,
		staminatrain = true,
		k9weed = true,
		k9revivekit = true
	},
	LeashLength = 10,

	K9Search = {
		["joint"] = 20,
		["weapon_pistol"] = 70,
		["cokebaggy"] = 40,
		["crack_baggy"] = 45,
		["xtcbaggy"] = 30,
		["weed_white-widow"] = 25,
		["weed_skunk"] = 30,
		["weed_purple-haze"] = 35,
		["weed_og-kush"] = 40,
		["weed_amnesia"] = 50,
		["weed_ak47"] = 45,
		["weed_brick"] = 60,
		["coke_brick"] = 55,
		["coke_small_brick"] = 50,
		["puremeth"] = 70,
		["meth"] = 50
	}
}
