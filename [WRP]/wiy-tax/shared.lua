Shared = {}

Shared.EconomyTax = {
    ['low'] = 200000,
    ['medium'] = 1,
    ['high'] = 1,    
    ['ultra'] = 1,
    ['extreme'] = 1,
}

Shared.EconomyTaxPercentage = {
    ['low'] = 0.0003, -- 0.3%
    ['medium'] = 0.5,
    ['high'] = 0.6,    
    ['ultra'] = 0.8,
    ['extreme'] = 1,
}

Shared.EconomyTaxInterval = 300 -- in minutes (7 days)

Shared.CarTaxRate = 100 -- $100 per car
Shared.CarTaxInterval = 10080 -- in minutes (7 days)

Shared.HouseTaxRate = 500 -- $500 per house 
Shared.HouseTaxInterval = 10080 -- in minutes (7 days)

-- account where all the taxes will go to
Shared.TaxesAccountEnabled = false
Shared.TaxesAccount = {
    accountType = 'business', -- 'business' or 'player'
    playerCitizenId = 'XX1111', -- player citizenid (only for player account)
    business_name = 'tax', -- 'businessName' (only for business account)
    business_id = 1 -- -- 'businessId' (only for business account)
}

Shared.Lang = {
    player_tax = 'Player tax recieved $%d',
    car_tax = 'Vehicle tax recieved $%d',
    house_tax = 'House tax recieved $%d'
}