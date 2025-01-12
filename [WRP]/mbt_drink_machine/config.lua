MBT = {}
MBT.Debug = false -- Debugging toggle if something's wrong

MBT.Framework = "QB" -- ESX/QB/Standalone
MBT.ESXLegacy = true -- Set true if you're using ESX Legacy version

MBT.Props = {`prop_vend_soda_02` --[[,`ANOTHER-PROP`]] } -- Put the props you wanna interact it here

MBT.Drinks = { -- Adjust the price and items you wanna give, don't touch the name between []
    ["coke"]   = { ["Price"] = 5,     ["Item"] = "cola" },
    ["sprite"] = { ["Price"] = 5.9,   ["Item"] = "sprite" },
    ["fanta"]  = { ["Price"] = 5.99,  ["Item"] = "fanta" },
    ["water"]  = { ["Price"] = 5,     ["Item"] = "water" }
}

MBT.Language = { 
    ["Selected"] = "EN",
    ["IT"] = {
        ["wrong_notification"] = "Il tipo di notifica scelto non esiste o è errato!",
        ["wrong_notification_coords"] = "Coordinate della notifica errate o inesistenti!",
        ["press_to_interact"] = "Premi ~p~E~s~ per usare la macchinetta",
        ["not_enough_money"] = "Non hai abbastanza soldi",
        ["too_heavy"] = "Non puoi trasportare altro peso",
        ["get_drink"] = "Ritira",
        ["choose_drink"] = "Scegli una bevanda!"
    },
    ["EN"] = {
        ["wrong_notification"] = "Wrong or non-existent notification type! Check it!",
        ["wrong_notification_coords"] = "Wrong or non-existent notification coords!",
        ["press_to_interact"] = "Press ~p~E~s~ for drink machine",
        ["not_enough_money"] = "You don't have enough money",
        ["too_heavy"] = "You can't carry more weight!",
        ["get_drink"] = "Get your drink",
        ["choose_drink"] = "Choose your drink!"
    }
}

MBT.HelpNotification = "Standard" -- Standard/Floating 

MBT.Notification = function (source, text, text2) -- Put your custom notification event here
   if MBT.Framework == "QB" then
        TriggerClientEvent('QBCore:Notify', source, text, "success", 5000) 
    else 
        TriggerClientEvent('esx:showNotification', source, text)
    end
end

MBT.UseTarget = true -- Use a target script or markers

if MBT.UseTarget then
    
    AddEventHandler("mbt_drink_machine:setupTarget", function ()
        -- Setup your target script here!
        -- Event to call: mbt_drink_machine:openMalidrink
        
        --[[
            exports["qtarget"]:AddTargetModel(MBT.Props, {
            options = {
                {
                    icon = "",
                    label = "Use",
                    event = 'mbt_drink_machine:openMalidrink',			
                },
            },
            distance = 2.5
        })]]
    end)
end

MBT.Functions = { -- Preset framework binded functions, tested and working on ESX Legacy
    ["ESX"] = {
        ["get_player"] = function (s)
            return ESX.GetPlayerFromId(s)
        end,
        ["get_account_money"] = function (p)
            if not MBT.ESXLegacy then return p.getMoney() end
            return p.getAccount("money").money
        end,
        ["get_account_bank"] = function (p)
            return p.getAccount("bank").money
        end,
        ["can_carry"] = function (p, item, count)
            return p.canCarryItem(item, count)
        end,
        ["remove_money"] = function (p, account, price)
            if not MBT.ESXLegacy then 
                if account == "bank" then
                    p.removeAccountMoney(account, price)
                else
                    return p.removeMoney(price) 
                end
            end
            return p.removeAccountMoney(account, price)
        end,
        ["add_item"] = function (p, item, count)
            return p.addInventoryItem(item, count)
        end
        
    },
    ["QB"] = {
        ["get_player"] = function (s)
            return QBCore.Functions.GetPlayer(s)
        end,
        ["get_account_money"] = function (p)
            return p.PlayerData.money['cash']
        end,
        ["get_account_bank"] = function (p)
            return p.PlayerData.money['bank']
        end,
        ["can_carry"] = function (p, item, count)
            return true -- QB automatically check this 
        end,
        ["remove_money"] = function (p, account, price)
            return p.Functions.RemoveMoney(account, price, "Drink machine")
        end,
        ["add_item"] = function (p, item, count)
            return p.Functions.AddItem(item, count)
        end
    },
    ["Standalone"] = {
        ["initialize"] = function (f)
            local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
            local import = LoadResourceFile('ox_core', file)
            local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
            chunk()
        end,
        ["svInitialize"] = function ()
            local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
            local import = LoadResourceFile('ox_core', file)
            local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
            chunk()
        end,
        ["get_player"] = function (s)
            return Ox.GetPlayer(s)
        end,
        ["get_account_money"] = function (p)
            return exports.ox_inventory:getCash(p.source)
        end,
        ["get_account_bank"] = function (p)
            return exports.pefcl:getDefaultAccountBalance(p.source).data
        end,
        ["can_carry"] = function (p, item, count)
            return exports.ox_inventory:CanCarryItem(p.source,item, count)  
        end,
        ["remove_money"] = function (p, account, price)
            if account == 'money' then
                return exports.ox_inventory:removeCash(p.source, price)
            else
                exports.pefcl:removeBankBalance(p.source, { amount = price, message = "Billing Vending Machine" })
            end
        end,
        ["add_item"] = function (p, item, count)
            return exports.ox_inventory:AddItem(p.source, item, count)
        end
    }
}

