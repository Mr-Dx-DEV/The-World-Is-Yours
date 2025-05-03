
--- @section Table Actions

--- Actions available for interacting with plants via DUI.
config.tables.actions = {
    { 
        key = "E",
        label = "Access",
        action_type = "server",
        action = "boii_weed:sv:access_table"
    },
    { 
        key = "G",
        label = "Pick Up",
        action_type = "server",
        action = "boii_weed:sv:pick_up_table"
    },
    { 
        key = "Z",
        label = "Destroy",
        action_type = "server",
        action = "boii_weed:sv:destroy_table"
    }
    
}

--- Table prop
config.tables.model = "bkr_prop_weed_table_01a"

--- XP
config.tables.xp_growth_factor = 1.5