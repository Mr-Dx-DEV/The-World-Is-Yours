-- Copyright (C) 2024 Constant Development

fx_version 'cerulean'
game 'gta5'

author 'xoraphox | Constant Development'
description 'Document Forgery System'
version '1.2.1'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/en.lua'
}

client_scripts {
    'client/**.lua',
}

server_scripts {
    'server/**.lua',
}

escrow_ignore {
    'client/cl_framework.lua',
    'server/sv_framework.lua',
    'locales/**.lua',
    'config.lua',
    'README.md',
    'fxmanifest.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/idscanner_details.ytyp'

lua54 'yes'
dependency '/assetpacks'