----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

-- Targeting
for k, v in pairs(Config.JobSettings.Locations.Store.Food) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenStore',
                icon = Language.Targeting['storeicon'],
                label = Language.Targeting['storelabel'],
                food = true
            },
        },
        distance = v.distance,
    })
end
for k, v in pairs(Config.JobSettings.Locations.Store.Drinks) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenStore',
                icon = Language.Targeting['storeicon'],
                label = Language.Targeting['storelabel'],
                drinks = true
            },
        },
        distance = v.distance,
    })
end
for k, v in pairs(Config.JobSettings.Locations.Store.Wine) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenStore',
                icon = Language.Targeting['storeicon'],
                label = Language.Targeting['storelabel'],
                wine = true
            },
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:OpenStore', function(data)
    if data.food then
        local store = {}
        store.label = 'bbar_foodstore'
        store.items = Config.Store.Food.Items
        store.slots = #Config.Store.Food.Items
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', store.label, store)  
    elseif data.drinks then
        local store = {}
        store.label = 'bbar_drinkstore'
        store.items = Config.Store.Drinks.Items
        store.slots = #Config.Store.Drinks.Items
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', store.label, store)  
    elseif data.wine then
        local store = {}
        store.label = 'bbar_winestore'
        store.items = Config.Store.Wine.Items
        store.slots = #Config.Store.Wine.Items
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', store.label, store)  
    end  
end)
--<!>-- STORE END --<!>--