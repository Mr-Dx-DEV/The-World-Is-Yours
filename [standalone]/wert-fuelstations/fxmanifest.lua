fx_version 'bodacious'
game 'gta5'

description 'Wert-fuelstations'
version '1.0.1'

ui_page 'html/ui.html'

files {
    'html/ui.html',
	'html/style.css',
    'html/digital-counter-7.ttf',
	'html/js/*',
    'html/img/*',
}

shared_scripts {
    '@ox_lib/init.lua', -- If use this open code please
    'config.lua',
    'lang.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'editable_client.lua',
    'refinery.lua',
    'client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}

escrow_ignore {
    'lang.lua',
    'config.lua',
    'editable_client.lua',
    'html/img/*',
}

lua54 'yes'


dependency '/assetpacks'