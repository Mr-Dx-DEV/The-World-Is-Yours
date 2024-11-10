fx_version 'cerulean'
game 'gta5'
version '1.2'
author 'tworst-script'
shared_scripts {
	'config/*.lua',
}

client_scripts {
	'client/*.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	-- '@mysql-async/lib/MySQL.lua'
}

ui_page "html/index.html"
files {
	'html/index.html',
	'html/*.css',
	'html/font/*.TTF',
	'html/font/*.*',
	'html/audio/*.*',
	'html/sound/*.*',
	'html/img/*.*',
	'html/js/*.js',
}

escrow_ignore {
	'config/*.lua',
	'client/editable.lua',
	'client/utility.lua',
	--'client/main.lua',
	'server/editable.lua',
	'server/utility.lua',
	--'server/server.lua',
}

lua54 'yes'

dependency '/assetpacks'