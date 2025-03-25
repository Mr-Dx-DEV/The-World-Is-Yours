fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Coca islands pack by KuzQuality'
version '1.0.2'

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island3.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island4.ytyp'

files {
    'stream/*.*'
}

client_scripts {
    'ocean-calmer.lua',
}

escrow_ignore {
    'stream/**.ymap',
    'stream/**.ytd',
    'ocean-calmer.lua',
}

dependency '/assetpacks'