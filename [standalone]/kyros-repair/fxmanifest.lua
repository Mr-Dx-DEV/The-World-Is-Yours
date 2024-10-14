fx_version 'cerulean'
game 'gta5'
author 'KyrosFiveM'
version '1.0.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'shared.lua'
}

server_scripts {
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'