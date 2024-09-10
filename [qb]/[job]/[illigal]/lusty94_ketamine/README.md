## Lusty94_Ketamine


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================




## Features

- Process ketamine to sell to others or consume and gain buffs with toggle-able effects
- Mine quartz rock, get ether and hydrochloric acid alongside other ingredients to process further
- Consume ketamine for visual screen effects and player buffs such as armour and stress removal
- A chance to overdose if consuming too many drugs with configurable effects
- Consumve overdose cure to reduce your chances of overdosing and coming to an untimely demise!
- Placeable processing table for players to process where they like
- Supplies mission which the player needs to kill peds and search the body to get required items for processing
- Chance to notify police upon failing to find items
- Easily add your own recipes and requirements for processing
- Language settings for custom translations
- Extensive config file


## XP
If you are using the inbuilt XP and Overdose system then you must add these metadata lines below to your player.lua file in core
- new qb method is via the config but you might need to edit how metadata is assigned in server files

- look for the lines that are similair for the hunger and thirst  and stress or other xp types etc
- do not forget to edit this if you have changed your `MetaDataName` inside `config.lua`

```

#old core

PlayerData.metadata['drugxp'] = PlayerData.metadata['drugxp'] or 0 -- Added for lusty94_ketamnine
PlayerData.metadata['overdose'] = PlayerData.metadata['overdose'] or 0 -- Added for lusty94_ketamnine

#new core

drugxp = 0,
overdose = 0,

```


## DEPENDENCIES

* [qb-core](https://github.com/qbcore-framework/qb-core)
* [qb-target](https://github.com/qbcore-framework/qb-target)
* [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
* [qb-phone](https://github.com/qbcore-framework/qb-phone)
* [ox_lib](https://github.com/overextended/ox_lib/releases)



## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place inside inventory/web/images




## OX_INVENTORY SHOPS / STASHES
-- this resource creates shops and stashes automatically, to edit item names or prices go to hornys_server.lua and look for their functions




## ITEMS

```

   --KETAMINE
    --REQUIRED ITEMS    
    pickaxe 			        = {name = 'pickaxe', 			 label = 'Pickaxe', 			            weight = 100, 		 type = 'item', 		image = 'pickaxe.png', 			            unique = false, 	useable = false,    shouldClose = false,	 combinable = nil,   description = ''},
    ketprocessingtable 		    = {name = 'ketprocessingtable',  label = 'Ketamine Processing Table', 	    weight = 200, 		 type = 'item', 	    image = 'ketprocessingtable.png', 	        unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    pressurecooker              = {name = 'pressurecooker',      label = 'Pressure Cooker',                 weight = 100,        type = 'item',         image = 'pressurecooker.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    mortarpestle                = {name = 'mortarpestle',        label = 'Mortar & Pestle',                 weight = 100,        type = 'item',         image = 'mortarpestle.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    butane_gas                  = {name = 'butane_gas',          label = 'Butane Gas',                      weight = 100,        type = 'item',         image = 'butane_gas.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    plasticjerrycan             = {name = 'plasticjerrycan',     label = 'Plastic Jerry Can',               weight = 100,        type = 'item',         image = 'plasticjerrycan.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    
    
    --MATERIALS
    quartz                      = {name = 'quartz',               label = 'Quartz',                         weight = 100,        type = 'item',         image = 'quartz.png',                       unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    ether                       = {name = 'ether',                label = 'Ether',                          weight = 100,        type = 'item',         image = 'ether.png',                        unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    silica                      = {name = 'silica',               label = 'Silica',                         weight = 100,        type = 'item',         image = 'silica.png',                       unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    steviapowder                = {name = 'steviapowder',         label = 'Stevia Powder',                  weight = 100,        type = 'item',         image = 'steviapowder.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    citricacid                  = {name = 'citricacid',           label = 'Citric Acid',                    weight = 100,        type = 'item',         image = 'citricacid.png',                   unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    polyethyleneglycol          = {name = 'polyethyleneglycol',   label = 'Polyethylene Glycol',            weight = 100,        type = 'item',         image = 'polyethyleneglycol.png',           unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    hydrochloricacid            = {name = 'hydrochloricacid',     label = 'Hydrochloric Acid',              weight = 100,        type = 'item',         image = 'hydrochloricacid.png',             unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    noscapine                   = {name = 'noscapine',            label = 'Noscapine',                      weight = 100,        type = 'item',         image = 'noscapine.png',                    unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	papaverine 			        = {name = 'papaverine', 	      label = 'Papaverine', 			        weight = 200, 		 type = 'item', 	    image = 'papaverine.png', 		            unique = false, 	useable = true, 	shouldClose = true,      combinable = nil,   description = ''},
    
    
    --DRUGS
    liquidketamine              = {name = 'liquidketamine',       label = 'Liquid Ketamine',                weight = 100,        type = 'item',         image = 'liquidketamine.png',               unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    ketamine                    = {name = 'ketamine',             label = 'Ketamine',                       weight = 100,        type = 'item',         image = 'ketamine.png',                     unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
	overdosecure                = {name = 'overdosecure',         label = 'Overdose Cure',                  weight = 100,        type = 'item',         image = 'overdosecure.png',                 unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},


```


