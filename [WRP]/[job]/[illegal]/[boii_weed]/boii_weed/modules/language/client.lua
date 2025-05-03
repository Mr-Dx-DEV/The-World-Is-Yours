client_locale = {}

--- @section Functions

--- Retrieves a localized string from the loaded language file.
--- Falls back to the key itself if the translation is missing.
--- @param key string: The key corresponding to a translation entry.
--- @param ... any: Optional arguments for string formatting.
--- @return string The localized text.
function L(key, ...)
    return client_locale[key] and string.format(client_locale[key], ...) or key
end

local function request_locale()
    TriggerServerEvent("boii_weed:sv:request_locale")
end
request_locale()

--- @section Events

--- Receives locale form server.
RegisterNetEvent("boii_weed:cl:receive_locale")
AddEventHandler("boii_weed:cl:receive_locale", function(locale_data)
    client_locale = locale_data
end)