fx_version 'cerulean'
game 'gta5'
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'Advanced K9 Script V2 Fivem'
Author 'Evo-Develompent'
version '2.0.0'
lua54 'yes'

data_file "DLC_ITYP_REQUEST" "stream/evok9_doghouse-p-a.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/evo_dog-house.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/evo_dog-portable-2.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/evo_dog-portable.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/evok9_dummy.ytyp"
data_file "PED_METADATA_FILE" "peds.meta"

shared_script {
	'config.lua',
	'client/function.lua',
	'server/function.lua',
	'client/target.lua',
	'locales.lua',
}

client_scripts {
	'client/function.lua',
	'client/target.lua',
	'client/client.lua'
}

server_scripts {
	'server/function.lua',
	'server/server.lua'
}

ui_page('ui/index.html')

files({
    'ui/*',
	'ui/assets/*',
	'ui/assets/icons/*',
	'ui/assets/dogs/*',
	'ui/assets/items/*',
	'stream/*',
	'peds.meta',
	'ui/assets/texture/*'
})

escrow_ignore {
	'server/function.lua',
	'client/function.lua',
	'client/target.lua',
	'locales.lua',
	'config.lua'
  }

server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'