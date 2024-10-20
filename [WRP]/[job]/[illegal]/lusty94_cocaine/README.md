## Lusty94_Cocaine


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
- Process cocaine and crack to sell to other players or consume for configurable effects
- Pick coca leaves, get cement, get gasoline and hydrochloric acid to proceess into pure cocaine
- Process pure cocaine, sodium carbonate and bottled water into pure crack
- Bag up cocaine and crack with scales and empty baggies to sell to other players
- Consume cocaine and crack for visual screen effects and player buffs such as armour and stress removal
- A chance to overdose if consuming too many drugs with configurable effects
- Consumve overdose cure to reduce your chances of overdosing and coming to an untimely demise!
- Extensive config file
- Change core settings to suit your server
- Language settings for custom translations




## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place inside inventory/web/images



## XP & OVERDOSE METADATA
If you are using the inbuilt XP and Overdose system then you must add the metadata lines below to your player.lua file in core
-- new qb-core this is now in config file instead
- Insert the following lines around `LINE:90` do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for lusty94_cocaine
PlayerData.metadata['overdose'] = PlayerData.metadata['overdose'] or 0 -- Added for lusty94_cocaine


# IMAGE OF WHAT IT SHOULD LOOK LIKE:
https://cdn.discordapp.com/attachments/1158046707762868384/1167422555519451166/image.png?ex=654e11fa&is=653b9cfa&hm=d21b8c9448cbdc7e27b60019d470997479cad93addff2b75e799604521172244&



## OX INVENTORY USERS - SUPPLIES SHOP

- this resource automatically creates the supply shop for you, to change item names or prices look in cocaine_server.lua for the function
``


## DEPENDENCIES

- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-menu - https://github.com/qbcore-framework/qb-menu
- qb-inventory - https://github.com/qbcore-framework/qb-inventory
- qb-policejob - https://github.com/qbcore-framework/qb-policejob
- ox_lib - https://github.com/overextended/ox_lib/releases




## ITEMS

```

   --cocaine
    
    --REQUIRED ITEMS
    trowel                      = {name = 'trowel',               label = 'Trowel',                     weight = 100,        type = 'item',         image = 'trowel.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    plasticjerrycan             = {name = 'plasticjerrycan',      label = 'Empty Plastic Jerry Can',    weight = 100,        type = 'item',         image = 'plasticjerrycan.png',          unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    cokeprocessingtable 		= {name = 'cokeprocessingtable',  label = 'Coke Processing Table', 		weight = 200, 		 type = 'item', 	    image = 'cokeprocessingtable.png', 		unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    lighter 				    = {name = 'lighter', 			  label = 'Lighter', 				    weight = 0, 		 type = 'item', 		image = 'lighter.png', 				    unique = false, 	useable = true, 	shouldClose = true,	     combinable = nil,   description = ''},

    --MATERIALS
    cocaleaf                    = {name = 'cocaleaf',             label = 'Coca Leaf',                  weight = 100,        type = 'item',         image = 'cocaleaf.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    cement                      = {name = 'cement',               label = 'Cement',                     weight = 100,        type = 'item',         image = 'cement.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    gasoline                    = {name = 'gasoline',             label = 'Gasoline',                   weight = 100,        type = 'item',         image = 'gasoline.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    hydrochloricacid            = {name = 'hydrochloricacid',     label = 'Hydrochloric Acid',          weight = 100,        type = 'item',         image = 'hydrochloricacid.png',         unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    sodiumcarbonate             = {name = 'sodiumcarbonate',      label = 'Sodium Carbonate',           weight = 100,        type = 'item',         image = 'sodiumcarbonate.png',          unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    pure_cocaine                = {name = 'pure_cocaine',         label = 'Pure Cocaine',               weight = 100,        type = 'item',         image = 'pure_cocaine.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    pure_crack                  = {name = 'pure_crack',           label = 'Pure Crack',                 weight = 100,        type = 'item',         image = 'pure_crack.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    water_bottle               = {name = 'water_bottle',        label = 'Bottled Water',              weight = 100,        type = 'item',         image = 'water_bottle.png',            unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	emptybaggies 				= {name = 'emptybaggies', 	  label = 'Empty Baggies', 			    weight = 200, 		 type = 'item', 	    image = 'emptybaggies.png', 			unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	scales 					    = {name = 'scales', 			  label = 'Scales', 			        weight = 200, 		 type = 'item', 	    image = 'scales.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	acetone 					= {name = 'acetone', 			  label = 'Acetone', 			        weight = 200, 		 type = 'item', 	    image = 'acetone.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	dimethylformamide 			= {name = 'dimethylformamide', 	  label = 'Dimethylformamide', 			weight = 200, 		 type = 'item', 	    image = 'dimethylformamide.png', 		unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	iodine 			            = {name = 'iodine', 	          label = 'Iodine', 			        weight = 200, 		 type = 'item', 	    image = 'iodine.png', 		            unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    overdosecure                = {name = 'overdosecure',         label = 'Overdose Cure',              weight = 100,        type = 'item',         image = 'overdosecure.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    
    --DRUGS
    coke_baggy                 = {name = 'coke_baggy',            label = 'Bag of Cocaine',             weight = 100,        type = 'item',         image = 'coke_baggy.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    crack_baggy                = {name = 'crack_baggy',           label = 'Bag of Crack',               weight = 100,        type = 'item',         image = 'crack_baggy.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},



```


