Citizen.CreateThread(function()
    while not CommandList do
        TwoNa.TriggerServerCallback("2na_chat:getCommands", {}, function(commands)
            CommandList = commands

            for _, command in ipairs(GetRegisteredCommands()) do
                if IsAceAllowed(('command.%s'):format(command.name)) and command.name ~= 'toggleChat' then
                    table.insert(CommandList, command.name)
                end
            end
        end)

        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while true do
        for _, RPText in ipairs(RPTexts) do
            local currentPed       = GetPlayerPed(-1)
            local targetPed        = GetPlayerPed(GetPlayerFromServerId(RPText.source))

            local currentPedCoords = GetEntityCoords(currentPed)
            local targetPedCoords  = GetEntityCoords(targetPed)

            if #(currentPedCoords - targetPedCoords) < 10 then
                local pedCoords = GetEntityCoords(targetPed)
                local multiplier = GetUserRPTExtCoordMultiplier(RPText.source, RPText.text)

                TwoNa.Draw3DText(pedCoords.x, pedCoords.y, pedCoords.z + multiplier, 0.7, RPText.text, true)
            end
        end

        Citizen.Wait(1)
    end
end)

CreateThread(function()
    while true do
        for src, data in pairs(gMusics) do
            if data then
                local player = GetPlayerFromServerId(src)
                if player ~= -1 then
                    local ped = GetPlayerPed(player)
                    local vehicle = GetVehiclePedIsIn(ped)
                    if not xSound:soundExists('chat-music-' .. src) then
                        xSound:PlayUrlPos('chat-music-' .. src, data.url, data.volume, GetEntityCoords(ped))
                        xSound:setVolumeMax('chat-music-' .. src, 1.0)
                    else
                        local url = xSound:getLink('chat-music-' .. src)
                        if url ~= data.url then
                            xSound:Destroy('chat-music-' .. src)
                            xSound:PlayUrlPos('chat-music-' .. src, data.url, data.volume, GetEntityCoords(ped))
                            xSound:setVolumeMax('chat-music-' .. src, 1.0)
                            if xSound:isPaused('chat-music-' .. src) then
                                xSound:Resume('chat-music-' .. src)
                            end
                        end
                        xSound:setVolume('chat-music-' .. src, data.volume)
                        xSound:Position('chat-music-' .. src, GetEntityCoords(ped))
                        if data.isPaused then
                            xSound:Pause('chat-music-' .. src)
                        elseif not data.isPaused then
                            xSound:Resume('chat-music-' .. src)
                        end
                        xSound:Distance('chat-music-' .. src, 130)
                    end
                end
            else
                if xSound:soundExists('chat-music-' .. src) then
                    xSound:Destroy('chat-music-' .. src)
                end
            end
        end
        Wait(350)
    end
end)
