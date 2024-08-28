----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

# BOII | DEVELOPMENT - BUSINESS: BILLIARDS BAR #

Here we have an indepth job for your billiards bar mlo!
Script covers everything you could want from a bar work job!
You can pull pints, hard liquor, mix cocktails, prepare food or even make your citizens a coffee for the drive home!
Enjoy!

### USAGE ###

- Target trays to collect orders
- Target EPOS to make sales
- Target bar pumps to pull pints
- Target liquor rack to pull liquor
- Target cocktail jug to make cocktails
- Target coffee machine to make hot drinks
- Target microwave to make microwave meals
- Target drinks fridge to purchase drinks
- Target mini fridge to purchase ingredients
- Target large fridge for job storage
- Target cups on shelves to take/store clean cups
- Target plates on counter to take/store clean plates
- Target glasses on counter to store/take clean glasses
- Target sinks to wash hands/face/dishes
- Target ifruit pc to clock in/out
- Target ceo table for job management
- Target safe in ceo room for boss storage
- Target clothing rack to change outfits
- Target wines on shelves to purchase wines
- Target garage ped to take/store vehicle
- Target any storage location as `police` to force entry into storage
- Use food items to consume
- Combine drinks *(water, cocacola, pepsi etc)* with glasses to make glass of "drink"
- Combine soft drinks *(cocacola, lemonade)* with glasses of liquor to make glass of "drink"
- Combine glass of whiskey with cup of coffee to make irish coffee

### DEPENDENCIES ###
-- `boii-consumables` v2.0.0 is required for this script to function.

PREVIEW - updated preview coming soon
DOWNLOAD - https://boii.tebex.io/package/5140964 or https://github.com/boiidevelopment/boii-consumables-qb 

### INSTALL ###

1) Ensure you have `boii-consumables` in your server resources as this is required for script to function
2) Drag and drop `boii-billiardsbar` into your server resources
2) Add `ensure boii-billiardsbar` to your server.cfg if required
3) Copy images from `boii-billiardsbar/html/images/*` into your inventory images. Default; `qb-inventory/html/images`
4) Copy the job information provided under **SHARED/JOBS.LUA** into your `qb-core/shared/jobs.lua`
5) Copy the job information provided under **SHARED/ITEMS.LUA** into your `qb-core/shared/items.lua`
6) Adjust `shared/config.lua` & `shared/language.lua` to fit your server requirements
7) Restart your server.

### SHARED/JOBS.LUA ###

    ['billiards'] = {
		label = 'billiards',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Dishwasher',
                payment = 50
            },
			['1'] = {
                name = 'Wait Staff',
                payment = 75
            },
			['2'] = {
                name = 'Deliveries',
                payment = 100
            },
			['3'] = {
                name = 'Bartender',
                payment = 125
            },
			['4'] = {
                name = 'Floor Manager',
                payment = 150
            },
			['5'] = {
                name = 'General Manager',
				isboss = true,
                payment = 175
            },
			['6'] = {
                name = 'Owner',
				isboss = true,
                payment = 200
            },
        },
	},


### SHARED/ITEMS.LUA ###

	--<!>-- BILLIARDS BAR --<!>--
	-- Items
	['clean_plate'] 				= {['name'] = 'clean_plate', 			    	['label'] = 'Clean Plate', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_plate.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean dinner plate!'},
	['dirty_plate'] 				= {['name'] = 'dirty_plate', 			    	['label'] = 'Dirty Plate', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_plate.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty dinner plate!'},
	['clean_cup'] 					= {['name'] = 'clean_cup', 			    		['label'] = 'Clean Cup', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_cup.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean cup!'},
	['dirty_cup'] 					= {['name'] = 'dirty_cup', 			    		['label'] = 'Dirty Bowl', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_cup.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty cup!'},
	['clean_glass'] 				= {['name'] = 'clean_glass', 			    	['label'] = 'Clean Glass', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_glass.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean glass!'},
	['dirty_glass'] 				= {['name'] = 'dirty_glass', 			    	['label'] = 'Dirty Glass', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_glass.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty glass!'},
	['clean_smallglass'] 			= {['name'] = 'clean_smallglass', 			    ['label'] = 'Clean Small Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_smallglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean small glass!'},
	['dirty_smallglass'] 			= {['name'] = 'dirty_smallglass', 			    ['label'] = 'Dirty Small Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_smallglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty small glass!'},
	['clean_pintglass'] 			= {['name'] = 'clean_pintglass', 			    ['label'] = 'Clean Pint Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_pintglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean pint glass!'},
	['dirty_pintglass'] 			= {['name'] = 'dirty_pintglass', 			    ['label'] = 'Dirty Pint Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_pintglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty pint glass!'},
	['clean_wineglass'] 			= {['name'] = 'clean_wineglass', 			    ['label'] = 'Clean Wine Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_wineglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean wine glass!'},
	['dirty_wineglass'] 			= {['name'] = 'dirty_wineglass', 			    ['label'] = 'Dirty Wine Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_wineglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty wine glass!'},
	['clean_cocktailglass'] 		= {['name'] = 'clean_cocktailglass', 			['label'] = 'Clean Cocktail Glass', 	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_cocktailglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean cocktail glass!'},
	['dirty_cocktailglass'] 		= {['name'] = 'dirty_cocktailglass', 			['label'] = 'Dirty Cocktail Glass', 	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_cocktailglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty cocktail glass!'},
	['livemouse']         	     	= {['name'] = 'livemouse',         				['label'] = 'Live Mouse',    			['weight'] = 450,       ['type'] = 'item',      ['image'] = 'livemouse.png',     	   	 		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A mouse! A snakes favorite meal!'},
	
	-- Ingredients
	['cherry']            			= {['name'] = 'cherry',             			['label'] = 'Cherry',     				['weight'] = 20,        ['type'] = 'item',      ['image'] = 'cherry.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Cherry!'},
	['lime']            		 	= {['name'] = 'lime',             				['label'] = 'Lime',     				['weight'] = 40,        ['type'] = 'item',      ['image'] = 'lime.png',        		    		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lime!'},
	['lemon']            		 	= {['name'] = 'lemon',             				['label'] = 'Lemon',     				['weight'] = 40,        ['type'] = 'item',      ['image'] = 'lemon.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lemon!'},	
	['pineapple']                	= {['name'] = 'pineapple',             			['label'] = 'Pineapple',     			['weight'] = 60,        ['type'] = 'item',      ['image'] = 'pineapple.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lemon!'},
	['coconut']            		 	= {['name'] = 'coconut',             			['label'] = 'Coconut',     				['weight'] = 80,        ['type'] = 'item',      ['image'] = 'coconut.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Coconut!'},
	['cranberry']            	 	= {['name'] = 'cranberry',             			['label'] = 'Cranberry',     			['weight'] = 20,        ['type'] = 'item',      ['image'] = 'cranberry.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Cranberry!'},
	['apple']              	 		= {['name'] = 'apple',               			['label'] = 'Apple',                	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'apple.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh apple!'},
	['orange']              	 	= {['name'] = 'orange',               			['label'] = 'Orange',                	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'orange.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh orange!'},
	['tomato']              	 	= {['name'] = 'tomato',               			['label'] = 'Tomato',                	['weight'] = 100,      	['type'] = 'item',      ['image'] = 'tomato.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh tomato!'},

	-- Drinks
	['cocacola'] 				 	= {['name'] = 'cocacola', 			  	  		['label'] = 'CocaCola', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'cocacola.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_cocacola', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring a Glass Of CocaCola..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'CocaCola, Taste The Feeling!'},
	['pepsi'] 				 		= {['name'] = 'pepsi', 			  	  			['label'] = 'Pepsi', 					['weight'] = 330, 		['type'] = 'item', 		['image'] = 'pepsi.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_pepsi', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Pepsi..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Every Pepsi Refreshes The World!'},
	['drpepper'] 				 	= {['name'] = 'drpepper', 			  	  		['label'] = 'Dr Pepper', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'drpepper.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_drpepper', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Dr Pepper..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Dr Pepper, whats the worst that can happen!'},
	['mountaindew'] 				= {['name'] = 'mountaindew', 			  	  	['label'] = 'Mountain Dew', 			['weight'] = 330, 		['type'] = 'item', 		['image'] = 'mountaindew.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_mountaindew', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Mountain Dew..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Do the DEW!'},
	['lemonade'] 					= {['name'] = 'lemonade', 			  	  		['label'] = 'Lemonade', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'lemonade.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_lemonade', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Lemonade..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'The Secret Lemonade Drinker!'},
	['water'] 						= {['name'] = 'water', 			  	  			['label'] = 'Water', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'water.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_water', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Water..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Water the way nature intended.'},
    ['glass_cocacola']           	= {['name'] = 'glass_cocacola',             	['label'] = 'Glass of CocaCola',        ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_cocacola.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of cocacola!'},
    ['glass_pepsi']           		= {['name'] = 'glass_pepsi',             		['label'] = 'Glass of Pepsi',       	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_pepsi.png',        			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of pepsi!'},
    ['glass_drpepper']           	= {['name'] = 'glass_drpepper',             	['label'] = 'Glass of Dr Pepper',       ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_drpepper.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of dr pepper!'},
    ['glass_mountaindew']           = {['name'] = 'glass_mountaindew',             	['label'] = 'Glass of Mountain Dew',    ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_mountaindew.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of mountain dew!'},
    ['glass_lemonade']           	= {['name'] = 'glass_lemonade',             	['label'] = 'Glass of Lemonade',    	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_lemonade.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of lemonade!'},
    ['glass_water']           		= {['name'] = 'glass_water',             		['label'] = 'Glass of Water',    		['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_water.png',        			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of water!'},
    ['cup_coffee']                	= {['name'] = 'cup_coffee',                		['label'] = 'Cup of Coffee',            ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'cup_coffee.png',            		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'glass_whiskey'}, reward = 'irishcoffee', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Making Irish Coffee..', ['timeOut'] = math.random(3550,6500)}},   ['description'] = 'A cup of coffee.'},
	['cup_tea']                	 	= {['name'] = 'cup_tea',                			['label'] = 'Cup of Tea',               ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'cup_tea.png',            			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cup of tea.'},
 
	
	-- Alocohol
    ['pint_ambeer']              	= {['name'] = 'pint_ambeer',               		['label'] = 'Pint of AM Beer',          ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_ambeer.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Morning sun!'},
    ['pint_piswasser']           	= {['name'] = 'pint_piswasser',            		['label'] = 'Pint of Piswasser',        ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_piswasser.png',       		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Your in for a good time!'},
    ['pint_logger']              	= {['name'] = 'pint_logger',               		['label'] = 'Pint of Logger',           ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_logger.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'The beer that brings the forest down!'},
    ['pint_dusche']              	= {['name'] = 'pint_dusche',               		['label'] = 'Pint of Dusche Gold',      ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_dusche.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Golden shower!'},
    ['glass_whiskey']            	= {['name'] = 'glass_whiskey',             		['label'] = 'Glass of Whiskey',         ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_whiskey.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'cocacola'}, reward = 'glass_whiskeycoke', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Whiskey and Coke..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of whiskey!'},
    ['glass_vodka']              	= {['name'] = 'glass_vodka',               		['label'] = 'Glass of Vodka',           ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_vodka.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'lemonade'}, reward = 'glass_vodkalemon', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Vodka Lemonade..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of vodka!'},
    ['glass_rum']                	= {['name'] = 'glass_rum',                 		['label'] = 'Glass of Rum',             ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_rum.png',          			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'lemonade'}, reward = 'glass_rumlemon', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Rum and Lemonade..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of vodka!'},	
    ['glass_whiskeycoke']        	= {['name'] = 'glass_whiskeycoke',         		['label'] = 'Glass of Whiskey Coke',    ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_whiskeycoke.png',    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of whiskey and coke!'},
    ['glass_rumlemon']          	= {['name'] = 'glass_rumlemon',          		['label'] = 'Glass of Rum Lemonade',  	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_rumlemon.png',     			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of rum lemonade!'},	
	['glass_vodkalemon']         	= {['name'] = 'glass_vodkalemon',          		['label'] = 'Glass of Vodka Lemonade',  ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_vodkalemon.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of vodka lemonade!'},
	['whiskeysour']            	 	= {['name'] = 'whiskeysour',             		['label'] = 'Whiskey Sour',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'whiskeysour.png',        			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Whiskey Sour!'},
	['whiskeysmash']             	= {['name'] = 'whiskeysmash',             		['label'] = 'Whiskey Smash',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'whiskeysmash.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Whiskey Smash!'},
	['bloodandsand']            	= {['name'] = 'bloodandsand',             		['label'] = 'Blood and Sand',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'bloodandsand.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Blood & Sand!'},
	['pinacolada']               	= {['name'] = 'pinacolada',             		['label'] = 'Pina Colada',     	    	['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pinacolada.png',           		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Pina Colada!'},
	['zombie']                  	= {['name'] = 'zombie',             			['label'] = 'Zombie',     	    		['weight'] = 400,       ['type'] = 'item',      ['image'] = 'zombie.png',           			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Zombie!'},
	['maitai']               	 	= {['name'] = 'maitai',             			['label'] = 'Mai Tai',     	    		['weight'] = 400,       ['type'] = 'item',      ['image'] = 'maitai.png',           			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Mai Tai!'},
	['appletini']                	= {['name'] = 'appletini',             			['label'] = 'Appletini',     	    	['weight'] = 400,       ['type'] = 'item',      ['image'] = 'appletini.png',            		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Cubra Libre!'},
	['cosmopolitan']             	= {['name'] = 'cosmopolitan',             		['label'] = 'Cosmopolitan',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'cosmopolitan.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Cosmopolitan!'},
	['bloodymary']             		= {['name'] = 'bloodymary',             		['label'] = 'bloodymary',     	        ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'bloodymary.png',           		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Bloody Mary!'},
	['irishcoffee']              	= {['name'] = 'irishcoffee',               		['label'] = 'Irish Coffee',             ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'irishcoffee.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cup of irish coffee.'},
	['chardonnay'] 				 	= {['name'] = 'chardonnay', 			  	  	['label'] = 'Chardonnay', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'chardonnay.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'Chardonnay for after a really long, hard day.'},
	['barolo'] 				 		= {['name'] = 'barolo', 			  	  		['label'] = 'Barolo', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'barolo.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'The King of Wines and the Wine of Kings.'},
	['pinotgrigio'] 				= {['name'] = 'pinotgrigio', 			  	  	['label'] = 'Pinot Grigio', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'pinotgrigio.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'One should always be drunk. Thats all that matters.'},
	['pinotnoir'] 					= {['name'] = 'pinotnoir', 			  	  		['label'] = 'Pinot Noir', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'pinotnoir.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'If you drink no noir, you will pinot noir.'},
	['glass_chardonnay'] 			= {['name'] = 'glass_chardonnay', 			  	['label'] = 'Glass of Chardonnay', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_chardonnay.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'Chardonnay for after a really long, hard day.'},
	['glass_barolo'] 				= {['name'] = 'glass_barolo', 			  	  	['label'] = 'Glass of Barolo', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_barolo.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'The King of Wines and the Wine of Kings.'},
	['glass_pinotgrigio'] 			= {['name'] = 'glass_pinotgrigio', 			  	['label'] = 'Glass of Pinot Grigio', 	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_pinotgrigio.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'One should always be drunk. Thats all that matters.'},
	['glass_pinotnoir'] 			= {['name'] = 'glass_pinotnoir', 			  	['label'] = 'Glass of Pinot Noir', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_pinotnoir.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'If you drink no noir, you will pinot noir.'},

	-- Food
	['steakpie']         	     	= {['name'] = 'steakpie',         				['label'] = 'Microwavable Steak Pie',   ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'steakpie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable steak pie!'},
	['chickenpie']         	     	= {['name'] = 'chickenpie',         			['label'] = 'Microwavable Chicken Pie', ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'chickenpie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable chicken and mushroom pie!'},
	['meatpie']         	     	= {['name'] = 'meatpie',         				['label'] = 'Microwavable Meat Pie',    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'meatpie.png',     	        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable meat pie!'},
	['cheesepie']         	     	= {['name'] = 'cheesepie',         	    		['label'] = 'Microwavable Cheese Pie',  ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'cheesepie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable cheese and onion pie!'},
	['cookedsteakpie']         	 	= {['name'] = 'cookedsteakpie',         		['label'] = 'Steak Pie',    			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedsteakpie.png',     			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked steak pie!'},
	['cookedchickenpie']         	= {['name'] = 'cookedchickenpie',         		['label'] = 'Chicken Pie',       		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedchickenpie.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked chicken and mushroom pie!'},
	['cookedmeatpie']         	 	= {['name'] = 'cookedmeatpie',         			['label'] = 'Meat Pie',       			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmeatpie.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked meat pie!'},
	['cookedcheesepie']          	= {['name'] = 'cookedcheesepie',         		['label'] = 'Cheese Pie',       		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedcheesepie.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked cheese and onion pie!'},
	['mwburger']          		 	= {['name'] = 'mwburger',         				['label'] = 'Microwave Burger',   		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable burger!'},
	['mwcburger']          		 	= {['name'] = 'mwcburger',         				['label'] = 'Microwave Cheeseburger',   ['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwcburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable cheeseburger!'},
	['mwbcburger']          	 	= {['name'] = 'mwbcburger',         			['label'] = 'Microwave Bacon Burger',   ['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwbcburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable bacon cheeseburger!'},
	['cookedmwburger']           	= {['name'] = 'cookedmwburger',        			['label'] = 'Burger',   				['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwburger.png',       		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable burger!'},
	['cookedmwcburger']          	= {['name'] = 'cookedmwcburger',        		['label'] = 'Cheeseburger',   			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwcburger.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable cheeseburger!'},
	['cookedmwbcburger']         	= {['name'] = 'cookedmwbcburger',        		['label'] = 'Bacon Cheeseburger',   	['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwbcburger.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable bacon cheeseburger!'},


### PREVIEW ###
COMING SOON

### SUPPORT ###
https://discord.gg/MUckUyS5Kq