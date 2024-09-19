local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local IsCookingFood = false

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.BBQModels, {
        options = {
            {
                type = "client",
                event = "qb-bbq:BBQMenu",
                icon = "fas fa-burger",
                label = "Use BBQ",
            },
        },
        distance = 2.5
    })
end)



--BBQ Menu
RegisterNetEvent('qb-bbq:BBQMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Cook |",
            isMenuHeader = true, 
        },
        {
            
            header = "• Burger",
            txt = "Cook a Juicy Burger",
            params = {
                event = "qb-bbq:client:CookBurger"
            }
        },
        {
            
            header = "• Chicken Burger",
            txt = "Rolling Paper , Dream Weed",
            params = {
                event = "qb-bbq:client:CookChicken"
            }
        },
        {
            
            header = "• Hot Dog",
            txt = "An American Hero",
            params = {
                event = "qb-bbq:client:CookHotDog"
            }
        },  
        {
            
            header = "• Spare Ribs",
            txt = "Juicy Pork Ribs with BBQ Sauce",
            params = {
                event = "qb-bbq:client:CookRibs"
            }
        },
        {
            
            header = "• Brisket",
            txt = "A Tender Joint of Brisket",
            params = {
                event = "qb-bbq:client:CookBrisket"
            }
        },
        {
            
            header = "• Loaded Jacket",
            txt = "A Jacket Full of Goodness",
            params = {
                event = "qb-bbq:client:CookJacket"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)


RegisterNetEvent('qb-bbq:StartConvo', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Billy |",
            txt = "Hey Man hows it going?",
            isMenuHeader = true, 
        },
        {
            
            header = "Im feeling good, Thank you",
            txt = "",
            params = {
                event = "qb-bbq:FeelingGood"
            }
        },
        {
            
            header = "Im not having a good day today",
            txt = "",
            params = {
                event = "qb-bbq:FeelingBad"
            }
        },
    })
end)

RegisterNetEvent('qb-bbq:FeelingGood', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| That is Great to hear Friend, you looking to buy some fresh BBQ products? |",
            isMenuHeader = true, 
        },
        {
            
            header = "Yea i would love to browse your stuff",
            txt = "$ Buy $",
            params = {
                event = "qb-bbq:shop"
            }
        },
        {
            
            header = "No thank you, ill be going now",
            txt = "",
            params = {
            
            }
        },
    })
end)

RegisterNetEvent('qb-bbq:FeelingBad', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Oh No that is a shame, can i interest you in some fresh BBQ products? |",
            isMenuHeader = true, 
        },
        {
            
            header = "Sure, i guess so...",
            txt = "$ Buy $",
            params = {
                event = "qb-bbq:shop"
            }
        },
        {
            
            header = "No thank you, ill be going now",
            txt = "",
            params = {
        
            }
        },
    })
end)

RegisterNetEvent('qb-bbq:shop', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Billy |",
            txt = "Heres My Stock",
            isMenuHeader = true, 
        },
        {
            
            header = "Raw Burger",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyBurger"
            }
        },
        {
            
            header = "Raw Chicken Burger",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyChicken"
            }
        },
        {
            
            header = "HotDog Tin",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyHotDog"
            }
        },
        {
            
            header = "Raw Ribs",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyRibs"
            }
        },
        {
            
            header = "Raw Brisket",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyBrisket"
            }
        },
        {
            
            header = "Raw Jacket",
            txt = "",
            params = {
                event = "qb-bbq:client:BuyJacket"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, 
        },
    })
end)

--buying--
RegisterNetEvent('qb-bbq:client:BuyBurger', function()
    QBCore.Functions.Progressbar('name_here', 'Buying Burgers...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyBurger')
        QBCore.Functions.Notify('You Bought some Burgers', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-bbq:client:BuyChicken', function()
    QBCore.Functions.Progressbar('name_here', 'Buying Chicken Burgers...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyChicken')
        QBCore.Functions.Notify('You Bought some Chicken Burgers', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-bbq:client:BuyHotDog', function()
    QBCore.Functions.Progressbar('name_here', 'Buying HotDogs...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyHotDog')
        QBCore.Functions.Notify('You Bought some HotDogs', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-bbq:client:BuyRibs', function()
    QBCore.Functions.Progressbar('name_here', 'Buying Ribs...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyRibs')
        QBCore.Functions.Notify('You Bought some Ribs', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-bbq:client:BuyBrisket', function()
    QBCore.Functions.Progressbar('name_here', 'Buying Brisket...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyBrisket')
        QBCore.Functions.Notify('You Bought some Brisket', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('qb-bbq:client:BuyJacket', function()
    QBCore.Functions.Progressbar('name_here', 'Buying Potatoes...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'idle',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-bbq:server:BuyJacket')
        QBCore.Functions.Notify('You Bought some Potatoes', 'primary', 7500)
        ClearPedTasks(PlayerPedId())
    end)
end)

Citizen.CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = Config.BuyPed,
        coords = Config.BuyLocation, 
        minusOne = true, --may have to change this if your ped is in the ground
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "qb-bbq:StartConvo",
                    icon = "fas fa-smile",
                    label = "Greet"
                }
            },
          distance = 2.5,
        },
    })
end)

--Recipes--
RegisterNetEvent('qb-bbq:client:CookBurger', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar('cook', 'Cooking Burger . . .', 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookBurger')
                QBCore.Functions.Notify("You Cooked a Burger!", "success", "20")
                IsCookingFood = false 
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false
            end)
        else
            QBCore.Functions.Notify("You need some uncooked burgers!", "error")
        end
    end, "b-uc-burger")
end)


RegisterNetEvent('qb-bbq:client:CookChicken', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar("cook", "Cooking Chicken Burger", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookChicken')
                QBCore.Functions.Notify("You Cooked a Chicken Burger!", "success", "20")
                IsCookingFood = false  
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false
            end)
        else
            QBCore.Functions.Notify("You need an uncooked Chicken burger!", "error")
        end
    end, "b-uc-chicken")  
end)

RegisterNetEvent('qb-bbq:client:CookHotDog', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar("cook", "Cooking Hot Dog", 7000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookHotDog')
                QBCore.Functions.Notify("You Cooked a HotDog!", "success", "20")
                IsCookingFood = false   
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false  
            end)
        else
            QBCore.Functions.Notify("You need some uncooked hotdog!", "error")
        end
    end, "b-uc-hotdog")  
end)

RegisterNetEvent('qb-bbq:client:CookRibs', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar("cook", "Cooking Ribs", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookRibs')
                QBCore.Functions.Notify("You Cooked Spare Ribs!", "success", "20")
                IsCookingFood = false 
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false
            end)
        else
            QBCore.Functions.Notify("You need uncooked ribs!", "error")
        end
    end, "b-uc-ribs")  
end)

RegisterNetEvent('qb-bbq:client:CookBrisket', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar("cook", "Cooking Brisket", 20000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookBrisket')
                QBCore.Functions.Notify("You Cooked Brisket!", "success", "20")
                IsCookingFood = false 
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false 
            end)
        else
            QBCore.Functions.Notify("You need uncooked brisket!", "error")
        end
    end, "b-uc-brisket")  
end)

RegisterNetEvent('qb-bbq:client:CookJacket', function() 
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(hasitem)
        if hasitem then
            IsCookingFood = true
            QBCore.Functions.Progressbar("cook", "Cooking Jacket Potato", 10000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
                disableInventory = true,
            }, {
                animDict = 'amb@prop_human_bbq@male@idle_a',
                anim = 'idle_b',
                flags = 8,
            }, {
                model = 'prop_fish_slice_01',
                bone = 28422,
                coords = { x = -0.005, y = 0.00, z = 0.00 },
                rotation = { x = 350.0, y = 320.0, z = 0.0 },
            }, {}, function()
                TriggerServerEvent('qb-bbq:server:CookJacket')
                QBCore.Functions.Notify("You Cooked a Jacket!", "success", "20")
                IsCookingFood = false 
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), 'amb@prop_human_bbq@male@idle_a', 'idle_b', 1.0)
                QBCore.Functions.Notify("Canceled..", "error")
                IsCookingFood = false
            end)
        else
            QBCore.Functions.Notify("You need an uncooked Jacket!", "error")
        end
    end, "b-uc-jacket")  
end)


CreateThread(function()
    local BBQBlip = AddBlipForCoord(Config.BuyLocation)
    SetBlipSprite (BBQBlip, 536)
    SetBlipDisplay(BBQBlip, 4)
    SetBlipScale  (BBQBlip, 0.6)
    SetBlipAsShortRange(BBQBlip, true)
    SetBlipColour(BBQBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BBQ Sell")
    EndTextCommandSetBlipName(BBQBlip)
end)
