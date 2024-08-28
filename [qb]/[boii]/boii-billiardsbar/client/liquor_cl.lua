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
for k, v in pairs(Config.JobSettings.Locations.Liquor) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:Liquor',
                icon = Language.Targeting['liquoricon'],
                label = Language.Targeting['whiskeylabel'],
                whiskey = true
            },
            {
                event = 'boii-billiards:cl:Liquor',
                icon = Language.Targeting['liquoricon'],
                label = Language.Targeting['rumlabel'],
                rum = true
            },
            {
                event = 'boii-billiards:cl:Liquor',
                icon = Language.Targeting['liquoricon'],
                label = Language.Targeting['vodkalabel'],
                vodka = true
            },
        },
        distance = v.distance,
    })
end

-- Event
RegisterNetEvent('boii-billiards:cl:Liquor', function(data)
    local itemremove = Config.Drinks.Liquor.Required.name
    if data.whiskey then
        itemadd = Config.Drinks.Liquor.Whiskey.Return.name
        timer = Config.Drinks.Liquor.Whiskey.Time
        lang = Language.Bar['madewhiskey']
    elseif data.rum then
        itemadd = Config.Drinks.Liquor.Rum.Return.name
        timer = Config.Drinks.Liquor.Rum.Time
        lang = Language.Bar['maderum']
    elseif data.vodka then
        itemadd = Config.Drinks.Liquor.Vodka.Return.name
        timer = Config.Drinks.Liquor.Vodka.Time
        lang = Language.Bar['madevodka']
    end
    local HasItem = Core.Functions.HasItem(itemremove)
    if HasItem then
        TriggerServerEvent('boii-billiards:sv:RemoveItem', itemremove, 1)
        Wait(200)
        Core.Functions.Progressbar('bbar_liquor', Language.Bar['pullliquor'], timer*1000, false, true,{
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        }, {
            animDict = Config.Drinks.Liquor.Animations.Dict,
            anim = Config.Drinks.Liquor.Animations.Anims,
            flags = Config.Drinks.Liquor.Animations.Flags
        }, {}, {}, function()
            TriggerServerEvent('boii-billiards:sv:AddItem', itemadd, 1)
            TriggerEvent('boii-billiards:notify', lang, 'success')
        end, function() -- Cancel
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-billiards:notify', Language.Shared['cancelled'], 'primary')
        end)
    else
        TriggerEvent('boii-billiards:notify', Language.Bar['nosmallglass'], 'error')
    end
end)