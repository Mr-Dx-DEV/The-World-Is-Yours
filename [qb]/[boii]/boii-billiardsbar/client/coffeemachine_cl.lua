----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--


-- Targeting
for k, v in pairs(Config.JobSettings.Locations.HotDrinks) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:HotDrinks',
                icon = Language.Targeting['hotdrinksicon'],
                label = Language.Targeting['makecoffeelabel'],
                job = Config.JobSettings.Job,
                coffee = true
            },
            {
                event = 'boii-billiards:cl:HotDrinks',
                icon = Language.Targeting['hotdrinksicon'],
                label = Language.Targeting['maketealabel'],
                job = Config.JobSettings.Job,
                coffee = false
            }
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:HotDrinks', function(data)
    if data.coffee then
        itemadd = Config.Drinks.Hot.Coffee.Return.name
        timer = Config.Drinks.Hot.Coffee.Time
        lang = Language.HotDrinks['madecoffee']
    else
        itemadd = Config.Drinks.Hot.Tea.Return.name
        timer = Config.Drinks.Hot.Coffee.Time
        lang = Language.HotDrinks['madetea']
    end
    local itemremove = Config.Drinks.Hot.Required.name
    local HasItem = Core.Functions.HasItem(itemremove)
    if HasItem then
        TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        Core.Functions.Progressbar('pt_hotdrinks', Language.HotDrinks['makehotdrink'], timer*1000, false, true,{
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = Config.Drinks.Hot.Animations.Dict,
            anim = Config.Drinks.Hot.Animations.Anim,
            flags = Config.Drinks.Hot.Animations.Flags
        }, {}, {}, function()
            TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
            TriggerEvent('boii-billiards:notify', lang, 'success')
        end, function() -- Cancel
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        end)
    else
        TriggerEvent('boii-billiards:notify', Language.HotDrinks['nocup'], 'error')
    end
end)
