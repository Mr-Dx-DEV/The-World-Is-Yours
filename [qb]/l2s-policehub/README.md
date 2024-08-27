--██╗░░░░░██████╗░░██████╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗
--██║░░░░░╚════██╗██╔════╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝
--██║░░░░░░░███╔═╝╚█████╗░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░
--██║░░░░░██╔══╝░░░╚═══██╗  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░
--███████╗███████╗██████╔╝  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░
--╚══════╝╚══════╝╚═════╝░  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░
------------------------------------------------------------------------
--Thank you Thank you for purchasing this script
-- If you encounter any problems or would like to contact us
-- Our Discord : https://discord.gg/l2s
-- © LTWOS Store || [Dev Team]

---------------------< Installation Instructions  > ---------------------

-- <1> Put l2s-policehub into your resources folder

-- <2> ensure l2s-policehub  

-- <3> Add body cam item qb-core/shared/items.lua || add this items ||   ضيف الاتيم وتاكد انه غير موجود سابقا
    ["bodycam"] 			   = {["name"] = "bodycam", 			 	["label"] = "Bodycam", 				["weight"] = 500, 		["type"] = "item", 		["image"] = "bodycam.png", 				["unique"] = true, 		["useable"] = false, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Body Camera for police"},

-- <4> Add Police Hub Metadata qb-core/server/player.lua :
    PlayerData.metadata['policehub'] = PlayerData.metadata['policehub'] or {
        ['alerts'] = {
            ['enablealerts'] = true,
            ['autoclear'] = false,
            ['mute'] = false,
        },
        ['wings'] = {
            [1] = false,
            [2] = false,
            [3] = false,
            [4] = false,
            [5] = false,
            [6] = false,
            [7] = false,
            [8] = false,
            [9] = false,
        },
        ['direction'] = nil,
        ['Assignment'] = nil,
        ['OfficerPlayTime'] = 0,
    }
    PlayerData.metadata["dutybusy"] = PlayerData.metadata["dutybusy"] ~= nil and PlayerData.metadata["dutybusy"] or false
    PlayerData.metadata["dutybreak"] = PlayerData.metadata["dutybreak"] ~= nil and PlayerData.metadata["dutybreak"] or false

--<5> Add This In AddItem Function : in qb-inventory or qb-core like : https://prnt.sc/Eg1ABC0kfTkm
    if item == 'bodycam' then
		TriggerClientEvent('l2s-policehub:client:togglebody', source)
	end

--<6> Add This In RemoveItem Function : in qb-inventory or qb-core like : https://prnt.sc/lVrxD5QfPA4T
	if item == 'bodycam' then
		TriggerClientEvent('l2s-policeuhub:client:cancelbody', -1, Player.PlayerData.source)
	end

-- Finaly : <Customize Your setting in Config.lua>