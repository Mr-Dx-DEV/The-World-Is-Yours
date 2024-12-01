--[[ FX Information ]]--
fx_version   'adamant'
lua54        'yes'
games        {'gta5'}
--[[ Resource Information ]]--
name         'horsestable'
author       'Slapaboom'

shared_scripts{
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', --comment this for esx MySQLAsync users
    'server/*.lua'
}

escrow_ignore{
    'config.lua',
    'README.txt',
    'cl_events',
    'client/cl_shared.lua'
}
dependency '/assetpacks'