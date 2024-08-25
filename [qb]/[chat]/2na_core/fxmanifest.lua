fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'tunasayin'
description 'Core script needed for almost all 2na scripts.'

version '0.2.8'

shared_scripts {
	'Common/*.lua',
	'Config.lua'
}

client_scripts {
	'Client/*.lua'
}

server_scripts {
	'Server/*.lua'
}

dependency '/assetpacks'