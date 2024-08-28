Config.IngredientsOrders = { --## Make it so there are armed players driving the car and you have to stop it without damaging it
  Timeout          = 15, --## After x minutes the mission will become available again regardless if complete
  TimeBetween      = 1, --## Minutes betweeen orders
  OrderAccount     = "bank", 
  TruckModel       = "rumpo",
  ToInventory      = true,  --## If true then ingredients will go into the players inventory upon completion rather than the labs

  Blip = {
    Scale   = 0.75,
    Sprite  = 51,
    Color   = 1,
    Display = 4,
  },

  Missions    = { --## Locations players will need to go to collect orders

    ['Downtown Vinewood'] = {
      Van = {
        Position = vector4(41.59, 6449.78, 31.42, 227.99),
        Model    = "blista",
        Driver   = "a_m_m_hillbilly_01", --## If there is a driver the van will drive off when attempt of theft is made
      },
      Guards      = {
        {
          Model    = "a_m_m_hillbilly_01",
          Position = vector4(31.25, 6445.05, 31.43, 223.57),
          Accuracy = 60, 
          Weapon   = "WEAPON_PISTOL",
        },
        {
          Model    = "a_m_m_hillbilly_01",
          Position = vector4(43.0, 6457.49, 31.43, 199.26), 
          Accuracy = 60,
          Weapon   = "WEAPON_PISTOL",
        }
      },
    },
    
    ['Downtown Vinewood'] = {
      Van = {
        Position = vector4(41.59, 6449.78, 31.42, 227.99),
        Model    = "blista",
        Driver   = "a_m_m_hillbilly_01", --## If there is a driver the van will drive off when attempt of theft is made
      },
      Guards      = {
        {
          Model    = "a_m_m_hillbilly_01",
          Position = vector4(31.25, 6445.05, 31.43, 223.57),
          Accuracy = 60, 
          Weapon   = "WEAPON_PISTOL",
        },
        {
          Model    = "a_m_m_hillbilly_01",
          Position = vector4(43.0, 6457.49, 31.43, 199.26), 
          Accuracy = 60,
          Weapon   = "WEAPON_PISTOL",
        }
      },
    },

  },
}