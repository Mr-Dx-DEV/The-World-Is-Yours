----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'adamant'

game 'gta5'

author 'case#1993'

description 'BOII | Development - Best Buds Job Script'

version '1.0.7'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
    'html/images/**/*.png',
}
shared_scripts {
    'shared/*'
}
client_scripts{
    'client/**/*'
}
server_scripts{
    'server/*'
}
escrow_ignore{
    'client/bestbuds_c.lua',
    'client/menus/*',
    'server/bestbuds_s.lua',
    'shared/*'
}
dependency '/assetpacks'