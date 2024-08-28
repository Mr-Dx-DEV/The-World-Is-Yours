Config.Labs['Paleto Cocaine Lab'] = { --## Tebex Package Example
  Door  = vector4(-212.60719299316,6358.0473632813,31.492290496826,221.96774291992),
  Shell = "Cocaine High End Shell", -- Can be false or can be model name of a shell
  TebexPackage = 'https://www.google.com', --## This will not be useable until claimed. Please read the documentation provided on how to setup tebex packages. --- Access.Ownable must be a number but it doesnt matter which number it is 

  TeamWorkMode = false, --## If this is true required items will come from the shared stockpile and reward items will also go here

  Access = {
    Ownable = 50000, --## Will make this buyable and have key access -- Probably leave Gangs, Jobs and Public as false. Can be false also -- If this is a tebex package please make rthis a random number -- MUST BE A NUMBER VALUE (THIS WILL BE TRHE BUY PRICE)
    KeyCode = false, --## Do you want a keycode to access this? -- This will overwrite everything else except public. 
    Public  = false,  -- If this is true anyone can access this regardless of other settings.
    Gangs   = false, --## Gangs can access this lab
    Jobs    = false, --## Jobs can access this lab
    ItemKey = false, --## If this is an itemname then the player will need a an item to access this lab (NOT THE SAME AS PLAYER OWNED WITH UNIQUE KEYS)
  },


  IngOrders = {
    Price        = 5000, -- How much will it cost to order ingredients?
    DropPoint    = vector4(-215.32147216797,6351.30859375,31.528518676758,319.28759765625), --## This is the point where the van will have to be dropped outside the lab in order to deliver ingredietns
    Items = { -- What will the player get for this ingredients run
      rawcocaine   = 50, 
      bakingsoda   = 50, 
      actionfigure = 25,  
    },
  },

  Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 497, 
    Color   = 45,
    Display = 2,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },

  Stages = {
    [1] = {
      Position      = vector4(4.825562, -3.003174, -2.673802, 179.7306060791), 
      Label         = "Cut Cocaine",
      Icon          = "fa-solid fa-scissors",
      
      FancyScene    = "Cut Cocaine", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        rawcocaine = 3, 
        bakingsoda = 2, 
      },
      RewardItems   = {
        cutcocaine = 2, 
      },
    },
    [2] = {
      Position      = vector4(3.890869, -0.5727539, -2.673793,359.83615112305),
      Label         = "Cut Cocaine",
      Icon          = "fa-solid fa-scissors",
      
      FancyScene    = "Cut Cocaine", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        rawcocaine = 3, 
        bakingsoda = 2, 
      },
      RewardItems   = {
        cutcocaine = 2, 
      },
    },
    [3] = {
      Position      = vector4(4.125854, 3.231079, -2.673817,0.0),
      Label         = "Package Cocaine",
      Icon          = "fa-solid fa-box-archive",
      
      FancyScene    = "Package Cocaine", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        cutcocaine   = 1, 
        actionfigure = 1, 
      },
      RewardItems   = {
        cocainepackage = 1, 
      },
    },
  },
}