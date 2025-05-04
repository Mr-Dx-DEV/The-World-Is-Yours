Config = {}

Config.GTAMenu = {
    top = {
        -- "text" will display only "Server Name" in the top of the menu
        -- "texture" will display the texture in the top of the menu
        -- "both" will display the texture and the text in the top of the menu
        DisplayMode = "text",
        texture = {
            TextureDict = "texture_name", -- if UseTexture is set to true, this is the name of the texture inside the ytd
            TextureFile = "file_name", --the ytd file name
            Width = 30,
            Height = 30,
        },
        text = "The World Is Yours", -- if UseTexture is set to false, this is the text that will be displayed in the top of the menu
    },
    menu = {
        ChangeColor = true, -- Set to true to change the color of the menu
        colors = {
            TextUnselected = { r = 255, g = 215, b = 0, a = 200 }, -- Gold for unselected text and selected menu
            TextSelected = { r = 255, g = 0, b = 0, a = 200 }, -- Red for selected text
            MenuUnselected = { r = 139, g = 0, b = 0, a = 150 }, -- Dark red for unselected menu
            MapBackground = { r = 255, g = 215, b = 0, a = 255 }, -- Gold for map background
            OtherLines = { r = 255, g = 0, b = 0, a = 200 } -- Red for lines and selection bar
        }
    }
}

