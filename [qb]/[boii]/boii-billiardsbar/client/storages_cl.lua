----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- STORAGES START --<!>--
-- Boss stash
for k, v in pairs(Config.JobSettings.Locations.BossStorage) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenStorage',
                icon = Language.Targeting['bossstorageicon'],
                label = Language.Targeting['bossstoragelabel'],
                job = {[Config.JobSettings.Job] = 5, [Config.JobSettings.Job] = 6},
                stash = Config.Storage.Boss.Name,
                storagesize = Config.Storage.Boss.Size,
                storageslots = Config.Storage.Boss.Slots
            },
            {
                event = 'boii-billiards:cl:OpenStorage',
                icon = Language.Targeting['forceentryicon'],
                label = Language.Targeting['forceentrylabel'],
                job = Config.JobSettings.Raid.Job,
                stash = Config.Storage.Boss.Name,
                storagesize = Config.Storage.Boss.Size,
                storageslots = Config.Storage.Boss.Slots,
                forceentry = true
            }
        },
        distance = v.distance,
    })
end
-- Job stash
for k, v in pairs(Config.JobSettings.Locations.JobStorage) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenStorage',
                icon = Language.Targeting['jobstorageicon'],
                label = Language.Targeting['jobstoragelabel'],
                job = Config.JobSettings.Job,
                stash = Config.Storage.Job.Name,
                storagesize = Config.Storage.Job.Size,
                storageslots = Config.Storage.Job.Slots
            },
            {
                event = 'boii-billiards:cl:OpenStorage',
                icon = Language.Targeting['forceentryicon'],
                label = Language.Targeting['forceentrylabel'],
                job = Config.JobSettings.Raid.Job,
                stash = Config.Storage.Job.Name,
                storagesize = Config.Storage.Job.Size,
                storageslots = Config.Storage.Job.Slots,
                forceentry = true
            }
        },
        distance = v.distance,
    })
end
-- Order tray 1
for k, v in pairs(Config.JobSettings.Locations.Tray) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenTray',
                icon = Language.Targeting['traystorageicon'],
                label = Language.Targeting['traystoragelabel'],
                stash = Config.Storage.Tray.Name1,
                storagesize = Config.Storage.Tray.Size,
                storageslots = Config.Storage.Tray.Slots
            },
        },
        distance = v.distance,
    })
end
-- Order tray 2
for k, v in pairs(Config.JobSettings.Locations.Tray2) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
                event = 'boii-billiards:cl:OpenTray',
                icon = Language.Targeting['traystorageicon'],
                label = Language.Targeting['traystorageicon'],
                stash = Config.Storage.Tray.Name2,
                storagesize = Config.Storage.Tray.Size,
                storageslots = Config.Storage.Tray.Slots
            },
        },
        distance = v.distance,
    })
end
-- Event to open stash
RegisterNetEvent('boii-billiards:cl:OpenStorage', function(data)
    local player = PlayerPedId()
    if not data.forceentry then
        TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
            maxweight = data.storagesize,
            slots = data.storageslots,
        })
    else
        Core.Functions.Progressbar(data.stash, Language.Shared['forceentry'], Config.JobSettings.Raid.Time*1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = Config.JobSettings.Raid.Animations.Dict,
            anim = Config.JobSettings.Raid.Animations.Anim,
            flags = Config.JobSettings.Raid.Animations.Flags,
        }, {}, {}, function()
            TriggerEvent('inventory:client:SetCurrentStash', data.stash)
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
                maxweight = data.storagesize,
                slots = data.storageslots,
            })
            ClearPedTasks(player)
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-billiards:notify', Language.Shared['cancel'], 'error')
            ClearPedTasks(player)
        end)
    end
end)
RegisterNetEvent('boii-billiards:cl:OpenTray', function(data)
    TriggerEvent('inventory:client:SetCurrentStash', data.stash)
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
        maxweight = data.storagesize,
        slots = data.storageslots,
    })
end)
--<!>-- STORAGES END --<!>--