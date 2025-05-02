Thank you for choosing my script!
For more scripts, visit: https://a-n.tebex.io/

## INSTALLATION
• [QBCore] Add the following lines to your qbcore/shared/items.lua

	['badge']              = {['name'] = 'badge',                 ['label'] = 'PD Badge',                 ['weight'] = 500,         ['type'] = 'item',         ['image'] = 'badge.png',         ['unique'] = true,         ['useable'] = true,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'Police Officer Badge'},
	['sdbadge']              = {['name'] = 'sdbadge',                 ['label'] = 'BCSO Badge',                 ['weight'] = 500,         ['type'] = 'item',         ['image'] = 'sdbadge.png',         ['unique'] = true,         ['useable'] = true,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'Deputy Badge'},

• [QBOX] Add the following lines to your ox_inventory/data/items.lua

    ['badge'] = {
        label = 'PD Badge',
        weight = 100,
        stack = false,
        buttons = {
            {
                label = 'Change Avatar',
                action = function(slot)
                    TriggerEvent("an_badges:updateAvatar", "badge", slot)
                end
            },
        },
    },
    ['sdbadge'] = {
        label = 'BCSO Badge',
        weight = 100,
        stack = false,
        buttons = {
            {
                label = 'Change Avatar',
                action = function(slot)
                    TriggerEvent("an_badges:updateAvatar", "sdbadge", slot)
                end
            },
        },
    },


## REQUIREMENTS
• QBCore
• an_dialogBox ( download link: https://github.com/aymannajim/an_dialogBox )

## HOW TO ADD MORE BADGES:
• Follow the same structure on config.lua ( Use the LSPD or BCSO example )
• Create a new design with the source.psd provided in the designs folder
• Fill in the template accordingly, example:

    { -- Ambulance Badge Example
        itemName = "emsbadge", -- you need to add this item on your qbcore/shared/items.lua
        design = "ems.png",
        job = "ambulance",
        number = "EMS",
    },

## SUPPORT
• If you need help, join my discord: https://discord.gg/KxdPzC5EeJ

For more scripts, visit: https://a-n.tebex.io/