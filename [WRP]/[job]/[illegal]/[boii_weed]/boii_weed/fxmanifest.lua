--[[
---------------------------
  ____   ____ _____ _____ 
 |  _ \ / __ \_   _|_   _|
 | |_) | |  | || |   | |  
 |  _ <| |  | || |   | |  
 | |_) | |__| || |_ _| |_ 
 |____/ \____/_____|_____|
                                                    
---------------------------                                              
       Advanced Weed
          V0.0.4              
---------------------------
]]

fx_version "cerulean"
games { "gta5" }

name "boii_weed"
version "0.0.4" -- Some initial release bugs to be expected will move to 1.0.0 soon as have some feedback <3
description "BOII Development - Advanced Weed"
author "boiidevelopment"
lua54 "yes"

ui_page "ui/index.html"
nui_callback_strict_mode "true"

files {
    "ui/**"
}

shared_script "loader.lua"

shared_scripts {
    "locales/*"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",

    "configs/config.lua",
    "configs/plants.lua",
    "configs/strains.lua",
    "configs/items.lua",
    "configs/recipes.lua",
    "configs/tables.lua",
    "configs/consumables.lua",

    "modules/language/server.lua",
    "modules/xp/server.lua",
    "modules/plants/server.lua",
    "modules/tables/server.lua",
    "modules/objects/server.lua",
    "modules/consumables/server.lua"
}

client_scripts {
    "modules/language/client.lua",
    "ui/lua/*",
    "modules/objects/client.lua",
    "modules/plants/client.lua",
    "modules/tables/client.lua",
    "modules/consumables/client.lua",
    "modules/guide/client.lua",
}

escrow_ignore {
    "**"
}

dependencies {
    "oxmysql",
    "boii_utils",
    "boii_drugprops" --- Remove if you dont want to use the included props; they are only base plants without pots nothing fancy.
}
dependency '/assetpacks'