local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',
    
   
   
    ['cuffing'] = '',
    
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    
    ['powerplants'] = '',
    
    ['ooc'] = '',
    ['report'] = '',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    
    ['anticheat'] = 'https://discordapp.com/api/webhooks/1190196635590983681/RAb5L1mhBPEFIWt95082LyUUXjPeG-A0CFavlsXzt9pg-qy-MAsNdK0Tm7U9zsHaA1Y7',
    ['weather'] = '',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
    ['qbjobs'] = '',
    ['identificationforgery'] = 'YOUR_WEBHOOK_HERE',
    ['burnerphones'] = 'YOUR_WEBHOOK_HERE',



    ["playermoney"] = "https://discordapp.com/api/webhooks/1190196221655134309/mIiu2BfJFT437rTm2DG_ZrSd6i4sOkmAxVjioXE26cTRS2Q_v5d1QCamahhpNEVJuY7Z",
    ["playerinventory"] = "https://discordapp.com/api/webhooks/1294746684235976804/lKdrLls3NG02tnctzvIAMN41waSjYmUnca3Hh60ltCj9KKXS-BraQ2vDKMc52EoJF13A",
    ["robbing"] = "https://discordapp.com/api/webhooks/1190196901379850300/2cgQaz5zr8i06o-s_5dmqZSXNleb5qqpJAuJmSf5BhA6ulIn4b5kV3rss7au-wl3iK8h",
    
    ["drop"] = "https://discordapp.com/api/webhooks/1190197000654819369/tz6JT_GHOqOvTX31l6BpKa0YcpNmjgmtyVr9p-rbpjHBIbEX2ZnZHvJY5YQ8JYQxxqMc",
    ["trunk"] = "https://discordapp.com/api/webhooks/1190197103104905216/BRF5B7n_OgBvWHhknRUvo2p_rr-KHbegslKMG_BezxBC_qawiIyocyGl5FRG2yHksLuC",
    ["stash"] = "https://discord.com/api/webhooks/1190197185053204511/KUvtOjjr5uUbazkt0q83_hRThZ1Br1A85XGm3_ti1dWxeb2q8AC3EnoxMxeBTuxZVu1s",
    ["glovebox"] = "https://discord.com/api/webhooks/1190197270361161758/GMqFVE2Yvda6vINxi47Cg3f7SFacWBnypQj-yFd0KR08iv68qs5Oy_UEZ03husgcLtTo",
    ["banking"] = "https://discordapp.com/api/webhooks/1190197428620640266/Rlmp5iqoxI4aMkdhxrSHI40X9wY4LWmmwr2S3ijw4uz2eVpSpaa4MYW8Qe7unrFHNWlR",
    
    ["storerobbery"] = "https://discord.com/api/webhooks/1190197525026713710/wkSL6xb3hmEDIndWFnS29moVTdu0mohvejIN309-gZstlqbOcKnmbT5cPjT3knBBPR11",
    ["bankrobbery"] = "https://discord.com/api/webhooks/1190197693486739457/8GDkstNIHLPcsw2fDLXf_GG-cv7Jk1D7MmByMTxe051o-58R7Q9Mu02Qp1Nw7a7cj67x",
    
    ["death"] = "https://discordapp.com/api/webhooks/1190196438198652928/qxc5W4CY1VCw33W3k8Mxr-zf0dbYpa1-5XdXOMPS0C-PklrGd6zCphMozZLo1vrAyWA6",
    ["joinleave"] = "https://discordapp.com/api/webhooks/1294746201983553597/7YUhEJoau29_NIaMZN3P0pPDM2SC3KTGGu44OOhY6WEM-00zNDW5IIH3HKShBdqbFQe0",
    
    ["bans"] = "https://discordapp.com/api/webhooks/1190196542041227296/J0lZw8aWmsR0uvkhwULTGLROpx6kIJ4rNX9JgU4kFvmENf6GCrk6prn88kZP_cBCruVY",
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local postData = {}
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            if tag then
                postData = { username = 'QB Logs', content = '@everyone', embeds = {} }
            else
                postData = { username = 'QB Logs', embeds = {} }
            end
            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
