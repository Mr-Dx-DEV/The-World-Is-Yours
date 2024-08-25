
WebhookURL = ""

if not WebhookURL or WebhookURL == "" then
    print("^1[ERROR]^7 m-Vehicleshop: Webhook URL is not set, please set it in the s_utils.lua")
end

local timeSettings = "months" -- days or months
function CalculateTime(now, months)
    if timeSettings == "days" then
        local date = now + months * 24 * 60 * 60
        return date
    elseif timeSettings == "months" then
        local date = now + months * 30 * 24 * 60 * 60
        return date
    end
end

function SocietyAddMoney(society, price)
    if Config.Societys.management == "qb-management" then
        exports['qb-management']:AddMoney(society, price)
    elseif Config.Societys.management == "qb-banking" then
        exports['qb-banking']:AddMoney(society, price)
    elseif Config.Societys.management == "okokBanking" then
        exports['okokBanking']:AddMoney(society, price)
    end
end