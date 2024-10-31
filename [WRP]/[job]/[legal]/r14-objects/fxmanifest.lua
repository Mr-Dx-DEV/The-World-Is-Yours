fx_version 'cerulean'
game 'gta5'

description 'R14-OBJECTS HAS BEEN INCORRECTLY INSTALLED, PLEASE INSTALL THE SUBFOLDER'
version '0.0'

escrow_ignore {
  'r14-objects/*.lua', -- ignore all lua
  'r14-objects/client/*.lua', -- ignore all lua
  'r14-objects/server/*.lua', -- ignore all lua
  'r14-objects/stream/*.ytd', -- ignore all lua
  'r14-objects/stream/*.yft', -- ignore all lua
  'sounds/*.oog', -- ignore all sounds
  'inventory/*.png', -- ignore all images
  'optionalresources/*.txt', -- ignore all txt
  'optionalresources/**/*.txt', -- ignore all txt
  'optionalresources/**/*.lua', -- ignore all lua
  'optionalresources/**/**/*.lua', -- ignore all lua
  'optionalresources/**/**/*.lua', -- ignore all lua
  'optionalresources/**/**/*.js', -- ignore all lua
  'optionalresources/**/**/*.html', -- ignore all lua
  'optionalresources/**/**/*.css', -- ignore all lua
  'script/*.lua', -- ignore all lua
  'script/*.txt', -- ignore all txt
}

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'

dependency '/assetpacks'