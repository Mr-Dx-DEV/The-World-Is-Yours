function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function RegisterCallback(name, cbFunc)
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end

function WaitCore()
    while Core == nil do
        Wait(0)
    end
end

function GetJob(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getJob().name, Player.getJob().grade, Player.getJob().label, Player.getJob().grade_label, Player.getJob().payment or 0
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            return Player.PlayerData.job.name, Player.PlayerData.job.grade.level, Player.PlayerData.job.label,
                Player.PlayerData.job.grade.name, Player.PlayerData.job.grade.payment, Player.PlayerData.job.grade.isboss or false, false
        elseif Config.Framework == 'qbox' then
            return Player.PlayerData.job.name, Player.PlayerData.job.grade.level, Player.PlayerData.job.label,
                Player.PlayerData.job.grade.name, Player.PlayerData.job.payment, Player.PlayerData.job.isboss or false, Player.PlayerData.job.type
        end
    end
    return false
end

function GetGang(source)
    local Player = GetPlayer(source)
    if Player then
        return Player.PlayerData.gang.name, Player.PlayerData.gang.grade.level, Player.PlayerData.gang.label, Player.PlayerData.gang.grade.name, 0, Player.PlayerData.gang.isboss or false
    end
    return false
end

function IsPlayerInGame(source)
    if (source == nil) then
        return false
    end
    if (source == 0) then
        return false
    end
    local src = tonumber(source)
    if not src then
        return false
    end
    local endpoint = GetPlayerEndpoint(src)

    if endpoint and endpoint ~= "" then
        return true
    else
        return false
    end
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function CheckIsAdmin(source)
    if source == 0 then
        return false
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local Player = Core.GetPlayerFromId(source)
        if Player then
            for _, v in pairs(Config.Admins) do
                if Player.getGroup() == v then
                    return true
                end
            end
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'qbox' then
        for _, v in pairs(Config.Admins) do
            if Core.Functions.HasPermission(source, v) or IsPlayerAceAllowed(source, 'command') then
                return true
            end
        end
    elseif Config.Framework == 'oldqb' then
        for _, v in pairs(Config.Admins) do
            if Core.Functions.GetPermission(source) == v then
                return true
            end
        end
    end
    return false
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        else
            return Player.PlayerData.citizenid
        end
    end
end

function GetName(source)
    if Config.Framework == "oldesx" or Config.Framework == "esx" then
        local xPlayer = Core.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getName()
        else
            return "0"
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' or Config.Framework == 'qbox' then
        local Player = Core.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
        end
    end
end

function GetPlayerMoney(source, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if value == 'bank' then
                return Player.getAccount('bank').money
            end
            if value == 'cash' then
                return Player.getMoney()
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' or Config.Framework == 'qbox' then
            if value == 'bank' then
                return Player.PlayerData.money['bank']
            end
            if value == 'cash' then
                return Player.PlayerData.money['cash']
            end
        end
    end
end

function RemoveMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.removeAccountMoney('bank', value)
            end
            if type == 'cash' then
                Player.removeMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' or Config.Framework == 'qbox' then
            if type == 'bank' then
                Player.Functions.RemoveMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.RemoveMoney('cash', value)
            end
        end
    end
end

function AddMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.removeAccountMoney('bank', value)
            end
            if type == 'cash' then
                Player.removeMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' or Config.Framework == 'qbox' then
            if type == 'bank' then
                Player.Functions.AddMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.AddMoney('cash', value)
            end
        end
    end
end

function SqlFire(identifiers, job)
    local identifier = identifiers
    if Config.Framework == "qb" or Config.Framework == "old-qb" then
        local result = ExecuteSql("SELECT job FROM `players` WHERE `citizenid` = ?", { identifier })
        if result then
            local targetJob = json.decode(result[1].job)
            targetJob.type = "none"
            targetJob.payment = 10
            targetJob.grade = { name = "Freelancer", level = 0 }
            targetJob.label = 'Civilian'
            targetJob.name = "unemployed"
            targetJob.onduty = true
            ExecuteSql("UPDATE `players` SET `job` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
        end
    elseif Config.Framework == "qbox" then
        local result = ExecuteSql("SELECT job FROM `players` WHERE `citizenid` = ?", { identifier })
        if result then
            local targetJob = json.decode(result[1].job)
            targetJob.type = "none"
            targetJob.payment = 10
            targetJob.grade = { name = "Freelancer", level = 0 }
            targetJob.label = 'Civilian'
            targetJob.name = "unemployed"
            targetJob.onduty = true
            ExecuteSql("UPDATE `players` SET `job` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
        end
    elseif Config.Framework == "esx" or Config.Framework == 'old-esx' then
        local result = ExecuteSql("SELECT job FROM `users` WHERE `identifier` = ?", { identifier })
        if result then
            ExecuteSql("UPDATE `users` SET `job` = 'unemployed', `job_grade` = 0 WHERE `identifier` = ?", { identifier })
        end
    end

    if BossMenu[job.name] and BossMenu[job.name]['employees'][identifier] then
        BossMenu[job.name]['employees'][identifier] = nil
        for _, member in pairs(BossMenu[job.name]['employees']) do
            if member.id then
                local GetIdentifier = IsPlayerInGame(member.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateJobData', tonumber(member.id), BossMenu[job.name])
                end
            end
        end
    end
end

function SqlGangFire(identifiers, job)
    local identifier = identifiers
    if Config.Framework == "qb" or Config.Framework == "old-qb" then
        local result = ExecuteSql("SELECT gang FROM `players` WHERE `citizenid` = ?", { identifier })
        if result then
            local targetJob = json.decode(result[1].gang)
            targetJob.type = "none"
            targetJob.payment = 10
            targetJob.grade = { name = "Unaffiliated", level = 0 }
            targetJob.label = 'No Gang'
            targetJob.name = "Unaffiliated"
            targetJob.onduty = true
            ExecuteSql("UPDATE `players` SET `gang` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
        end
    elseif Config.Framework == "qbox" then
        local result = ExecuteSql("SELECT gang FROM `players` WHERE `citizenid` = ?", { identifier })
        if result then
            local targetJob = json.decode(result[1].gang)
            targetJob.type = "none"
            targetJob.payment = 10
            targetJob.grade = { name = "Unaffiliated", level = 0 }
            targetJob.label = 'No Gang'
            targetJob.name = "Unaffiliated"
            targetJob.onduty = true
            ExecuteSql("UPDATE `players` SET `gang` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
        end
    end

    if BossMenu[job.name] and BossMenu[job.name]['employees'][identifier] then
        BossMenu[job.name]['employees'][identifier] = nil
        for _, member in pairs(BossMenu[job.name]['employees']) do
            if member.id then
                local GetIdentifier = IsPlayerInGame(member.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateJobData', tonumber(member.id), BossMenu[job.name])
                end
            end
        end
    end
end

function SetJobByIdentifier(identifier, jobData)
    local Player = GetPlayer(identifier)
    if Player then
        local newGrade = grade or 0
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            Player.setJob(tostring(jobb), tonumber(newGrade))
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' or Config.Framework == 'qbox' then

            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if Core.Shared.Jobs[jobb] and Core.Shared.Jobs[jobb].grades[tostring(newGrade)] then
                    Player.Functions.SetJob(jobb, newGrade)
                end
            elseif Config.Framework == 'qbox' then
                if Core.Shared.Jobs[jobb] and Core.Shared.Jobs[jobb].grades[tonumber(newGrade)] then
                    Player.Functions.SetJob(jobb, newGrade)
                end
            end
        end
    else
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            local newGrade = jobData.gradeLevel or 0
            ExecuteSql("UPDATE users SET `job` = '" ..
                jobData.job .. "', `job_grade` = '" .. newGrade .. "' WHERE `identifier` = '" .. identifier .. "'")
        elseif Config.Framework == "qb" or Config.Framework == "old-qb" then
            local newGrade = jobData.gradeLevel or 0
            local result = ExecuteSql("SELECT job FROM `players` WHERE `citizenid` = ?", { identifier })
            if result then
                local targetJob = json.decode(result[1].job)
                targetJob.name = jobData.job
                if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                    targetJob.payment = Core.Shared.Jobs[jobData.job].grades[tostring(newGrade)].payment
                elseif Config.Framework == 'qbox' then
                    targetJob.payment = Core.Shared.Jobs[jobData.job].grades[tonumber(newGrade)].payment
                end
                if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                    targetJob.grade = {
                        name = Core.Shared.Jobs[jobData.job].grades[tostring(newGrade)].name,
                    level = tonumber(newGrade)
                    }
                elseif Config.Framework == 'qbox' then
                    targetJob.grade = {
                        name = Core.Shared.Jobs[jobData.job].grades[tonumber(newGrade)].name,
                        level = tonumber(newGrade)
                    }
                end
                ExecuteSql("UPDATE `players` SET `job` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
            end
        end
    end

    if BossMenu[jobData.job] and BossMenu[jobData.job]['employees'][identifier] then
        local oldGradeLevel = BossMenu[jobData.job]['employees'][identifier].jobGrade
        if oldGradeLevel and tonumber(oldGradeLevel) ~= tonumber(jobData.gradeLevel) then
            local jobRankList = BossMenu[jobData.job].jobRankList
            
            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if jobRankList[tostring(oldGradeLevel)] and jobRankList[tostring(oldGradeLevel)].player then
                    jobRankList[tostring(oldGradeLevel)].player[identifier] = nil
                end
            elseif Config.Framework == 'qbox' then
                if jobRankList[tonumber(oldGradeLevel)] and jobRankList[tonumber(oldGradeLevel)].player then
                    jobRankList[tonumber(oldGradeLevel)].player[identifier] = nil
                end
            end
        end
    
        BossMenu[jobData.job]['employees'][identifier].gradeLevel = jobData.gradeLevel
        BossMenu[jobData.job]['employees'][identifier].jobGrade = jobData.gradeLevel
        BossMenu[jobData.job]['employees'][identifier].name = jobData.job
        BossMenu[jobData.job]['employees'][identifier].jobGradeName = jobData.jobGradeName or jobData.name
        BossMenu[jobData.job]['employees'][identifier].jobSalary = jobData.payment
    

        local jobRankList = Core.Shared.Jobs[jobData.job].grades
        for k, v in pairs(jobRankList) do
            k = tonumber(k)
            v.gradeLevel = k
    
            if BossMenu[jobData.job].permissions and BossMenu[jobData.job].permissions['grades'] and BossMenu[jobData.job].permissions['grades'][tostring(k)] and not v.permissions then
                v.permissions = BossMenu[jobData.job].permissions['grades'][tostring(k)] or Config.DefaultPermissions
            elseif Config.Framework == 'qbox' then
                if BossMenu[jobData.job].permissions and BossMenu[jobData.job].permissions['grades'] and BossMenu[jobData.job].permissions['grades'][tonumber(k)] and not v.permissions then
                    v.permissions = BossMenu[jobData.job].permissions['grades'][tonumber(k)] or Config.DefaultPermissions
                end
            end
    
            if BossMenu[jobData.job]['employees'][identifier] and tonumber(k) == tonumber(jobData.gradeLevel) then
                if v.player then
                    v.player[identifier] = BossMenu[jobData.job]['employees'][identifier]
                else
                    v.player = {}
                    v.player[identifier] = BossMenu[jobData.job]['employees'][identifier]
                end
            end
            v.totalPlayer = getJobRankPlayers(jobData.job, k) or 0
        end
        BossMenu[jobData.job].jobRankList = jobRankList

        for _, member in pairs(BossMenu[jobData.job]['employees']) do
            if member.id then
                local GetIdentifier = IsPlayerInGame(member.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateJobData', tonumber(member.id), BossMenu[jobData.job])
                end
            end
        end
    end
    
end

function SetGangByIdentifier(identifier, jobData)
    local Player = GetPlayer(identifier)
    if Player then
        local newGrade = grade or 0
        if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if Core.Shared.Gangs[jobb] and Core.Shared.Gangs[jobb].grades[tostring(newGrade)] then
                Player.Functions.SetGang(jobb, newGrade)
            end
        elseif Config.Framework == 'qbox' then
            if Core.Shared.Gangs[jobb] and Core.Shared.Gangs[jobb].grades[tonumber(newGrade)] then
                Player.Functions.SetGang(jobb, newGrade)
            end
        end
    else
        local newGrade = jobData.gradeLevel or 0
        local result = ExecuteSql("SELECT gang FROM `players` WHERE `citizenid` = ?", { identifier })
        if result then
            local targetJob = json.decode(result[1].gang)
            targetJob.name = jobData.job
            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                targetJob.payment = Core.Shared.Gangs[jobData.job].grades[tostring(newGrade)].payment
            elseif Config.Framework == 'qbox' then
                targetJob.payment = Core.Shared.Gangs[jobData.job].grades[tonumber(newGrade)].payment
            end
            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                targetJob.grade = {
                    name = Core.Shared.Gangs[jobData.job].grades[tostring(newGrade)].name,
                level = tonumber(newGrade)
                }
            elseif Config.Framework == 'qbox' then
                targetJob.grade = {
                    name = Core.Shared.Gangs[jobData.job].grades[tonumber(newGrade)].name,
                    level = tonumber(newGrade)
                }
            end
            ExecuteSql("UPDATE `players` SET `gang` = ? WHERE `citizenid` = ?", { json.encode(targetJob), identifier })
        end
    end

    if BossMenu[jobData.job] and BossMenu[jobData.job]['employees'][identifier] then
        local oldGradeLevel = BossMenu[jobData.job]['employees'][identifier].jobGrade
        if oldGradeLevel and tonumber(oldGradeLevel) ~= tonumber(jobData.gradeLevel) then
            local jobRankList = BossMenu[jobData.job].jobRankList
            
            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if jobRankList[tostring(oldGradeLevel)] and jobRankList[tostring(oldGradeLevel)].player then
                    jobRankList[tostring(oldGradeLevel)].player[identifier] = nil
                end
            elseif Config.Framework == 'qbox' then
                if jobRankList[tonumber(oldGradeLevel)] and jobRankList[tonumber(oldGradeLevel)].player then
                    jobRankList[tonumber(oldGradeLevel)].player[identifier] = nil
                end
            end
        end
    
        BossMenu[jobData.job]['employees'][identifier].gradeLevel = jobData.gradeLevel
        BossMenu[jobData.job]['employees'][identifier].jobGrade = jobData.gradeLevel
        BossMenu[jobData.job]['employees'][identifier].name = jobData.job
        BossMenu[jobData.job]['employees'][identifier].jobGradeName = jobData.jobGradeName or jobData.name
        BossMenu[jobData.job]['employees'][identifier].jobSalary = jobData.payment
    

        local jobRankList = Core.Shared.Gangs[jobData.job].grades
        for k, v in pairs(jobRankList) do
            k = tonumber(k)
            v.gradeLevel = k
    
            if BossMenu[jobData.job].permissions and BossMenu[jobData.job].permissions['grades'] and BossMenu[jobData.job].permissions['grades'][tostring(k)] and not v.permissions then
                v.permissions = BossMenu[jobData.job].permissions['grades'][tostring(k)] or Config.DefaultPermissions
            elseif Config.Framework == 'qbox' then
                if BossMenu[jobData.job].permissions and BossMenu[jobData.job].permissions['grades'] and BossMenu[jobData.job].permissions['grades'][tonumber(k)] and not v.permissions then
                    v.permissions = BossMenu[jobData.job].permissions['grades'][tonumber(k)] or Config.DefaultPermissions
                end
            end
    
            if BossMenu[jobData.job]['employees'][identifier] and tonumber(k) == tonumber(jobData.gradeLevel) then
                if v.player then
                    v.player[identifier] = BossMenu[jobData.job]['employees'][identifier]
                else
                    v.player = {}
                    v.player[identifier] = BossMenu[jobData.job]['employees'][identifier]
                end
            end
            v.totalPlayer = getJobRankPlayers(jobData.job, k) or 0
        end
        BossMenu[jobData.job].jobRankList = jobRankList

        for _, member in pairs(BossMenu[jobData.job]['employees']) do
            if member.id then
                local GetIdentifier = IsPlayerInGame(member.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateJobData', tonumber(member.id), BossMenu[jobData.job])
                end
            end
        end
    end
    
end

function UpdatePlayerRank(jobName, identifier, data)
    if BossMenu[jobName] and BossMenu[jobName]['employees'][identifier] then
        local oldGradeLevel = BossMenu[jobName]['employees'][identifier].jobGrade

        if oldGradeLevel and tonumber(oldGradeLevel) ~= tonumber(data.GradeLevel) then
            local jobRankList = BossMenu[jobName].jobRankList
            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if jobRankList[tostring(oldGradeLevel)] and jobRankList[tostring(oldGradeLevel)].player then
                    jobRankList[tostring(oldGradeLevel)].player[identifier] = nil
                end
            elseif Config.Framework == 'qbox' then
                if jobRankList[tonumber(oldGradeLevel)] and jobRankList[tonumber(oldGradeLevel)].player then
                    jobRankList[tonumber(oldGradeLevel)].player[identifier] = nil
                end
            end
        end

        BossMenu[jobName]['employees'][identifier].gradeLevel = data.GradeLevel
        BossMenu[jobName]['employees'][identifier].jobGrade = data.GradeLevel
        BossMenu[jobName]['employees'][identifier].name = jobName
        BossMenu[jobName]['employees'][identifier].jobGradeName = data.GradeName
        BossMenu[jobName]['employees'][identifier].jobSalary = data.payment
        BossMenu[jobName]['employees'][identifier].isBoss = BossMenu[jobName].isBoss or false
        local isGang = BossMenu[jobName] and BossMenu[jobName].jobSettings and BossMenu[jobName].jobSettings.isGang or false
        local jobRankList = {}
        if isGang then
            jobRankList = Core.Shared.Gangs[jobName].grades
        else
            jobRankList = Core.Shared.Jobs[jobName].grades
        end

        for k, v in pairs(jobRankList) do
            k = tonumber(k)
            v.gradeLevel = k
            if BossMenu[jobName].permissions and BossMenu[jobName].permissions['grades'] and BossMenu[jobName].permissions['grades'][tostring(k)] and not v.permissions then
                v.permissions = BossMenu[jobName].permissions['grades'][tostring(k)] or Config.DefaultPermissions
            elseif Config.Framework == 'qbox' then
                if BossMenu[jobName].permissions and BossMenu[jobName].permissions['grades'] and BossMenu[jobName].permissions['grades'][tonumber(k)] and not v.permissions then
                    v.permissions = BossMenu[jobName].permissions['grades'][tonumber(k)] or Config.DefaultPermissions
                end
            end

            if BossMenu[jobName]['employees'][identifier] and tonumber(k) == tonumber(data.GradeLevel) then
                if not v.player then
                    v.player = {}
                end
                v.player[identifier] = BossMenu[jobName]['employees'][identifier]
            end
            v.totalPlayer = getJobRankPlayers(jobName, k) or 0
        end
        BossMenu[jobName].jobRankList = jobRankList

        for _, member in pairs(BossMenu[jobName]['employees']) do
            if member.id then
                local GetIdentifier = IsPlayerInGame(member.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateJobData', tonumber(member.id), BossMenu[jobName])
                end
            end
        end
    end
end

function UpdateBossMenuHistory(jobname, playerName, action, amount)
    local lasttime = os.date("%d/%m | %H:%M")

    local newData = {
        name = playerName,
        type = action,
        amount = tonumber(amount) or 0,
        date = lasttime,
    }

    ExecuteSql(
        'UPDATE tw_bossmenu SET jobHistory = ? WHERE jobname = ?',
        { json.encode(BossMenu[jobname].jobHistory), jobname },
        function(success)
            if success then
                TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification['actionlogupdated'])
            else
                TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification['actionlogupdatefailed'])
            end
        end
    )
end

RegisterServerEvent('tworst:bossmenu:openStash', function(jobName)
    local src = source
    local myPermissions = getPermissions(src)
    local identifier = GetIdentifier(src)
    local myJob = getGangorgetJob(identifier)
    if jobName == 'unknown' or not jobName then
        TriggerClientEvent('tworst:bossmenu:addNotification', src, 'Job not found')
        return
    end

    if not myPermissions.stash then
        TriggerClientEvent('tworst:bossmenu:addNotification', src, 'Stash permission denied')
        return
    end

    if Config.Inventory == 'qb_inventory' then
	    exports['qb-inventory']:OpenInventory(src, jobName)
    elseif Config.Inventory == 'ox_inventory' then
        exports['qb-inventory']:OpenInventory(src, jobName)
    end
end)

function UpdateCoreJobs()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return
    end
    if Config.Framework == 'qbox' then
        UpdateCoreJobsQbox()
        return
    end
    local filePathQB = 'shared/jobs.lua'
    Core = GetCore()
    while Core == nil do
        Citizen.Wait(0)
    end
    local jobs = Core.Shared.Jobs
    local ForceJobDefaultDutyAtLogin = Core.Shared.ForceJobDefaultDutyAtLogin
    local jobsContent = "QBShared = QBShared or {}\n"
    jobsContent = jobsContent .. "QBShared.ForceJobDefaultDutyAtLogin = " .. tostring(ForceJobDefaultDutyAtLogin) .. "\n"
    jobsContent = jobsContent .. "QBShared.Jobs = {\n"

    for jobName, jobData in pairs(jobs) do
        jobsContent = jobsContent .. "    [" .. string.format("%q", jobName) .. "] = {\n"
        jobsContent = jobsContent .. "        label = " .. string.format("%q", jobData.label) .. ",\n"
        jobsContent = jobsContent .. "        defaultDuty = " .. tostring(jobData.defaultDuty) .. ",\n"
        jobsContent = jobsContent .. "        offDutyPay = " .. tostring(jobData.offDutyPay) .. ",\n"
        jobsContent = jobsContent .. "        grades = {\n"

        for grade, gradeData in pairs(jobData.grades) do
            local isboss = gradeData.isboss or false
            jobsContent = jobsContent .. "            [" .. string.format("%q", grade) .. "] = {\n"
            jobsContent = jobsContent .. "                name = " .. string.format("%q", gradeData.name) .. ",\n"
            jobsContent = jobsContent .. "                payment = " .. tostring(gradeData.payment) .. ",\n"
            if isboss then
                jobsContent = jobsContent .. "                isboss = " .. tostring(isboss) .. ",\n"
            end
            jobsContent = jobsContent .. "            },\n"
        end

        jobsContent = jobsContent .. "        }\n"
        jobsContent = jobsContent .. "    },\n"
    end

    jobsContent = jobsContent .. "}\n"

    SaveResourceFile('qb-core', filePathQB, jobsContent, -1)
end

function UpdateCoreGangs()
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return
    end
    if Config.Framework == 'qbox' then
        UpdateCoreGangsQbox()
        return
    end
    local filePathQB = 'shared/gangs.lua'
    Core = GetCore()
    while Core == nil do
        Citizen.Wait(0)
    end
    local gangs = Core.Shared.Gangs
    local gangsContent = "QBShared = QBShared or {}\n"
    gangsContent = gangsContent .. "QBShared.Gangs = {\n"

    for gangName, gangData in pairs(gangs) do
        gangsContent = gangsContent .. "    [" .. string.format("%q", gangName) .. "] = {\n"
        gangsContent = gangsContent .. "        label = " .. string.format("%q", gangData.label) .. ",\n"
        gangsContent = gangsContent .. "        grades = {\n"

        for grade, gradeData in pairs(gangData.grades) do
            local isboss = gradeData.isboss or false
            gangsContent = gangsContent .. "            [" .. string.format("%q", grade) .. "] = {\n"
            gangsContent = gangsContent .. "                name = " .. string.format("%q", gradeData.name) .. ",\n"
            if isboss then
                gangsContent = gangsContent .. "                isboss = " .. tostring(isboss) .. ",\n"
            end
            gangsContent = gangsContent .. "            },\n"
        end

        gangsContent = gangsContent .. "        }\n"
        gangsContent = gangsContent .. "    },\n"
    end

    gangsContent = gangsContent .. "}\n"

    SaveResourceFile('qb-core', filePathQB, gangsContent, -1)
end

function UpdateCoreJobsQbox()
    local filePathQB = 'shared/jobs.lua'
    Core = GetCore()
    while Core == nil do
        Citizen.Wait(0)
    end

    local jobs = Core.Shared.Jobs
    local jobsContent = "---@type table<string, Job>\n"
    jobsContent = jobsContent .. "return {\n"

    for jobName, jobData in pairs(jobs) do
        jobsContent = jobsContent .. string.format("    [%q] = {\n", jobName)
        jobsContent = jobsContent .. string.format("        label = %q,\n", jobData.label)
        jobsContent = jobsContent .. string.format("        type = %q,\n", jobData.type or "unknown")
        jobsContent = jobsContent .. string.format("        defaultDuty = %s,\n", tostring(jobData.defaultDuty))
        jobsContent = jobsContent .. string.format("        offDutyPay = %s,\n", tostring(jobData.offDutyPay))
        jobsContent = jobsContent .. "        grades = {\n"

        for grade, gradeData in pairs(jobData.grades) do
            local isboss = gradeData.isboss or false
            local bankAuth = gradeData.bankAuth or isboss
            jobsContent = jobsContent .. string.format("            [%q] = {\n", grade)
            jobsContent = jobsContent .. string.format("                name = %q,\n", gradeData.name)
            jobsContent = jobsContent .. string.format("                payment = %s,\n", tostring(gradeData.payment))
            if isboss then
                jobsContent = jobsContent .. string.format("                isboss = %s,\n", tostring(isboss))
                jobsContent = jobsContent .. string.format("                bankAuth = %s,\n", tostring(bankAuth))
            end
            jobsContent = jobsContent .. "            },\n"
        end

        jobsContent = jobsContent .. "        },\n"
        jobsContent = jobsContent .. "    },\n"
    end

    jobsContent = jobsContent .. "}\n"

    SaveResourceFile('qb-core', filePathQB, jobsContent, -1)
end

function UpdateCoreGangsQbox()
    local filePathQB = 'shared/gangs.lua'
    Core = GetCore()
    while Core == nil do
        Citizen.Wait(0)
    end

    local gangs = Core.Shared.Gangs
    local gangsContent = "---Gang names must be lower case (top level table key)\n"
    gangsContent = gangsContent .. "---@type table<string, Gang>\n"
    gangsContent = gangsContent .. "return {\n"

    for gangName, gangData in pairs(gangs) do
        gangsContent = gangsContent .. string.format("    [%q] = {\n", gangName:lower())
        gangsContent = gangsContent .. string.format("        label = %q,\n", gangData.label)
        gangsContent = gangsContent .. "        grades = {\n"

        for grade, gradeData in pairs(gangData.grades) do
            local isboss = gradeData.isboss or false
            local bankAuth = gradeData.bankAuth or isboss
            gangsContent = gangsContent .. string.format("            [%d] = {\n", tonumber(grade))
            gangsContent = gangsContent .. string.format("                name = %q,\n", gradeData.name)
            if isboss then
                gangsContent = gangsContent .. string.format("                isboss = %s,\n", tostring(isboss))
                gangsContent = gangsContent .. string.format("                bankAuth = %s,\n", tostring(bankAuth))
            end
            gangsContent = gangsContent .. "            },\n"
        end

        gangsContent = gangsContent .. "        },\n"
        gangsContent = gangsContent .. "    },\n"
    end

    gangsContent = gangsContent .. "}\n"

    SaveResourceFile('qb-core', filePathQB, gangsContent, -1)
end

