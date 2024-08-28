----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- INFO EMAILS --<!>--
-- Request job info
local ket_emailsent = false
RegisterNetEvent('boii-drugs:cl:RequestInfo', function()
    if ket_emailsent then
        TriggerEvent('boii-drugs:notify', Language.Ketamine.Worker.Email['cantemail'], 'error')
        return
    end
    local hasitem = Core.Functions.HasItem(Config.Ketamine.Worker.Emails.Request.Required.name)
    if not hasitem then TriggerEvent('boii-drugs:notify', Language.Ketamine.Worker.Email['nophone'], 'error') return end
    ket_emailsent = true
    TriggerEvent('boii-drugs:notify', Language.Ketamine.Worker.Email['emailsent'], 'success')
    Wait(Config.Ketamine.Worker.Emails.Request.Delay*1000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Suspicious Worker',
        subject = 'I have some info..',
        message = 'Yo<br><br>I overheard the vet talking about a van full of kitkats set to arrive at the store<br><br>I think you should intercept it..<br><br>Let me know if your interested..',
        button = {
            enabled = true,
            buttonEvent = 'boii-drugs:cl:AcceptInfo'
        }
    })
    Wait(Config.Ketamine.Worker.Emails.Request.Cooldown*60000)
    ket_emailsent = false
end)
-- Accept job
RegisterNetEvent('boii-drugs:cl:AcceptInfo', function()
    TriggerEvent('boii-drugs:notify', Language.Ketamine.Worker.Email['accepted'], 'primary')
    Wait(Config.Ketamine.Worker.Emails.Request.Delay*1000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Suspicious Worker',
        subject = 'Heres what you need..',
        message = 'Yo<br><br>So i know where the van is going to be<br><br>Make sure you bring the right tools those vehicle are well protected..<br><br>Ill be watching..<br><br>REQUIRED:<br>- A Weapon and ammo<br>- Lockpicks<br>- Tracking chip removers',
        button = {
            enabled = true,
            buttonEvent = 'boii-drugs:cl:StartJob'
        }
    })
end)
--<!>-- INFO EMAILS --<!>--


--<!>-- TRACKER EMAIL --<!>--
RegisterNetEvent('boii-drugs:cl:TrackerEmail', function()
    Wait(Config.Ketamine.Worker.Emails.Delivery.Delay*1000)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Suspicious Worker',
        subject = 'Extra info..',
        message = 'Yo<br><br>That vehicle is tracked btw..<br><br>You did bring a few chip removers right?..<br><br>Youll get the drop information as soon as the tracker is removed..',
        button = {
            enabled = false,
        }
    })
end)
--<!>-- TRACKER EMAIL --<!>--
