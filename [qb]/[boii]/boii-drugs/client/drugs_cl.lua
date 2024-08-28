----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('boii-drugs:notify', function(msg,type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
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

--<!>-- PEDS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
        DrugPeds = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
        FreezeEntityPosition(DrugPeds, true)
        SetEntityInvincible(DrugPeds, true)
        SetBlockingOfNonTemporaryEvents(DrugPeds, true)
        TaskStartScenarioInPlace(DrugPeds, v.scenario, 0, true)
        exports[TargetName]:AddEntityZone('drug_peds'..DrugPeds, DrugPeds, {
            name = 'drug_peds'..DrugPeds,
            heading = GetEntityHeading(DrugPeds),
            debugPoly = false,
        }, {
            options = {
                {   
                    icon = v.icon,
                    label = v.label,
                    event = v.event,
                    canInteract = function(entity)
                        if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then return false end
                        return true
                    end,    
                },
            },
            distance = v.distance
        })
    end
end)
CreateThread(function()
    for _,v in pairs(Config.Bodyguard) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
        bodyguard = CreatePed(4, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, true)
        SetEntityHeading(bodyguard, v.h)
        SetEntityAsMissionEntity(bodyguard)
        FreezeEntityPosition(bodyguard, true)
        SetEntityInvincible(bodyguard, true)
        SetPedAccuracy(bodyguard, 100)
        weapon = GetHashKey(v.weapon)
        GiveWeaponToPed(bodyguard, weapon, 40, false, true)    
    end
end)
--<!>-- PEDS END --<!>--

--<!>-- PROCESSING TABLES --<!>--
CreateThread(function()
    for k, v in pairs(Config.Ketamine.Locations.Processing) do
        ReqModel(v.model)
        local ProcessingTables = CreateObject(v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, true)
        SetEntityInvincible(ProcessingTables, true)
        SetBlockingOfNonTemporaryEvents(ProcessingTables, true)
        FreezeEntityPosition(ProcessingTables, true)
        SetEntityHeading(ProcessingTables, v['coords'].w)
        exports[TargetName]:AddEntityZone('ketamine_tables'..ProcessingTables, ProcessingTables, {
            name = 'ketamine_tables'..ProcessingTables,
            heading = GetEntityHeading(ProcessingTables),
            debugPoly = false,
        }, {
            options = {
                {   
                    icon = v.icon,
                    label = v.label,
                    event = v.event,   
                },
            },
            distance = v.distance
        })
    end
end)
--<!>-- PROCESSING TABLES --<!>--

--<!>-- DRUG MATERIALS TARGETING --<!>--
-- Shared
-- Hydrochloric Acid
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Shared.Hydrochloric.Prop, {options = {{event = 'boii-drugs:cl:CollectHydro', icon = Language.Targeting['hydroicon'], label = Language.Targeting['hydrolabel']}}, distance = Config.DrugMaterials.Shared.Hydrochloric.Range})
-- Construction site
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Shared.ConstructionSite.Prop, {options = {{event = 'boii-drugs:cl:CollectConstruction', icon = Language.Targeting['matsicon'], label = Language.Targeting['matslabel']}}, distance = Config.DrugMaterials.Shared.ConstructionSite.Range})

-- Heroin
-- Opium plants
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Heroin.Opium.Prop, {options = {{event = 'boii-drugs:cl:CollectOpium', icon = Language.Targeting['opiumicon'], label = Language.Targeting['opiumlabel']}}, distance = Config.DrugMaterials.Heroin.Opium.Range})
-- Ether
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Heroin.Ether.Prop, {options = {{event = 'boii-drugs:cl:CollectEther', icon = Language.Targeting['ethericon'], label = Language.Targeting['etherlabel']}}, distance = Config.DrugMaterials.Heroin.Ether.Range})

-- Meth
-- Methylamine
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Meth.Methylamine.Prop, {options = {{event = 'boii-drugs:cl:CollectMethy', icon = Language.Targeting['methyicon'], label = Language.Targeting['methylabel']}}, distance = Config.DrugMaterials.Meth.Methylamine.Range})
-- Acetone
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Meth.Acetone.Prop, {options = {{event = 'boii-drugs:cl:CollectAcetone', icon = Language.Targeting['acetoneicon'], label = Language.Targeting['acetonelabel']}}, distance = Config.DrugMaterials.Meth.Acetone.Range})
-- Prospecting
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Meth.Lithium.Prop, {options = {{event = 'boii-drugs:cl:ProspectRock', icon = Language.Targeting['prospecticon'], label = Language.Targeting['prospectlabel']}}, distance = Config.DrugMaterials.Meth.Lithium.Range})

-- Cocaine
-- Coca plants
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Cocaine.CocaPlants.Prop, {options = {{event = 'boii-drugs:cl:CollectCoca', icon = Language.Targeting['cocaicon'], label = Language.Targeting['cocalabel']}}, distance = Config.DrugMaterials.Cocaine.CocaPlants.Range})
-- Illegal gasoline
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Cocaine.IllegalGasoline.Prop, {options = {{event = 'boii-drugs:cl:CollectGasoline', icon = Language.Targeting['gasolineicon'], label = Language.Targeting['gasolinelabel']}}, distance = Config.DrugMaterials.Cocaine.IllegalGasoline.Range})
-- Benzocaine
exports[TargetName]:AddTargetModel(Config.DrugMaterials.Cocaine.Benzocaine.Prop, {options = {{event = 'boii-drugs:cl:CollectBenzo', icon = Language.Targeting['carticon'], label = Language.Targeting['cartlabel']}}, distance = Config.DrugMaterials.Cocaine.Benzocaine.Range})
--<!>-- DRUG MATERIALS TARGETING --<!>--


--<!>-- STORES --<!>--
RegisterNetEvent('boii-drugs:cl:OpenShop', function(args)
    local args = tonumber(args)
    storeitems = {}
    if args == 1 then
        storeitems.label = Language.Stores.Weed.SmokeShop['smokeshopheader']
        storeitems.items = Config.Stores.Weed.SmokeShop.Items
        storeitems.slots = #Config.Stores.Weed.SmokeShop.Items
        lang = 'SMOKEONTHEWATER_'
    elseif args == 2 then
        storeitems.label = Language.Stores.Heroin.Pharmacy['pharmacystorelabel']
        storeitems.items = Config.Stores.Heroin.Pharmacy.Items
        storeitems.slots = #Config.Stores.Heroin.Pharmacy.Items
        lang = 'PHARMACIST_'
    elseif args == 3 then
        storeitems.label = Language.Stores.Heroin.Morphine.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Heroin.Morphine.BlackMarket.Items
		storeitems.slots = #Config.Stores.Heroin.Morphine.BlackMarket.Items
		lang = 'MORPHINE_BLACKMARKET_'
    elseif args == 4 then
        storeitems.label = Language.Stores.Heroin.HeroinBase.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Heroin.HeroinBase.BlackMarket.Items
		storeitems.slots = #Config.Stores.Heroin.HeroinBase.BlackMarket.Items
		lang = 'HEROINB_BLACKMARKET_'
    elseif args == 5 then
        storeitems.label = Language.Stores.Heroin.Heroin.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Heroin.Heroin.BlackMarket.Items
		storeitems.slots = #Config.Stores.Heroin.Heroin.BlackMarket.Items
		lang = 'HEROIN_BLACKMARKET_'
    elseif args == 6 then
        storeitems.label = Language.Stores.Cocaine.Crack.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Cocaine.Crack.BlackMarket.Items
		storeitems.slots = #Config.Stores.Cocaine.Crack.BlackMarket.Items
		lang = 'CRACK_BLACKMARKET_'
    elseif args == 7 then
        storeitems.label = Language.Stores.Meth.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Meth.BlackMarket.Items
		storeitems.slots = #Config.Stores.Meth.BlackMarket.Items
		lang = 'METH_BLACKMARKET_'
    elseif args == 8 then
        storeitems.label = Language.Stores.Cocaine.Cocaine.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.Cocaine.Cocaine.BlackMarket.Items
		storeitems.slots = #Config.Stores.Cocaine.Cocaine.BlackMarket.Items
		lang = 'COKE_BLACKMARKET_'
    elseif args == 9 then
        storeitems.label = Language.Stores.BulkSelling.BlackMarket['blackmarketstorelabel']
		storeitems.items = Config.Stores.BulkSelling.BlackMarket.Items
		storeitems.slots = #Config.Stores.BulkSelling.BlackMarket.Items
		lang = 'COKE_BLACKMARKET_'
    elseif args == 10 then
        storeitems.label = 'Suspicious Worker'
		storeitems.items = Config.Ketamine.Worker.Store.Items
		storeitems.slots = #Config.Ketamine.Worker.Store.Items
		lang = 'KETAMINE_BLACKMARKET_'
    end
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', lang, storeitems)
end)
--<!>-- STORES --<!>--

--<!>-- ALERTS --<!>--
RegisterNetEvent('boii-drugs:cl:AlertPolice', function(coords)
    if ServiceJob() then
        local alpha = 250
        local Blip = AddBlipForCoord(coords)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('boii-drugs:notify', Language.Alerts['notif'], 'police')
        SetBlipSprite(Blip,  161)
        SetBlipColour(Blip,  1)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Language.Alerts['blip'])
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Wait(120*4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    end
end)
--<!>-- ALERTS --<!>--

--<!>-- ALERTS --<!>--
RegisterNetEvent('boii-drugs:cl:AlertPoliceTracker', function(coords)
    if ServiceJob() then
        local alpha = 120
        local Blip = AddBlipForCoord(coords)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('boii-drugs:notify', Language.Ketamine.Alerts['notif'], 'police')
        SetBlipSprite(Blip,  161) -- Change blip here
        SetBlipColour(Blip,  1) -- Change blip colour here
        SetBlipScale(Blip, 1.5) -- Change blip scale here
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Language.Ketamine.Alerts['blip'])
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Wait(120*4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    end
end)
--<!>-- ALERTS --<!>--