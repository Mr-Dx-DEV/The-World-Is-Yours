fx_version 'cerulean'
author 'Marttins'
lua54 'yes'
game 'gta5'
description 'Uma merda qualquer'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'esxVehicles.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
 --   '@pmc-instance/instance.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'web/index.html'

files {
    'locales/*.json',
    'web/*.html',
    'web/*.css',
    'web/*.js',
    'web/images/**.png'
}

escrow_ignore {
    'client/editable.lua',
    'client/core.lua',
    'server/core.lua',
    'server/editable.lua',
    'config.lua',
    'esxVehicles.lua',
}

dependency '/assetpacks'