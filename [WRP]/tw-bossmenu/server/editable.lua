bot_Token = ""

local Caches = {
    Avatars = {}
}

local FormattedToken = "Bot " .. bot_Token
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = { data = resultData, code = errorCode, headers = resultHeaders }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        { ["Content-Type"] = "application/json", ["Authorization"] = FormattedToken }
    )

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    local discordId = nil
    local imgURL = nil
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if discordId then
        if Caches.Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif"
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            end
            Caches.Avatars[discordId] = imgURL
        else
            imgURL = Caches.Avatars[discordId]
        end
    end
    return imgURL
end

function SetMoney(account, amount)
    if BossMenu[account] and BossMenu[account].jobSettings.jobMoney then
        BossMenu[account].jobSettings.jobMoney = amount
        for k, v in pairs(BossMenu[account]['employees']) do
            if v.id then
                local GetIdentifier = IsPlayerInGame(v.id)
                if GetIdentifier then
                    TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, BossMenu[account].jobSettings.jobMoney)
                end
            end
        end
    end
end

RegisterServerEvent('tworst:bossmenu:reloadData', function()
    local result = ExecuteSql('SELECT * FROM tw_bossmenu')
    if next(result) ~= nil then
        for _, row in pairs(result) do
            BossMenu[row.jobname] = {}
            BossMenu[row.jobname].jobSettings = {}
            BossMenu[row.jobname].employees = {}
            BossMenu[row.jobname].jobRankList = {}
            BossMenu[row.jobname].outfitList = json.decode(row.outfitList) or {}
            BossMenu[row.jobname].jobHistory = json.decode(row.jobHistory)
            BossMenu[row.jobname].permissions = json.decode(row.permissions)
            BossMenu[row.jobname].jobSettings.jobLabel = row.jobLabel
            BossMenu[row.jobname].jobSettings.jobName = row.jobname
            BossMenu[row.jobname].jobSettings.jobLogo = row.jobLogo
            BossMenu[row.jobname].jobSettings.jobBanner = row.jobBanner
            BossMenu[row.jobname].jobSettings.jobDescription = row.jobDescription
            BossMenu[row.jobname].jobSettings.jobStashCoords = json.decode(row.stashLoc)
            BossMenu[row.jobname].jobSettings.jobBossMenuCoords = json.decode(row.openLoc)
            BossMenu[row.jobname].jobSettings.isGang = row.isGang or false
            BossMenu[row.jobname].jobSettings.blipList = json.decode(row.blipData) or {}

            if Config.Inventory == 'ox_inventory' then
                local stashData = {
                    id = row.jobname,
                    label = row.jobname .. ' Stash',
                    slots = 50,
                    weight = 100000,
                    owner = nil,
                    groups = {
                        [row.jobname] = 0
                    },
                    coords = vector3(BossMenu[row.jobname].jobSettings.jobStashCoords.x,
                        BossMenu[row.jobname].jobSettings.jobStashCoords.y,
                        BossMenu[row.jobname].jobSettings.jobStashCoords.z)
                }
                exports.ox_inventory:RegisterStash(stashData.id, stashData.label, stashData.slots, stashData.weight,
                    stashData.owner, stashData.groups, stashData.coords)
            end
        end
    end


    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql('SELECT citizenid, job, gang, charinfo FROM players')
        for _, row in pairs(result) do
            local identifier = row.citizenid
            local job = json.decode(row.job)
            local gang = json.decode(row.gang)

            local charinfo = json.decode(row.charinfo)
            if JobAllPlayer[job.name] then
                table.insert(JobAllPlayer[job.name], identifier)
            else
                JobAllPlayer[job.name] = {}
                table.insert(JobAllPlayer[job.name], identifier)
            end

            if GangAllPlayer[gang.name] then
                table.insert(GangAllPlayer[gang.name], identifier)
            else
                GangAllPlayer[gang.name] = {}
                table.insert(GangAllPlayer[gang.name], identifier)
            end

            if BossMenu[job.name] then
                local bossGrades = job.grade.isboss or false
                BossMenu[job.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = job.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = job.grade.level,
                    jobLabel = job.label,
                    boss = bossGrades or false,
                    jobGradeName = job.grade.name,
                    jobSalary = job.grade.payment or job.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[job.name].permissions and BossMenu[job.name].permissions.players and
                        BossMenu[job.name].permissions.players[identifier] or Config.DefaultPermissions
                }

                local processedRanks = {}

                local jobRankList = Core.Shared.Jobs[job.name] and Core.Shared.Jobs[job.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[job.name .. k] then
                        processedRanks[job.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[job.name].permissions and BossMenu[job.name].permissions['grades'] and BossMenu[job.name].permissions['grades'][tostring(k)] and not v.permissions then
                            v.permissions = BossMenu[job.name].permissions['grades'][tostring(k)].permissions or
                                Config.DefaultPermissions
                        end

                        if BossMenu[job.name]['employees'][identifier] and tonumber(k) == tonumber(job.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(job.name, k) or 0
                    end
                end

                BossMenu[job.name].jobRankList = jobRankList
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { job.name })
                    if next(bossmoney) == nil then
                        ExecuteSql(
                            'INSERT INTO bank_accounts (account_name, account_balance, account_type) VALUES (?, ?, ?)',
                            { job.name, 0, 'job' })
                    end

                    BossMenu[job.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].account_balance or 0
                elseif Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 MANAGEMENT ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetAccount(job.name)
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { job.name })
                    end

                    if not bossmoney then
                        ExecuteSql(
                            'INSERT INTO management_funds (job_name, amount, type) VALUES (?, ?, ?)',
                            { job.name, 0, 'boss' })
                    end
                    if Config.ExportManagementFunds then
                        BossMenu[job.name].jobSettings.jobMoney = bossmoney or 0
                    else
                        BossMenu[job.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].amount or 0
                    end
                else
                    BossMenu[job.name].jobSettings.jobMoney = 0
                end
            end

            if BossMenu[gang.name] then
                local bossGrades = gang.grade.isboss or false
                BossMenu[gang.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = gang.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = gang.grade.level,
                    jobLabel = gang.label,
                    boss = bossGrades or false,
                    jobGradeName = gang.grade.name,
                    jobSalary = 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[gang.name].permissions and BossMenu[gang.name].permissions.players and
                        BossMenu[gang.name].permissions.players[identifier] or Config.DefaultPermissions
                }

                local processedRanks = {}

                local jobRankList = Core.Shared.Gangs[gang.name] and Core.Shared.Gangs[gang.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[gang.name .. k] then
                        processedRanks[gang.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[gang.name].permissions and BossMenu[gang.name].permissions['grades'] and BossMenu[gang.name].permissions['grades'][tostring(k)] and not v.permissions then
                            v.permissions = BossMenu[gang.name].permissions['grades'][tostring(k)].permissions or
                                Config.DefaultPermissions
                        end

                        if BossMenu[gang.name]['employees'][identifier] and tonumber(k) == tonumber(gang.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(gang.name, k) or 0
                    end
                end

                BossMenu[gang.name].jobRankList = jobRankList
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { gang.name })
                    if next(bossmoney) == nil then
                        ExecuteSql(
                            'INSERT INTO bank_accounts (account_name, account_balance, account_type) VALUES (?, ?, ?)',
                            { gang.name, 0, 'job' })
                    end

                    BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].account_balance or 0
                elseif Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 MANAGEMENT ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetGangAccount(gang.name)
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { gang.name })
                    end
                    if not bossmoney then
                        ExecuteSql(
                            'INSERT INTO management_funds (job_name, amount, type) VALUES (?, ?, ?)',
                            { gang.name, 0, 'boss' })
                    end
                    if Config.ExportManagementFunds then
                        BossMenu[gang.name].jobSettings.jobMoney = bossmoney or 0
                    else
                        BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].amount or 0
                    end
                else
                    BossMenu[gang.name].jobSettings.jobMoney = 0
                end
            end
        end
    elseif Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local result = ExecuteSql('SELECT identifier, job, job_grade, firstname, lastname FROM users')
        for _, row in pairs(result) do
            local identifier = row.identifier
            if not BossMenu[row.job] then
                BossMenu[row.job] = {}
                BossMenu[row.job].employees = {}
                BossMenu[row.job].jobHistory = {}
                BossMenu[row.job].jobRankList = {}
            end
            if BossMenu[row.job] then
                local bossGrades = true
                local jobGrade = ExecuteSql('SELECT * FROM job_grades WHERE job_name = ? AND grade = ? ',
                    { row.job, row.job_grade })
                local jobname = ExecuteSql('SELECT * FROM jobs WHERE name = ?', { row.job })
                BossMenu[row.job]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = row.job,
                    playerName = row.firstname .. ' ' .. row.lastname or 'Unknown',
                    jobGrade = row.job_grade,
                    jobLabel = jobname[1].label or row.job,
                    boss = bossGrades or false,
                    jobGradeName = jobGrade[1].label or row.job_grade,
                    jobSalary = jobGrade[1].payment or 0,
                    profilepicture = Config.ExampleProfilePicture
                }
            end
        end
    elseif Config.Framework == 'qbox' then
        local result = ExecuteSql('SELECT citizenid, job, gang, charinfo FROM players')
        for _, row in pairs(result) do
            local identifier = row.citizenid
            local job = json.decode(row.job)
            local gang = json.decode(row.gang)

            local charinfo = json.decode(row.charinfo) or {}
            if JobAllPlayer[job.name] then
                table.insert(JobAllPlayer[job.name], identifier)
            else
                JobAllPlayer[job.name] = {}
                table.insert(JobAllPlayer[job.name], identifier)
            end

            if GangAllPlayer[gang.name] then
                table.insert(GangAllPlayer[gang.name], identifier)
            else
                GangAllPlayer[gang.name] = {}
                table.insert(GangAllPlayer[gang.name], identifier)
            end

            if BossMenu[job.name] then
                local bossGrades = job.grade.isboss or false
                BossMenu[job.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = job.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = job.grade.level,
                    jobLabel = job.label,
                    boss = bossGrades or false,
                    jobGradeName = job.grade.name,
                    jobSalary = job.grade.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[job.name].permissions and BossMenu[job.name].permissions.players and
                        BossMenu[job.name].permissions.players[identifier] or Config.DefaultPermissions
                }
                local processedRanks = {}
                local jobRankList = Core.Shared.Jobs[job.name] and Core.Shared.Jobs[job.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[job.name .. k] then
                        processedRanks[job.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[job.name].permissions and BossMenu[job.name].permissions['grades'] and BossMenu[job.name].permissions['grades'][tonumber(k)] and not v.permissions then
                            v.permissions = BossMenu[job.name].permissions['grades'][tonumber(k)].permissions or
                                Config.DefaultPermissions
                        else
                            v.permissions = Config.DefaultPermissions
                        end

                        if BossMenu[job.name]['employees'][identifier] and tonumber(k) == tonumber(job.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(job.name, k) or 0
                    end
                end
                BossMenu[job.name].jobRankList = jobRankList

                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    BossMenu[job.name].jobSettings.jobMoney = bossmoney[1].amount or 0
                else
                    BossMenu[job.name].jobSettings.jobMoney = 0
                end
            end

            if BossMenu[gang.name] then
                local bossGrades = gang.grade.isboss or false
                BossMenu[gang.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = gang.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = gang.grade.level,
                    jobLabel = gang.label,
                    boss = bossGrades or false,
                    jobGradeName = gang.grade.name,
                    jobSalary = gang.grade.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[gang.name].permissions and BossMenu[gang.name].permissions.players and
                        BossMenu[gang.name].permissions.players[identifier] or Config.DefaultPermissions
                }
                local processedRanks = {}
                local jobRankList = Core.Shared.Gangs[gang.name] and Core.Shared.Gangs[gang.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[gang.name .. k] then
                        processedRanks[gang.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[gang.name].permissions and BossMenu[gang.name].permissions['grades'] and BossMenu[gang.name].permissions['grades'][tonumber(k)] and not v.permissions then
                            v.permissions = BossMenu[gang.name].permissions['grades'][tonumber(k)].permissions or
                                Config.DefaultPermissions
                        else
                            v.permissions = Config.DefaultPermissions
                        end

                        if BossMenu[gang.name]['employees'][identifier] and tonumber(k) == tonumber(gang.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(gang.name, k) or 0
                    end
                end
                BossMenu[gang.name].jobRankList = jobRankList

                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1].amount or 0
                else
                    BossMenu[gang.name].jobSettings.jobMoney = 0
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while Core == nil do
        Citizen.Wait(0)
    end


    RegisterCallback('tworst:bossmenu:getBossMoney', function(source, cb)
        local src = source
        local identifier = GetIdentifier(src)
        local job = getGangorgetJob(identifier)
        local isGang = BossMenu[job.name] and BossMenu[job.name].jobSettings and BossMenu[job.name].jobSettings.isGang or
            false
        if not job then
            TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification['datanotfound'])
            return
        end
        if Config.QBCoreJobVaultSql == 'management_funds' then
            if Config.ExportManagementFunds then
                if isGang then
                    local bossmoney = exports['qb-management']:GetGangAccount(job.name)
                    cb(bossmoney)
                else
                    local bossmoney = exports['qb-management']:GetAccount(job.name)
                    cb(bossmoney)
                end
            else
                local bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { job.name })
                cb(bossmoney[1].amount)
            end
        elseif Config.QBCoreJobVaultSql == 'bank_account' then
            local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
            if result[1] == nil then
                for i = 0, 10 do
                    print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                end
                return
            end
            local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { job.name })

            if next(bossmoney) == nil then
                ExecuteSql(
                    'INSERT INTO bank_accounts (account_name, account_balance, account_type) VALUES (?, ?, ?)',
                    { job.name, 0, 'job' })
            end

            print(bossmoney[1].account_balance)
            BossMenu[job.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].account_balance or 0
            cb(BossMenu[job.name].jobSettings.jobMoney)
        else
            cb(0)
        end
    end)
end)

Citizen.CreateThread(function()
    while not Core do
        Wait(0)
    end

    local result = ExecuteSql('SELECT * FROM tw_bossmenu')
    if next(result) ~= nil then
        for _, row in pairs(result) do
            BossMenu[row.jobname] = {}
            BossMenu[row.jobname].jobSettings = {}
            BossMenu[row.jobname].employees = {}
            BossMenu[row.jobname].jobRankList = {}
            BossMenu[row.jobname].outfitList = json.decode(row.outfitList) or {}
            BossMenu[row.jobname].jobHistory = json.decode(row.jobHistory)
            BossMenu[row.jobname].permissions = json.decode(row.permissions)
            BossMenu[row.jobname].jobSettings.jobLabel = row.jobLabel
            BossMenu[row.jobname].jobSettings.jobName = row.jobname
            BossMenu[row.jobname].jobSettings.jobLogo = row.jobLogo
            BossMenu[row.jobname].jobSettings.jobBanner = row.jobBanner
            BossMenu[row.jobname].jobSettings.jobDescription = row.jobDescription
            BossMenu[row.jobname].jobSettings.jobStashCoords = json.decode(row.stashLoc)
            BossMenu[row.jobname].jobSettings.jobBossMenuCoords = json.decode(row.openLoc)
            BossMenu[row.jobname].jobSettings.isGang = row.isGang or false
            BossMenu[row.jobname].jobSettings.blipList = json.decode(row.blipData) or {}


            if Config.Inventory == 'ox_inventory' then
                local stashData = {
                    id = row.jobname,
                    label = row.jobname .. ' Stash',
                    slots = 50,
                    weight = 100000,
                    owner = nil,
                    groups = {
                        [row.jobname] = 0
                    },
                    coords = vector3(BossMenu[row.jobname].jobSettings.jobStashCoords.x,
                        BossMenu[row.jobname].jobSettings.jobStashCoords.y,
                        BossMenu[row.jobname].jobSettings.jobStashCoords.z)
                }
                exports.ox_inventory:RegisterStash(stashData.id, stashData.label, stashData.slots, stashData.weight,
                    stashData.owner, stashData.groups, stashData.coords)
            end
        end
    end

    if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local result = ExecuteSql('SELECT citizenid, job, gang, charinfo FROM players')
        for _, row in pairs(result) do
            local identifier = row.citizenid
            local job = json.decode(row.job)
            local gang = json.decode(row.gang)

            local charinfo = json.decode(row.charinfo)
            if JobAllPlayer[job.name] then
                table.insert(JobAllPlayer[job.name], identifier)
            else
                JobAllPlayer[job.name] = {}
                table.insert(JobAllPlayer[job.name], identifier)
            end

            if GangAllPlayer[gang.name] then
                table.insert(GangAllPlayer[gang.name], identifier)
            else
                GangAllPlayer[gang.name] = {}
                table.insert(GangAllPlayer[gang.name], identifier)
            end

            if BossMenu[job.name] then
                local bossGrades = job.grade.isboss or false
                BossMenu[job.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = job.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = job.grade.level,
                    jobLabel = job.label,
                    boss = bossGrades or false,
                    jobGradeName = job.grade.name,
                    jobSalary = job.grade.payment or job.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[job.name].permissions and BossMenu[job.name].permissions.players and
                        BossMenu[job.name].permissions.players[identifier] or Config.DefaultPermissions
                }

                local processedRanks = {}

                local jobRankList = Core.Shared.Jobs[job.name] and Core.Shared.Jobs[job.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[job.name .. k] then
                        processedRanks[job.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[job.name].permissions and BossMenu[job.name].permissions['grades'] and BossMenu[job.name].permissions['grades'][tostring(k)] and not v.permissions then
                            v.permissions = BossMenu[job.name].permissions['grades'][tostring(k)].permissions or
                                Config.DefaultPermissions
                        end

                        if BossMenu[job.name]['employees'][identifier] and tonumber(k) == tonumber(job.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(job.name, k) or 0
                    end
                end

                BossMenu[job.name].jobRankList = jobRankList
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { job.name })
                    if next(bossmoney) == nil then
                        ExecuteSql(
                            'INSERT INTO bank_accounts (account_name, account_balance, account_type) VALUES (?, ?, ?)',
                            { job.name, 0, 'job' })
                    end

                    BossMenu[job.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].account_balance or 0
                elseif Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 MANAGEMENT ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetAccount(job.name)
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { job.name })
                    end
                    if not bossmoney then
                        ExecuteSql(
                            'INSERT INTO management_funds (job_name, amount, type) VALUES (?, ?, ?)',
                            { job.name, 0, 'boss' })
                    end
                    if Config.ExportManagementFunds then
                        BossMenu[job.name].jobSettings.jobMoney = bossmoney or 0
                    else
                        BossMenu[job.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].amount or 0
                    end
                else
                    BossMenu[job.name].jobSettings.jobMoney = 0
                end
            end

            if BossMenu[gang.name] then
                local bossGrades = gang.grade.isboss or false
                BossMenu[gang.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = gang.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = gang.grade.level,
                    jobLabel = gang.label,
                    boss = bossGrades or false,
                    jobGradeName = gang.grade.name,
                    jobSalary = 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[gang.name].permissions and BossMenu[gang.name].permissions.players and
                        BossMenu[gang.name].permissions.players[identifier] or Config.DefaultPermissions
                }

                local processedRanks = {}

                local jobRankList = Core.Shared.Gangs[gang.name] and Core.Shared.Gangs[gang.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[gang.name .. k] then
                        processedRanks[gang.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[gang.name].permissions and BossMenu[gang.name].permissions['grades'] and BossMenu[gang.name].permissions['grades'][tostring(k)] and not v.permissions then
                            v.permissions = BossMenu[gang.name].permissions['grades'][tostring(k)].permissions or
                                Config.DefaultPermissions
                        end

                        if BossMenu[gang.name]['employees'][identifier] and tonumber(k) == tonumber(gang.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(gang.name, k) or 0
                    end
                end

                BossMenu[gang.name].jobRankList = jobRankList
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { gang.name })
                    if next(bossmoney) == nil then
                        ExecuteSql(
                            'INSERT INTO bank_accounts (account_name, account_balance, account_type) VALUES (?, ?, ?)',
                            { gang.name, 0, 'job' })
                    end

                    BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].account_balance or 0
                elseif Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result[1] == nil then
                        for i = 0, 10 do
                            print('^1 MANAGEMENT ACCOUNTS SQL TABLE NOT FOUND, CHECK Config.QBCoreJobVaultSql ^0')
                        end
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetGangAccount(gang.name)
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { gang.name })
                    end
                    if not bossmoney then
                        ExecuteSql(
                            'INSERT INTO management_funds (job_name, amount, type) VALUES (?, ?, ?)',
                            { gang.name, 0, 'boss' })
                    end
                    if Config.ExportManagementFunds then
                        BossMenu[gang.name].jobSettings.jobMoney = bossmoney or 0
                    else
                        BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1] and bossmoney[1].amount or 0
                    end
                else
                    BossMenu[gang.name].jobSettings.jobMoney = 0
                end
            end
        end
    elseif Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local result = ExecuteSql('SELECT identifier, job, job_grade, firstname, lastname FROM users')
        for _, row in pairs(result) do
            local identifier = row.identifier
            if not BossMenu[row.job] then
                BossMenu[row.job] = {}
                BossMenu[row.job].employees = {}
                BossMenu[row.job].jobHistory = {}
                BossMenu[row.job].jobRankList = {}
            end
            if BossMenu[row.job] then
                local bossGrades = true
                local jobGrade = ExecuteSql('SELECT * FROM job_grades WHERE job_name = ? AND grade = ? ',
                    { row.job, row.job_grade })
                local jobname = ExecuteSql('SELECT * FROM jobs WHERE name = ?', { row.job })
                BossMenu[row.job]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = row.job,
                    playerName = row.firstname .. ' ' .. row.lastname or 'Unknown',
                    jobGrade = row.job_grade,
                    jobLabel = jobname[1].label or row.job,
                    boss = bossGrades or false,
                    jobGradeName = jobGrade[1].label or row.job_grade,
                    jobSalary = jobGrade[1].payment or 0,
                    profilepicture = Config.ExampleProfilePicture
                }
            end
        end
    elseif Config.Framework == 'qbox' then
        local result = ExecuteSql('SELECT citizenid, job, gang, charinfo FROM players')
        for _, row in pairs(result) do
            local identifier = row.citizenid
            local job = json.decode(row.job)
            local gang = json.decode(row.gang)

            local charinfo = json.decode(row.charinfo) or {}
            if JobAllPlayer[job.name] then
                table.insert(JobAllPlayer[job.name], identifier)
            else
                JobAllPlayer[job.name] = {}
                table.insert(JobAllPlayer[job.name], identifier)
            end

            if GangAllPlayer[gang.name] then
                table.insert(GangAllPlayer[gang.name], identifier)
            else
                GangAllPlayer[gang.name] = {}
                table.insert(GangAllPlayer[gang.name], identifier)
            end

            if BossMenu[job.name] then
                local bossGrades = job.grade.isboss or false
                BossMenu[job.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = job.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = job.grade.level,
                    jobLabel = job.label,
                    boss = bossGrades or false,
                    jobGradeName = job.grade.name,
                    jobSalary = job.grade.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[job.name].permissions and BossMenu[job.name].permissions.players and
                        BossMenu[job.name].permissions.players[identifier] or Config.DefaultPermissions
                }
                local processedRanks = {}
                local jobRankList = Core.Shared.Jobs[job.name] and Core.Shared.Jobs[job.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[job.name .. k] then
                        processedRanks[job.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[job.name].permissions and BossMenu[job.name].permissions['grades'] and BossMenu[job.name].permissions['grades'][tonumber(k)] and not v.permissions then
                            v.permissions = BossMenu[job.name].permissions['grades'][tonumber(k)].permissions or
                                Config.DefaultPermissions
                        else
                            v.permissions = Config.DefaultPermissions
                        end

                        if BossMenu[job.name]['employees'][identifier] and tonumber(k) == tonumber(job.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[job.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(job.name, k) or 0
                    end
                end
                BossMenu[job.name].jobRankList = jobRankList

                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    BossMenu[job.name].jobSettings.jobMoney = bossmoney[1].amount or 0
                else
                    BossMenu[job.name].jobSettings.jobMoney = 0
                end
            end

            if BossMenu[gang.name] then
                local bossGrades = gang.grade.isboss or false
                BossMenu[gang.name]['employees'][identifier] = {
                    id = false,
                    identifier = identifier,
                    name = gang.name,
                    playerName = charinfo.firstname .. ' ' .. charinfo.lastname or 'Unknown',
                    jobGrade = gang.grade.level,
                    jobLabel = gang.label,
                    boss = bossGrades or false,
                    jobGradeName = gang.grade.name,
                    jobSalary = gang.grade.payment or 0,
                    profilepicture = Config.ExampleProfilePicture,
                    playerPermission = BossMenu[gang.name].permissions and BossMenu[gang.name].permissions.players and
                        BossMenu[gang.name].permissions.players[identifier] or Config.DefaultPermissions
                }
                local processedRanks = {}
                local jobRankList = Core.Shared.Gangs[gang.name] and Core.Shared.Gangs[gang.name].grades or {}

                for k, v in pairs(jobRankList) do
                    if not processedRanks[gang.name .. k] then
                        processedRanks[gang.name .. k] = true
                        v.gradeLevel = k

                        if BossMenu[gang.name].permissions and BossMenu[gang.name].permissions['grades'] and BossMenu[gang.name].permissions['grades'][tonumber(k)] and not v.permissions then
                            v.permissions = BossMenu[gang.name].permissions['grades'][tonumber(k)].permissions or
                                Config.DefaultPermissions
                        else
                            v.permissions = Config.DefaultPermissions
                        end

                        if BossMenu[gang.name]['employees'][identifier] and tonumber(k) == tonumber(gang.grade.level) then
                            if v.player then
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            else
                                v.player = {}
                                v.player[identifier] = BossMenu[gang.name]['employees'][identifier]
                            end
                        end
                        v.totalPlayer = getJobRankPlayers(gang.name, k) or 0
                    end
                end
                BossMenu[gang.name].jobRankList = jobRankList

                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    BossMenu[gang.name].jobSettings.jobMoney = bossmoney[1].amount or 0
                else
                    BossMenu[gang.name].jobSettings.jobMoney = 0
                end
            end
        end
    end
end)


RegisterServerEvent('tworst:bossmenu:depositMoney', function(data)
    local src = source
    if cooldown[src] then
        return
    else
        cooldown[src] = true
        SetTimeout(1500, function()
            cooldown[src] = nil
        end)
    end
    local identifier = GetIdentifier(src)
    local job = getGangorgetJob(identifier)

    if not job then
        TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification['datanotfound'])
        return
    end

    if BossMenu[job.name] then
        if BossMenu[job.name]['employees'][identifier] then
            local amount = tonumber(data)
            if amount == nil then
                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                    Config.Notification['theamountwasnotspecified'])
                return
            end
            if amount < 0 then
                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                    Config.Notification['theamountcannotbelessthan0'])
                return
            end
            local GetMoney = GetPlayerMoney(src, 'bank')
            if not GetMoney then
                TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification['datanotfound'])
                return
            end

            if tonumber(GetMoney) < amount then
                TriggerClientEvent('tworst:bossmenu:addNotification', src, Config.Notification
                    ['youdonothaveenoughmoney'])
                return
            end


            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result and result[1] == nil then
                        print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND ^0')
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { job.name })
                    if next(bossmoney) == nil then
                        print('^1 ' .. job.name .. ' BANK ACCOUNTS SQL TABLE NOT FOUND ^0')
                        return
                    end
                    if bossmoney and bossmoney[1] then
                        local newmoney = bossmoney[1].account_balance + amount
                        ExecuteSql('UPDATE bank_accounts SET account_balance = ? WHERE account_name = ?',
                            { newmoney, job.name })
                        BossMenu[job.name].jobSettings.jobMoney = newmoney
                        RemoveMoney(src, 'bank', amount)
                        local newData = {
                            name = GetName(src),
                            type = 'deposit',
                            amount = tonumber(amount) or 0,
                            date = os.date("%d/%m | %H:%M"),
                        }
                        table.insert(BossMenu[job.name].jobHistory, newData)
                        UpdateBossMenuHistory(job.name, GetName(src), 'deposit', amount or 0)
                        for k, v in pairs(BossMenu[job.name]['employees']) do
                            if v.id then
                                local GetIdentifier = IsPlayerInGame(v.id)
                                if GetIdentifier then
                                    TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                    TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                                end
                            end
                        end
                    end
                end

                if Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result and result[1] == nil then
                        print('^1 MANAGEMENT FUNDS SQL TABLE NOT FOUND ^0')
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetAccount(job.name)
                        if not bossmoney then
                            print('^1 ' .. job.name .. ' MANAGEMENT_FUNDS  ACCOUNTS SQL TABLE NOT FOUND ^0')
                            return
                        end
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { job.name })
                        if next(bossmoney) == nil then
                            print('^1 ' .. job.name .. ' MANAGEMENT_FUNDS  ACCOUNTS SQL TABLE NOT FOUND ^0')
                            return
                        end
                    end

                    if bossmoney then
                        local newmoney
                        if Config.ExportManagementFunds then
                            exports['qb-management']:AddMoney(job.name, amount)
                            newmoney = exports['qb-management']:GetAccount(job.name)
                        else
                            newmoney = bossmoney[1].amount + amount
                            ExecuteSql('UPDATE management_funds SET amount = ? WHERE job_name = ?',
                                { newmoney, job.name })
                        end

                        BossMenu[job.name].jobSettings.jobMoney = newmoney
                        RemoveMoney(src, 'bank', amount)
                        local newData = {
                            name = GetName(src),
                            type = 'deposit',
                            amount = tonumber(amount) or 0,
                            date = os.date("%d/%m | %H:%M"),
                        }
                        table.insert(BossMenu[job.name].jobHistory, newData)
                        UpdateBossMenuHistory(job.name, GetName(src), 'deposit', amount or 0)
                        for k, v in pairs(BossMenu[job.name]['employees']) do
                            if v.id then
                                local GetIdentifier = GetIdentifier(v.id)
                                if GetIdentifier then
                                    TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                    TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                                end
                            end
                        end
                    end
                end
            elseif Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'addon_account_data'))
                if result and result[1] == nil then
                    print('^1 ADDON ACCOUNT DATA SQL TABLE NOT FOUND ^0')
                    return
                end

                local bossmoney = ExecuteSql('SELECT * FROM addon_account_data WHERE account_name = ?',
                    { 'society_' .. job.name })
                if next(bossmoney) == nil then
                    print('^1 ' .. job.name .. ' ADDON ACCOUNT DATA ACCOUNTS SQL TABLE NOT FOUND ^0')
                    return
                end
                if bossmoney and bossmoney[1] then
                    local newmoney = bossmoney[1].money + amount
                    ExecuteSql('UPDATE addon_account_data SET money = ? WHERE account_name = ?',
                        { newmoney, 'society_' .. job.name })
                    BossMenu[job.name].jobSettings.jobMoney = newmoney
                    RemoveMoney(src, 'bank', amount)
                    local newData = {
                        name = GetName(src),
                        type = 'deposit',
                        amount = tonumber(amount) or 0,
                        date = os.date("%d/%m | %H:%M"),
                    }
                    table.insert(BossMenu[job.name].jobHistory, newData)
                    UpdateBossMenuHistory(job.name, GetName(src), 'deposit', amount or 0)
                    for k, v in pairs(BossMenu[job.name]['employees']) do
                        if v.id then
                            local GetIdentifier = GetIdentifier(v.id)
                            if GetIdentifier then
                                TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                            end
                        end
                    end
                end
            elseif Config.Framework == 'qbox' then
                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    local newmoney = bossmoney[1].amount + amount
                    ExecuteSql('UPDATE bank_accounts_new SET amount = ? WHERE id = ?',
                        { newmoney, job.name })
                    BossMenu[job.name].jobSettings.jobMoney = newmoney
                    RemoveMoney(src, 'bank', amount)
                    local newData = {
                        name = GetName(src),
                        type = 'deposit',
                        amount = tonumber(amount) or 0,
                        date = os.date("%d/%m | %H:%M"),
                    }
                    table.insert(BossMenu[job.name].jobHistory, newData)
                    UpdateBossMenuHistory(job.name, GetName(src), 'deposit', amount or 0)
                    for k, v in pairs(BossMenu[job.name]['employees']) do
                        if v.id then
                            local GetIdentifier = IsPlayerInGame(v.id)
                            if GetIdentifier then
                                TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                            end
                        end
                    end
                end
            end
        else
            print('job data not found')
        end
    end
end)

RegisterServerEvent('tworst:bossmenu:withdrawMoney', function(data)
    local src = source
    if cooldown[src] then
        return
    else
        cooldown[src] = true
        SetTimeout(1500, function()
            cooldown[src] = nil
        end)
    end
    local identifier = GetIdentifier(src)
    local job = getGangorgetJob(identifier)

    if BossMenu[job.name] then
        if BossMenu[job.name]['employees'][identifier] then
            local amount = tonumber(data)
            if amount == nil then
                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                    Config.Notification['theamountwasnotspecified'])
                return
            end
            if amount < 0 then
                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                    Config.Notification['theamountcannotbelessthan0'])
                return
            end

            if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
                if Config.QBCoreJobVaultSql == 'bank_account' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts'))
                    if result and result[1] == nil then
                        print('^1 BANK ACCOUNTS SQL TABLE NOT FOUND ^0')
                        return
                    end
                    local bossmoney = ExecuteSql('SELECT * FROM bank_accounts WHERE account_name = ?', { job.name })
                    if bossmoney and bossmoney[1] then
                        if tonumber(bossmoney[1].account_balance) < amount then
                            TriggerClientEvent('tworst:bossmenu:addNotification', src,
                                Config.Notification['youdonothaveenoughmoney'])
                            return
                        end
                        local newmoney = bossmoney[1].account_balance - amount
                        ExecuteSql('UPDATE bank_accounts SET account_balance = ? WHERE account_name = ?',
                            { newmoney, job.name })
                        BossMenu[job.name].jobSettings.jobMoney = newmoney
                        AddMoney(src, 'bank', amount)
                        local newData = {
                            name = GetName(src),
                            type = 'withdraw',
                            amount = tonumber(amount) or 0,
                            date = os.date("%d/%m | %H:%M"),
                        }
                        table.insert(BossMenu[job.name].jobHistory, newData)
                        UpdateBossMenuHistory(job.name, GetName(src), 'withdraw', amount or 0)
                        for k, v in pairs(BossMenu[job.name]['employees']) do
                            if v.id then
                                local GetIdentifier = IsPlayerInGame(v.id)
                                if GetIdentifier then
                                    TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                    TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                                end
                            end
                        end
                    end
                end
                if Config.QBCoreJobVaultSql == 'management_funds' then
                    local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'management_funds'))
                    if result and result[1] == nil then
                        print('^1 MANAGEMENT FUNDS SQL TABLE NOT FOUND ^0')
                        return
                    end
                    local bossmoney
                    if Config.ExportManagementFunds then
                        bossmoney = exports['qb-management']:GetAccount(job.name)
                    else
                        bossmoney = ExecuteSql('SELECT * FROM management_funds WHERE job_name = ?', { job.name })
                    end
                    if bossmoney then
                        local newmoney
                        if Config.ExportManagementFunds then
                            if tonumber(bossmoney) < amount then
                                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                                    Config.Notification['youdonothaveenoughmoney'])
                                return
                            end
                            exports['qb-management']:RemoveMoney(job.name, amount)
                            newmoney = exports['qb-management']:GetAccount(job.name)
                        else
                            if tonumber(bossmoney[1].amount) < amount then
                                TriggerClientEvent('tworst:bossmenu:addNotification', src,
                                    Config.Notification['youdonothaveenoughmoney'])
                                return
                            end
                            newmoney = bossmoney[1].amount - amount
                            ExecuteSql('UPDATE management_funds SET amount = ? WHERE job_name = ?',
                                { newmoney, job.name })
                        end
                        BossMenu[job.name].jobSettings.jobMoney = newmoney
                        AddMoney(src, 'bank', amount)
                        local newData = {
                            name = GetName(src),
                            type = 'withdraw',
                            amount = tonumber(amount) or 0,
                            date = os.date("%d/%m | %H:%M"),
                        }
                        table.insert(BossMenu[job.name].jobHistory, newData)
                        UpdateBossMenuHistory(job.name, GetName(src), 'withdraw', amount or 0)
                        for k, v in pairs(BossMenu[job.name]['employees']) do
                            if v.id then
                                local GetIdentifier = IsPlayerInGame(v.id)
                                if GetIdentifier then
                                    TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                    TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                                end
                            end
                        end
                    end
                end
            elseif Config.Framework == 'esx' or Config.Framework == 'oldesx' then
                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'addon_account_data'))
                if result and result[1] == nil then
                    print('^1 ADDON ACCOUNT DATA TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM addon_account_data WHERE account_name = ?',
                    { 'society_' .. job.name })
                if bossmoney and bossmoney[1] then
                    if tonumber(bossmoney[1].money) < amount then
                        TriggerClientEvent('tworst:bossmenu:addNotification', src,
                            Config.Notification['youdonothaveenoughmoney'])
                        return
                    end
                    local newmoney = bossmoney[1].money - amount
                    ExecuteSql('UPDATE addon_account_data SET money = ? WHERE account_name = ?',
                        { newmoney, 'society_' .. job.name })
                    BossMenu[job.name].jobSettings.jobMoney = newmoney
                    AddMoney(src, 'bank', amount)
                    local newData = {
                        name = GetName(src),
                        type = 'withdraw',
                        amount = tonumber(amount) or 0,
                        date = os.date("%d/%m | %H:%M"),
                    }
                    table.insert(BossMenu[job.name].jobHistory, newData)
                    UpdateBossMenuHistory(job.name, GetName(src), 'withdraw', amount or 0)
                    for k, v in pairs(BossMenu[job.name]['employees']) do
                        if v.id then
                            local GetIdentifier = IsPlayerInGame(v.id)
                            if GetIdentifier then
                                TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                            end
                        end
                    end
                end
            elseif Config.Framework == 'qbox' then
                local result = ExecuteSql(string.format("SHOW TABLES LIKE '%s'", 'bank_accounts_new'))
                if result and result[1] == nil then
                    print('^1 BANK ACCOUNTS NEW SQL TABLE NOT FOUND ^0')
                    return
                end
                local bossmoney = ExecuteSql('SELECT * FROM bank_accounts_new WHERE id = ?', { job.name })
                if bossmoney and bossmoney[1] then
                    if tonumber(bossmoney[1].amount) < amount then
                        TriggerClientEvent('tworst:bossmenu:addNotification', src,
                            Config.Notification['youdonothaveenoughmoney'])
                        return
                    end
                    local newmoney = bossmoney[1].amount - amount
                    ExecuteSql('UPDATE bank_accounts_new SET amount = ? WHERE id = ?',
                        { newmoney, job.name })
                    BossMenu[job.name].jobSettings.jobMoney = newmoney
                    AddMoney(src, 'bank', amount)
                    local newData = {
                        name = GetName(src),
                        type = 'withdraw',
                        amount = tonumber(amount) or 0,
                        date = os.date("%d/%m | %H:%M"),
                    }
                    table.insert(BossMenu[job.name].jobHistory, newData)
                    UpdateBossMenuHistory(job.name, GetName(src), 'withdraw', amount or 0)
                    for k, v in pairs(BossMenu[job.name]['employees']) do
                        if v.id then
                            local GetIdentifier = IsPlayerInGame(v.id)
                            if GetIdentifier then
                                TriggerClientEvent('tworst:bossmenu:updateMoneyData', v.id, newmoney)
                                TriggerClientEvent('tworst:bossmenu:updatejobHistoryData', v.id, newData)
                            end
                        end
                    end
                end
            end
        else
            print('job data not found')
        end
    end
end)
