-- ███████ ██    ██ ███    ██  ██████ ████████ ██  ██████  ███    ██ ███████
-- ██      ██    ██ ████   ██ ██         ██    ██ ██    ██ ████   ██ ██
-- █████   ██    ██ ██ ██  ██ ██         ██    ██ ██    ██ ██ ██  ██ ███████
-- ██      ██    ██ ██  ██ ██ ██         ██    ██ ██    ██ ██  ██ ██      ██
-- ██       ██████  ██   ████  ██████    ██    ██  ██████  ██   ████ ███████

--Remove Tool On Break
AddEventHandler('ngd-tobacco:Server:RemoveTool', function(src, tool)
    local player = Framework.GetPlayer(src)
    if player.Job.Name ~= Config.Job then return end
    Framework.RemoveItem(src, tool, 1)
end)

--Give Cig Tobacco
AddEventHandler('ngd-tobacco:Server:GiveCigTobacco', function(src, plantitem)
    local itemcheck = plantitem
    if Framework.Items[itemcheck] == nil then
        TriggerClientEvent('ngd-tobacco:Client:Notify', src, Config.Lang.Notifications.System.MissingItemsT,
            Config.Lang.Notifications.System.MissingItemsServM, 5000, 'error')
        Wait(1500)
        print("Item " .. itemcheck .. " is missing from your inventory")
    end
    local player = Framework.GetPlayer(src)
    if player.Job.Name ~= Config.Job then return end
    for i = 1, Config.CigTobaccoItemQty do
        local moistureContent = math.random(85, 100)
        local description = string.format(Config.Lang.CigTobaccoDescription, tostring(moistureContent))
        local metadata = {
            description = description,
            moisture_content = moistureContent
        }
        Framework.AddItem(src, plantitem, 1, metadata)
    end
end)

--Give Pipe Tobacco
AddEventHandler('ngd-tobacco:Server:GivePipeTobacco', function(src, plantitem)
    local itemcheck = plantitem
    if Framework.Items[itemcheck] == nil then
        TriggerClientEvent('ngd-tobacco:Client:Notify', src, Config.Lang.Notifications.System.MissingItemsT,
            Config.Lang.Notifications.System.MissingItemsServM, 5000, 'error')
        Wait(1500)
        print("Item " .. itemcheck .. " is missing from your inventory")
    end
    local player = Framework.GetPlayer(src)
    if player.Job.Name ~= Config.Job then return end
    for i = 1, Config.PipeTobaccoItemQty do
        local moistureContent = math.random(85, 100)
        local description = string.format(Config.Lang.PipeTobaccoDescription, tostring(moistureContent))
        local metadata = {
            description = description,
            moisture_content = moistureContent
        }
        Framework.AddItem(src, plantitem, 1, metadata)
    end
end)

--Give Cigar Tobacco
AddEventHandler('ngd-tobacco:Server:GiveCigarTobacco', function(src, plantitem)
    local itemcheck = plantitem
    if Framework.Items[itemcheck] == nil then
        TriggerClientEvent('ngd-tobacco:Client:Notify', src, Config.Lang.Notifications.System.MissingItemsT,
            Config.Lang.Notifications.System.MissingItemsServM, 5000, 'error')
        Wait(1500)
        print("Item " .. itemcheck .. " is missing from your inventory")
    end
    local player = Framework.GetPlayer(src)
    if player.Job.Name ~= Config.Job then return end
    for i = 1, Config.CigarTobaccoItemQty do
        local moistureContent = math.random(85, 100)
        local description = string.format(Config.Lang.CigarTobaccoDescription, tostring(moistureContent))
        local metadata = {
            description = description,
            moisture_content = moistureContent
        }
        Framework.AddItem(src, plantitem, 1, metadata)
    end
end)

--Update stats/buffs for smoking
RegisterNetEvent('ngd-tobacco:Server:SmokeStats', function(data, itemForBuff)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end

    local function applyBuff(item)
        local buffConfig = Config.ItemBuffs[item]
        if buffConfig then
            local stressValue = buffConfig.stress and math.random(buffConfig.stress[1], buffConfig.stress[2])
            local armorValue = buffConfig.armor and math.random(buffConfig.armor[1], buffConfig.armor[2])
            local currentStress = Player.GetStatus('stress')
            local currentArmor = Player.GetStatus('armor')
            local newStress = currentStress - stressValue
            local newArmor = currentArmor + armorValue

            if newStress < 0 then
                newStress = 0
            end

            Player.SetStatus('stress', newStress)
            Player.SetStatus('armor', newArmor)

            if Config.debug then
                print('PlayerStress', currentStress, 'PlayerArmor', currentArmor)
                print('NewPlayerStress', newStress, 'NewPlayerArmor', newArmor)
            end

            if Bridge.Framework == 'esx' then
                --LOGIC FOR ESX HUD NEEDS
            else
                TriggerClientEvent('hud:client:UpdateStress', src, newStress)
            end
            SetPedArmour(GetPlayerPed(src), newArmor)
        end
    end

    if itemForBuff then
        applyBuff(itemForBuff)
    end
end)

--Update stats for drinking booze
RegisterServerEvent('ngd-tobacco:Server:Drink', function(itemName)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end
    if Framework.RemoveItem(src, itemName, 1) then
        local randomThirst = math.random(Config.DrinkThirstMin, Config.DrinkThirstMax)
        local randomStress = math.random(Config.DrinkStressMin, Config.DrinkStressMax)
        local thirst = Player.GetStatus('thirst') + randomThirst
        local stress = Player.GetStatus('stress') - randomStress
        local hunger = Player.GetStatus('hunger') + Config.DrinkHunger
        Player.SetStatus('stress', stress)
        Player.SetStatus('thirst', thirst)
        Player.SetStatus('hunger', hunger)
        TriggerEvent('ngd-tobacco:Server:UpdateHud', hunger, thirst, stress)
        TriggerClientEvent('ngd-tobacco:Client:Drunks', src, itemName)
    end
end)

--Update HUD
RegisterNetEvent('ngd-tobacco:Server:UpdateHud', function(hunger, thirst, stress)
    local src = source
    if Bridge.Framework == 'esx' then
        --Stuff that happens to update HUD if needed
    else
        TriggerClientEvent('hud:client:UpdateNeeds', src, hunger, thirst)
        TriggerClientEvent('hud:client:UpdateStress', src, stress)
    end
end)

--Create usable items from packaged products
for PackagedProduct, Contents in pairs(Config.PackageProducts) do
    Framework.CreateUseableItem(PackagedProduct, function(source)
      local player = Framework.GetPlayer(source)
      local ItemName = Framework.Items[PackagedProduct]['label']
      if not player then return end
      if Framework.HasItem(source, PackagedProduct, 1) then
        TriggerClientEvent("ngd-tobacco:Client:OpenProductsAnim", source, ItemName)
        Wait(Config.Animations.OpenProductsTime)
        if Framework.RemoveItem(source, PackagedProduct, 1) then
          for item, quantity in pairs(Contents) do
            Framework.AddItem(source, item, quantity)
          end
        end
      end
    end)
  end
  
  --Create usable items to smoke
  local totalItemsRemoved = 0
  for consumableItem, data in pairs(Config.TobaccoConsumables) do
    Framework.CreateUseableItem(consumableItem, function(source)
      local player = Framework.GetPlayer(source)
      local Consumable = Framework.Items[consumableItem]['name']
      if not player then return end
      if Framework.HasItem(source, consumableItem, 1) then
        if data.itemtype == 'pipe' or data.itemtype == 'longpipe' then
          TriggerClientEvent("ngd-tobacco:Client:PipeMenu", source, data, Consumable)
        else
          TriggerClientEvent("ngd-tobacco:Client:StartSmoking", source, data, Consumable)
          Wait(3500)
          Framework.RemoveItem(source, consumableItem, 1)
          if Config.debug then
          totalItemsRemoved = totalItemsRemoved + 1
            print("Removed item: " .. consumableItem .. ". Total items removed: " .. totalItemsRemoved)
          end
        end
      end
    end)
  end

--Pay society from PED vendor
function PaySociety(moneyType, price)
    Framework.SocietyAddMoney(Config.Job, 'job', price)
    if Config.debug then
        print('Society Money Added')
        print('Total:', price)
    end
end

