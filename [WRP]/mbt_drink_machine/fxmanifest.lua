fx_version 'cerulean'
lua54        'yes'
game         'gta5'

name 'mbt_drink_machine'
author 'Malibù Tech Team'
version '1.3.0'
description 'mbt_drink_machine'

ui_page "html/index.html"
files {
    "html/*.html",
    "html//*.css",
    "html/*.js",
    "html/assets/*.mp3",
    "html/assets/*.svg",
    "html/assets/*.png"
}

shared_scripts {
    "config.lua",
    "helper.lua"
}

server_scripts {
    "server/*.lua"
}

client_scripts {
    "client/*.lua"
}
escrow_ignore {"config.lua"}

dependency '/assetpacks'