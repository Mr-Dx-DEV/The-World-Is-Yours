----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

# BOII | DEVELOPMENT - DRUGS; DRUG SYSTEM

Here we have a in depth drug system for your citizens to enjoy!
Comes pre setup with 61 levels for citizen to grind. XP system increases rewards throughout.
Pre setup police alerts all throughout.
Drug system included all of our currently drug releases; coke, meth, heroin, weed, drug sales.
Enjoy :)

### INSTALL ###

1) Customise `shared/config.lua` and `shared/language.lua` to your liking
2) Drag and drop `boii-drugs` into your server resources
3) Add `boii-drugs` to your server.cfg
4) Add the sql provided `outdoor_plants.sql` into your servers database
5) Insert the line under **QB-CORE/SERVER/PLAYER.LUA** into your `qb-core/server/player.lua` in order for your xp to work correctly
6) Add item information provided under **QB-CORE/SHARED.ITEMS.LUA** into your `qb-core/shared/items.lua`
7) Copy the item images from `html/images/*` into your `qb-inventory/html/images` **DO NOT COPY THE FOLDERS ONLY THE IMAGES**
8) Follow the instructions provided under **QB-SHOPS/CONFIG.LUA** to remove the base smoke on the store and add aditional items required by script
9) Restart your server

### QB-CORE/SERVER/PLAYER.LUA ###
-- Insert the following line around `LINE:80` do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for drugs

### QB-SHOPS/CONFIG.LUA ###
-- In your qb-shops `config.lua` remove the following store information

["weedshop"] = {
        ["label"] = "Smoke On The Water",
        ["coords"] = vector4(-1171.31, -1570.89, 4.66, 130.03),
        ["ped"] = 'a_m_y_hippy_01',
        ["scenario"] = "WORLD_HUMAN_AA_SMOKE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-cannabis",
        ["targetLabel"] = "Open Weed Shop",
        ["products"] = Config.Products["weedshop"],
        ["showblip"] = true,
        ["blipsprite"] = 140,
        ["blipcolor"] = 0
    },

-- Head to `qb-shops/config.lua` and insert the following lines 

-- Normal stores **you can put this anywhere do not forget to edit accordingly if you have edited in config**

        [14] = {
            name = "sodiumbicarbonate",
            price = 8,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },

-- Hardware stores **you can put these anywhere do not forget to edit accordingly if you have edited in config**

        [18] = {
            name = "plasticjerrycan",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "trowel",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "razorblade",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "ammonia",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 21,
        },


### QB-CORE/SHARED.ITEMS.LUA ###

    --<!>-- BOII DRUGS --<!>--
    -- Drugsales
	['burnerphone']                	 = {['name'] = 'burnerphone',               	['label'] = 'Burner Phone',             ['weight'] = 250,       ['type'] = 'item',      ['image'] = 'burnerphone.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A burner phone, what do you need one of these for?'},

    -- Weed
    -- Tools
	['drug_shears'] 			    = {['name'] = 'drug_shears', 		        	['label'] = 'Trimming Shears', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'drug_shears.png', 					['unique'] = false,    	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A set of high quality trimming shears.'},	
	['drug_scales'] 		 	    = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
    ['drug_grinder'] 		 	    = {['name'] = 'drug_grinder', 					['label'] = 'Grinder', 					['weight'] = 150, 	    ['type'] = 'item', 		['image'] = 'drug_grinder.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A grinder for grinding herbs.. or other things..'},
	['rollingpapers'] 				= {['name'] = 'rollingpapers', 					['label'] = 'Rolling Papers', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'rollingpapers.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	['lighter'] 			 		= {['name'] = 'lighter', 						['label'] = 'Lighter', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A lighter, everybody has to have one of these on hand!'},
	['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			    ['label'] = 'Resealable Bag', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['weed_fertilizer'] 			= {['name'] = 'weed_fertilizer', 				['label'] = 'Big Bud Fertilizer', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weed_fertilizer.png', 		        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	  	['combinable'] = nil,   ['description'] = 'Get that big bug energy!'},
	['distilled_water'] 				    = {['name'] = 'distilled_water', 			    	['label'] = 'Distilled Water', 		    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'distilled_water.png', 		            ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Distilled water for your plants or other uses..'},
	['trowel'] 			 	         = {['name'] = 'trowel', 			  			['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	
	-- Seeds
	-- Male
	['weed_skunk_seed_m'] 			= {['name'] = 'weed_skunk_seed_m', 				['label'] = 'Skunk: Seed (M)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male skunk seed!'},
	['weed_og-kush_seed_m'] 		= {['name'] = 'weed_og-kush_seed_m', 			['label'] = 'OG-Kush: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male og-kush seed!'},
	['weed_white-widow_seed_m'] 	= {['name'] = 'weed_white-widow_seed_m', 		['label'] = 'White-Widow: Seed (M)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male white-widow seed!'},
	['weed_ak47_seed_m'] 			= {['name'] = 'weed_ak47_seed_m', 				['label'] = 'AK47: Seed (M)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male ak47 seed!'},
	['weed_amnesia_seed_m'] 		= {['name'] = 'weed_amnesia_seed_m', 			['label'] = 'Amnesia: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male amnesia seed!'},
	['weed_purple-haze_seed_m'] 	= {['name'] = 'weed_purple-haze_seed_m', 		['label'] = 'Purple-Haze: Seed (M)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male purple-haze seed!'},
	['weed_gelato_seed_m'] 			= {['name'] = 'weed_gelato_seed_m', 			['label'] = 'Gelato: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male gelato seed!'},
	['weed_zkittlez_seed_m'] 		= {['name'] = 'weed_zkittlez_seed_m', 			['label'] = 'Zkittlez: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male zkittlez seed!'},

	-- Feminized
	['weed_skunk_seed_f'] 			= {['name'] = 'weed_skunk_seed_f', 				['label'] = 'Skunk: Seed (F)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized skunk seed.'},
	['weed_og-kush_seed_f'] 		= {['name'] = 'weed_og-kush_seed_f', 			['label'] = 'OG-Kush: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized og-kush seed.'},
	['weed_white-widow_seed_f'] 	= {['name'] = 'weed_white-widow_seed_f', 		['label'] = 'White-Widow: Seed (F)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized white-widow seed.'},
	['weed_ak47_seed_f'] 			= {['name'] = 'weed_ak47_seed_f', 				['label'] = 'AK47: Seed (F)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized ak47 seed.'},
	['weed_amnesia_seed_f'] 		= {['name'] = 'weed_amnesia_seed_f', 			['label'] = 'Amnesia: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized amnesia seed.'},
	['weed_purple-haze_seed_f'] 	= {['name'] = 'weed_purple-haze_seed_f', 		['label'] = 'Purple-Haze: Seed (F)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized purple-haze seed.'},
	['weed_gelato_seed_f'] 			= {['name'] = 'weed_gelato_seed_f', 			['label'] = 'Gelato: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized gelato seed.'},
	['weed_zkittlez_seed_f'] 		= {['name'] = 'weed_zkittlez_seed_f', 			['label'] = 'Zkittlez: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized zkittlez seed.'},
	
	-- Crops
	['weed_skunk_crop'] 			= {['name'] = 'weed_skunk_crop', 				['label'] = 'Skunk: Crop', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_skunk_crop.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest skunk flower!'},
	['weed_og-kush_crop'] 			= {['name'] = 'weed_og-kush_crop', 				['label'] = 'OG-Kush: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_og-kush_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest og-kush flower!'},
	['weed_white-widow_crop'] 		= {['name'] = 'weed_white-widow_crop', 			['label'] = 'White-Widow: Crop', 		['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_white-widow_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest white-widow flower!'},
	['weed_ak47_crop'] 				= {['name'] = 'weed_ak47_crop', 				['label'] = 'AK47: Crop', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_ak47_crop.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest ak47 flower!'},
	['weed_amnesia_crop'] 			= {['name'] = 'weed_amnesia_crop', 				['label'] = 'Amnesia: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_amnesia_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest amnesia flower!'},
	['weed_purple-haze_crop'] 		= {['name'] = 'weed_purple-haze_crop', 			['label'] = 'Purple-Haze: Crop', 		['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest purple-haze flower!'},
	['weed_gelato_crop'] 			= {['name'] = 'weed_gelato_crop', 				['label'] = 'Gelato: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_gelato_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest gelato flower!'},
	['weed_zkittlez_crop'] 			= {['name'] = 'weed_zkittlez_crop', 			['label'] = 'Zkittlez: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest zkittlez flower!'},

	-- Bags 
	['weed_skunk'] 				  	= {['name'] = 'weed_skunk', 			 		['label'] = 'Skunk: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_skunk.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest skunk flower!'},
	['weed_og-kush'] 				= {['name'] = 'weed_og-kush', 			 		['label'] = 'OG-Kush: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_og-kush.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest og-kush flower!'},
	['weed_white-widow'] 			= {['name'] = 'weed_white-widow', 				['label'] = 'White-Widow: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_white-widow.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest white-widow flower!'},
	['weed_ak47'] 				    = {['name'] = 'weed_ak47', 			 			['label'] = 'AK47: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_ak47.png', 			        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest ak47 flower!'},
	['weed_amnesia'] 				= {['name'] = 'weed_amnesia', 			 		['label'] = 'Amnesia: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_amnesia.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest amnesia flower!'},
	['weed_purple-haze'] 			= {['name'] = 'weed_purple-haze', 				['label'] = 'Purple-Haze: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_purple-haze.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest purple-haze flower!'},
	['weed_gelato'] 				= {['name'] = 'weed_gelato', 			 		['label'] = 'Gelato: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_gelato.png', 			    	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest gelato flower!'},
	['weed_zkittlez'] 			 	= {['name'] = 'weed_zkittlez', 					['label'] = 'Zkittlez: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_zkittlez.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest zkittlez flower!'},

	-- Joint
	['weed_skunk_joint'] 			= {['name'] = 'weed_skunk_joint', 				['label'] = 'Skunk: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest skunk!'},
	['weed_og-kush_joint'] 			= {['name'] = 'weed_og-kush_joint', 			['label'] = 'OG-Kush: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_joint.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest og-kush!'},
	['weed_white-widow_joint'] 		= {['name'] = 'weed_white-widow_joint', 		['label'] = 'White-Widow: Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest white-widow!'},
	['weed_ak47_joint'] 			= {['name'] = 'weed_ak47_joint', 				['label'] = 'AK47: Joint', 				['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_joint.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest ak47!'},
	['weed_amnesia_joint'] 			= {['name'] = 'weed_amnesia_joint', 			['label'] = 'Amnesia: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_joint.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest amnesia!'},
	['weed_purple-haze_joint'] 		= {['name'] = 'weed_purple-haze_joint', 		['label'] = 'Purple-Haze: Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest purple-haze!'},
	['weed_gelato_joint'] 		 	= {['name'] = 'weed_gelato_joint', 				['label'] = 'Gelato: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest gelato!'},
	['weed_zkittlez_joint'] 		= {['name'] = 'weed_zkittlez_joint', 			['label'] = 'Zkittlez: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest zkittlez!'},

    -- Heroin
	-- Tools
	['razorblade'] 			 		 = {['name'] = 'razorblade', 					['label'] = 'Razor Blade', 				['weight'] = 10, 		['type'] = 'item', 		['image'] = 'razorblade.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A sharp razorblade, be careful not to cut yourself!'},
	['syringe'] 			 		 = {['name'] = 'syringe', 						['label'] = 'Syringe', 					['weight'] = 50, 		['type'] = 'item', 		['image'] = 'syringe.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A sterile syringe, dont share!'},
	['plasticjerrycan'] 			 = {['name'] = 'plasticjerrycan', 				['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
	['emptyvial'] 			 		 = {['name'] = 'emptyvial', 					['label'] = 'Empty Vial', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'emptyvial.png', 			['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty sterile vial for storing liquid meds.'},
	['drug_scales'] 		 	     = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
	['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 				['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},


	-- Drug materials
	['cement'] 						 = {['name'] = 'cement',			 			['label'] = 'Cement', 			    	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cement.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Just a regular bag of builders cement.'},	
	['slakedlime'] 			 		 = {['name'] = 'slakedlime', 					['label'] = 'Slaked Lime', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'slakedlime.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Supposed to be used in preparation of dry mixer for painting and white washing.. However..'},
	['ammonia'] 			 		 = {['name'] = 'ammonia', 						['label'] = 'Ammonia', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ammonia.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Ammonia is a colorless, highly irritating gas with a pungent, suffocating odor.'},
	['aceticacid'] 			 		 = {['name'] = 'aceticacid', 					['label'] = 'Acetic Acid', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'aceticacid.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Acetic Acid is a clear colourless liquid which has a pungent, vinegar-like odour.'},
	['hydrochloricacid'] 			 = {['name'] = 'hydrochloricacid', 				['label'] = 'Hydrochloric Acid', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'hydrochloricacid.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'Disolves food pretty well..'},
	['ether'] 			 		 	 = {['name'] = 'ether', 						['label'] = 'Petroleum Ether', 		    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ether.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Petroleum ether is the petroleum fraction consisting of aliphatic hydrocarbons, commonly used as a laboratory solvent.'},
	['sodiumcarbonate'] 			 = {['name'] = 'sodiumcarbonate', 				['label'] = 'Sodium Carbonate', 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'sodiumcarbonate.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Sodium Carbonate is the disodium salt of carbonic acid with alkalinizing property.'},
	['opium'] 			 		 	 = {['name'] = 'opium', 						['label'] = 'Opium Sap', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'opium.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Opium, do you know how to refine it?'},
	['morphinebase'] 				 = {['name'] = 'morphinebase', 					['label'] = 'Morphine Base', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'morphinebase.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Morphine base. You can turn this into morphine or heroin.'},
	['heroinbase'] 				 	 = {['name'] = 'heroinbase', 					['label'] = 'Heroin Base', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'heroinbase.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin base. Refine this into heroin powder.'},
	['sterilewater'] 			 	 = {['name'] = 'sterilewater', 					['label'] = 'Sterile Water', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'sterilewater.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A vial of sterile water for injecting meds.'},

	-- Drugs
	['morphine'] 			 		 = {['name'] = 'morphine', 						['label'] = 'Morphine', 				['weight'] = 10, 		['type'] = 'item', 		['image'] = 'morphine.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Morphine. Good for pain but also a good time!'},
    ['morphinebaggy'] 			 	= {['name'] = 'morphinebaggy', 				['label'] = 'Bag of Morphine', 				['weight'] = 1, 		['type'] = 'item', 		['image'] = 'morphinebaggy.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  	['combinable'] = nil,   ['description'] = 'Morphine. Good for pain but also a good time!'},
    ['heroin_1oz'] 			 	 	 = {['name'] = 'heroin_1oz', 					['label'] = 'Ounce of Heroin', 			['weight'] = 280, 		['type'] = 'item', 		['image'] = 'heroin_1oz.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A large amount of heroin.'},
	['heroinbaggy'] 			 	 = {['name'] = 'heroinbaggy', 					['label'] = 'Bag of Heroin', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'heroinbaggy.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin. Destroying lives since 1898!'},
	['liquidheroin'] 			 	 = {['name'] = 'liquidheroin', 					['label'] = 'Liquid Heroin', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'liquidheroin.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin. Destroying lives since 1898!'},

    -- Meth
   -- Tools
	['plasticjerrycan'] 			= {['name'] = 'plasticjerrycan', 			['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
	['trowel'] 			 	        = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Just a simple gardening tool.'},
	['drug_scales'] 		 	    = {['name'] = 'drug_scales', 				['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
	['drug_cuttingkit'] 			= {['name'] = 'drug_cuttingkit', 			['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},
	['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			['label'] = 'Resealable Bags', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 		        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A small empty bag'},
	
	-- Drug Materials
    ['hydrochloricacid'] 			= {['name'] = 'hydrochloricacid', 			['label'] = 'Hydrochloric Acid', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'hydrochloricacid.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Disolves food pretty well..'},
	['acetone'] 					= {['name'] = 'acetone', 					['label'] = 'Acetone', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'acetone.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A highly volitile and flamable liquid..'},
	['lithium'] 			 	    = {['name'] = 'lithium', 					['label'] = 'Lithium', 				    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'lithium.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Lithium, for batteries or maybe or things?'},
 	['methylamine'] 			 	= {['name'] = 'methylamine', 				['label'] = 'Methylamine', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'methylamine.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Methylamine? What is this breaking bad?'},
	-- Drugs
	['meth'] 			 	        = {['name'] = 'meth', 						['label'] = '1g of Meth', 			    ['weight'] = 10, 		['type'] = 'item', 		['image'] = 'meth.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A gram of the finest teeth rotting goodness!'},	
	['meth_1oz'] 			 	    = {['name'] = 'meth_1oz', 					['label'] = 'Ounce of Meth', 			['weight'] = 280, 		['type'] = 'item', 		['image'] = 'meth_1oz.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A ounce of the finest teeth rotting goodness!'},	

    -- Cocaine
	-- Tools
	['drug_scales'] 		 	     = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
	['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 				['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},
	['plasticjerrycan'] 			 = {['name'] = 'plasticjerrycan', 				['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
	['trowel'] 			 	         = {['name'] = 'trowel', 			  			['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
	['lighter'] 				 	 = {['name'] = 'lighter', 			  	  		['label'] = 'Lighter', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'On new years eve a nice fire to stand next to'},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},

	-- Drug materials
	['cement'] 						 = {['name'] = 'cement',			 			['label'] = 'Cement', 			    	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cement.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Just a regular bag of builders cement.'},	
	['cocaleaf'] 				     = {['name'] = 'cocaleaf', 						['label'] = 'Cocaine Leaf', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'cocaineleaf.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,  		['combinable'] = nil,   ['description'] = 'Makes that premium nose candy!'},	
	['sodiumbicarbonate'] 			 = {['name'] = 'sodiumbicarbonate', 			['label'] = 'Baking Soda', 			    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sodiumbicarbonate.png', 			['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Baking soda ey? What you cooking?'},	
	['illegalgasoline'] 			 = {['name'] = 'illegalgasoline', 				['label'] = 'Illegal Gasoline', 		['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'illegalgasoline.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Stolen gasoline? What are you doing with this?'},
	['benzocaine'] 					 = {['name'] = 'benzocaine', 			  		['label'] = 'Benzocaine', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'benzocaine.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Benzo? You got a toothache mate?'},
    ['water_jerrycan'] 				 = {['name'] = 'water_jerrycan', 			['label'] = 'Water Jerrycan', 				['weight'] = 3500, 		['type'] = 'item', 		['image'] = 'water_jerrycan.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Water from a tanker.. it could be a dirty but who cares..'},
	
    -- Drugs
	['cokebaggy'] 					 = {['name'] = 'cokebaggy', 			  		['label'] = '1g Bag of Coke', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'cocaine_baggy.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A gram of the finest nose candy!'},
	['coke_1oz'] 					 = {['name'] = 'coke_1oz', 			  	  		['label'] = 'Ounce of Cocaine', 	    ['weight'] = 280, 		['type'] = 'item', 		['image'] = 'coke_1oz.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A ounce of the finest nose candy!'},
	['crack_1oz'] 				     = {['name'] = 'crack_1oz', 			  		['label'] = 'Ounce of Crack', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'crack_1oz.png', 		            ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	        ['combinable'] = nil,   ['description'] = 'For all the thirsty out there'},
	['crack_baggy'] 			     = {['name'] = 'crack_baggy', 			  		['label'] = '1g Bag of Crack', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'crack_baggy.png', 		            ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,         ['combinable'] = nil,   ['description'] = 'Man your about to lose some teeth!'},

   --<!>-- KETAMINE --<!>--
   -- Tools
   ['tracker_remover']                	 = {['name'] = 'tracker_remover',               	['label'] = 'Tracking Chip Remover',             ['weight'] = 1000,       ['type'] = 'item',      ['image'] = 'tracker_remover.png',        	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A tracking chip remover!'},

   -- Processing
   ['liquidketamine']                	 = {['name'] = 'liquidketamine',               	['label'] = 'Liquid Ketamine',             ['weight'] = 500,       ['type'] = 'item',      ['image'] = 'liquidketamine.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A vial of liquid ketamine!'},

   -- Drugs
   ['ketamine_1oz']                	 = {['name'] = 'ketamine_1oz',               	['label'] = 'Ounce of Ketamine',             ['weight'] = 2800,       ['type'] = 'item',      ['image'] = 'ketamine_1oz.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A ounce of ketamine!'},
   ['ketamine']                	 = {['name'] = 'ketamine',               	['label'] = 'Bag of Ketamine',             ['weight'] = 100,       ['type'] = 'item',      ['image'] = 'ketamine.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A bag of ketamine!'},

### NOTES ###

Planting;

```
-- How the planting seeds event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "GENDER", "GROWTH RATE", "DEGRADE", "XP"
 
-- "ITEM NAME" - This carries the name of the seed you planted to be removed/returned
-- "STRAIN" - This should match your settings in `harvest_sv.lua`
-- "GENDER" - This should match your settings in `harvest_sv.lua`
-- "GROWTH RATE" - How much plants should grow per update tick, 100 = 1%. Default rate: 1% every 1min
-- "DEGRADE" - How much food/water/quality should decay per update tick, 100 = 1%. Default rate: food/water 1% every 1min, quality 0.5% every 1min
-- "XP" - Amount of XP to gain when planting seed

- Example
Core.Functions.CreateUseableItem('weed_skunk_seed_m', function(source, item)
    -- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "GENDER", "GROWTH RATE", "DEGRADE", "XP"
    TriggerClientEvent('boii-weed:cl:PlantSeed', source, item.name, 'Skunk', 'Male', 100, 100, math.random(1,3))
end)
```

Trimming;

```
-- How the trimming event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "BAG ITEM", "AMOUNT"

-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `trimming_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `trimming_sv.lua`
-- "BAG ITEM" - Name of bag item to remove when trimming
-- "AMOUNT" - Amount of bags to remove/return this is affected by your settings in `trimming_sv.lua`

-- Example
Core.Functions.CreateUseableItem('weed_skunk_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    -- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "BAG ITEM", "AMOUNT"
                    TriggerClientEvent('boii-weed:cl:Trim', source, item.name, 'Skunk', 'weed_skunk', bags, bagamount)
                else
                    TriggerClientEvent('boii-weed:notify', source, Language.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-weed:notify', source, Language.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Trimming['noshears'], 'error')
    end
end)
```

Rolling;

```
-- How the joint rolling event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "PAPERS ITEM", "AMOUNT"

-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `rolling_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `rolling_sv.lua`
-- "PAPERS ITEM" - Name of papers item to remove when rolling
-- "AMOUNT" - Amount of papers to remove and joints to return

-- Example
Core.Functions.CreateUseableItem('weed_skunk', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required.name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required.amount
    if pData.Functions.GetItemByName(papers) ~= nil then
        if pData.Functions.GetItemByName(papers).amount >= papersamount then
            -- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "PAPERS ITEM", "AMOUNT"
            TriggerClientEvent('boii-weed:cl:Roll', source, item.name, 'Skunk', 'weed_skunk_joint', papers, papersamount)
        else
            TriggerClientEvent('boii-weed:notify', source, Language.Rolling['enoughpapers'], 'error')
        end
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Rolling['nopapers'], 'error')
    end
end)
```

Smoking; 

```
-- How the smoking event works
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS"

-- "ITEM NAME" - Name of joint
-- "ARMOUR" - Amount of armour added by smoking joint
-- "STRESS" - Amount of stress removed by smoking joint
-- "TIME" - Amount of time drug effects should remain active in minutes

-- Example
Core.Functions.CreateUseableItem('weed_skunk_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        -- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS"
        TriggerClientEvent('boii-weed:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-weed:notify', source, Language.Smoking['nolighter'], 'error')
    end
end)
```

### PREVIEW ###
PREVIEW COMING SOON

### SUPPORT ###
https://discord.gg/MUckUyS5Kq
