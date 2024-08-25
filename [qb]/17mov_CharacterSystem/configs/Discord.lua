-- We moved this part of Selector.lua config there, because otherwise your Discord bot token can be easly leaked by cheaters who's using dumper
-- Here you can configure custom number of characters per specified player (based on discord roles)
Selector.Discord = {
    Enable = true,                                                                      -- Should enable system?
    Token = "MTI3NzA1MDA4ODMyNTM4MjI0OA.G0grR4.yR6M8b4tJ_laCPwNG-KnMa8Za2IKQNkHQdKCRU", -- Discord Bot token (bot must be on guild)
    Guild = "975183018262163537",                                                       -- DiscordId of your server guild
    Roles = {                                                                           -- There you can add roles and assign number of characters
        -- ["DISCORD_ID_OF_ROLE"] = NUMBER_OF_CHARACTERS,                               -- Template
        -- ["1111774118820446259"] = 10,                                                -- Example
    }
}