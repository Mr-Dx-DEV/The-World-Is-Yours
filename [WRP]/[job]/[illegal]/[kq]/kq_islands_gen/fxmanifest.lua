fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Islands generator by KuzQuality'
version '1.0.3'

--
-- Client
--

client_scripts {
    'config.lua',
    'client/classes/island.lua',
    'client/helpers/builderHelper.lua',
    'client/functions.lua',
    'client/main.lua',
    'client/editable/islandElements.lua',
    'client/setup.lua',
}

escrow_ignore {
    'config.lua',
    'client/editable/*.lua',
}

dependencies {
    'kq_islands_props',
}

dependency '/assetpacks'