local current_locale = {}
local selected_language = GetConvar("locale", "en-EN"):lower()
local base_language = selected_language:gsub("en%-", "") 

--- @section Functions

--- Loads the locale file based on the server"s configured language.
--- @param language string The language code (e.g., "en", "fr", "es").
local function load_locale(language)
    local file_path = ("locales/%s.lua"):format(language)
    local file_content = LoadResourceFile(GetCurrentResourceName(), file_path)
    if not file_content then
        return load_locale("en")
    end
    local success, locale_table = pcall(function() return assert(load(file_content))() end)
    if not success or type(locale_table) ~= "table" then
        return load_locale("en")
    end
    current_locale = locale_table
end
load_locale(base_language)

--- Retrieves a localized string from the loaded language file.
--- Falls back to the key itself if the translation is missing.
--- @param key string: The key corresponding to a translation entry.
--- @param ... any: Optional arguments for string formatting.
--- @return string The localized text.
function L(key, ...)
    return current_locale.server[key] and string.format(current_locale.server[key], ...) or key
end

--- @section Events

--- Sends the client-side locale data to a player upon request.
RegisterServerEvent("boii_weed:sv:request_locale")
AddEventHandler("boii_weed:sv:request_locale", function()
    local src = source
    TriggerClientEvent("boii_weed:cl:receive_locale", src, current_locale.client)
end)
