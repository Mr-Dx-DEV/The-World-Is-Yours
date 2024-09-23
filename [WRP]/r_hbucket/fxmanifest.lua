fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'rytrak.fr'
ui_page 'html/index.html'

files {
    'html/*'
}

dependencies {
	'/onesync',
}

escrow_ignore {
	'config.lua',
	'cl_utils.lua'
}

server_scripts {
	'server/server.lua',
	'server/create.lua',
	'server/delete.lua'
}

client_scripts {
	'cl_utils.lua',
	
	'client/client.lua',
	'client/create.lua',
	'client/delete.lua',
	'client/firesystem.lua',
	'client/thread.lua',
	'client/exports.lua',
	'client/water.lua'
}

shared_script 'config.lua'

data_file "DLC_ITYP_REQUEST" "stream/props_hbucket.ytyp"
dependency '/assetpacks'