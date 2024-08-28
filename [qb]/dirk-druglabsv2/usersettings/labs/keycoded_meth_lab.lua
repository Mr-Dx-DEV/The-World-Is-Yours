Config.Labs['Keycoded Meth Lab'] = { --## Keycoded to 1234
  Door  = vector4(1261.6147460938,-1616.744140625,54.742881774902,214.38056945801),
  Shell = "Meth Shell", -- Can be false or can be model name of a shell

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
    Price        = 5000, 
    DropPoint    = vector4(1252.2244873047,-1605.4554443359,53.107166290283,314.43713378906), 
    Items = {
      rawcocaine   = 50, 
      bakingsoda   = 50, 
      actionfigure = 25,  
    },
  },

  --[[ Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 499, 
    Color   = 45,
    Display = 4,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },
 ]]
  Stages = {
    [1] = {
      Position      = vector4(-2.2980346679688,-1.635498046875,-0.47295570373535,174.29225158691),
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
      Position      = vector4(6.2822265625,2.942626953125,-0.95849323272705,0.30201748013496),
      Label         = "Package Meth",
      Icon          = "fa-solid fa-box",
      ProgText      = "Packaing Meth",
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