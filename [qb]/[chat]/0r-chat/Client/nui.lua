RegisterNUICallback("hide", function()
    TriggerEvent("chat:hide")
end)

RegisterNUICallback("processInput", function(data)
    ExecuteCommand(data.command)
end)

RegisterNUICallback("toggleSettingsMenu", function(data)
    SendNUIMessage({
        action = "toggleSettingsMenu",
        data = data.status
    })
    SetNuiFocus(data.status, data.status)
end)

RegisterNUICallback("updateChatStyle", function(data)
    SendNUIMessage({
        action = "changeChatStyle",
        data = data.newStyle
    })
end)
