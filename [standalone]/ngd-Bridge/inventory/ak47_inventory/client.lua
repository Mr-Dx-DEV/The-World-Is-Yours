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
        item.image = v.name .. '.png'
        Framework.Items[v.name] = item
    end

    setmetatable(Framework.Items, {
        __index = function(table, key)
            error(('^9Item \'%s\' Does Not Exist.^0'):format(tostring(key)), 0)
        end
    })
end)

Framework.OpenStash = function(name)
    Framework.TriggerCallback(Bridge.Resource .. ':bridge:GetStash', function(stash)
        if not stash then return end
        local isAllowed = false
        if stash.groups and Framework.HasJob(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and Framework.HasGang(stash.groups, Framework.Player) then isAllowed = true end
        if stash.groups and not isAllowed then return end
        ak47_inventory:OpenInventory({
            identifier = 'stash:' .. name,
            label = name,
            type = 'stash',
            maxWeight = stash.weight,
            slots = stash.slots,
        })
    end, name)
end

Framework.OpenShop = function(name)
    Framework.TriggerCallback(Bridge.Resource .. ':bridge:OpenShop', function(shopdata)
        if table.type(shopdata) ~= 'empty' then
            ak47_inventory:OpenInventory(name)
        end
    end, name)
end

Framework.CloseInventory = function()
    ak47_inventory:CloseInventory()
end

Framework.GetItem = function(item, metadata, strict)
    local items = {}
    ---@cast items table<number, Item>
    for k, v in pairs(ak47_inventory:GetSlotsWithItem(item, metadata, strict)) do
        items[#items + 1] = {
            name = v.name,
            count = v.count,
            label = v.label,
            description = v.description,
            metadata = v.info,
            stack = v.stacksize and true or false,
            weight = v.weight or 0,
            close = v.close,
            image = v.name .. '.png',
            type = v.type,
            slot = tonumber(v.slot),
        }
    end
    return items
end

Framework.HasItem = function(items, count, metadata, strict)
    if type(items) == "string" then
        local counted = 0
        for _, v in pairs(Framework.GetItem(items, metadata, strict)) do
            counted += v.count
        end
        return counted >= (count or 1)
    elseif type(items) == "table" then
        if table.type(items) == 'hash' then
            for item, amount in pairs(items) do
                local counted = 0
                for _, v in pairs(Framework.GetItem(item, metadata, strict)) do
                    counted += v.count
                end
                if counted < amount then return false end
            end
            return true
        elseif table.type(items) == 'array' then
            local counted = 0
            for i = 1, #items do
                local item = items[i]
                for _, v in pairs(Framework.GetItem(item, metadata, strict)) do
                    counted += v.count
                end
                if counted < (count or 1) then return false end
            end
            return true
        end
    end
end

Framework.LockInventory = function()
    LocalPlayer.state:set('invBusy', true, true)
end

Framework.UnlockInventory = function()
    LocalPlayer.state:set("invBusy", false, true)
end
