----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local RemoveStress = Config.CoreSettings.RemoveStressEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Targeting
-- Wash self/dishes
for k, v in pairs(Config.JobSettings.Locations.Wash) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:WashSelf',
                icon = Language.Targeting['washicon'],
                label = Language.Targeting['washfacelabel'],
                face = true

            },
            {
                event = 'boii-billiards:cl:WashSelf',
                icon = Language.Targeting['washicon'],
                label = Language.Targeting['washhandslabel'],
                face = false
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['platelabel'],
                job = Config.JobSettings.Job,
                plate = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['cuplabel'],
                job = Config.JobSettings.Job,
                cup = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['glasslabel'],
                job = Config.JobSettings.Job,
                glass = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['pintglasslabel'],
                job = Config.JobSettings.Job,
                pintglass = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['smallglasslabel'],
                job = Config.JobSettings.Job,
                smallglass = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['wineglasslabel'],
                job = Config.JobSettings.Job,
                wineglass = true
            },
            {
                event = 'boii-billiards:cl:WashDishes',
                icon = Language.Targeting['washdishesicon'],
                label = Language.Targeting['cocktailglasslabel'],
                job = Config.JobSettings.Job,
                cocktailglass = true
            }
        },
        distance = v.distance,
    })
end
-- Glasses 2
for k, v in pairs(Config.JobSettings.Locations.Dishes.Glasses2) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:WineGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takewineglasslabel'],
                job = Config.JobSettings.Job,
                take = true,
            },
            {
                event = 'boii-billiards:cl:WineGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storewineglasslabel'],
                job = Config.JobSettings.Job,
                take = false,
            },
            {
                event = 'boii-billiards:cl:SmallGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takesmallglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:SmallGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storesmallglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            },
            {
                event = 'boii-billiards:cl:CocktailGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takecocktailglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:CocktailGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storecocktailglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            }
        },
        distance = v.distance,
    })
end
-- Glasses
for k, v in pairs(Config.JobSettings.Locations.Dishes.Glasses) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:Glasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takeglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:Glasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storeglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            },
            {
                event = 'boii-billiards:cl:PintGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takepintglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:PintGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storepintglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            },
            {
                event = 'boii-billiards:cl:SmallGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takesmallglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:SmallGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storesmallglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            },
            {
                event = 'boii-billiards:cl:CocktailGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['takecocktailglasslabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:CocktailGlasses',
                icon = Language.Targeting['glassesicon'],
                label = Language.Targeting['storecocktailglasslabel'],
                job = Config.JobSettings.Job,
                take = false
            }
        },
        distance = v.distance,
    })
end
-- Plates
for k, v in pairs(Config.JobSettings.Locations.Dishes.Plates) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:Plates',
                icon = Language.Targeting['platesicon'],
                label = Language.Targeting['takeplatelabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:Plates',
                icon = Language.Targeting['platesicon'],
                label = Language.Targeting['storeplatelabel'],
                job = Config.JobSettings.Job,
                take = false
            }
        },
        distance = v.distance,
    })
end
-- Cup shelf
for k, v in pairs(Config.JobSettings.Locations.Dishes.Cups) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:Cups',
                icon = Language.Targeting['cupsicon'],
                label = Language.Targeting['takecuplabel'],
                job = Config.JobSettings.Job,
                take = true
            },
            {
                event = 'boii-billiards:cl:Cups',
                icon = Language.Targeting['cupsicon'],
                label = Language.Targeting['storecuplabel'],
                job = Config.JobSettings.Job,
                take = false
            },
        },
        distance = v.distance,
    })
end
-- Events
-- Wash self 
RegisterNetEvent('boii-billiards:cl:WashSelf', function(data)
    if data.face then
        lang = Language.Wash['washface']
        lang2 = Language.Wash['washedface']
        timer = Config.Wash.Self.Face.Time
        stressamount = Config.Wash.Self.Face.Stress
        animdict = Config.Wash.Self.Face.Animations.Dict
        anims = Config.Wash.Self.Face.Animations.Anim
        flags = Config.Wash.Self.Face.Animations.Flags
    else
        lang = Language.Wash['washhands']
        lang2 = Language.Wash['washedhands']
        timer = Config.Wash.Self.Hands.Time
        stressamount = Config.Wash.Self.Hands.Stress
        animdict = Config.Wash.Self.Hands.Animations.Dict
        anims = Config.Wash.Self.Hands.Animations.Anim
        flags = Config.Wash.Self.Hands.Animations.Flags
    end
    Core.Functions.Progressbar('bbar_washself', lang, timer*1000, false, false, {
        disableMovement = true, --
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animdict, 
        anim = anims,
        flags = flags
    }, {}, {}, function()  
		TriggerEvent('boii-billiards:notify', lang2, 'success')
        TriggerServerEvent(RemoveStress, stressamount)
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancel'], 'error')
    end)
end)

-- Wash dishes
RegisterNetEvent('boii-billiards:cl:WashDishes', function(data)
    if data.plate then
        itemremove = Config.Wash.Dishes.Plate.Required.name
        itemadd = Config.Wash.Dishes.Plate.Return.name
        timer = Config.Wash.Dishes.Plate.Time
        lang = Language.Wash['washedplate']
        lang2 = Language.Wash['nodirtyplate']
    elseif data.cup then
        itemremove = Config.Wash.Dishes.Cup.Required.name
        itemadd = Config.Wash.Dishes.Cup.Return.name
        timer = Config.Wash.Dishes.Cup.Time
        lang = Language.Wash['washedcup']
        lang2 = Language.Wash['nodirtycup']
    elseif data.glass then
        itemremove = Config.Wash.Dishes.Glass.Required.name
        itemadd = Config.Wash.Dishes.Glass.Return.name
        timer = Config.Wash.Dishes.Glass.Time
        lang = Language.Wash['washedglass']
        lang2 = Language.Wash['nodirtyglass']
    elseif data.pintglass then
        itemremove = Config.Wash.Dishes.PintGlass.Required.name
        itemadd = Config.Wash.Dishes.PintGlass.Return.name
        timer = Config.Wash.Dishes.PintGlass.Time
        lang = Language.Wash['washedpintglass']
        lang2 = Language.Wash['nodirtypintglass']
    elseif data.smallglass then
        itemremove = Config.Wash.Dishes.SmallGlass.Required.name
        itemadd = Config.Wash.Dishes.SmallGlass.Return.name
        timer = Config.Wash.Dishes.SmallGlass.Time
        lang = Language.Wash['washedsmallglass']
        lang2 = Language.Wash['nodirtysmallglass']
    elseif data.wineglass then
        itemremove = Config.Wash.Dishes.WineGlass.Required.name
        itemadd = Config.Wash.Dishes.WineGlass.Return.name
        timer = Config.Wash.Dishes.WineGlass.Time
        lang = Language.Wash['washedwineglass']
        lang2 = Language.Wash['nodirtywineglass']
    elseif data.cocktailglass then
        itemremove = Config.Wash.Dishes.WineGlass.Required.name
        itemadd = Config.Wash.Dishes.WineGlass.Return.name
        timer = Config.Wash.Dishes.WineGlass.Time
        lang = Language.Wash['washedcocktailglass']
        lang2 = Language.Wash['nodirtycocktailglass']
    end
    local HasItem = Core.Functions.HasItem(itemremove)
    if HasItem then
        TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        Wait(200)
        Core.Functions.Progressbar('bbar_washdishes', Language.Wash['washdishes'], timer*1000, false, true,{
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.Wash.Dishes.Animations.Wash.Dict,
            anim = Config.Wash.Dishes.Animations.Wash.Anim,
            flags = Config.Wash.Dishes.Animations.Wash.Flags
        }, {}, {}, function()
            TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
            TriggerEvent('boii-billiards:notify', lang, 'success')
        end, function() -- Cancel
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        end)
    else
        TriggerEvent('boii-billiards:notify', lang2, 'error')
    end
end)

-- Store glasses
RegisterNetEvent('boii-billiards:cl:Glasses', function(data)
    local player = PlayerPedId()
    if data.take then
        itemadd = Config.Wash.Dishes.Glass.Return.name
        timer = Config.Wash.Dishes.Glass.Time2
        lang = Language.Wash['takingglass']
        lang2 = Language.Wash['takeglass']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.Glass.Return.name
        timer = Config.Wash.Dishes.Glass.Time3
        lang = Language.Wash['storingglass']
        lang2 = Language.Wash['storeglass']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['noglass'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_glasses', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)

-- Small glasses
RegisterNetEvent('boii-billiards:cl:SmallGlasses', function(data)
    local player = PlayerPedId()
    if data.take then
        itemadd = Config.Wash.Dishes.SmallGlass.Return.name
        timer = Config.Wash.Dishes.SmallGlass.Time2
        lang = Language.Wash['takingsmallglass']
        lang2 = Language.Wash['takesmallglass']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.SmallGlass.Return.name
        timer = Config.Wash.Dishes.SmallGlass.Time3
        lang = Language.Wash['storingsmallglass']
        lang2 = Language.Wash['storesmallglass']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['nosmallglass'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_smallglasses', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)

-- Pint glasses
RegisterNetEvent('boii-billiards:cl:PintGlasses', function(data)
    local player = PlayerPedId()
    if data.take then
        itemadd = Config.Wash.Dishes.PintGlass.Return.name
        timer = Config.Wash.Dishes.PintGlass.Time2
        lang = Language.Wash['takingpintglass']
        lang2 = Language.Wash['takepintglass']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.PintGlass.Return.name
        timer = Config.Wash.Dishes.PintGlass.Time3
        lang = Language.Wash['storingpintglass']
        lang2 = Language.Wash['storepintglass']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['nopintglass'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_glasses', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)

-- Wine glasses
RegisterNetEvent('boii-billiards:cl:WineGlasses', function(data)
    local player = PlayerPedId()
    if data.take then
        itemadd = Config.Wash.Dishes.WineGlass.Return.name
        timer = Config.Wash.Dishes.WineGlass.Time2
        lang = Language.Wash['takingwineglass']
        lang2 = Language.Wash['takewineglass']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.WineGlass.Return.name
        timer = Config.Wash.Dishes.WineGlass.Time3
        lang = Language.Wash['storingwineglass']
        lang2 = Language.Wash['storewineglass']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['nowineglass'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_wineglasses', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)

-- Cups
RegisterNetEvent('boii-billiards:cl:Cups', function(data)
    if data.take then
        itemadd = Config.Wash.Dishes.Cup.Return.name
        timer = Config.Wash.Dishes.Cup.Time2
        lang = Language.Wash['takingcup']
        lang2 = Language.Wash['takecup']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.Cup.Return.name
        timer = Config.Wash.Dishes.Cup.Time3
        lang = Language.Wash['storingcup']
        lang2 = Language.Wash['storecup']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['nocup'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_cups', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
    end)
end)

-- Plates
RegisterNetEvent('boii-billiards:cl:Plates', function(data)
    if data.take then
        itemadd = Config.Wash.Dishes.Plate.Return.name
        timer = Config.Wash.Dishes.Plate.Time2
        lang = Language.Wash['takingplate']
        lang2 = Language.Wash['takeplate']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.Plate.Return.name
        timer = Config.Wash.Dishes.Plate.Time3
        lang = Language.Wash['storingplate']
        lang2 = Language.Wash['storeplate']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['noplate'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_plates', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
    end)
end)

-- Store cocktail glasses
RegisterNetEvent('boii-billiards:cl:CocktailGlasses', function(data)
    local player = PlayerPedId()
    if data.take then
        itemadd = Config.Wash.Dishes.CocktailGlass.Return.name
        timer = Config.Wash.Dishes.CocktailGlass.Time2
        lang = Language.Wash['takingcocktailglass']
        lang2 = Language.Wash['takecocktailglass']
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
    else
        itemremove = Config.Wash.Dishes.CocktailGlass.Return.name
        timer = Config.Wash.Dishes.CocktailGlass.Time3
        lang = Language.Wash['storingcocktailglass']
        lang2 = Language.Wash['storecocktailglass']
        local HasItem = Core.Functions.HasItem(itemremove)
        if HasItem then 
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        else
            TriggerEvent('boii-billiards:notify', Language.Wash['noglass'], 'error') 
            return 
        end
    end
    Wait(200)
    Core.Functions.Progressbar('bbar_cocktailglasses', lang, timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Wash.Dishes.Animations.Store.Dict,
        anim = Config.Wash.Dishes.Animations.Store.Anim,
        flags = Config.Wash.Dishes.Animations.Store.Flags
    }, {}, {}, function()
        TriggerEvent('boii-billiards:notify', lang2, 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
    end)
end)