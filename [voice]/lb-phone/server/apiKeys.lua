-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discordapp.com/api/webhooks/1295259445638725724/gj0oKuMatm99lpYh5gY9j17U7ywgActW_hH045xnbb6RFczCDclnXroj-Bu1ktSVJvNn"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discordapp.com/api/webhooks/1295259524227272724/A4n5lQAMmoN3A2j1KY0BTB52gFzrpOVBZpbfCGBvPZmyHuzjBPT8CKq_kIAb58dIAayy"

-- Discord webhook for server logs
LOGS = {
    Calls = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC", -- set to false to disable
    Messages = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    InstaPic = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Birdy = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    YellowPages = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Marketplace = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Mail = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Wallet = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    DarkChat = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Services = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Crypto = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Trendy = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC",
    Uploads = "https://discordapp.com/api/webhooks/1299672445678260234/5KFVMP5ukajxKV0tADtFrTBaNF2V8QHIl-rChPI8VSzTQRY8xqnOTrdrEUcljRoDSczC" -- all camera uploads will go here
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs
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
