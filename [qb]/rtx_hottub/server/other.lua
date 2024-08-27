if Config.CustomFramework == true then
	--[[ 

	!! you need enable mysql line in fxmanifest.lua
	
	-- this is command examples from esx which you can export to your framework (you need just change permission function)
	RegisterCommand("removeallhottubs", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
			for i, hottubhandler in ipairs(Config.HotTubs) do
				for i, hottubseat in ipairs(hottubhandler.seats) do
					if hottubseat.taken == true then
						TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
					end
				end								
				MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
					['@id'] = hottubhandler.hottubid
				}, function(changed)
					TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
					table.remove(Config.HotTubs, i)
					print("[RTX HOTTUB] "..Language[Config.Language]["removeallhottubs"].."")
				end)			
			end	
		else
			local xPlayer = ESX.GetPlayerFromId(playersource)
			local playergroup = xPlayer.getGroup()
			if playergroup == "admin" or playergroup == "superadmin" then
				for i, hottubhandler in ipairs(Config.HotTubs) do
					for i, hottubseat in ipairs(hottubhandler.seats) do
						if hottubseat.taken == true then
							TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
						end
					end											
					MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
						['@id'] = hottubhandler.hottubid
					}, function(changed)
						TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
						table.remove(Config.HotTubs, i)
						TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["removeallhottubs"])
					end)			
				end		
			end
		end
	end)

	RegisterCommand("removenearbyhottubs", function(source, args, raw)
		local playersource = source
		if playersource == 0 then
		else
			if args[1] ~= nil then
				local xPlayer = ESX.GetPlayerFromId(playersource)
				local playergroup = xPlayer.getGroup()
				if playergroup == "admin" or playergroup == "superadmin" then
					local playerhandler = GetPlayerPed(playersource)
					local playercoords = GetEntityCoords(playerhandler)			
					for i, hottubhandler in ipairs(Config.HotTubs) do
						local distancehottub = #(playercoords - hottubhandler.coords)
						if distancehottub < tonumber(args[1]) then						
							for i, hottubseat in ipairs(hottubhandler.seats) do
								if hottubseat.taken == true then
									TriggerClientEvent("rtx_hottub:SitEnd", hottubseat.takenplayerid)
								end
							end												
							MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
								['@id'] = hottubhandler.hottubid
							}, function(changed)
								TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubhandler.hottubid)
								table.remove(Config.HotTubs, i)
							end)		
						end
					end	
					TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["removeallhottubsnearby"])
				end
			end
		end
	end)


	-- this is events examples from esx which you can export to your framework (you need just change item check, and removeintenroy functon + identifier function) 
	
	RegisterServerEvent("rtx_hottub:SpawnNewHottub")
	AddEventHandler("rtx_hottub:SpawnNewHottub", function(hottubcoords, hottubrotation, hottubitem)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then	
			local hottubitemcheck = xPlayer.getInventoryItem(hottubitem)
			if hottubitemcheck.count > 0 then	
				local itemdata = GetHottubItemData(hottubitem)
				if itemdata.found == true then
					xPlayer.removeInventoryItem(hottubitem, 1)
					MySQL.Async.execute('INSERT INTO hottubs (identifier, coords, rotation, stairs, type) VALUES (@identifier,@coords,@rotation,@stairs,@type)',
					{
						['@identifier'] = xPlayer.identifier,
						['@coords'] = json.encode({coords = hottubcoords}),
						['@rotation'] = json.encode({rotation = hottubrotation}),
						['@stairs'] = itemdata.stairs,
						['@type'] = itemdata.type,
					}, function(changed)
						HotTubBuild()
					end)
				end
			end
		end
	end)

	RegisterServerEvent("rtx_hottub:RemoveHottubCheck")
	AddEventHandler("rtx_hottub:RemoveHottubCheck", function(hottubid, hottubowned, hottubownedid)
		local playersource = source
		if hottubid ~= nil then
			if hottubowned == true then
				local hottubdatacheck = CheckHotTubIdData(hottubownedid)
				if hottubdatacheck ~= nil then		
					local playerhandler = GetPlayerPed(playersource)
					local playercoords = GetEntityCoords(playerhandler)
					local hottubhandler = Config.HotTubs[hottubdatacheck]	
					local distancehottubremove = #(playercoords - hottubhandler.coords)
					if distancehottubremove < 10.0 then	
						if hottubhandler.spawnedbyplayer == true then
							local xPlayer = ESX.GetPlayerFromId(playersource)
							if xPlayer then							
								if hottubhandler.spawnedbyplayeridentifier == xPlayer.identifier then
									TriggerClientEvent("rtx_hottub:HotTubRemove", playersource, hottubownedid)
								else
									TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["hottubnotowned"])
								end	
							end
						end
					end		
				end	
			end
		end
	end)

	RegisterServerEvent("rtx_hottub:RemoveHottub")
	AddEventHandler("rtx_hottub:RemoveHottub", function(hottubid)
		local playersource = source
		if hottubid ~= nil then
			local playerhandler = GetPlayerPed(playersource)
			local playercoords = GetEntityCoords(playerhandler)
			local hottubdatacheck = CheckHotTubIdData(hottubid)
			if hottubdatacheck ~= nil then			
				local hottubhandler = Config.HotTubs[hottubdatacheck]	
				local distancehottubremove = #(playercoords - hottubhandler.coords)
				if distancehottubremove < 10.0 then	
					if hottubhandler.spawnedbyplayer == true then
						local xPlayer = ESX.GetPlayerFromId(playersource)
						if xPlayer then							
							if hottubhandler.spawnedbyplayeridentifier == xPlayer.identifier then							
								local playerfoundseat = false
								for i, hottubseat in ipairs(hottubhandler.seats) do
									if hottubseat.taken == true then
										playerfoundseat = true
										break
									end
								end				
								if playerfoundseat == false then
									MySQL.Async.execute('DELETE FROM hottubs WHERE id = @id', {
										['@id'] = hottubhandler.hottubid
									}, function(changed)
										TriggerClientEvent("rtx_hottub:HotTubDelete", -1, hottubid)
										local itemdata = GetHottubItem(hottubhandler.hottubtype, hottubhandler.hottubstairs)
										xPlayer.addInventoryItem(itemdata, 1)								
										table.remove(Config.HotTubs, hottubdatacheck)
										TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["hottubremoved"])
									end)		
								else
									TriggerClientEvent("rtx_hottub:Notify", playersource, Language[Config.Language]["someonesit"])
								end									
							end	
						end
					end
				end		
			end
		end
	end)

	-- this is register item examples from esx which you can export to your framework
	ESX.RegisterUsableItem("hottub1", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub1")
		end
	end)

	ESX.RegisterUsableItem("hottub2", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub2")
		end
	end)

	ESX.RegisterUsableItem("hottub3", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub3")
		end
	end)

	ESX.RegisterUsableItem("hottub1stairs", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub1stairs")
		end
	end)

	ESX.RegisterUsableItem("hottub2stairs", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub2stairs")
		end
	end)

	ESX.RegisterUsableItem("hottub3stairs", function(source)
		local playersource = source
		local xPlayer = ESX.GetPlayerFromId(playersource)
		if xPlayer then
			TriggerClientEvent("rtx_hottub:HotTubSpawnItem", playersource, "hottub3stairs")
		end
	end)
	]]--
end