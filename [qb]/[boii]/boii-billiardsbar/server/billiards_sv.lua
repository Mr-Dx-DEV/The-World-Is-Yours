----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local PhoneEvent = Config.CoreSettings.PhoneEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- ITEMS START --<!>--
-- You can leave these items here, or move them into `boii-consumables/server/consumables_sv.lua`
-- Drinks
Core.Functions.CreateUseableItem('glass_water', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Water..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_cocacola', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking CocaCola..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_pepsi', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Pepsi..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_drpepper', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Dr Pepper..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_mountaindew', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Mtn Dew..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_lemonade', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_glass', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Lemonade..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('cup_coffee', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_cup', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Coffee..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'v_res_mcofcup', 28422, vector3(-0.005, 0.00, -0.05), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('cup_tea', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_cup', 'thirst', math.random(10,40), math.random(5,10), 'Drinking Tea..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'v_res_mcofcup', 28422, vector3(-0.005, 0.00, -0.05), vector3(175.0, 185.0, 0.0))
end)

-- Alcoholic drinks
Core.Functions.CreateUseableItem('glass_whiskey', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Whiskey..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_rum', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Rum..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_vodka', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Vodka..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_whiskeycoke', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Whiskey Coke..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_rumlemon', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Rum Lemonade..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_vodkalemon', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_smallglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Vodka Lemonade..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('chardonnay', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'emptyglassbottle', 'thirst', math.random(10,40), math.random(5,10), 50, 'Drinking Chardonnay..', math.random(3,5), 'mp_player_intdrink', 'loop_bottle', 49, 'prop_wine_white', 60309, vector3(-0.005, 0.00, -0.09), vector3(0.0, 0.0, 0.0))
end)
Core.Functions.CreateUseableItem('barola', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'emptyglassbottle', 'thirst', math.random(10,40), math.random(5,10), 50, 'Drinking Barola..', math.random(3,5), 'mp_player_intdrink', 'loop_bottle', 49, 'prop_wine_red', 60309, vector3(-0.005, 0.00, -0.09), vector3(0.0, 0.0, 0.0))
end)
Core.Functions.CreateUseableItem('pinotgrigio', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'emptyglassbottle', 'thirst', math.random(10,40), math.random(5,10), 50, 'Drinking Pinot Grigio..', math.random(3,5), 'mp_player_intdrink', 'loop_bottle', 49, 'prop_wine_white', 60309, vector3(-0.005, 0.00, -0.09), vector3(0.0, 0.0, 0.0))
end)
Core.Functions.CreateUseableItem('pinotnoir', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'emptyglassbottle', 'thirst', math.random(10,40), math.random(5,10), 50, 'Drinking Pinot Noir..', math.random(3,5), 'mp_player_intdrink', 'loop_bottle', 49, 'prop_wine_red', 60309, vector3(-0.005, 0.00, -0.09), vector3(0.0, 0.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_chardonnay', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_wineglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Chardonnay..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_sh_wine_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_barola', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_wineglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Barola..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_sh_wine_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_pinotgrigio', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_wineglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Pinot Grigio..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_sh_wine_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('glass_pinotnoir', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_wineglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Pinot Noir..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_sh_wine_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('appletini', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Appletini..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('bloodandsand', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Blood and Sand..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('bloodymary', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Bloody Mary..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('cosmopolitan', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Cosmopolitan..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('maitai', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Mai Tai..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('pinacolada', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Pina Colada..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('whiskeysmash', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Whiskey Smash..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_shot_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('whiskeysour', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Whiskey Sour..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail_glass', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('zombie', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_cocktailglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking Zombie..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_cocktail', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('pint_ambeer', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_pintglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking A Pint..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('pint_dusche', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_pintglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking A Pint..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('pint_logger', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_pintglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking A Pint..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)
Core.Functions.CreateUseableItem('pint_piswasser', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'dirty_pintglass', 'thirst', math.random(10,40), math.random(5,10), 10, 'Drinking A Pint..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_pint_glass_tall', 28422, vector3(-0.005, 0.00, -0.01), vector3(175.0, 185.0, 0.0))
end)


-- Food
Core.Functions.CreateUseableItem('cookedcheesepie', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Cheese Pie..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedmeatpie', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Meat Pie..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedchickenpie', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Chicken Pie..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedsteakpie', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Steak Pie..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedmwburger', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Burger..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedmwcburger', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Cheeseburger..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
Core.Functions.CreateUseableItem('cookedmwbcburger', function(source, item)
    TriggerClientEvent('boii-consumables:cl:Consumables', source, item.name, 'dirty_plate', 'hunger', math.random(10,40), math.random(5,10), 'Eating Bacon Cheeseburger..', math.random(3,5), 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 49, 'prop_cs_burger_01', 60309, vector3(-0.005, 0.00, -0.01), vector3(175.0, 160.0, 0.0))
end)
--<!>-- ITEMS END --<!>--

--<!>-- BILLING EVENT CODE START --<!>--
RegisterServerEvent('boii-billiards:sv:Pay', function(playerId, amount)
    local payee = Core.Functions.GetPlayer(source)
    local payer = Core.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if payee.PlayerData.job.name == Config.JobSettings.Job then
        if payer ~= nil then
            if payee.PlayerData.citizenid ~= payer.PlayerData.citizenid then
                if amount and amount > 0 then
                    exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (@citizenid, @amount, @society, @sender, @sendercitizenid)', {
                        ['@citizenid'] = payer.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = payee.PlayerData.job.name,
                        ['@sender'] = payee.PlayerData.charinfo.firstname,
                        ['@sendercitizenid'] = payee.PlayerData.citizenid
                    })
                    TriggerClientEvent(PhoneEvent, payer.PlayerData.source)
                    TriggerClientEvent('boii-billiards:notify', source, Language.Billing['invoicesent'], 'success')
                    TriggerClientEvent('boii-billiards:notify', payer.PlayerData.source, Language.Billing['invoicereceived'])
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Billing['minamount'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Billing['billself'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Billing['billoffline'], 'error')
        end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Billing['noaccess'], 'error')
    end
end)
--<!>-- BILLING EVENT CODE START --<!>--