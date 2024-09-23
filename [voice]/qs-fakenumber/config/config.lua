Config = {}
Locales = Locales or {}

Config.Framework = 'esx' -- 'esx' or 'qb'

Config.Language = 'en'

Config.NumberPrefix = '553' -- Prefix of the number
Config.NumberDigits = 6     -- Amount of digits after the prefix
Config.MaxSimCards = 5      -- Max sim cards

--[[
    Number change system using Sim card!

    To execute this function, we must use the item
    selected in Config.SimItems, then we can use the
    Config.SimCommand command to switch between phone numbers.
]]

Config.SimCommand = 'mysimcards'
Config.SimItems = 'sim_card'

--[[
    Command system for number change!

    The command to change the phone number is found in Config.ChangeNumberCommand,
    and with Config.ChangeNumberMax we select the number of numbers that we can use.
    We also have a Config.BannedNumbers so they can't choose certain phone numbers.
]]

Config.EnableChangeNumberCommand = false
Config.ChangeNumberCommand = 'changenumber'
Config.ChangeNumberMax = 9
Config.BannedNumbers = {
    '000000000',
    '111111111',
    '222222222'
}
