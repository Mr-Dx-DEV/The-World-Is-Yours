fx_version 'adamant'
game 'gta5'

ui_page "html/ui.html"
lua54 "yes"
shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua'
}

---------------------------------------------------------------------------
-- INCLUDED FILES
---------------------------------------------------------------------------

files {
    'peds.meta',
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.svg',
    'html/fonts/*.ttf',
    "html/sounds/*.ogg",
}
exports {
    'GetHeadBlendData'
}

---------------------------------------------------------------------------
-- DATA FILES
---------------------------------------------------------------------------

data_file 'PED_METADATA_FILE' 'peds.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/props/horse_items.ytyp'

escrow_ignore{
    'config.lua',
    'README.txt',
    'client/cl_shared.lua'
}
dependency '/assetpacks'