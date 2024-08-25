fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Tuna#1565 & aliko. <Discord>'
description 'Chat script v2'
version '2.0'

shared_scripts {
	'Config.lua',
	'Common/**/*'
}
client_scripts {
	'Client/**/*'
}
server_scripts {
	'Server/**/*'
}

ui_page 'UI/index.html'

files {
	'UI/**/*',
}

escrow_ignore {
	'Config.lua',
	'Client/**/*',
	'Server/**/*',
	'UI/**/*',
}

dependency '2na_core'

dependency '/assetpacks'