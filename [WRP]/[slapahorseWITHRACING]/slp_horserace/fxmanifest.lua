-- Resource Metadata
fx_version "cerulean"
game "gta5"

lua54 "yes"

ui_page "html/ui.html"

shared_scripts{
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/*.lua',
    'rendertarget.lua'
}

server_scripts {
    'server/*.lua'
}

---------------------------------------------------------------------------
-- INCLUDED FILES
---------------------------------------------------------------------------

files {
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.svg',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    "html/sounds/*.ogg",
}

escrow_ignore{
    'config.lua',
    'README.txt'
}
dependency '/assetpacks'