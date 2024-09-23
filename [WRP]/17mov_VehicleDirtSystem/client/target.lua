if Config.UseTarget then
    if Config.Framework == "QBCore" then
        Config.TargetSystem = "qb-target"
    else
        Config.TargetSystem = "qtarget"
    end
    
    if GetResourceState("ox_target") ~= "missing" then
        Config.TargetSystem = "qtarget"    -- OX_Target have a backward compability to qtarget
    end
else
    return
end

function DeleteIntefaceFromTarget(index)
    exports[Config.TargetSystem]:RemoveZone("CarwashStation " .. index)
end

function AddInterfaceToTarget(table, index)
    exports[Config.TargetSystem]:AddBoxZone("CarwashStation " .. index, vector3(table.interface.x, table.interface.y, table.interface.z), 1.0, 0.5, {
        name = "CarwashStation " .. index,
        minZ = table.interface.z - 0.7,
        maxZ = table.interface.z + 0.7,
        heading = table.interfaceRot.y
    }, {
        options = {
            {
                event = "17mov_CharacterSystem:interfaceInteraction",
                icon = "fa-solid fa-car",
                label = string.format(_L("Carwash.StartWashingTarget"), table.price),
                table = table,
                index = index,
            },
        },
        distance = 2.5,
    })
end