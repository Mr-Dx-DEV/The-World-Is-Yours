Config.Labs['Public Weed Grow'] = { -- ## Public
  Door  = vector4(154.16979980469,-1548.412109375,29.143009185791,231.43171691895),
  Shell = "Weed Shell", -- Can be false or can be model name of a shell

  TeamWorkMode = false, --## If this is true required items will come from the shared stockpile and reward items will also go here
  KeyItem      = nil, --## This could be a name of an item if you wanted a different item to be the key for this lab :thinking: It'll still need metadata attached via the script

  Access = {
    Ownable = false, --## Will make this buyable and have key access -- Probably leave Gangs, Jobs and Public as false. Can be false also
    KeyCode = false, --## Do you want a keycode to access this? -- This will overwrite everything else
    Public  = true, 
    Gangs   = false, --## Gangs can access this lab
    Jobs    = false, --## Gangs can access this lab
  },

  Blip = { --## Delete this blip table if you don't want a blip
    Scale   = 0.75, 
    Sprite  = 496, 
    Color   = 45,
    Display = 4,
    Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
  },

  Stages = {
    [1] = {
      Position      = vector4(6.3436584472656,-9.7176513671875,-2.0926952362061,268.46987915039),
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
      Position      = vector4(7.5216064453125,-3.8681640625,-2.0929279327393,267.34216308594),
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
      Position      = vector4(7.4476623535156,-5.4110107421875,-2.0929279327393,268.05358886719),
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
      Position      = vector4(7.428955078125,-7.0372314453125,-2.0928840637207,263.57763671875),
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
      Position      = vector4(6.3436584472656,-9.7176513671875,-2.0926952362061,268.46987915039),
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
      Position      = vector4(11.679122924805,-7.263427734375,-2.092866897583,82.601036071777),
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

    [7] = {
      Position      = vector4(11.789215087891,-5.7425537109375,-2.0929298400879,85.139038085938),
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
      Position      = vector4(11.895095825195,-4.1693115234375,-2.0929298400879,86.093078613281),
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
      Position      = vector4(11.244354248047,-1.6134033203125,-2.0929298400879,176.37371826172),
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
    [10] = {
      Position      = vector4(8.4410552978516,-1.3575439453125,-2.0929298400879,177.27713012695),
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
    [11] = {
      Position      = vector4(-14.352951049805,-9.8824462890625,-1.1094284057617,0.74314200878143),
      Label         = "Trim Weed",
      Icon          = "fa-solid fa-scissors",
      ProgText      = "Trimming Weed",
      FancyScene    = "Trim Weed", --# This can be one of the scenes from Config.Scenes or it can be false and you can use a regular animation
      NormalAnim    = false, --## Can be false or can be a table like so {anim = "anim_b", dict = "dict_a", time = 15000}
      RequiredItems = {
        untrimmed_weed = 5, 
      },
      RewardItems   = {
        trimmed_weed = 4, 
      },
    },
  },
}