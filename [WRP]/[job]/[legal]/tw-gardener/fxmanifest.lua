fx_version 'cerulean'
game 'gta5'
version '2.2'
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
	'html/sound/*.*',
	'html/img/*.*',
	'html/js/*.js',
}

escrow_ignore {
	'config/*.lua',
	--'client/main.lua',
	'client/utility.lua',
	'server/utility.lua',
	--'server/server.lua',
	'server/editable.lua',
}

lua54 'yes'

dependency '/assetpacks'