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
for k, v in pairs(Config.JobSettings.Locations.Cocktails) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name=v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:CocktailsMainMenu',
                icon = Language.Targeting['cocktailsicon'],
                label = Language.Targeting['cocktailslabel'],
                job = Config.JobSettings.Job,
            }
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:MixCocktails', function(args)
    local args = tonumber(args)
    if args == 1 then
        itemadd = Config.Drinks.Cocktails.WhiskeySour.Return.name
        timer = Config.Drinks.Cocktails.WhiskeySour.Time
    elseif args == 2 then
        itemadd = Config.Drinks.Cocktails.WhiskeySmash.Return.name
        timer = Config.Drinks.Cocktails.WhiskeySmash.Time
    elseif args == 3 then
        itemadd = Config.Drinks.Cocktails.BloodSand.Return.name
        timer = Config.Drinks.Cocktails.BloodSand.Time
    elseif args == 4 then
        itemadd = Config.Drinks.Cocktails.PinaColada.Return.name
        timer = Config.Drinks.Cocktails.PinaColada.Time
    elseif args == 5 then
        itemadd = Config.Drinks.Cocktails.Zombie.Return.name
        timer = Config.Drinks.Cocktails.Zombie.Time
    elseif args == 6 then
        itemadd = Config.Drinks.Cocktails.MaiTai.Return.name
        timer = Config.Drinks.Cocktails.MaiTai.Time
    elseif args == 7 then
        itemadd = Config.Drinks.Cocktails.Appletini.Return.name
        timer = Config.Drinks.Cocktails.Appletini.Time
    elseif args == 8 then
        itemadd = Config.Drinks.Cocktails.Cosmopolitan.Return.name
        timer = Config.Drinks.Cocktails.Cosmopolitan.Time
    elseif args == 9 then
        itemadd = Config.Drinks.Cocktails.BloodyMary.Return.name
        timer = Config.Drinks.Cocktails.BloodyMary.Time
    end
    Core.Functions.Progressbar('bbar_mixcocktail', Language.Cocktails['mixingcocktail'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Drinks.Cocktails.Animations.Dict,
        anim = Config.Drinks.Cocktails.Animations.Anims,
        flags = Config.Drinks.Cocktails.Animations.Flags
    }, {}, {}, function()
        TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
        TriggerEvent('boii-billiards:notify', Language.Cocktails['madecocktail'], 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
    end)
end)