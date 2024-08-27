fx_version 'adamant'
game 'gta5'
lua54 'yes'

description 'Boat Trailer Script'
author 'Theebu https://discord.gg/SvxZj2h'

version '0.3.3'

client_scripts {
	'config.lua',
	'client/client.lua',
	'client/utils.lua'
}

escrow_ignore {
	'config.lua',
	'client/utils.lua',
}
dependency '/assetpacks'