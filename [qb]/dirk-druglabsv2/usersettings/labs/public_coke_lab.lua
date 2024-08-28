Config.Labs['Public Cocaine Lab'] = { --## Public
  Door  = vector4(-773.0400390625,-187.76544189453,37.28369140625,303.32772827148),
  Shell = "Cocaine Shell", -- Can be false or can be model name of a shell

  TeamWorkMode = false, --## If this is true required items will come from the shared stockpile and reward items will also go here
  KeyItem      = nil, --## This could be a name of an item if you wanted a different item to be the key for this lab :thinking: It'll still need metadata attached via the script

  Access = {
    Ownable = false, --## Will make this buyable and have key access -- Probably leave Gangs, Jobs and Public as false. Can be false also
    KeyCode = false, --## Do you want a keycode to access this? -- This will overwrite everything else
    Public  = true, 
    Gangs   = false, --## Gangs can access this lab
    Jobs    = false, --## Gangs can access this lab
  },


  IngOrders = {
    Price        = 5000, 
    DropPoint    = vector4(-775.93023681641,-193.7191619873,37.28369140625,120.91262054443), 
    Items = {
      rawcocaine   = 50, 
      bakingsoda   = 50, 
      actionfigure = 25,  
    },
  },

  Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 497, 
    Color   = 45,
    Display = 4,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },

  Stages = {
    [1] = {
      Position      = vector4(-4.6897039413452,-0.55615234375,-0.95853424072266,359.3857421875),
      Label         = "Cut Cocaine",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Cutting Cocaine",
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
      Position      = vector4(0.51191282272339,-0.4735107421875,-0.95852851867676,1.1724637746811),
      Label         = "Cut Cocaine",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Cutting Cocaine",
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
      Position      = vector4(6.2549304962158,-2.6531982421875,-0.95852851867676,180.15774536133),
      Label         = "Package Cocaine",
      Icon          = "fa-solid fa-box-archive",
      ProgText      = "Packing Cocaine",
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