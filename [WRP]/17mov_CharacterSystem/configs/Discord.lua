-- We moved this part of Selector.lua config there, because otherwise your Discord bot token can be easly leaked by cheaters who's using dumper
-- Here you can configure custom number of characters per specified player (based on discord roles)
Selector.Discord = {
    Enable = true,                                                                      -- Should enable system?
    Token = "MTI3MTkxMjU1MDU0MzM5MjgxMQ.Gu0B6K.wJMFk2YIxkh3QNVLs9Ui7F9WHkkP5HGTD-EW1c", -- Discord Bot token (bot must be on guild)
    Guild = "1053230196326666270",                                                       -- DiscordId of your server guild
    Roles = {                                                                           -- There you can add roles and assign number of characters
        -- ["DISCORD_ID_OF_ROLE"] = NUMBER_OF_CHARACTERS,                               -- Template
        -- ["1111774118820446259"] = 10,                                                -- Example
    }
}