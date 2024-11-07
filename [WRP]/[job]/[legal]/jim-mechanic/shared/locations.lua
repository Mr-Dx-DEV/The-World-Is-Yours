Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "kittys",
	zones = {
		vec2(-249.339, -1152.002),
		vec2(-248.799, -1185.063),
		vec2(-128.949, -1187.516),
		vec2(-125.76, -1151.523)
		
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-209.2, -1176.95, 23.03, 90.0), w = 4.0, d = 2.0, },
		{ coords = vec4(-195.93, -1176.84, 23.03, 90.0), w = 4.0, d = 2.0, },
		{ coords = vec4(-182.19, -1176.62, 23.03, 90.0), w = 3.0, d = 2.0, },
	},
	store = {
		{ coords = vec4(-202.53, -1175.81, 23.03, 90.0), w = 8.0, d = 3.0 },
		{ coords = vec4(-188.56, -1175.83, 23.03, 90.0), w = 8.0, d = 3.0 },
		{ coords = vec4(-175.5, -1175.34, 23.03, 90.0), w = 8.0, d = 3.0 },
	},
	crafting = {
		{ coords = vec4(-203.687, -1159.738, 23.034, 0.0), w = 2.0, d = 1.0 },
		{ coords = vec4(-174.74, -1163.279, 23.036, 0.0), w = 2.0, d = 1.0 },
	},
	clockin = {
		{ coords = vec4(-210.33, -1162.56, 23.03, 0.0), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-171.99, -1159.58, 23.03, 270.0), prop = false, },
	},
	carLift = {
        { coords = vec4(-201.85, -1319.65, 31.3, 19.36), useMLOLift = false },
        { coords = vec4(-221.27, -1318.71, 31.3, 352.67), useMLOLift = false },
    },
	garage = {
		spawn = vec4(-246.369, -1183.977, 23.096, 336.62),
		out = vec4(-241.054, -1183.624, 23.029, 274.45),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-214.68, -1162.9, 23.03, 0.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-210.123, -1171.293, 23.034),
		label = "Kitty's Customs",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.5,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	discord = {
		link = "",
		color = 16711680,
	}
}


Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "mosleys",
	zones = {
		vec2(-21.942, -1630.619),
		vec2(-71.221, -1685.383),
		vec2(-56.687, -1705.98),
		vec2(23.215, -1671.199)
		
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-5.88, -1660.17, 29.48, 320.0), w = 1.0, d = 4.0, },
		
	},
	store = {
		{ coords = vec4(-8.42, -1657.98, 29.48, 320.0), w = 1.0, d = 3.0 },
		
	},
	crafting = {
		{ coords = vec4(0.0, 0.0, 0.0, 0.0), w = 2.0, d = 1.0 },
		
	},
	clockin = {
		{ coords = vec4(-14.93, -1662.66, 29.48, 50.0), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-19.49, -1682.75, 29.45, 17.26), prop = true, },
	},
	carLift = {
        { coords = vec4(-7.05, -1674.42, 29.83, 200.58), useMLOLift = false },
        { coords = vec4(-10.94, -1676.32, 29.83, 200.16), useMLOLift = false },
    },
	garage = {
		spawn = vec4(-31.66, -1677.67, 29.47, 142.88),
		out = vec4(-25.44, -1673.35, 29.49, 139.31),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-15.16, -1660.66, 33.04, 50.0), prop = false },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-16.43, -1673.17, 29.48),
		label = "Mosley's Customs",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.5,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	discord = {
		link = "",
		color = 16711680,
	}
}