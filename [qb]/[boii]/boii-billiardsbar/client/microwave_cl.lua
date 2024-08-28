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
for k, v in pairs(Config.JobSettings.Locations.Microwave) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:MicrowaveMenu',
                icon = Language.Targeting['microwaveicon'],
                label = Language.Targeting['microwavelabel'],
            },
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:Microwave', function(args)
    local args = tonumber(args)
    itemremove = Config.Microwave.Required.name
    if args == 1 then
        itemremove2 = Config.Microwave.Pie.Cheese.Required.name
        itemadd = Config.Microwave.Pie.Cheese.Return.name
    elseif args == 2 then
        itemremove2 = Config.Microwave.Pie.Meat.Required.name
        itemadd = Config.Microwave.Pie.Meat.Return.name
    elseif args == 3 then
        itemremove2 = Config.Microwave.Pie.Steak.Required.name
        itemadd = Config.Microwave.Pie.Steak.Return.name
    elseif args == 4 then
        itemremove2 = Config.Microwave.Pie.Chicken.Required.name
        itemadd = Config.Microwave.Pie.Chicken.Return.name
    elseif args == 5 then
        itemremove2 = Config.Microwave.Burger.Burger.Required.name
        itemadd = Config.Microwave.Burger.Burger.Return.name
    elseif args == 6 then
        itemremove2 = Config.Microwave.Burger.Cheese.Required.name
        itemadd = Config.Microwave.Burger.Cheese.Return.name
    elseif args == 7 then
        itemremove2 = Config.Microwave.Burger.Bacon.Required.name
        itemadd = Config.Microwave.Burger.Bacon.Return.name
    end
    local HasItem = Core.Functions.HasItem(itemremove)
    if HasItem then
        local HasItem2 = Core.Functions.HasItem(itemremove2)
        if HasItem2 then
            Core.Functions.Progressbar('bbar_microwave', Language.Microwave['usemicrowave'], Config.Microwave.Time*1000, false, true,{
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = Config.Microwave.Animations.Dict,
                anim = Config.Microwave.Animations.Anim,
                flags = Config.Microwave.Animations.Flags
            }, {}, {}, function()
                TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
                TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove2, 1)
                UseMicrowave(itemadd)
            end, function() -- Cancel
                TriggerEvent('inventory:client:busy:status', false)
                TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
            end)
        else
            TriggerEvent('boii-billiards:notify', Language.Microwave['nofood'], 'error')
        end
    else
        TriggerEvent('boii-billiards:notify',Language.Microwave['noplate'], 'error')
    end
end)

function UseMicrowave(itemadd)
    Core.Functions.Progressbar('bbar_cookmicro', Language.Microwave['microwavefood'], Config.Microwave.Time2*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Microwave.Animations.Dict2,
        anim = Config.Microwave.Animations.Anim2,
        flags = Config.Microwave.Animations.Flags2
    }, {}, {}, function()
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
        TriggerEvent('boii-billiards:notify', Language.Microwave['mademicrowave'], 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
    end)
end
