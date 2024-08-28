Config = {
  Debug       = false, 
  TargetBased   = true, --\ if false will use my menu system
  --## Lab Generic Settings
  ShellHeight     = 2000.0, --\\ Shells spawn in the sky
  OwnerNeedsKeys  = true, --## Does the owner of a lab need keys or will he always have access?
  PurchaseAccount = "bank", --## Where will lab purchase money come from?
  DefaultKeyItem  = "lab-key",

  ProgressBars  = true, --## Do you want progress bars during stages?

  TebexCommand  = 'drug_lab_purchase', --## drug_lab_purchase {"steamId":"{hexid}", "lab":{packageName}} -- This is what you will use as the command for this package. --## Lock this
  TestBuy       = 'testBuy', --## /testBuy Cocaine Lab --## use this to test if you wished
  RedeemCommand = 'ClaimLab',

  GiveLab       = "GiveLab", --## Use this command to give labs to people by ID if you wished --## /GiveLab playerId Heroin Lab
  RemoveLab     = "RemoveLab", --## Use this command to remove a labs current owner --## /RemoveLab Heroin Lab

  InShellTime = { --## Time will be set when entering a shell and will sync to sever time when 
    Hour    = 12, 
    Min     = 0 
  },

  Police = {
    RaidTool     = "raidtool",
    RaidCooldown = 12, --## For how many hours will this lab be disabled if police raid it?
    Jobs = {
    --jobname = minimumraidgrade
      police = 1, 
    },
  },



  --[[
    Optional Vars for Labs
    TebexPackage = "link to my tebex package", -- This will be a link to your tebex package players will be able to open at the door of any unclaimed tebex labs. 
    TeamworkMode = true,  --## Will prevent players doing processes unless the lab storage has the items. Reward items will also go here.

    IngredientsOrders = { -- Will allow users of the lab to place ingredients orders at the door and do missions to get ingredients
      Price        = 15000, -- Cost of the ingredients run 
      DropPoint    = vector4(-16.90599822998,6276.65234375,31.22873878479,298.28988647461), -- Where outside the labt the ingredients will be dropped too
      Items = { -- Items and amount player will recieve from runs.
        sodiumbenzoate   = 50, 
        propelyeneglycol   = 50,   
      },
    },

    Blip = { --## Delete this blip table from a lab if you don't want a blip
      Scale   = 0.75, 
      Sprite  = 499, 
      Color   = 45,
      Display = 2,
      Close  = true, --## Will only show this on the minimap when you are close to the lab forcing players to drive around and try find it. 
    },
  ]]

  Labs = {}
}

Core, Settings = exports['dirk-core']:getCore()

--## Debug Print Function
dPrint = function(msg)
  if Config.Debug then 
    print(string.format("DIRK-SCRIPTS: %s", msg))
  end
end

