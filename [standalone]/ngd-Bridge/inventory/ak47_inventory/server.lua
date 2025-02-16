---@diagnostic disable: duplicate-set-field
module 'shared/debug'
module 'shared/resource'

Version = resource.version(Bridge.InventoryName)
Bridge.Debug('Inventory', Bridge.InventoryName, Version)

local ak47_inventory = exports[Bridge.InventoryName]

Framework.OnReady(ak47_inventory, function()
    Framework.Items = {}
    for k, v in pairs(ak47_inventory:Items()) do
        local item = {}
        item.name = v.name
        item.label = v.label
        item.description = v.description
        item.stack = v.stacksize and true or false
        item.weight = v.weight or 0
        item.close = v.close
        Framework.Items[v.name] = item
    end

    setmetatable(Framework.Items, {
        __index = function(table, key)
            error(('^9Item \'%s\' Does Not Exist.^0'):format(tostring(key)), 0)
        end
    })
end)

Framework.AddItem = function(inventory, item, count, metadata, slot)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    if not ak47_inventory:CanAddItem(inventory, item, count) then return false end
    local success = ak47_inventory:AddItem(inventory, item, count, slot, metadata)
    return success
end

Framework.RemoveItem = function(inventory, item, count, metadata, slot)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    local removed = count
    local removedItems = {}
    local items = ak47_inventory:GetSlotsWithItem(inventory, item, metadata)

    for _, v in pairs(items) do
        if metadata and table.matches(metadata, v.info) then
            if removed >= v.amount and ak47_inventory:RemoveItem(inventory, item, v.amount, v.slot) then
                removedItems[#removedItems + 1] = v
                removed = removed - v.amount
            elseif ak47_inventory:RemoveItem(inventory, item, removed, v.slot) then
                removedItems[#removedItems + 1] = v
                removed = removed - removed
            end
        elseif not metadata then
            if removed >= v.amount and ak47_inventory:RemoveItem(inventory, item, v.amount, v.slot) then
                removedItems[#removedItems + 1] = v
                removed = removed - v.amount
            elseif ak47_inventory:RemoveItem(inventory, item, removed, v.slot) then
                removedItems[#removedItems + 1] = v
                removed = removed - removed
            end
        end

        if removed == 0 then
            break
        end
    end

    if removed == 0 then
        return true
    else
        for _, v in pairs(removedItems) do
            Framework.AddItem(inventory, item, v.amount, v.slot, v.info)
        end
        return false
    end
end

Framework.GetItem = function(inventory, item, metadata, strict)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    local items = {}
    ---@cast items table<number, Item>
    for k, v in pairs(ak47_inventory:GetSlotsWithItem(inventory, item, metadata, strict)) do
        items[#items + 1] = {
            name = v.name,
            count = v.count,
            label = v.label,
            description = v.description,
            metadata = v.info,
            stack = v.stacksize and true or false,
            weight = v.weight or 0,
            close = v.close,
            type = v.type,
            slot = tonumber(v.slot),
        }
    end
    return items
end

Framework.GetItemCount = function(inventory, item, metadata, strict)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    return ak47_inventory:GetAmount(inventory, item, metadata, strict)
end

Framework.HasItem = function(inventory, items, count, metadata, strict)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    if type(items) == "table" then
        if table.type(items) == 'hash' then
            for item, amount in pairs(items) do
                if ak47_inventory:GetAmount(inventory, item, metadata, strict) < amount then
                    return false
                end
            end
            return true
        elseif table.type(items) == 'array' then
            for i = 1, #items do
                local item = items[i]
                if ak47_inventory:GetAmount(inventory, item, metadata, strict) < count then
                    return false
                end
            end
            return true
        end
    else
        return ak47_inventory:GetAmount(inventory, items, metadata, strict) >= count
    end
end

Framework.GetItemMetadata = function(inventory, slot)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    return ak47_inventory:GetSlot(inventory, slot)?.info or {}
end

Framework.SetItemMetadata = function(inventory, slot, metadata)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    ak47_inventory:SetItemInfo(inventory, slot, metadata)
end

Framework.GetInventory = function(inventory)
    local items = {}
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    for k, v in pairs(ak47_inventory:GetInventoryItems(inventory)) do
        if table.type(v) ~= 'empty' then
            items[k] = {
                name = v.name,
                count = v.count,
                label = v.label,
                description = v.description,
                metadata = v.info,
                stack = v.stacksize and true or false,
                weight = v.weight or 0,
                close = v.close,
                type = v.type,
                slot = tonumber(v.slot),
            }
        end
    end
    return items
end

Framework.ClearInventory = function(inventory, keep)
    if type(inventory) == "string" then inventory = 'stash:' .. inventory end
    local inventoryData = ak47_inventory:GetInventoryItems(inventory)
    local items = {}

    if keep then
        local keepType = type(keep)
        if keepType == "string" then
            for k, v in pairs(inventoryData) do
                if v.name == keep then
                    items[k] = v
                end
            end
        elseif keepType == "table" and table.type(keep) == "array" then
            for k, v in pairs(inventoryData) do
                for i = 1, #keep do
                    if v.name == keep[i] then
                        items[k] = v
                    end
                end
            end
        end
    end
    ak47_inventory:SetInvItems(inventory, items)
end

local stashes = {}
Framework.RegisterStash = function(name, slots, weight, owner, groups)
    if not stashes[name] then
        stashes[name] = { slots = slots, weight = weight, owner = owner, groups = groups }
    end
    ak47_inventory:LoadInventory(name, {
        label = name,
        slots = slots,
        maxWeight = weight,
        type = 'stash'
    })
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:GetStash', function(source, cb, name)
    cb(stashes[name] and stashes[name] or nil)
end)

local shops = {}
Framework.RegisterShop = function(name, data)
    if shops[name] then return end
    local items = {}
    for i = 1, #data.items do
        items[i] = {
            item = data.items[i].name,
            buyPrice = data.items[i].price,
            stock = data.items[i].count or nil,
            info = data.items[i].metadata or {}
        }
    end
    ak47_inventory:CreateShop(name, name, items, 'cash')
    shops[name] = data
end

Framework.CreateCallback(Bridge.Resource .. ':bridge:OpenShop', function(source, cb, name)
    if not shops[name] then cb({}) end
    local isAllowed = false
    local Player = Framework.GetPlayer(source)
    if shops[name].groups and Framework.HasJob(shops[name].groups, Player) then isAllowed = true end
    if shops[name].groups and Framework.HasGang(shops[name].groups, Player) then isAllowed = true end
    if type(shops[name].groups) == "table" and (shops[name].groups and not isAllowed) then cb({}) end
    cb(shops[name])
end)

Framework.ConfiscateInventory = function(source)
    ak47_inventory:ConfiscateInventory(source)
end

Framework.ReturnInventory = function(source)
    ak47_inventory:ReturnInventory(source)
end
