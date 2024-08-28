----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--


--<!>-- WEED ITEMS --<!>--
-- Seeds

--<!>-- NOTES --<!>--
-- How the planting seeds event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "GENDER", "GROWTH RATE", "DEGRADE", "XP"
-- 
-- "ITEM NAME" - This carries the name of the seed you planted to be removed/returned
-- "STRAIN" - This should match your settings in `harvest_sv.lua`
-- "GENDER" - This should match your settings in `harvest_sv.lua`
-- "GROWTH RATE" - How much plants should grow per update tick, 100 = 1%. Default rate: 1% every 1min
-- "DEGRADE" - How much food/water/quality should decay per update tick, 100 = 1%. Default rate: food/water 1% every 1min, quality 0.5% every 1min
-- "XP" - Amount of XP to gain when planting seed
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Skunk', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_skunk_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Skunk', 'Feminized', 100, 100, math.random(1,3))
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'OG Kush', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_og-kush_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'OG Kush', 'Feminized', 100, 100, math.random(1,3))
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'White Widow', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_white-widow_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'White Widow', 'Feminized', 100, 100, math.random(1,3))
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'AK47', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_ak47_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'AK47', 'Feminized', 100, 100, math.random(1,3))
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Amnesia', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_amnesia_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Amnesia', 'Feminized', 100, 100, math.random(1,3))
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Purple Haze', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_purple-haze_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Purple Haze', 'Feminized', 100, 100, math.random(1,3))
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Gelato', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_gelato_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Gelato', 'Feminized', 100, 100, math.random(1,3))
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_seed_m', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Zkittlez', 'Male', 100, 100, math.random(1,3))
end)
Core.Functions.CreateUseableItem('weed_zkittlez_seed_f', function(source, item)
    TriggerEvent('boii-drugs:sv:PlantSeed', source, item.name, 'Zkittlez', 'Feminized', 100, 100, math.random(1,3))
end)


-- Crops
--<!>-- NOTES --<!>--
-- How the trimming event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "BAG ITEM", "AMOUNT"
-- 
-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `trimming_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `trimming_sv.lua`
-- "BAG ITEM" - Name of bag item to remove when trimming
-- "AMOUNT" - Amount of bags to remove/return this is affected by your settings in `trimming_sv.lua`
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_skunk', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'OG Kush', 'weed_og-kush', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_white-widow', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_ak47', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_amnesia', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_purple-haze', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_gelato', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_crop', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local shears = Config.Plants.Outdoor.Actions.Trimming.Required['1'].name
    local scales = Config.Plants.Outdoor.Actions.Trimming.Required['2'].name
    local bags = Config.Plants.Outdoor.Actions.Trimming.Required['3'].name
    local bagamount = math.random(2,7)
    if pData.Functions.GetItemByName(shears) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:Trim', source, item.name, 'Skunk', 'weed_zkittlez', bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Trimming['noshears'], 'error')
    end
end)

-- Bags
--<!>-- NOTES --<!>--
-- How the joint rolling event works
-- "EVENT", "SOURCE", "ITEM NAME", "STRAIN", "RETURN ITEM", "PAPERS ITEM", "AMOUNT"
-- 
-- "ITEM NAME" - This carries the name of the crop you are trimming to remove it
-- "STRAIN" - This should match your settings in `rolling_sv.lua`
-- "RETURN ITEM" - Item to return after trimming this should match your settings in `rolling_sv.lua`
-- "PAPERS ITEM" - Name of papers item to remove when rolling
-- "AMOUNT" - Amount of papers to remove and joints to return
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'Skunk', 'weed_skunk_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'OG Kush', 'weed_og-kush_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'White Widow', 'weed_white-widow_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'AK47', 'weed_ak47_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'Amnesia', 'weed_amnesia_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'Purple Haze', 'weed_purple-haze_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'Gelato', 'weed_gelato_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local grinder = Config.Plants.Outdoor.Actions.Rolling.Required['1'].name
    local papers = Config.Plants.Outdoor.Actions.Rolling.Required['2'].name
    local papersamount = Config.Plants.Outdoor.Actions.Rolling.Required['2'].amount
    if pData.Functions.GetItemByName(grinder) ~= nil then
        if pData.Functions.GetItemByName(papers) ~= nil then
            if pData.Functions.GetItemByName(papers).amount >= papersamount then
                TriggerClientEvent('boii-drugs:cl:Roll', source, item.name, 'Zkittlez', 'weed_zkittlez_joint', papers, papersamount)
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['enoughpapers'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nopapers'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Rolling['nogrinder'], 'error')
    end
end)

-- Joints
--<!>-- NOTES --<!>--
-- How the smoking event works
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS"

-- "ITEM NAME" - Name of joint
-- "ARMOUR" - Amount of armour added by smoking joint
-- "STRESS" - Amount of stress removed by smoking joint
-- "TIME" - Amount of time drug effects should remain active in minutes
--<!>-- NOTES --<!>--

-- Skunk
Core.Functions.CreateUseableItem('weed_skunk_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- OG Kush
Core.Functions.CreateUseableItem('weed_og-kush_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- White Widow
Core.Functions.CreateUseableItem('weed_white-widow_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- AK47
Core.Functions.CreateUseableItem('weed_ak47_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- Amnesia
Core.Functions.CreateUseableItem('weed_amnesia_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- Purple Haze
Core.Functions.CreateUseableItem('weed_purple-haze_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- Gelato
Core.Functions.CreateUseableItem('weed_gelato_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
-- Zkittlez
Core.Functions.CreateUseableItem('weed_zkittlez_joint', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.Plants.Outdoor.Actions.Smoking.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:Smoke', source, item.name, math.random(1,3), math.random(3,5), 2)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Weed.Smoking['nolighter'], 'error')
    end
end)
--<!>-- WEED ITEMS --<!>--

--<!>-- KETAMINE ITEMS --<!>--
-- Tracking remover
Core.Functions.CreateUseableItem('tracker_remover', function(source, item)
    TriggerClientEvent('boii-drugs:cl:RemoveTracker', source)
end)

-- Ounces
Core.Functions.CreateUseableItem('ketamine_1oz', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local bagamount = math.random(25,28)
    if pData.Functions.GetItemByName(Config.Ketamine.Cutting.Required['1'].name) ~= nil then
        if pData.Functions.GetItemByName(Config.Ketamine.Cutting.Required['2'].name) ~= nil then
            if pData.Functions.GetItemByName(Config.Ketamine.Cutting.Required['3'].name) ~= nil then
                if pData.Functions.GetItemByName(Config.Ketamine.Cutting.Required['3'].name).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Ketamine', Config.Ketamine.Cutting.Return.name, Config.Ketamine.Cutting.Required['3'].name, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Ketamine.Cutting['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Ketamine.Cutting['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Ketamine.Cutting['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Ketamine.Cutting['nocutkit'], 'error')
    end    
end)

-- Bags

--<!>-- NOTES --<!>--
-- How to use drug taking event
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS", "EFFECT TIMER"
--
-- "ITEM NAME" -- Name of item you are using to be removed by client
-- "ARMOUR" -- Amount of armour that should be added by taking drugs
-- "STRESS" -- Amount of stress that should be relived by taking drugs
-- "EFFECT TIMER" -- Amount of time screen effects will remain active in mins
--<!>-- NOTES --<!>--

Core.Functions.CreateUseableItem('ketamine', function(source, item)
    TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Ketamine', math.random(30,40), math.random(1,10), 1)
end)
--<!>-- KETAMINE ITEMS --<!>--

--<!>-- HEROIN ITEMS --<!>--
-- Ounces
-- Morphine
Core.Functions.CreateUseableItem('morphinebase', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local cuttingkit = Config.DrugCutting.Shared.Required['1'].name
    local scales = Config.DrugCutting.Shared.Required['2'].name
    local bags = Config.DrugCutting.Heroin.Morphine.Required['1'].name
    local drugbag = Config.DrugCutting.Heroin.Morphine.Return.name
    local bagamount = math.random(13,20)
    if pData.Functions.GetItemByName(cuttingkit) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Morphine', drugbag, bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Heroin.Morphine['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Heroin.Morphine['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['nocutkit'], 'error')
    end     
end)
-- Heroin
Core.Functions.CreateUseableItem('heroin_1oz', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local cuttingkit = Config.DrugCutting.Shared.Required['1'].name
    local scales = Config.DrugCutting.Shared.Required['2'].name
    local bags = Config.DrugCutting.Heroin.Heroin.Required['1'].name
    local drugbag = Config.DrugCutting.Heroin.Heroin.Return.name
    local bagamount = math.random(25,28)
    if pData.Functions.GetItemByName(cuttingkit) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Heroin', drugbag, bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Heroin.Heroin['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Heroin.Heroin['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['nocutkit'], 'error')
    end     
end)

-- Prep
-- Morphine
Core.Functions.CreateUseableItem('morphinebaggy', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local water = Config.PrepDrugs.Heroin.Morphine.Required['1'].name
    local vial = Config.PrepDrugs.Heroin.Morphine.Required['2'].name
    local drugitem = Config.PrepDrugs.Heroin.Morphine.Return.name
    if pData.Functions.GetItemByName(water) ~= nil then
        if pData.Functions.GetItemByName(vial) ~= nil then
            TriggerClientEvent('boii-drugs:cl:PrepMorphine', source, item.name, drugitem, water, vial)
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.PrepDrugs.Heroin.Morphine['novial'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.PrepDrugs.Heroin.Morphine['nowater'], 'error')
    end
end)
-- Liquid heroin
Core.Functions.CreateUseableItem('heroinbaggy', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local water = Config.PrepDrugs.Heroin.Heroin.Required['1'].name
    local vial = Config.PrepDrugs.Heroin.Heroin.Required['2'].name
    local drugitem = Config.PrepDrugs.Heroin.Heroin.Return.name
    if pData.Functions.GetItemByName(water) ~= nil then
        if pData.Functions.GetItemByName(vial) ~= nil then
            TriggerClientEvent('boii-drugs:cl:PrepHeroin', source, item.name, drugitem, water, vial)
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.PrepDrugs.Heroin.Heroin['novial'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.PrepDrugs.Heroin.Heroin['nowater'], 'error')
    end
end)

-- Drugs
--<!>-- NOTES --<!>--
-- How to use drug taking event
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS", "EFFECT TIMER"
--
-- "ITEM NAME" -- Name of item you are using to be removed by client
-- "ARMOUR" -- Amount of armour that should be added by taking drugs
-- "STRESS" -- Amount of stress that should be relived by taking drugs
-- "EFFECT TIMER" -- Amount of time screen effects will remain active in mins
--<!>-- NOTES --<!>--

-- Morphine
Core.Functions.CreateUseableItem('morphine', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local syringe = Config.TakeDrugs.Heroin.Morphine.Required.name
    if pData.Functions.GetItemByName(syringe) ~= nil then
        TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Morphine', math.random(60,80), math.random(1,5), 1)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.TakeDrugs.Heroin.Morphine['nosyringe'], 'error')
    end
end)
-- Heroin
Core.Functions.CreateUseableItem('liquidheroin', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local syringe = Config.TakeDrugs.Heroin.Heroin.Required.name
    if pData.Functions.GetItemByName(syringe) ~= nil then
        TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Heroin', math.random(20,30), math.random(13,25), 1)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.TakeDrugs.Heroin.Heroin['nosyringe'], 'error')
    end
end)
--<!>-- HEROIN ITEMS --<!>--

--<!>-- METH ITEMS --<!>--
-- Ounces
Core.Functions.CreateUseableItem('meth_1oz', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local cuttingkit = Config.DrugCutting.Shared.Required['1'].name
    local scales = Config.DrugCutting.Shared.Required['2'].name
    local bags = Config.DrugCutting.Meth.Meth.Required['1'].name
    local drugbag = Config.DrugCutting.Meth.Meth.Return.name
    local bagamount = math.random(25,28)
    if pData.Functions.GetItemByName(cuttingkit) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Meth', drugbag, bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Meth['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Meth['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['nocutkit'], 'error')
    end     
end)

-- Bags
--<!>-- NOTES --<!>--
-- How to use drug taking event
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS", "EFFECT TIMER"
--
-- "ITEM NAME" -- Name of item you are using to be removed by client
-- "ARMOUR" -- Amount of armour that should be added by taking drugs
-- "STRESS" -- Amount of stress that should be relived by taking drugs
-- "EFFECT TIMER" -- Amount of time screen effects will remain active in mins
--<!>-- NOTES --<!>--

Core.Functions.CreateUseableItem('meth', function(source, item)
    TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Meth', math.random(30,40), math.random(1,10), 1)
end)
--<!>-- METH ITEMS --<!>--

--<!>-- COCAINE ITEMS --<!>--
-- Tools
Core.Functions.CreateUseableItem('plasticjerrycan', function(source, item)
    TriggerClientEvent('boii-drugs:cl:CollectWater', source, item.name)
end)

-- Ounces
-- Crack
Core.Functions.CreateUseableItem('crack_1oz', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local cuttingkit = Config.DrugCutting.Shared.Required['1'].name
    local scales = Config.DrugCutting.Shared.Required['2'].name
    local bags = Config.DrugCutting.Cocaine.Crack.Required['1'].name
    local drugbag = Config.DrugCutting.Cocaine.Crack.Return.name
    local bagamount = math.random(25,28)
    if pData.Functions.GetItemByName(cuttingkit) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Crack', drugbag, bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Cocaine.Crack['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Cocaine.Crack['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Crack['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Crack['nocutkit'], 'error')
    end     
end)
-- Cocaine
Core.Functions.CreateUseableItem('coke_1oz', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local cuttingkit = Config.DrugCutting.Shared.Required['1'].name
    local scales = Config.DrugCutting.Shared.Required['2'].name
    local bags = Config.DrugCutting.Cocaine.Cocaine.Required['1'].name
    local drugbag = Config.DrugCutting.Cocaine.Cocaine.Return.name
    local bagamount = math.random(25,28)
    if pData.Functions.GetItemByName(cuttingkit) ~= nil then
        if pData.Functions.GetItemByName(scales) ~= nil then
            if pData.Functions.GetItemByName(bags) ~= nil then
                if pData.Functions.GetItemByName(bags).amount >= bagamount then
                    TriggerClientEvent('boii-drugs:cl:CutDrugs', source, item.name, 'Cocaine', drugbag, bags, bagamount)
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Cocaine.Cocaine['enoughbags'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Cocaine.Cocaine['nobags'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['noscales'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['nocutkit'], 'error')
    end     
end)

-- Bags
--<!>-- NOTES --<!>--
-- How to use drug taking event
-- "EVENT", "SOURCE", "ITEM NAME", "ARMOUR", "STRESS", "EFFECT TIMER"
--
-- "ITEM NAME" -- Name of item you are using to be removed by client
-- "ARMOUR" -- Amount of armour that should be added by taking drugs
-- "STRESS" -- Amount of stress that should be relived by taking drugs
-- "EFFECT TIMER" -- Amount of time screen effects will remain active in mins
--<!>-- NOTES --<!>--

-- Crack
Core.Functions.CreateUseableItem('crack_baggy', function(source, item)
    local pData = Core.Functions.GetPlayer(source)
    local lighter = Config.TakeDrugs.Cocaine.Crack.Required.name
    if pData.Functions.GetItemByName(lighter) ~= nil then
        TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Crack', math.random(50,60), math.random(1,10), 1)
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.TakeDrugs.Cocaine.Crack['nolighter'], 'error')
    end
end)
-- Cocaine
Core.Functions.CreateUseableItem('cokebaggy', function(source, item)
    TriggerClientEvent('boii-drugs:cl:TakeDrugs', source, item.name, 'Cocaine', math.random(10,30), math.random(1,10), 1)
end)
--<!>-- COCAINE ITEMS --<!>--

--<!>-- BURNER PHONE --<!>--
Core.Functions.CreateUseableItem('burnerphone', function(source, item)
    TriggerClientEvent('boii-drugs:cl:ToggleSellingMenu', source)
end)
--<!>-- BURNER PHONE --<!>--