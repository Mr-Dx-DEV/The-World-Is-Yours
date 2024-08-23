Config = {}

--- Door identifiers with corresponding positions
Config.doorIDs = {
    ['DoorLabel'] = vector3(1130.67, -988.99, 46.11),
    ['DoorLabel2'] = vector3(1141.69, -986.8, 46.11)
}

--- Set useItem to true if you want players to use an item to open the door. With the removeItem to remove it after usage.
Config.useItem = false
Config.removeItem = false

--- Following the same template you can place as many as you want.
Config.washingmachines = {
    [1] = {
        coords = vector3(1135.63, -992.24, 46.11),
        inUse = false,
        worth = 0
    },
    [2] = {
        coords = vector3(1135.35, -990.98, 46.11),
        inUse = false,
        worth = 0
    },
    [3] = {
        coords = vector3(1135.20, -989.55, 46.11),
        inUse = false,
        worth = 0
    },
    [4] = {
        coords = vector3(1135.00, -988.2, 46.11),
        inUse = false,
        worth = 0
    }
}

Config.timer = 300000 -- milliseconds
Config.percentage = { -- % that gets lost when laundering
    min = 5,
    max = 20
}
