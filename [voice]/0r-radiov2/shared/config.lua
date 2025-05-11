Config = {
    VoiceSystem = "pma-voice", -- Voice system selection: "pma-voice" or "saltychat".
    UseCustomNotify = false,   -- Use a custom notification system (true) or the default one (false).
    RadioItem = "radio",       -- Radio item name
    RadioToggleKey = "",
    AllowMovement = true,      -- By activating this, you enable the player to move while the menu is open.
    RestrictedChannels = {     -- Restricted channels for jobs.
        [1] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [2] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [3] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [4] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [5] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [6] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [7] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [8] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [9] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true },
        [10] = { lspd = true, bcso = true, sahp = true, lsso = true, safw = true, sadoc = true, usms = true, fbi = true, dhs = true, ss = true, police = true, salsa = true, ambulance = true }
    },

    JammerSettings = {                           -- Jammer settings to interfere with communication.
        available = true,                        -- Jammers are available in the game.
        item_name = 'radioscanner',              -- Name of the jammer item used by players.
        enable_jobs = false,
        restricted_jobs = { police = true },     -- Only certain jobs can use jammers.
        object = "ch_prop_ch_mobile_jammer_01x", -- Object representing the jammer in the game world.
        min_distance_between_jammers = 15,       -- Minimum distance allowed between two jammers.
        range = 10.0,                            -- Effective range of the jammers.
    },
    MaxFrequency = 500,                          -- Maximum frequency value allowed in the game's radio communication system.
    Locale = 'en',
    -- ! PMA Voice Configs
    -- Radio communication effects and animation settings.
    RadioEffect = true,    -- Enable radio submix (voice sounds like on real radio).
    RadioAnimation = true, -- Enable animation while talking on the radio.
    RadioKey = 'CAPS',     -- Default keybind for talking on the radio (CAPS).
    RadioThemes = {
        [1] = { job = "police", theme = "theme2" },
        [2] = { job = "sheriff", theme = "theme3" },
        [3] = { job = "lspd", theme = "theme2" },
        [4] = { job = "bcso", theme = "theme2" },
        [5] = { job = "sahp", theme = "theme2" },
        [6] = { job = "lsso", theme = "theme2" },
        [7] = { job = "safw", theme = "theme2" },
        [8] = { job = "sadoc", theme = "theme2" },
        [9] = { job = "usms", theme = "theme2" },
        [10] = { job = "fbi", theme = "theme2" },
        [11] = { job = "dhs", theme = "theme2" },
        [12] = { job = "ss", theme = "theme2" },
        [13] = { job = "salsa", theme = "theme2" }
    },

    CheckIsDead = function()
        local pData = GetPlayerData()
        return gPlayer.isDead or pData.metadata.isdead or pData.metadata.inlaststand
    end
}
