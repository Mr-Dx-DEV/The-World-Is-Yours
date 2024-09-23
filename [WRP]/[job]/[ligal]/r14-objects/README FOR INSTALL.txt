     ___                        ___                     ___           ___           ___      
    /\  \         __ __        /\__\                   /\  \         /\  \         /\__\     
   /::\  \       /::\  \      /:/  /                  /::\  \       /::\  \       /:/  /     
  /:/\:\  \      \:::\  \    /:/__/                  /:/\:\  \     /:/\:\  \     /:/  /      
 /::\~\:\  \   __ \:::\__\   \:\  \ ___             /:/  \:\__\   /::\~\:\  \   /:/__/   ___ 
/:/\:\ \:\__\ /\ \/:::/  /    \:\  V\__\           /:/__/ \:|__| /:/\:\ \:\__\  |:|  |  /\__\
\/_|::\/:/  / \:\/:::/  /      \:\/:/  /           \:\  \ /:/  / \:\~\:\ \/__/  |:|  | /:/  /
   |:|::/  /   \::::/  /        \::/  /             \:\  /:/  /   \:\ \:\__\    |:|  |/:/  / 
   |:|\/__/     \::/  /         /:/  /               \:\/:/  /     \:\ \/__/    |:|__/:/  / 
   |:|  |        \:\__\        /:/  /                 \::/  /       \:\__\       \::::/  /    
    \|__|         \/__/        \/__/                   \/__/         \/__/        \__/__/      
    
This resource is NOT drag and drop. 
Please do not install this resource unless you are familiar 
with working in lua and Fivem.

If you choose to continue, please follow this guide closely!

**** WARNING: PLEASE MAKE BACKUPS OF YOUR RESOURCES BEFORE INSTALLING ****

----------------------------------

INSTALL INSTRUCTIONS:

1. Drag and drop the r14-objects resource into your server 
files, either place it in an ensured directory, or ensure it via the server config. 

2. You will need to make edits to two key resources, qb-core 
and qb-inventory. These resources are vital to the operation 
of your server, be very careful not to edit anything that is not necessary. 

3. Open the qb-inventory/server.main resource file. You will want to add this event handler
in the events section of the resource. This net event allows items that open an inventory 
to drop their contents on the ground when picked up. While you are here, you can add the
inventory images to the qb-inventory/html/images folder.

------- event handler to be added to qb-inventory/server.main ---------

AddEventHandler('inventory:server:CreateDrop', function(items, coords, player)
	local src = source

	local dropId = CreateDropId()
	Drops[dropId] = {}
	Drops[dropId].coords = coords
	Drops[dropId].createdTime = os.time()

	Drops[dropId].items = items

	TriggerClientEvent("inventory:client:AddDropItem", -1, dropId, player, coords)
end)

----------------

4. Open your qb-core/shared/items.lua or qb-core/shared.lua, this is the resource that
contains all your server items. Here, you will add the following items, along with any
that you wish to add in the future. Paste these inside the QBShared.Items table.

------- items to be added to QBShared.Items ---------

	['cone'] 						 = {['name'] = 'cone', 	  	  					['label'] = 'Cone', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cone.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An orange safety cone, or a hat if you\'ve had enough to drink.'},
	['barricade'] 					 = {['name'] = 'barricade', 	  	  			['label'] = 'Barricade', 				['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'barricade.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A police barricade to close off entry'},
	['roadblock'] 					 = {['name'] = 'roadblock', 	  	  			['label'] = 'Road Block', 				['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'roadblock.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A large sign to block off a road.'},
	['tent'] 						 = {['name'] = 'tent', 	  	  					['label'] = 'Canopy', 					['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'canopy.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable tent.'},
	['light'] 						 = {['name'] = 'light', 	  	  				['label'] = 'Mobile Lighting',			['weight'] = 20000, 	['type'] = 'item', 		['image'] = 'lighting.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable construction light.'},
	['medbag'] 					     = {['name'] = 'medbag', 	  					['label'] = 'Medical Bag', 				['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'medbag.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A medical bag with medical supplies.'},
	['stoppedvehicles'] 			 = {['name'] = 'stoppedvehicles',  	  			['label'] = 'Caution Sign', 			['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'cautionsign.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A sign to warn vehicles of other stopped vehicles ahead.'},
	['generator'] 					 = {['name'] = 'generator', 	  	  			['label'] = 'Generator', 				['weight'] = 20000, 	['type'] = 'item', 		['image'] = 'generator.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable generator to supply power in the field.'},
	['cooler'] 						 = {['name'] = 'cooler',		  	  			['label'] = 'Drink Cooler',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'cooler.png',	 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Keep your drinks cool!'},
	['spikestrip'] 					 = {['name'] = 'spikestrip',		  	  		['label'] = 'Spike Strip',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'spikestrip.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'No tires for you!'},
	['bomb'] 					     = {['name'] = 'bomb',			  	    		['label'] = 'Bomb',						['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bomb.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An actual bomb.'},
	['diffusedbomb'] 			     = {['name'] = 'diffusedbomb',			   		['label'] = 'Diffused Bomb',			['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bomb.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An actual bomb, but with its wires cut and detonator disabled.'},
	['foldingchair'] 		 		 = {['name'] = 'foldingchair', 			   		['label'] = 'Folding Chair', 			['weight'] = 2000,  	['type'] = 'item', 		['image'] = 'foldingchair1.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Take a load off'},
	['foldingchair2'] 		 		 = {['name'] = 'foldingchair2', 			   	['label'] = 'Folding Chair', 			['weight'] = 2000, 	    ['type'] = 'item', 		['image'] = 'foldingchair2.png',		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Take a load off'},
	['campfire']				     = {['name'] = 'campfire',		  	    		['label'] = 'Campfire Kit',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'campfire.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A bundle of logs and a firestarter'},
	['camptent'] 				     = {['name'] = 'camptent',		  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent2'] 				     = {['name'] = 'camptent2', 	  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent2.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent3'] 				     = {['name'] = 'camptent3',		  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent3.png',	 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent4'] 				     = {['name'] = 'camptent4', 	  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent4.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['cdplayer'] 				     = {['name'] = 'cdplayer',		 	    		['label'] = 'CD Player',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'cdplayer.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Looks like it came fresh from the goodwill'},
	['picnictable']				     = {['name'] = 'picnictable',	  	    		['label'] = 'Folding Picnic Table',		['weight'] = 4000,		['type'] = 'item', 		['image'] = 'picnictable.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A folding picnic table that will never be as good as a real one'},
	['umbrella'] 				     = {['name'] = 'umbrella',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['umbrella2'] 				     = {['name'] = 'umbrella2',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['umbrella3'] 				     = {['name'] = 'umbrella3',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['beachtowel'] 				     = {['name'] = 'beachtowel',	 	    		['label'] = 'Beach Towel',				['weight'] = 2000,		['type'] = 'item', 		['image'] = 'beachtowel.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Grants +5 to avoiding sand in places you don\'t wan it.'},
	['boombox'] 				     = {['name'] = 'boombox',		  	    		['label'] = 'Boombox',					['weight'] = 5000,		['type'] = 'item', 		['image'] = 'boombox.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A vintage WiWang Boom Box, circa 1993'},
	['miniradio'] 				     = {['name'] = 'miniradio',		 	    		['label'] = 'Mini Radio',				['weight'] = 1000,		['type'] = 'item', 		['image'] = 'miniradio.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A little portable radio'},
	['monobloc'] 					 = {['name'] = 'monobloc',			     		['label'] = 'Monobloc Chair',			['weight'] = 5000,		['type'] = 'item', 		['image'] = 'monobloc.png',	 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The classic white chair that looks bad everywhere'},
	['bbq'] 					     = {['name'] = 'bbq',			  	    		['label'] = 'BBQ',						['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bbq.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ooooh, we gonna have a cookout'},
	['foldingtable'] 				 = {['name'] = 'foldingtable',			  	   	['label'] = 'Folding Table',			['weight'] = 5000,		['type'] = 'item', 		['image'] = 'foldingtable.png',		 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just need some red solo cups'},

---- container items ----------

	['containerkey'] 			 	 = {['name'] = 'containerkey', 						['label'] = 'Padlock Key', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'labkey.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A generic padlock key stamped San Andreas Lock & Key'},
	['storagecontract'] 			 = {['name'] = 'storagecontract', 				['label'] = 'Storage Contract', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'printerdocument.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A rental agreement for a storage container.'},
	['anglegrinder']		 		 = {['name'] = 'anglegrinder', 			    	['label'] = 'Angle Grinder', 			['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'anglegrinder.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '"A PowerMetal H420 Angle Grinder has never been used for an illegal activity. Ever." - Former CEO of PowerMetal Inc"'},


--- food items and ingredients -----

	['burger']				 		 = {['name'] = 'burger',	 		  	  		['label'] = 'Burger',					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'burger.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A hamburger made out of meat on a bun with cheese, add ketchup if you want"},
	['hotdog'] 				 		 = {['name'] = 'hotdog', 			  	  		['label'] = 'Hot Dog',					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'hotdog.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A sandwich"},
	["burger_raw"] 				 	 = {["name"] = "burger_raw", 			 		["label"] = "Hamburger Patty",			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A raw, frozen hamburger patty"},
	["burger_bun"] 				 	 = {["name"] = "burger_bun", 			 	  	["label"] = "Bun", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_bun.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Minutes from being stale"},
	["americancheese"] 			 	 = {["name"] = "americancheese",		 	  	["label"] = "American Cheese",			["weight"] = 125, 		["type"] = "item", 		["image"] = "americancheese.png",    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "The classic plastic cheese everyone loves"},
	['coldweiner'] 					 = {['name'] = 'coldweiner',	 		  		['label'] = 'coldweiner',				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'coldweiner.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just a single serving of cold weiner'},
	['hotdogbun']					 = {['name'] = 'hotdogbun',				  		['label'] = 'hotdogbun',				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'hotdogbun.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A nice bun to hold that weiner'},

----------------

5. Open your interact-sounds folder and drag the beep.oog file into the interact-sound/client/html
folder containing the sound files for the resource. The bomb will not have an audible beep otherwise.

----------------

[OPTIONAL] 6. Open your qb-radialmenu resource. Here you can remove the object spawning
options that are being replaced by r14-objects. 

---------- police objects code to remove from qb-radialmenu/config.lua --------

{
            id = 'policeobjects',
            title = 'Objects',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Cone',
                    icon = 'exclamation-triangle',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Gate',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarrier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Speed Limit Sign',
                    icon = 'sign',
                    type = 'client',
                    event = 'police:client:spawnRoadSign',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Tent',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Lighting',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike Strips',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Remove object',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }

-------------

6. Run the following SQL in your database, if you wish to change the table and column names, you must change this in your config.

---------------- SQL to be run ----------------

CREATE TABLE objects (
    id int NOT NULL AUTO_INCREMENT,
    list LONGTEXT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO objects (list)
VALUES ('[]');

INSERT INTO objects (list)
VALUES ('[]');

----------- end of SQL ------------------

7. Enjoy the object script!
