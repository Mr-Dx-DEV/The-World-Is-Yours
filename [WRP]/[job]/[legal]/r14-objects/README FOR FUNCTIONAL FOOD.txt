If using qb-smallresources, please follow these instructions to make the bbq items usable, if
you are using a different system to manage your food and drink items, please consult the dev
to learn more about adding food items. Navigate to the qb-smallresources resource and make the
following edits:


1) Navigate to qb-smallresources:server:consumables.lua, you will need to make the
items usable by players, please add the following code to the server sided script:

QBCore.Functions.CreateUseableItem("burger", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotdog", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("americancheese", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coldweiner", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hotdogbun", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("burger_bun", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

----------------- end of code for qb-smallresources:server:consumables.lua ----------------

2) Navigate to your qb-smallresources/config.lua and insert the following into the ConsumeablesEat 
table, this will tell qb-core how much hunger each item restores. If you do not add this, the 
items will generate errors when used.

    ["burger"] = math.random(40, 50),
    ["hotdog"] = math.random(30, 40),
    ["coldweiner"] = math.random(15, 20),
    ["hotdogbun"] = math.random(10, 20),
    ["burger_bun"] = math.random(10, 20),
    ["americancheese"] = math.random(5, 15),

----------- end of code to add to the ConsumablesEat table in qb-smallresources/config.lua ----------

3) Enjoy!
