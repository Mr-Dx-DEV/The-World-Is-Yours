if Config.InventorySystem == Inventory.AUTOMATIC or Config.InventorySystem == nil then
    for keyConst, resourceName in ipairs(InventoryResourceNames) do
        if IsResourceOnServer(resourceName) then
            Config.InventorySystem = keyConst
            return
        end
    end

    if IsResourceOnServer("es_extended") then
        Config.InventorySystem = Inventory.ESX
        return
    end
    if IsResourceOnServer("qb-inventory") then
        Config.InventorySystem = Inventory.QB
        return
    end
end