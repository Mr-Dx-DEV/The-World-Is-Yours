fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'Rescue in water with a 25m Throw Bag'
version '1.0.0'
lua54 'yes'

files {
	'pedpersonality.meta',
	'weaponanimations.meta',
	'weaponarchetypes.meta',
	'weapons.meta'
}

client_scripts {
    'cl_throwbag.lua',
}

shared_script '@es_extended/imports.lua'

server_scripts {
	-- "@vrp/lib/utils.lua",
    'sv_throwbag.lua',
}

shared_script 'config.lua'

escrow_ignore {
    'stream/**',
    '*.meta',
    'sv_throwbag.lua',
    'config.lua',
}

data_file 'WEAPONINFO_FILE' 'weapons.meta'
data_file 'WEAPON_METADATA_FILE' 'weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' 'pedpersonality.meta'
dependency '/assetpacks'