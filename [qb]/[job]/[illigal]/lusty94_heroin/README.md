## Lusty94_Heroin


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================



- Process heroin to sell to other players or consume for configurable effects
- Pick opium plants, steal lime, ether and hydrochloric acid to make heroin base
- Process heroin base, acetone and noscapine to make pure heroin
- Make a vial of heroin using the pure heroin, scales and empty vials
- Consume heroin for visual screen effects and player buffs such as armour and stress removal
- A chance to overdose if consuming too many drugs with configurable effects
- Consume overdose cure to reduce your chances of overdosing and coming to an untimely demise!
- Support for qb-policejob and ps-dispatch for police alerts
- Extensive config file
- Change core settings to suit your server such as progressbar timers, notify lengths, event names, cooldown timers, prop types and much more
- Language settings for custom translations




## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place inside inventory/web/images



## DRUG XP AND OVERDOSE XP
If you are using the inbuilt XP and overdose system then you must add the metadata lines below to your player.lua file in core
- new qb method is via the config but you might need to edit how metadata is assigned in server files

- look for the lines that are similair for the hunger and thirst  and stress or other xp types etc
- do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

```

#old core

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for lusty94_heroin
PlayerData.metadata['overdosexp'] = PlayerData.metadata['overdosexp'] or 0 -- Added for lusty94_heroin

#new core

drugxp = 0,
overdosexp = 0,

```


## OX INVENTORY USERS - SUPPLIES SHOP

- this resource automatically creates the supply shop for you, to change item names or prices look in heroin_server.lua for the function



## DEPENDENCIES

- QB-CORE - https://github.com/qbcore-framework/qb-core
- QB-TARGET - https://github.com/qbcore-framework/qb-target
- QB-MENU - https://github.com/qbcore-framework/qb-menu
- QB-INVENTORY - https://github.com/qbcore-framework/qb-inventory
- QB-POLICEJOB - https://github.com/qbcore-framework/qb-policejob
- QB-PHONE - https://github.com/qbcore-framework/qb-phone
- OX_LIB - https://github.com/overextended/ox_lib/releases




## ITEMS

```

    -- HEROIN
    
    --REQUIRED ITEMS
    trowel                      = {name = 'trowel',               label = 'Trowel',                     weight = 100,        type = 'item',         image = 'trowel.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    plasticjerrycan             = {name = 'plasticjerrycan',      label = 'Empty Plastic Jerry Can',    weight = 100,        type = 'item',         image = 'plasticjerrycan.png',          unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    dirtyneedle 				= {name = 'dirtyneedle', 		  label = 'Dirty Needle', 				weight = 100, 		 type = 'item', 		image = 'dirtyneedle.png', 				unique = false, 	useable = true, 	shouldClose = true,	     combinable = nil,   description = ''},
    heroinprocessingtable 		= {name = 'heroinprocessingtable',label = 'Heroin Processing Table', 	weight = 200, 		 type = 'item', 	    image = 'heroinprocessingtable.png', 	unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    
    --MATERIALS
    opiumsap                    = {name = 'opiumsap',             label = 'Opium Sap',                  weight = 100,        type = 'item',         image = 'opiumsap.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    limepowder                  = {name = 'limepowder',           label = 'Lime Powder',                weight = 100,        type = 'item',         image = 'limepowder.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    hydrochloricacid            = {name = 'hydrochloricacid',     label = 'Hydrochloric Acid',          weight = 100,        type = 'item',         image = 'hydrochloricacid.png',         unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	acetone 					= {name = 'acetone', 			  label = 'Acetone', 			        weight = 200, 		 type = 'item', 	    image = 'acetone.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    noscapine                   = {name = 'noscapine',            label = 'Noscapine',                  weight = 100,        type = 'item',         image = 'noscapine.png',                unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	papaverine 			        = {name = 'papaverine', 	      label = 'Papaverine', 			    weight = 200, 		 type = 'item', 	    image = 'papaverine.png', 		        unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    heroin_base                 = {name = 'heroin_base',          label = 'Heroin Base',                weight = 100,        type = 'item',         image = 'heroin_base.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    pure_heroin                 = {name = 'pure_heroin',          label = 'Pure Heroin',                weight = 100,        type = 'item',         image = 'pure_heroin.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    emptyvial 				    = {name = 'emptyvial', 	          label = 'Empty Vial', 			    weight = 200, 		 type = 'item', 	    image = 'emptyvial.png', 			    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
	scales 					    = {name = 'scales', 			  label = 'Scales', 			        weight = 200, 		 type = 'item', 	    image = 'scales.png', 				    unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    
    --DRUGS
    heroin_vial                 = {name = 'heroin_vial',          label = 'Vioal of Heroin',            weight = 100,        type = 'item',         image = 'heroin_vial.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	overdosecure                = {name = 'overdosecure',         label = 'Overdose Cure',              weight = 100,        type = 'item',         image = 'overdosecure.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},


```


