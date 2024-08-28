----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'adamant'

game 'gta5'

author 'case#1993'

description 'BOII | Development - Businesses; Billiards Bar'

version '2.0.2'

lua54 'yes'

dependencies {
    'boii-consumables'
}
server_scripts {
    'server/*',
    'escrow/billiardslocked_sv.lua'
}
client_scripts {
    'client/**/*',
    'escrow/billiardslocked_cl.lua'
}
shared_scripts {
    'shared/*'
}
escrow_ignore {
    'server/*',
    'client/**/*',
    'shared/*',
    'stream/*'
}
dependency '/assetpacks'