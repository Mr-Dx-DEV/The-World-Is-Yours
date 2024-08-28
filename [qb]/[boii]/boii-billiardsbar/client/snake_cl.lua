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

--<!>-- SNAKE START --<!>--
-- Targeting
for k, v in pairs(Config.JobSettings.Locations.Snake) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:FeedSnake',
                icon = Language.Targeting['peticon'],
                label = Language.Targeting['snakelabel'],
                feed = true
            },
            {
                event = 'boii-billiards:cl:FeedSnake',
                icon = Language.Targeting['peticon'],
                label = Language.Targeting['mouselabel'],
                feed = false
            }
        },
        distance = v.distance,
    })
end
-- Event
RegisterNetEvent('boii-billiards:cl:FeedSnake', function(data)
    local player = PlayerPedId()
    local itemname =  Config.Snake.Item.name
    local stress = Config.Snake.Stress
    if data.feed then
        local HasItem = Core.Functions.HasItem(itemname)
        if HasItem then
            TriggerEvent('animations:client:EmoteCommandStart', {'point'})
		    Wait(200)
            TriggerServerEvent('boii-billiards:sv:RemoveItem', itemname, 1)
            TriggerServerEvent(RemoveStress, stress)
            TriggerEvent('boii-billiards:notify', Language.Snake['fedsnake'], 'error')
            ClearPedTasks(player)
        else
            TriggerEvent('boii-billiards:notify', Language.Snake['nomouse'], 'error')
        end
    else
        local HasItem = Core.Functions.HasItem(itemname)
        if HasItem then
            TriggerEvent('boii-billiards:notify', Language.Snake['hasmouse'], 'error')
        else
            TriggerEvent('animations:client:EmoteCommandStart', {'point'})
		    Wait(200)
            TriggerServerEvent('boii-billiards:sv:AddItem', itemname, 1)
            ClearPedTasks(player)
        end
    end
end)
--<!>-- SNAKE END --<!>--