shared_script "@GM_AntiDump/shared/clientloader.lua"

fx_version 'cerulean'
game 'gta5'

description 'L2S V5 Editied By : @L2S Dev Team || l2s.dev'
author 'L2S DEV TEAM '
version '2.0.0'

ui_page 'html/index.html'

shared_scripts { 
    '@qb-core/shared/locale.lua',
    'locales/en.lua' -- Change this to your preferred language
}

reduce_clientloader {
    --Shared
    'config.lua',
    --Shared

    'client/main.lua'
}

server_script {
     --Shared
     'config.lua',
     --Shared

     'server/main.lua'
} 

files {
	'html/*.html',
	'html/*.js',
	'html/*.css',
	'html/sounds/*.ogg',
}

lua54 'yes'