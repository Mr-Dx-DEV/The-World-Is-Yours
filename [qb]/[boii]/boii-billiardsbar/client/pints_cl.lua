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
for k, v in pairs(Config.JobSettings.Locations.Pumps) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:PumpMenu',
                icon = Language.Targeting['pumpicon'],
                label = Language.Targeting['pumplabel'],
            },
        },
        distance = v.distance,
    })
end
for k, v in pairs(Config.JobSettings.Locations.Pumps2) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:PumpMenu2',
                icon = Language.Targeting['pumpicon'],
                label = Language.Targeting['pumplabel'],
            },
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:PullPint', function(args)
    local args = tonumber(args)
    local itemremove = Config.Drinks.Pint.Required.name
    if args == 1 then
        itemadd = Config.Drinks.Pint.AMBeer.Return.name
        timer = Config.Drinks.Pint.AMBeer.Time
        lang = Language.Bar['madeambeer']
    elseif args == 2 then
        itemadd = Config.Drinks.Pint.Piswasser.Return.name
        timer = Config.Drinks.Pint.Piswasser.Time
        lang = Language.Bar['madepiswasser']
    elseif args == 3 then
        itemadd = Config.Drinks.Pint.Logger.Return.name
        timer = Config.Drinks.Pint.Logger.Time
        lang = Language.Bar['madelogger']
    elseif args == 4 then
        itemadd = Config.Drinks.Pint.Dusche.Return.name
        timer = Config.Drinks.Pint.Dusche.Time
        lang = Language.Bar['madedusche']
    end
    local HasItem = Core.Functions.HasItem(itemremove)
    if HasItem then
        TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        Wait(200)
        Core.Functions.Progressbar('bbar_pullpint', Language.Bar['pullpint'], timer*1000, false, true,{
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        }, {
            animDict = Config.Drinks.Pint.Animations.Dict,
            anim = Config.Drinks.Pint.Animations.Anims,
            flags = Config.Drinks.Pint.Animations.Flags
        }, {}, {}, function()
            TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
            TriggerEvent('boii-billiards:notify', lang, 'success')
        end, function() -- Cancel
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        end)
    else
        TriggerEvent('boii-billiards:notify', Language.Bar['nopintglass'], 'error')
    end
end)