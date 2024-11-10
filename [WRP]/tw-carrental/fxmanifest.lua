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
	'html/img/*.*',
	'html/img/vehicleImages/*.*',
	'html/js/*.js',
}

escrow_ignore {
	'config/*.lua',
	'server/editable.lua',
	'server/utility.lua',
	'client/utility.lua',
	'client/*.lua'
}

lua54 'yes'

dependency '/assetpacks'

dependency '/assetpacks'