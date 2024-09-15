Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "mechanic",
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
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
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
		label = "Mechanic",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	discord = {
		link = "",
		color = 16711680,
	}
}
