function ExtractCashConfig(data)
    if not data then
        return nil, nil
    end

    local useCashAsItem = data:match("UseCashAsItem%s*=%s*(%a+)")

    if useCashAsItem == "true" then
        useCashAsItem = true
    elseif useCashAsItem == "false" then
        useCashAsItem = false
    else
        useCashAsItem = nil
    end

    -- Extract the CashItem value
    local cashItem = data:match("CashItem%s*=%s*'([^']+)'")

    return useCashAsItem, cashItem
end

useCashAsItem, cashItem = nil, nil

CreateThread(function()
    if Config.Inventories == Inventories.QS then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1

            local itemCount = exports[Config.Inventories]:GetItemTotalAmount(source, itemName)

            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, itemCount >= amount or false)

            return itemCount and itemCount >= amount or false
        end

        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)
            local inventory = {}

            if not player then
                return inventory
            end

            if doesExportExistInResource(Inventories.QS, "GetPlayerInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetPlayerInventory")
                inventory = exports[Config.Inventories]:GetPlayerInventory(playerId)
            elseif doesExportExistInResource(Inventories.QS, "GetInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetInventory")
                inventory = exports[Config.Inventories]:GetInventory(playerId)
            else
                dbg.debug("Inventory-QS: Loading player inventory as fallback via Framework.")
                if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                    inventory = player.PlayerData.items
                elseif Config.Framework == Framework.ESX then
                    local items = player.inventory
                    local loadout = player.getLoadout(false)
        
                    if items and next(items) then
                        for k, v in pairs(items) do
                            if v.count > 0 then
                                inventory[#inventory + 1] = {
                                    name = v.name,
                                    count = v.count,
                                    label = v.label,
                                    weight = v.weight,
                                    useable = v.useable,
                                    rare = v.rare,
                                }
                            end
                        end
                    end
        
                    if loadout and next(loadout) then
                        inventory = table.merge(inventory, loadout)
                    end
                end
            end

            return inventory
        end

        Inventory.registerUsableItem = function(itemName, cb)
            if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                Framework.object.Functions.CreateUseableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end

            if Config.Framework == Framework.ESX then
                Framework.object.RegisterUsableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end
        end


        --- @return boolean success
        Inventory.addItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end

            return exports[Config.Inventories]:AddItem(client, item, amount, nil, data)
        end

        Inventory.addMultipleItems = function(client, items)
            if not client then
                return
            end

            if not items then
                return
            end

            local p = promise.new()

            if next(items) then
                for i = 1, #items, 1 do
                    local item = items[i]

                    if item and next(item) then
                        Inventory.addItem(client, item.name, item.count, item.metadata)
                    end

                    if i >= #items then
                        p:resolve(true)
                    end
                end
            else
                p:resolve(false)
            end

            return Citizen.Await(p)
        end

        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if useCashAsItem and cashItem then
                if player == nil then
                    return false
                end

                if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                    player.Functions.RemoveMoney('cash', amount)
                end

                if Config.Framework == Framework.ESX then
                    player.removeMoney(amount)
                end
            else
                if item == 'cash' or item == 'money' then
                    if player == nil then
                        return false
                    end

                    if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                        return player.Functions.RemoveMoney('cash', amount)
                    end

                    if Config.Framework == Framework.ESX then
                        return player.removeMoney(amount)
                    end
                end
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end

            return exports[Config.Inventories]:RemoveItem(client, item, amount, nil, data)
        end

        Inventory.clearInventory = function(playerId)
            local success, error_message = pcall(function()
                if Config.Stash.KeepItemsState and Inventory.KeepSessionItems then
                    if useCashAsItem and cashItem then
                        local player = Framework.getPlayer(playerId)

                        if player == nil then
                            return false
                        end

                        if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                            player.Functions.RemoveMoney('cash', player.Functions.GetMoney('cash'))
                        end

                        if Config.Framework == Framework.ESX then
                            player.removeMoney(player.getMoney())
                        end
                    end

                    return exports[Config.Inventories]:ClearInventory(playerId, Inventory.KeepSessionItems)
                else
                    return exports[Config.Inventories]:ClearInventory(playerId, {})
                end
            end)

            local state = false

            if success then
                state = true
            elseif Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                state = Framework.clearInventory(playerId)
            end

            return state
        end

        local inventoryResource = Config.Framework == Framework.ESX and Config.Inventories or Framework.QBCore

        AssetDeployer:registerFileDeploy('items', inventoryResource, 'shared/items.lua',
            function(file, data)
                file = file:strtrim():gsub('}$', '')
                file = append(file, ASSET_DEPLOYER_WATERMARK_PREFIX)
                local itemTemplate = [[
        ['%s'] = {
            ['name'] = '%s',
            ['label'] = '%s',
            ['weight'] = %s,
            ['type'] = '%s',
            ['image'] = '%s.png',
            ['unique'] = %s,
            ['useable'] = %s,
            ['shouldClose'] = %s,
            ['combinable'] = nil,
        },
            ]]

                for _, item in ipairs(data) do
                    local formattedItem = itemTemplate:format(
                        item.name,
                        item.name,
                        item.label,
                        item.weight,
                        item.type,
                        item.name,
                        item.unique,
                        item.useable,
                        item.shouldClose
                    )
                    file = appendQB(file, formattedItem)
                end

                file = append(file, '', ASSET_DEPLOYER_WATERMARK_SUFFIX, '}')
                return file
            end,
            QB_INVENTORY_ITEMS_DEPLOY
        )

        AssetDeployer:registerCopyFilesDeploy('items-images', Config.Inventories, 'assets/inventoryImages/png',
            'html/images',
            function(data)
                local files = {}

                for _, item in ipairs(data) do
                    table.insert(files, item .. '.png')
                end

                return files
            end,
            { 'sprunk', 'sludgie', 'ecola_light', 'ecola', 'coffee', 'water', 'fries', 'pizza_ham', 'chips', 'donut',
                'wire_cutter', 'cigarrete' }
        )

        local inventoryData = LoadScriptData('server/custom/framework/qb', Inventories.QS)

        useCashAsItem, cashItem = ExtractCashConfig(inventoryData)
    end
end)
