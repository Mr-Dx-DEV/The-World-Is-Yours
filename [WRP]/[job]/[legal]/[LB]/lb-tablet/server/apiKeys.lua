-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc

API_KEYS = {
    Video = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
    Image = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
    Audio = "FXj7LTG0zbyvZBDOuZ84Tz4ufIMchB4b",
}

LOG_WEBHOOKS = {
    Default = "https://discord.com/api/webhooks/", -- set to false to disable
    Police = "https://discord.com/api/webhooks/",
    Ambulance = "https://discord.com/api/webhooks/",
    Dispatch = "https://discord.com/api/webhooks/"
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs
