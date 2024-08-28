----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local InputName = Config.CoreSettings.InputName
local DutyEvent = Config.CoreSettings.DutyEvent
local ClothingEvent = Config.CoreSettings.ClothingEvent
local FuelEvent = Config.CoreSettings.FuelEvent
local RemoveStressEvent = Config.CoreSettings.RemoveStressEvent
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- NOTIFICATIONS START --<!>--
RegisterNetEvent('boii-bestbuds:notifications')
AddEventHandler('boii-bestbuds:notifications', function(msg, type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS END --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
--<!>-- BLIPS END --<!>--

--<!>-- ON DUTY START --<!>--
PlayerJob = {}
local onDuty = false
RegisterNetEvent('Core:Client:OnPlayerLoaded')
AddEventHandler('Core:Client:OnPlayerLoaded', function()
    Core.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.JobSettings.JobName then
                TriggerServerEvent(DutyEvent)
            end
        end
    end)
end)
RegisterNetEvent('Core:Client:OnJobUpdate')
AddEventHandler('Core:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)
RegisterNetEvent('Core:Client:SetDuty')
AddEventHandler('Core:Client:SetDuty', function(duty)
    onDuty = duty
end)
RegisterNetEvent('boii-bestbuds:client:ToggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent(DutyEvent)
end)
for k, v in pairs(Config.JobSettings.Locations.Duty) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:BestBudsDutyMenu',
            icon = Language.Targeting['dutyicon'],
            label = Language.Targeting['dutylabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
--<!>-- ON DUTY END --<!>--

--<!>-- BOSS MENU START --<!>--
-- Boss
for k, v in pairs(Config.JobSettings.Locations.Boss) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = Config.CoreSettings.BossMenuEvent,
            icon = Language.Targeting['bossicon'],
            label = Language.Targeting['bosslabel'],
            job = {[Config.JobSettings.JobName] = 5}
            },
        },
        distance = v.distance,
    })
end
--<!>-- BOSS MENU END --<!>--

--<!>-- STORAGES START --<!>--
-- Boss storage
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
                event = 'boii-bestbuds:client:OpenStash',
                icon = Language.Targeting['bossstorageicon'],
                label = Language.Targeting['bossstoragelabel'],
                job = Config.JobSettings.JobName,
                stash = 'bb_boss_storage'
            },
            {
                event = 'boii-bestbuds:client:OpenStash',
                icon = Language.Targeting['forceentryicon'],
                label = Language.Targeting['forceentrylabel'],
                job = Config.JobSettings.Raid.JobName,
                stash = 'bb_boss_storage',
                forceentry = true
            }
        },
        distance = v.distance,
    })
end
-- Job storage
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
                event = 'boii-bestbuds:client:OpenStash',
                icon = Language.Targeting['jobstorageicon'],
                label = Language.Targeting['jobstoragelabel'],
                job = Config.JobSettings.JobName,
                stash = 'bb_job_storage'
            },
            {
                event = 'boii-bestbuds:client:OpenStash',
                icon = Language.Targeting['forceentryicon'],
                label = Language.Targeting['forceentrylabel'],
                job = Config.JobSettings.Raid.JobName,
                stash = 'bb_job_storage',
                forceentry = true
            }
        },
        distance = v.distance,
    })
end
AddEventHandler('boii-bestbuds:client:OpenStash', function(data)
    local player = PlayerPedId()
    if not data.forceentry then
        TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
            maxweight = 1000000, -- Adjust storage weight here
            slots = 41, -- Adjust storage slots here
        })
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)  
    else
        Core.Functions.Progressbar(data.stash, Language.Shared['forceentry'], Config.JobSettings.Raid.ForceEntryTime*1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = Config.JobSettings.Raid.ForceEntryAnimationDict,
            anim = Config.JobSettings.Raid.ForceEntryAnimation,
            flags = Config.JobSettings.Raid.ForceEntryFlags,
        }, {}, {}, function()
            TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
            maxweight = 1000000, -- Adjust storage weight here
            slots = 41, -- Adjust storage slots here
        })
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4) 
            ClearPedTasks(player)
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-bestbuds:notifications', Language.Shared['cancel'], 'error')
        end)
    end
end)
--<!>-- STORAGES END --<!>--

--<!>-- STORAGE TRAY START --<!>--
-- Tray storage
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
            event = 'boii-bestbuds:client:OpenTrayStorage',
            icon = Language.Targeting['traystorageicon'],
            label = Language.Targeting['traystoragelabel'],
            },
        },
        distance = v.distance,
    })
end
-- Tray storage event
RegisterNetEvent('boii-bestbuds:client:OpenTrayStorage', function()
    TriggerEvent('inventory:client:SetCurrentStash', 'bb_tray')
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'bb_tray', {
        maxweight = 21000, -- Adjust storage weight here
        slots = 5, -- Adjust storage slots here
    })
end)
--<!>-- STORAGE TRAY END --<!>--

--<!>-- EPOS START --<!>--
-- EPOS
for k, v in pairs(Config.JobSettings.Locations.EPOS) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:BestBudsPay',
            icon = Language.Targeting['eposicon'],
            label = Language.Targeting['eposlabel'],
            job = {[Config.JobSettings.JobName] = 2}
            },
        },
        distance = v.distance,
    })
end
-- Event to charge customers
RegisterNetEvent('boii-bestbuds:client:BestBudsPay', function()
    local input = exports[InputName]:ShowInput({
        header = Language.Locations.Billing['paymenuheader'],
        submitText = Language.Locations.Billing['paymenuheadertext'],
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = Language.Locations.Billing['paytext']
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = Language.Locations.Billing['payamount'],
            }
        }
    })
    if input then
        if not input.id or not input.amount then 
            return 
        end
        TriggerServerEvent('boii-bestbuds:server:BestBudsPay', input.id, input.amount)
    end
end)
--<!>-- EPOS START --<!>--

--<!>-- TRIMMING START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Trimming) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:TrimmingMenu',
            icon = Language.Targeting['trimicon'],
            label = Language.Targeting['trimlabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
--<!>-- TRIMMING END --<!>--

--<!>-- BONGS START --<!>--
for k, v in pairs(Config.JobSettings.Locations.BongTable) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:BongMenu',
            icon = Language.Targeting['bongicon'],
            label = Language.Targeting['bonglabel'],
            },
        },
        distance = v.distance,
    })
end
--<!>-- BONGS END --<!>--

--<!>-- EDIBLES START --<!>--
-- Targeting
for k, v in pairs(Config.JobSettings.Locations.Edibles) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:EdiblesMenu',
            icon = Language.Targeting['ediblesicon'],
            label = Language.Targeting['edibleslabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
-- Prepare edibles
RegisterNetEvent('boii-bestbuds:client:PrepareEdibles', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = ''
    gummy = ''
    gummyamount = ''
    timer = ''
    weedcrop = '' -- Crop to remove
    cropremove = '' -- Amount of crop to remove
    item1name = ''
    item1amount = ''
    item2name = ''
    item2amount = ''
    item3name = ''
    item3amount = ''
    ProgressAnimationDict = Config.JobSettings.Edibles.ProgressAnimationDict
    ProgressAnimation = Config.JobSettings.Edibles.ProgressAnimation
    ProgressFlags = Config.JobSettings.Edibles.ProgressFlags
    if args == 1 then
        name = 'bb_edibles_s1'
        gummy = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain1.Time
        weedcrop = Config.JobSettings.Harvest.Strain1.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain1.RemoveAmount
        item2name = Config.JobSettings.Edibles.Strain1.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain1.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain1.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain1.RequiredItems['3'].amount
    elseif args == 2 then
        name = 'bb_edibles_s2'
        gummy = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain2.Time
        weedcrop = Config.JobSettings.Harvest.Strain2.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain2.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain2.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain2.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain2.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain2.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain2.RequiredItems['3'].amount
    elseif args == 3 then
        name = 'bb_edibles_s3'
        gummy = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain3.Time
        weedcrop = Config.JobSettings.Harvest.Strain3.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain3.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain3.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain3.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain3.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain3.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain3.RequiredItems['3'].amount
    elseif args == 4 then
        name = 'bb_edibles_s4'
        gummy = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain4.Time
        weedcrop = Config.JobSettings.Harvest.Strain4.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain4.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain4.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain4.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain4.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain4.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain4.RequiredItems['3'].amount
    elseif args == 5 then
        name = 'bb_edibles_s5'
        gummy = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].name
        gummyamount = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].amount
        timer = Config.JobSettings.Edibles.Strain5.Time
        weedcrop = Config.JobSettings.Harvest.Strain5.ReturnItem['1'].name
        cropremove = Config.JobSettings.Edibles.Strain5.RemoveAmount
        item1name = Config.JobSettings.Edibles.Strain5.RequiredItems['1'].name
        item2name = Config.JobSettings.Edibles.Strain5.RequiredItems['2'].name
        item2amount = Config.JobSettings.Edibles.Strain5.RequiredItems['2'].amount
        item3name = Config.JobSettings.Edibles.Strain5.RequiredItems['3'].name
        item3amount = Config.JobSettings.Edibles.Strain5.RequiredItems['3'].amount
    end
    Core.Functions.Progressbar(name, Language.Locations.Edibles['makeedibles'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
        flags = ProgressFlags,
    }, {}, {}, function()
        TriggerServerEvent('boii-bestbuds:server:RemoveItem', weedcrop, cropremove)
        Wait(200)
        TriggerServerEvent('boii-bestbuds:server:RemoveItem', item2name, item2amount)
        TriggerServerEvent('boii-bestbuds:server:RemoveItem', item3name, item3amount)
        Wait(1000)
        TriggerServerEvent('boii-bestbuds:server:AddItem', gummy, gummyamount)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-bestbuds:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)
-- Eat edibles
RegisterNetEvent('boii-bestbuds:client:EatEdibles', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = ''
    edible = ''
    timer = ''
    armour = ''
    stress = ''
    ProgressAnimationDict = Config.DrugSettings.Edibles.ProgressAnimationDict
    ProgressAnimation = Config.DrugSettings.Edibles.ProgressAnimation
    ProgressFlags = Config.DrugSettings.Edibles.ProgressFlags
    if args == 1 then
        name = 'ww_ediblestrain1'
        edible = Config.JobSettings.Edibles.Strain1.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain1.Time
        armour = Config.DrugSettings.Edibles.Strain1.Armour
        stress = Config.DrugSettings.Edibles.Strain1.Stress
    elseif args == 2 then
        name = 'ww_ediblestrain2'
        edible = Config.JobSettings.Edibles.Strain2.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain2.Time
        armour = Config.DrugSettings.Edibles.Strain2.Armour
        stress = Config.DrugSettings.Edibles.Strain2.Stress
    elseif args == 3 then
        name = 'ww_ediblestrain3'
        edible = Config.JobSettings.Edibles.Strain3.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain3.Time
        armour = Config.DrugSettings.Edibles.Strain3.Armour
        stress = Config.DrugSettings.Edibles.Strain3.Stress
    elseif args == 4 then
        name = 'ww_ediblestrain4'
        edible = Config.JobSettings.Edibles.Strain4.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain4.Time
        armour = Config.DrugSettings.Edibles.Strain4.Armour
        stress = Config.DrugSettings.Edibles.Strain4.Stress
    elseif args == 5 then
        name = 'ww_ediblestrain5'
        edible = Config.JobSettings.Edibles.Strain5.ReturnItem['1'].name
        timer = Config.DrugSettings.Edibles.Strain5.Time
        armour = Config.DrugSettings.Edibles.Strain5.Armour
        stress = Config.DrugSettings.Edibles.Strain5.Stress
    end
    Core.Functions.Progressbar(name, Language.Locations.Edibles['eatedibles'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
        flags = ProgressFlags,
    }, {}, {}, function()
        if Config.DrugSettings.Edibles.ScreenEffects == true then
            TriggerServerEvent('boii-bestbuds:server:AddItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)           
            ClearPedTasks(player)
            EdiblesEffect()
        elseif Config.DrugSettings.Edibles.ScreenEffects == false then
            TriggerServerEvent('boii-bestbuds:server:AddItem', edible, 1)
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)   
            ClearPedTasks(player)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-bestbuds:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)
--<!>-- EDIBLES END --<!>--

--<!>-- ROLLING JOINTS START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Rolling) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:RollJointsMenu',
            icon = Language.Targeting['rollingicon'],
            label = Language.Targeting['rollinglabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
--<!>-- JOINTS END --<!>--

--<!>-- STORES START --<!>--
for k, v in pairs(Config.JobSettings.Locations.JobStore) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:OpenJobStore',
            icon = Language.Targeting['jobstoreicon'],
            label = Language.Targeting['jobstorelabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
for k, v in pairs(Config.JobSettings.Locations.SnackTable) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:OpenSnackTable',
            icon = Language.Targeting['snacktableicon'],
            label = Language.Targeting['snacktablelabel'],
            },
        },
        distance = v.distance,
    })
end
-- Open job store
RegisterNetEvent('boii-bestbuds:client:OpenJobStore', function()
    local ShopItems = {}
    ShopItems.label = 'bb_job_store'
    ShopItems.items = Config.JobSettings.Stores.JobStore
    ShopItems.slots = #Config.JobSettings.Stores.JobStore
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'bb_job_store', ShopItems)
end)
-- Open snacks
RegisterNetEvent('boii-bestbuds:client:OpenSnackTable', function()
    local ShopItems = {}
    ShopItems.label = 'bb_snacks'
    ShopItems.items = Config.JobSettings.Stores.SnackTable
    ShopItems.slots = #Config.JobSettings.Stores.SnackTable
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'bb_snacks', ShopItems)
end)
--<!>-- STORES END --<!>--

--<!>-- OUTFITS START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Clothing) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:ChangeOutfit',
            icon = Language.Targeting['outfiticon'],
            label = Language.Targeting['outfitlabel'],
            job = Config.JobSettings.JobName
            },
        },
        distance = v.distance,
    })
end
RegisterNetEvent('boii-bestbuds:client:ChangeOutfit', function()
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Clothes1', 0.4)
    TriggerEvent(ClothingEvent)
end)
--<!>-- OUTFITS END --<!>--


--<!>-- GARAGE START --<!>--
for k, v in pairs(Config.JobSettings.Locations.Garage) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
        name=v.name,
        heading= v.heading,
        debugPoly= v.debugPoly,
        minZ = v.minZ,
        maxZ = v.maxZ,
        },{
        options = {
            {
            event = 'boii-bestbuds:client:AccessGarage',
            icon = Language.Targeting['garageicon'],
            label = Language.Targeting['garagelabel'],
            },
        },
        distance = v.distance,
    })
end
--<!>-- VEHICLE RENTAL MENU END --<!>--

--<!>-- OBJECTS START --<!>--
CreateThread(function()
    RequestModel(`prop_bong_01`)
    while not HasModelLoaded(`prop_bong_01`) do 
        Wait(1)
    end
    RequestModel(`sf_prop_sf_bong_01a`)
    while not HasModelLoaded(`sf_prop_sf_bong_01a`) do 
        Wait(1)
    end
    RequestModel(`bkr_prop_weed_dry_02b`)
    while not HasModelLoaded(`bkr_prop_weed_dry_02b`) do 
        Wait(1)
    end
    RequestModel(`prop_laptop_lester`)
    while not HasModelLoaded(`prop_laptop_lester`) do 
        Wait(1)
    end
    RequestModel(`v_ret_fh_kitchtable`)
    while not HasModelLoaded(`v_ret_fh_kitchtable`) do 
        Wait(1)
    end
    RequestModel(`prop_cs_silver_tray`)
    while not HasModelLoaded(`prop_cs_silver_tray`) do 
        Wait(1)
    end
    Bong1 = CreateObject(`prop_bong_01`, 382.11, -830.52, 28.85, false, false, false)
    Bong2 = CreateObject(`sf_prop_sf_bong_01a`, 382.52, -831.65, 28.85, false, false, false)
    Weed = CreateObject(`bkr_prop_weed_dry_02b`, 382.29, -831.17, 28.85, false, false, false)
    Laptop = CreateObject(`prop_laptop_lester`, 373.48, -823.91, 29.28, false, false, false)
    EdiblesTable = CreateObject(`v_ret_fh_kitchtable`, 378.43, -819.14, 28.30, false, false, false)
    Tray = CreateObject(`prop_cs_silver_tray`, 378.88, -827.38, 29.29, false, false, false)
    SetEntityHeading(Bong1,90.0)
    SetEntityHeading(Bong2,85.0)
    SetEntityHeading(Weed,85.0)
    SetEntityHeading(Laptop,90.0)
    SetEntityHeading(EdiblesTable, 0.0)
    SetEntityHeading(Tray, 0.0)
    FreezeEntityPosition(Bong1, true)
    FreezeEntityPosition(Bong2, true)
    FreezeEntityPosition(Weed, true)
    FreezeEntityPosition(Laptop, true)
    FreezeEntityPosition(EdiblesTable, true)
    FreezeEntityPosition(Tray, true)
end)
--<!>-- OBJECTS END --<!>--

--<!>-- VEHICLE RENTAL START --<!>--
RegisterNetEvent('boii-bestbuds:client:RentVehicle', function()
	Core.Functions.TriggerCallback('boii-bestbuds:server:MoneyCheck', function(price)
		if price then
            Core.Functions.SpawnVehicle(Config.JobSettings.Garage.Vehicle, function(van)
                SetVehicleNumberPlateText(van, 'BESTBUDS')
                exports[FuelEvent]:SetFuel(van, 100.0)
                SetEntityHeading(van, Config.JobSettings.Garage.Heading)
                TaskWarpPedIntoVehicle(PlayerPedId(), van, -1)
                TriggerEvent('vehiclekeys:client:SetOwner', Core.Functions.GetPlate(van))
                SetVehicleEngineOn(van, true, true)
            end, Config.JobSettings.Garage.Spawn, true)  
		end
	end)
end)
RegisterNetEvent('boii-bestbuds:client:ReturnVehicle', function()
	local player = PlayerPedId()
	if IsPedInAnyVehicle(player) then
        local van = GetVehiclePedIsIn(player,true) 
        Core.Functions.DeleteVehicle(van)
        SetEntityCoords(player, Config.JobSettings.Garage.Spawn.x, Config.JobSettings.Garage.Spawn.y, Config.JobSettings.Garage.Spawn.z, 0, 0, 0, false) 
        SetEntityHeading(player, Config.JobSettings.Garage.Heading)
        TriggerServerEvent('boii-bestbuds:server:ReturnDeposit')
	end
end)
--<!>-- VEHICLE RENTAL END --<!>--