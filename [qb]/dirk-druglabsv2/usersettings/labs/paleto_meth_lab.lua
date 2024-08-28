Config.Labs['Paleto Meth Lab'] = { --## KeyCode Example - Code - 1234
  Door  = vector4(-11.633558273315,6279.953125,31.376426696777,290.68182373047),
  Shell = "Meth High End Shell", -- Can be false or can be model name of a shell

  TeamWorkMode = false, --## If this is true required items will come from the shared stockpile and reward items will also go here
  KeyItem      = nil, --## This could be a name of an item if you wanted a different item to be the key for this lab :thinking: It'll still need metadata attached via the script

  Access = {
    Ownable = false, --## Will make this buyable and have key access -- Probably leave Gangs, Jobs and Public as false. Can be false also
    KeyCode = 1234, --## Do you want a keycode to access this? -- This will overwrite everything else
    Public  = false, 
    Gangs   = false, --## Gangs can access this lab
    Jobs    = false, --## Gangs can access this lab
  },


  IngOrders = {
    Price        = 15000, 
    DropPoint    = vector4(-16.90599822998,6276.65234375,31.22873878479,298.28988647461), 
    Items = {
      sodiumbenzoate   = 50, 
      propelyeneglycol   = 50,   
    },
  },

  Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 499, 
    Color   = 45,
    Display = 2,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },

  Stages = {
    [1] = {
      Position      = vector4(-2.1496429443359,-2.3616943359375,-2.2236909866333,186.49963378906),
      Label         = "Cook Meth",
      Icon          = "fa-solid fa-fire-burner",
      ProgText      = "Cooking Meth",
      FancyScene    = "Cook Meth", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        sodiumbenzoate   = 10, 
        propelyeneglycol = 10,   
      },
      RewardItems   = {
        boxmeth = 10, 
      },
    },
    [2] = {
      Position      = vector4(6.41650390625,3.1162109375,-2.673828125,4.8522024154663),
      Label         = "Package Meth",
      Icon          = "fa-solid fa-box",
      ProgText      = "Packaging Meth",
      FancyScene    = "Package Meth", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        boxmeth = 10, 
      },
      RewardItems   = {
        bagmeth = 20,  --## With Current time settings you will get 29 times this in an hour if grinding 
      },
    },
  },
}