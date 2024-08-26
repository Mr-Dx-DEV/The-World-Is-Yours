if not IsDuplicityVersion() then --client
    -- TriggerEvent('sh-electronicCuffs:client:refreshCuffs') -- Call this event to recreate the object after a skin refresh

    if framework == 'qb' then
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            TriggerServerEvent('sh-electronicCuffs:server:joined')
        end)
        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
            TriggerServerEvent('sh-electronicCuffs:server:unloaded')
        end)
    elseif framework == 'esx' then
        RegisterNetEvent('esx:playerLoaded', function()
            TriggerServerEvent('sh-electronicCuffs:server:joined')
        end)
    end

    RegisterNetEvent('sh-electronicCuffs:client:putHandcuffs', function(ped)
        if ped and DoesEntityExist(ped) and IsPedAPlayer(ped) then
            getBase64Mugshot(ped, false, function(mugshot)
                TriggerServerEvent('sh-electronicCuffs:server:wearCuffs', GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), mugshot, true)
            end)
        end
    end)

    RegisterNetEvent('sh-electronicCuffs:client:removeHandcuffs', function(ped)
        if ped and DoesEntityExist(ped) and IsPedAPlayer(ped) then
            TriggerServerEvent('sh-electronicCuffs:server:removeCuffs', GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
        end
    end)
else --server
    CreateThread(function()
        if framework == 'esx' then
            AddEventHandler('esx:playerLoaded', function(src, player)
                sh.sql.async.scalar('SELECT data FROM sh_electroniccuffs WHERE citizenId = @citizenId', { ['@citizenId'] = getCitizenID(src) }, function(result)
                    if result then
                        local data = json.decode(result)
                        player.set('electronic-cuffs', data)
                    end
                end)
            end)
        end
    end)

    getCitizenID = function(src)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            return player.getIdentifier()
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            return player.PlayerData.citizenid
        end
    end

    getPlayerRPName = function(src)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            local firstName = player.get('firstName')
            local lastName = player.get('lastName')
            return firstName .. lastName
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
        end
    end

    -- addItem = function(src, name, count)
    --     if framework == 'esx' then
    --         local player = ESX.GetPlayerFromId(src);
    --         if not player then return end
    --         player.addInventoryItem(name, count)
    --     elseif framework == 'qb' then
    --         local player = QBCore.Functions.GetPlayer(src);
    --         if not player then return end
    --         player.Functions.AddItem(name, count)
    --     end
    -- end

    removeItem = function(src, name, count)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            player.removeInventoryItem(name, count)
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            player.Functions.RemoveItem(name, count)
        end
    end

    registerUsableItem = function(name, cb)
        if framework == 'esx' then
            CreateThread(function()
                while not ESX do
                    Wait(0)
                end

                ESX.RegisterUsableItem(name, cb)
            end)
        elseif framework == 'qb' then
            CreateThread(function()
                while not QBCore do
                    Wait(0)
                end

                QBCore.Functions.CreateUseableItem(name, cb)
            end)
        end
    end

    setCuffData = function(src, data)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            player.set('electronic-cuffs', data)
            sh.sql.async.scalar('SELECT data FROM sh_electroniccuffs WHERE citizenId = @citizenId', { ['@citizenId'] = getCitizenID(src) }, function(result)
                if result then
                    sh.sql.async.update('UPDATE sh_electroniccuffs SET data = @data WHERE citizenId = @citizenId', { ['@data'] = json.encode(data), ['@citizenId'] = getCitizenID(src) })
                else
                    sh.sql.async.insert('INSERT INTO sh_electroniccuffs (citizenId, data) VALUES (@citizenId, @data)', { ['@citizenId'] = getCitizenID(src), ['@data'] = json.encode(data) })
                end
            end)
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            player.Functions.SetMetaData('electronic-cuffs', data)
        end
    end

    getCuffData = function(src)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            local data = player.get('electronic-cuffs')
            if not data then
                return false
            else
                data.src = src
                return data
            end
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            local data = player.PlayerData.metadata['electronic-cuffs']
            if not data then
                return false
            else
                data.src = src
                return data
            end
        end
    end

    isCuffed = function(src)
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            local data = player.get('electronic-cuffs')
            if not data then
                return false
            else
                return true
            end
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            local data = player.PlayerData.metadata['electronic-cuffs']
            if not data then
                return false
            else
                return true
            end
        end
    end

    jobCheck = function(src)
        src = tonumber(src);
        if framework == 'esx' then
            local player = ESX.GetPlayerFromId(src);
            if not player then return end
            if cfg.jobs[player.job.name] then return true else return false end
        elseif framework == 'qb' then
            local player = QBCore.Functions.GetPlayer(src);
            if not player then return end
            if cfg.jobs[player.PlayerData.job.name] then return true else return false end
        end
    end

    -- -- If you are using esx and you see firstname or lastname error,
    -- -- add '@mysql-async/lib/MySQL.lua' or '@oxmysql/lib/MySQL.lua'
    -- -- depending on the sql script you are using above the server scripts section in fxmanifest and uncomment the following lines

    -- RegisterNetEvent('esx:playerLoaded')
    -- AddEventHandler('esx:playerLoaded', function(playerId, player)
    --     local src = playerId
    --     local player = ESX.GetPlayerFromId(src);
    --     if not player then return end
    --     sh.sql.async.query('SELECT * FROM `users` WHERE `identifier` = @identifier', {
    --         ['@identifier'] = player.identifier
    --     }, function(result)
    --         if result and result[1] then
    --             player.setName(('%s %s'):format(result[1].firstname or 'unconfigured', result[1].lastname or 'unconfigured'))
    --             player.set('firstName', result[1].firstname or 'unconfigured')
    --             player.set('lastName', result[1].lastname or 'unconfigured')
    --             player.set('dateofbirth', result[1].dateofbirth or 'unconfigured')
    --             player.set('sex', result[1].sex or 'unconfigured')
    --             player.set('height', result[1].height or 'unconfigured')
    --         end
    --     end)
    -- end)
end
