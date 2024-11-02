Crafting = {
	Nos = {
		Header = Loc[Config.Lan]["crafting"].toolheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			--[[ { ["nos"] = { ["noscan"] = 1, },
				["amount"] = 1,
			},
			{ ["noscan"] = { ["steel"] = 1, },
				["amount"] = 1,
			}, ]]
			{ ["noscolour"] = { ["plastic"] = 8, },
				["amount"] = 1,
			},
		}
	},
	Repairs = {
		Header = Loc[Config.Lan]["crafting"].repairheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["mechanic_tools"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["ducttape"] = { ["plastic"] = 1, },
				["amount"] = 1,
			},
			{ ["newoil"] = { ["plastic"] = 1, },
				["amount"] = 1,
			},
			{ ["sparkplugs"] = { ["metalscrap"] = 1, },
				["amount"] = 1,
			},
			{ ["carbattery"] = { ["metalscrap"] = 1, ["plastic"] = 1 },
				["amount"] = 1,
			},
			{ ["axleparts"] = { ["steel"] = 1, },
				["amount"] = 1,
			},
			{ ["sparetire"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
		},
	},
	Tools = {
		Header = Loc[Config.Lan]["crafting"].toolheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["toolbox"] = {
				["iron"] = 3,
				["steel"] = 1,
				["plastic"] = 1,
			},
				["amount"] = 1,
			},
			{ ["paintcan"] = { ["aluminum"] = 1, },
				["amount"] = 1,
			},

			{ ["tint_supplies"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["underglow_controller"] = { ["iron"] = 1, },
				["amount"] = 1,
			},
			{ ["cleaningkit"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},

					-- Example : Delete me --
			-- Support for multiple items in recipes --
			-- Support for multiple resulting items --
			-- Support to limit items to certain job roles --
			{ ["cleaningkit"] = { ["rubber"] = 5, ["engine2"] = 1, ["plastic"] = 2 },
					["amount"] = 2,
					["job"] = { ["mechanic"] = 4, ["tuner"] = 4, }
				},
					-- Example : Delete me --

			{ ["adjustable_spanner"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
			
			{ ["impact_driver"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
			{ ["pliers"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
			
			{ ["screwdriver"] = { ["rubber"] = 1, },
				["amount"] = 1,
			},
			

		},
	},
	Perform = {
		Header = Loc[Config.Lan]["crafting"].performheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["turbo"] = { ["copper"] = 10, ["iron"] = 10, },
				["amount"] = 1,
			},
			{ ["car_armor"] = { ["plastic"] = 1, },
				["amount"] = 1,
			},
			{ ["engine1"] = { ["iron"] = 5, ["steel"] = 5, ["copper"] = 3, },
				["amount"] = 1,
			},
			{ ["engine2"] = { ["iron"] = 12, ["steel"] = 8, ["copper"] = 5, },
				["amount"] = 1,
			},
			{ ["engine3"] = { ["iron"] = 14, ["steel"] = 11, ["copper"] = 8, },
				["amount"] = 1,
			},
			{ ["engine4"] = { ["iron"] = 18, ["steel"] = 16, ["copper"] = 13, },
				["amount"] = 1,
			},
			{ ["engine5"] = { ["iron"] = 25, ["steel"] = 16, ["copper"] = 18, },
				["amount"] = 1,
			},
			{ ["transmission1"] = { ["copper"] = 9, ["steel"] = 13, },
				["amount"] = 1,
			},
			{ ["transmission2"] = { ["copper"] = 13, ["steel"] = 16, },
				["amount"] = 1,
			},
			{ ["transmission3"] = { ["copper"] = 19, ["steel"] = 21, },
				["amount"] = 1,
			},
			{ ["transmission4"] = { ["copper"] = 24, ["steel"] = 26, },
				["amount"] = 1,
			},
			{ ["brakes1"] = { ["steel"] = 6, ["iron"] = 8, },
				["amount"] = 1,
			},
			{ ["brakes2"] = { ["steel"] = 10, ["iron"] = 14, },
				["amount"] = 1,
			},
			{ ["brakes3"] = { ["steel"] = 14, ["iron"] = 20, },
				["amount"] = 1,
			},
			{ ["suspension1"] = { ["copper"] = 8, ["steel"] = 3, ["metalscrap"] = 5, },
				["amount"] = 1,
			},
			{ ["suspension2"] = { ["copper"] = 12, ["steel"] = 8, ["metalscrap"] = 10, },
				["amount"] = 1,
			},
			{ ["suspension3"] = { ["copper"] = 20, ["steel"] = 12, ["metalscrap"] = 15, },
				["amount"] = 1,
			},
			{ ["suspension4"] = { ["copper"] = 22, ["steel"] = 18, ["metalscrap"] = 20, },
				["amount"] = 1,
			},
			{ ["suspension5"] = { ["copper"] = 25, ["steel"] = 23, ["metalscrap"] = 25, },
				["amount"] = 1,
			},
			{ ["drifttires"] = { ["rubber"] = 15, },
				["amount"] = 1,
			},
			{ ["oilp1"] = { ["metalscrap"] = 6, ["steel"] = 3, },
				["amount"] = 1,
			},
			{ ["oilp2"] = { ["metalscrap"] = 12, ["steel"] = 6, },
				["amount"] = 1,
			},
			{ ["oilp3"] = { ["metalscrap"] = 18, ["steel"] = 12, },
				["amount"] = 1,
			},
			{ ["drives1"] = { ["metalscrap"] = 8, ["steel"] = 4, },
				["amount"] = 1,
			},
			{ ["drives2"] = { ["metalscrap"] = 12, ["steel"] = 8, },
				["amount"] = 1,
			},
			{ ["drives3"] = { ["metalscrap"] = 18, ["steel"] = 12, },
				["amount"] = 1,
			},
			{ ["cylind1"] = { ["metalscrap"] = 8, ["iron"] = 3, },
				["amount"] = 1,
			},
			{ ["cylind2"] = { ["metalscrap"] = 15, ["iron"] = 8, },
				["amount"] = 1,
			},
			{ ["cylind3"] = { ["metalscrap"] = 20, ["iron"] = 15, },
				["amount"] = 1,
			},
			{ ["cables1"] = { ["rubber"] = 8, ["copper"] = 5, },
		["amount"] = 1,
	},
	{ ["cables2"] = { ["rubber"] = 13, ["copper"] = 9, },
		["amount"] = 1,
	},
	{ ["cables3"] = { ["rubber"] = 18, ["copper"] = 13, },
		["amount"] = 1,
	},
	{ ["fueltank1"] = { ["steel"] = 8, ["metalscrap"] = 6, },
		["amount"] = 1,
	},
	{ ["fueltank2"] = { ["steel"] = 13, ["metalscrap"] = 10, },
		["amount"] = 1,
	},
	{ ["fueltank3"] = { ["steel"] = 17, ["metalscrap"] = 16, },
		["amount"] = 1,
	},
	{ ["harness"] = { ["rubber"] = 13, },
		["amount"] = 1,
	},
	{ ["antilag"] = { ["iron"] = 10, ["steel"] = 5, },
		["amount"] = 1,
	},
	{ ["manual"] = { ["metalscrap"] = 10, ["iron"] = 8, ["steel"] = 6, },
		["amount"] = 1,
	},
		}
		
	},
	Cosmetic = {
		Header = Loc[Config.Lan]["crafting"].cosmetheader,
		Anims = { animDict = "mini@repair", anim = "fixing_a_ped",},
		Recipes = {
			{ ["hood"] = { ["steel"] = 10, ["plastic"] = 3, },
		["amount"] = 1,
	},
	{ ["roof"] = { ["steel"] = 8, ["plastic"] = 5, },
		["amount"] = 1,
	},
	{ ["spoiler"] = { ["steel"] = 10, ["plastic"] = 5, },
		["amount"] = 1,
	},
	{ ["bumper"] = { ["steel"] = 10, ["plastic"] = 5, },
		["amount"] = 1,
	},
	{ ["skirts"] = { ["steel"] = 5, ["plastic"] = 6, },
		["amount"] = 1,
	},
	{ ["exhaust"] = { ["steel"] = 6, ["iron"] = 4, },
		["amount"] = 1,
	},
	{ ["seat"] = { ["plastic"] = 8, },
		["amount"] = 1,
	},
	{ ["livery"] = { ["plastic"] = 10, },
		["amount"] = 1,
	},
	{ ["tires"] = { ["rubber"] = 8, },
		["amount"] = 1,
	},
	{ ["horn"] = { ["rubber"] = 5, },
		["amount"] = 1,
	},
	{ ["internals"] = { ["plastic"] = 10, },
		["amount"] = 1,
	},
	{ ["externals"] = { ["plastic"] = 13, },
		["amount"] = 1,
	},
	{ ["customplate"] = { ["steel"] = 8, },
		["amount"] = 1,
	},
	{ ["headlights"] = { ["plastic"] = 10, },
		["amount"] = 1,
	},
	{ ["rims"] = { ["iron"] = 5, ["steel"] = 5, },
		["amount"] = 1,
	},
	{ ["underglow"] = { ["plastic"] = 8, },
		["amount"] = 1,
	},
	{ ["rollcage"] = { ["steel"] = 5, ["iron"] = 5, },
		["amount"] = 1,
	},
	{ ["radiocar"] = { ["steel"] = 8, },
		["amount"] = 1,
	},
	{ ["radiocar_blue"] = { ["steel"] = 8, },
		["amount"] = 1,
	},
		},
	},
}

Stores = {
	NosItems = {
		label = Loc[Config.Lan]["stores"].nos,
		items = {
		--	{ name = "nos", price = 0, amount = 50, info = {}, type = "item", },
		--	{ name = "noscolour", price = 0, amount = 50, info = {}, type = "item", },
		},
	},
	RepairItems = {
		label = Loc[Config.Lan]["stores"].repairs,
		items = {
			{ name = "mechanic_tools", price = 500, amount = 10, info = {}, type = "item", }, -- adjusted
			{ name = "sparetire", price = 250, amount = 100, info = {}, type = "item", }, -- adjusted
			{ name = "axleparts", price = 1500, amount = 1000, info = {}, type = "item", }, -- adjusted
			{ name = "carbattery", price = 500, amount = 1000, info = {}, type = "item", }, -- adjusted
			{ name = "sparkplugs", price = 800, amount = 1000, info = {}, type = "item", }, -- adjusted
			{ name = "newoil", price = 500, amount = 1000, info = {}, type = "item", }, -- adjusted
		},
	},
	ToolItems = {
		label = Loc[Config.Lan]["stores"].tools,
		items = {
			{ name = "toolbox", price = 500, amount = 10, info = {}, type = "item", }, -- adjusted
			{ name = "ducttape", price = 150, amount = 100, info = {}, type = "item", }, -- adjusted
			{ name = "paintcan", price = 500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "tint_supplies", price = 2000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "underglow_controller", price = 3000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "cleaningkit", price = 200, amount = 100, info = {}, type = "item", }, -- adjusted


			{ name = "radiocar", price = 500, amount = 100, info = {}, type = "item", },
			{ name = "radiocar_blue", price = 600, amount = 100, info = {}, type = "item", },
			{ name = "spanner", price = 500, amount = 100, info = {}, type = "item", },
			{ name = "impact_driver", price = 500, amount = 100, info = {}, type = "item", },
			{ name = "pliers", price = 500, amount = 100, info = {}, type = "item", },
			{ name = "screwdriver", price = 500, amount = 100, info = {}, type = "item", },

		},
	},
	PerformItems = {
		label = Loc[Config.Lan]["stores"].perform,
		items = {
			{ name = "turbo", price = 15000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "engine1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "engine2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "engine3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "engine4", price = 14000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "engine5", price = 16000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "transmission1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "transmission2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "transmission3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "transmission4", price = 14000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "brakes1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "brakes2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "brakes3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "car_armor", price = 20000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "suspension1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "suspension2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "suspension3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "suspension4", price = 14000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "suspension5", price = 16000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "drifttires", price = 1500, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "oilp1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "oilp2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "oilp3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "drives1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "drives2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "drives3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "cylind1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "cylind2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "cylind3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "cables1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "cables2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "cables3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "fueltank1", price = 8000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "fueltank2", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "fueltank3", price = 12000, amount = 50, info = {}, type = "item", }, -- adjusted


			{ name = "harness", price = 35000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "antilag", price = 10000, amount = 50, info = {}, type = "item", }, -- adjusted
			
			{ name = "manual", price = 7000, amount = 50, info = {}, type = "item", }, -- adjusted
		},
	},
	CosmeticItems = {
		label = Loc[Config.Lan]["stores"].cosmetic,
		items = {
			{ name = "hood", price = 2500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "roof", price = 2500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "spoiler", price = 1500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "bumper", price = 2000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "skirts", price = 1500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "exhaust", price = 1000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "seat", price = 3000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "livery", price = 1000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "tires", price = 750, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "horn", price = 500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "internals", price = 750, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "externals", price = 1000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "customplate", price = 250, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "headlights", price = 500, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "rims", price = 2500, amount = 100, info = {}, type = "item", }, -- adjusted
			{ name = "rollcage", price = 5000, amount = 50, info = {}, type = "item", }, -- adjusted
			{ name = "underglow", price = 2000, amount = 50, info = {}, type = "item", }, -- adjusted
		},
	},
}


MaterialRecieve = {
	turbo = {
		steel = 1,
	},
	car_armor = {
		plastic = 1,
	},
	engine1 = {
		steel = 1,
	},
	engine2 = {
		steel = 1,
	},
	engine3 = {
		steel = 1,
	},
	engine4 = {
		steel = 1,
	},
	engine5 = {
		steel = 1,
	},
	transmission1 = {
		steel = 1,
	},
	transmission2 = {
		steel = 1,
	},
	transmission3 = {
		steel = 1,
	},
	transmission4 = {
		steel = 1,
	},
	brakes1 = {
		steel = 1,
	},
	brakes2 = {
		steel = 1,
	},
	brakes3 = {
		steel = 1,
	},
	suspension1 = {
		steel = 1,
	},
	suspension2 = {
		steel = 1,
	},
	suspension3 = {
		steel = 1,
	},
	suspension4 = {
		steel = 1,
	},
	suspension5 = {
		steel = 1,
	},
	bprooftires = {
		rubber = 1,
	},
	drifttires = {
		rubber = 1,
	},
	oilp1 = {
		steel = 1,
	},
	oilp2 = {
		steel = 1,
	},
	oilp3 = {
		steel = 1,
	},
	drives1 = {
		steel = 1,
	},
	drives2 = {
		steel = 1,
	},
	drives3 = {
		steel = 1,
	},
	cylind1 = {
		steel = 1,
	},
	cylind2 = {
		steel = 1,
	},
	cylind3 = {
		steel = 1,
	},
	cables1 = {
		steel = 1,
	},
	cables2 = {
		steel = 1,
	},
	cables3 = {
		steel = 1,
	},
	fueltank1 = {
		steel = 1,
	},
	fueltank2 = {
		steel = 1,
	},
	fueltank3 = {
		steel = 1,
	},
	harness = {
		steel = 1,
	},
	antilag = {
		steel = 1,
	},
	manual = {
		steel = 1,
	},
}

-- No Touch
	-- This is corrective code to help simplify the stores for people removing the slot info
	-- Jim shops doesn"t use it but other inventories do
	-- Most people don"t even edit the slots, these lines generate the slot info autoamtically
Stores.CosmeticItems.slots = #Stores.CosmeticItems.items
for k in pairs(Stores.CosmeticItems.items) do Stores.CosmeticItems.items[k].slot = k end
Stores.PerformItems.slots = #Stores.PerformItems.items
for k in pairs(Stores.PerformItems.items) do Stores.PerformItems.items[k].slot = k end
Stores.ToolItems.slots = #Stores.ToolItems.items
for k in pairs(Stores.ToolItems.items) do Stores.ToolItems.items[k].slot = k end
Stores.RepairItems.slots = #Stores.RepairItems.items
for k in pairs(Stores.RepairItems.items) do Stores.RepairItems.items[k].slot = k end
Stores.NosItems.slots = #Stores.NosItems.items
for k in pairs(Stores.NosItems.items) do Stores.NosItems.items[k].slot = k end