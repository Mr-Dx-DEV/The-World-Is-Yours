fx_version 'cerulean'
game 'gta5'
this_is_a_map 'yes'
author 'Fiv3Devs'
description 'After Life Services'
version '1.0.1'
lua54 'yes'

shared_scripts {
    'language.lua',
	'config.lua' 
}

client_script {
  'client.lua'
}

server_script 'server.lua'

ui_page 'ui/index.html'

files {
	'5d_after_timecycle_mods.xml',
    'ui/index.html',
    'ui/script.js',
    'ui/style.css',
    'ui/tablet1d.png',
    'ui/tablet2d.png',
	'ui/tablet3d.png',
	'common/handling.meta',
	'common/vehicles.meta',
	'audio/config/fiv3devs_after_game.dat151.rel'
}

escrow_ignore {
  'language.lua',
  'config.lua' 
}

data_file 'TIMECYCLEMOD_FILE' '5d_after_timecycle_mods.xml'
data_file 'HANDLING_FILE' 'common/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'common/vehicles.meta'
data_file 'AUDIO_GAMEDATA' 'audio/config/fiv3devs_after_game.dat'
dependency '/assetpacks'