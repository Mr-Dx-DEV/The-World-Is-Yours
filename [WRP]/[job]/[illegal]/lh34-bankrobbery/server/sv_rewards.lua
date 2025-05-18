return {
    Trollys = {
        ['money'] = { -- Amount of bags rewarded when a player loots a trolly, minWorth and maxWorth decide the item.info.worth of the markedbills
            fleeca = { minAmount = 3, maxAmount = 5, minWorth = 10000, maxWorth = 14000 },
            maze = { minAmount = 3, maxAmount = 5, minWorth = 10000, maxWorth = 14000 },
            paleto = { minAmount = 5, maxAmount = 7, minWorth = 10000, maxWorth = 14000 },
            pacific = { minAmount = 7, maxAmount = 9, minWorth = 10000, maxWorth = 14000 }
        },
        ['gold'] = { -- Amount of gold bars rewarded when a player loots a gold trolly
            fleeca = { minAmount = 4, maxAmount = 5 },
            maze = { minAmount = 4, maxAmount = 6 },
            paleto = { minAmount = 4, maxAmount = 7 },
            pacific = { minAmount = 4, maxAmount = 7 }
        }
    },

    Lockers = {
        ['fleeca'] = {
            items = {'goldbar', }, -- Every time a player unlocks a locker, a random item from this array will be drawn, you can add more items
            amount = { minAmount = 1, maxAmount = 2 },
            rareChance = 10,
            rareItem = 'usb_blue',
        },
        ['maze'] = {
            items = {'goldbar', },
            amount = { minAmount = 1, maxAmount = 3 },
            rareChance = 15,
            rareItem = 'usb_blue',
        },
        ['paleto'] = {
            items = {'goldbar', },
            amount = { minAmount = 2, maxAmount = 4 },
            rareChance = 10,
            rareItem = 'usb_red',
        },
        ['pacific'] = {
            items = {'goldbar', },
            amount = { minAmount = 3, maxAmount = 5 },
            rareChance = 10,
            rareItem = 'usb_black', -- You could use the vault to drop a rare item used in another heist!
        }
    }
}
