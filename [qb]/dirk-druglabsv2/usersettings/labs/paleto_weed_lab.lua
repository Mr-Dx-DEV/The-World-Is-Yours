Config.Labs['Paleto Weed Grow'] = { --## Private Owned $25000
  Door  = vector4(-146.28691101074,6303.5537109375,31.558603286743,132.73893737793),
  Shell = "Weed High End Shell", -- Can be false or can be model name of a shell

  TeamWorkMode = false, --## If this is true required items will come from the shared stockpile and reward items will also go here
  KeyItem      = nil, --## This could be a name of an item if you wanted a different item to be the key for this lab :thinking: It'll still need metadata attached via the script

  Access = {
    Ownable = 25000, --## Will make this buyable and have key access -- Probably leave Gangs, Jobs and Public as false. Can be false also
    KeyCode = false, --## Do you want a keycode to access this? -- This will overwrite everything else
    Public  = false, 
    Gangs   = false, --## Gangs can access this lab
    Jobs    = false, --## Gangs can access this lab
  },

--[[   Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 496, 
    Color   = 45,
    Display = 2,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },
 ]]

  Stages = {
    [1] = {
      Position      = vector4(4.3036499023438,3.2998046875,-2.6737945079803,358.98886108398),
      Label         = "Trim Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Trim Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        untrimmed_weed = 5, 
      },
      RewardItems   = {
        trimmed_weed = 5, 
      },
    },

    [2] = {
      Position      = vector4(-4.6531829833984,-2.24658203125,-2.5402765274048,264.90560913086),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },


    [3] = {
      Position      = vector4(-3.8286743164063,1.44482421875,-2.6737940311432,177.63793945313),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
    [4] = {
      Position      = vector4(-1.9292755126953,1.2735595703125,-2.6737957000732,183.86921691895),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
    [5] = {
      Position      = vector4(-0.0038604736328125,1.177001953125,-2.6737945079803,174.0167388916),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
    [6] = {
      Position      = vector4(2.3000183105469,1.1473388671875,-2.673796415329,178.97296142578),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
    [7] = {
      Position      = vector4(4.3461151123047,1.1641845703125,-2.6737947463989,176.18046569824),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
    [8] = {
      Position      = vector4(7.2486419677734,1.0867919921875,-2.6739161014557,131.86152648926),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5,
      },
    },
    [9] = {
      Position      = vector4(7.6144561767578,-2.3123779296875,-2.6738851070404,88.717674255371),
      Label         = "Gather Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Harvesting",
      FancyScene    = "Gather Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        
      },
      RewardItems   = {
        untrimmed_weed = 5, 
      },
    },
  },
}
