QBCore = exports[Shared.Exports.core]:GetCoreObject()


function SendMail(citizenid, sender, subject, message)
    exports['qb-phone']:sendNewMailToOffline(citizenid, {
        sender = sender,
        subject = subject,
        message = message,
    })
end

RegisterNetEvent('l2s-hotel:server:openStash', function(stash, data)
    local src = source
    exports['qb-inventory']:OpenInventory(src, stash, data)
end)
