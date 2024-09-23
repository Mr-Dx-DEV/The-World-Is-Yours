fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Private Ryan @ Elusive Studios'
description 'Car Boosting & VIN Scratching'
version '2.0.0'

server_script {'server/*', '@oxmysql/lib/MySQL.lua'}
client_scripts {'client/*', '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua',}
shared_scripts {'shared/*', '@qb-core/shared/locale.lua', 'locales/en.lua'}

ui_page 'html/index.html'
files {'html/*.html', 'html/js/*.js', 'html/css/*.css', 'html/images/*.png'}

escrow_ignore {
    '*.lua',
    'server/*.lua',
    'client/*.lua',
    'shared/*.lua',
    'locales/*.lua',
}

dependencies { 'qb-core', 'PolyZone', 'ps-ui' }
dependency '/assetpacks'