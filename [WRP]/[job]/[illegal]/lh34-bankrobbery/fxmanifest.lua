fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt'
description 'FiveM Bankrobbery Script for Gabz MLO'
version '2.1'

dependencies {
    'ox_lib',
    'lh34-powerplant',
    'mka-lasers'
}

files {
    'locales/*.json',
    'modules/framework/**/client.lua',
    'modules/target/*.lua',
    'modules/utils/client.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/locales.lua'
}

client_scripts {
    '@mka-lasers/client/client.lua',
    'client/cl_extra.lua',
    'client/cl_main.lua',
    'client/cl_laptops.lua',
    'client/cl_fleeca.lua',
    'client/cl_maze.lua',
    'client/cl_paleto.lua',
    'client/cl_pacific.lua'
}

server_scripts {
    'server/sv_extra.lua',
    'server/sv_main.lua',
    'server/sv_rewards.lua',
    'server/sv_laptops.lua',
    'server/sv_fleeca.lua',
    'server/sv_paleto.lua',
    'server/sv_pacific.lua'
}

escrow_ignore {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/locales.lua',
    'modules/framework/**/*.lua',
    'modules/framework/**/*.lua',
    'modules/target/*.lua',
    'modules/utils/*.lua',
    '[installation]/doorlocks/*.lua',
    'client/cl_main.lua',
    'client/cl_laptops.lua',
    'client/cl_fleeca.lua',
    'client/cl_maze.lua',
    'client/cl_paleto.lua',
    'client/cl_pacific.lua',
    'server/sv_main.lua',
    'server/sv_rewards.lua',
    'server/sv_laptops.lua',
    'server/sv_fleeca.lua',
    'server/sv_paleto.lua',
    'server/sv_pacific.lua'
}

dependency '/assetpacks'