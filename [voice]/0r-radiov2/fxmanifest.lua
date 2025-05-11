fx_version 'cerulean'
game {'gta5'}
lua54 'yes'

scriptname '0r-radiov2'
version '1.1.1'

client_scripts {'client/*.lua'}
server_scripts {'server/*.lua'}
shared_scripts {'@ox_lib/init.lua', 'shared/*.lua'}
ui_page 'web/build/index.html'
files {'locales/**/*', 'web/**'}

dependency '/assetpacks'
