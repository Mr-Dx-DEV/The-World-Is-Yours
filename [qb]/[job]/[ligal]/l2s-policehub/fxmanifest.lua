fx_version 'cerulean'
game 'gta5'
description 'L2S Police Hub Full Created By : @L2S Dev Team || l2s.dev, v2.2'
author 'L2S DEV TEAM '
lua54 'yes'

server_script {
	'@oxmysql/lib/MySQL.lua',
     'server/sv_*.lua',
}
	 
client_script {
     'client/cl_*.lua',
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/*.css',
	'html/js/*.js',
	'html/imgs/*.png',
	'html/imgs/*.jpg',
	'html/audios/*.mp3',
	'html/audios/*.ogg',
	'html/*.ttf',
}

shared_script 'config.lua'

escrow_ignore {
	'client/cl_alerts.lua',  -- Only ignore one file
	'config.lua',  -- Only ignore one file
	'database.json',  -- Only ignore one file
}
dependency '/assetpacks'