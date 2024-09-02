QBShared = QBShared or {}
QBShared.Items = {
    -- WEAPONS
    -- Melee
    weapon_unarmed               = { name = 'weapon_unarmed', label = 'Fists', weight = 1000, type = 'weapon', ammotype = nil, image = 'placeholder.png', unique = true, useable = false, description = 'Fisticuffs' },
    weapon_dagger                = { name = 'weapon_dagger', label = 'Dagger', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_dagger.png', unique = true, useable = false, description = 'A short knife with a pointed and edged blade, used as a weapon' },
    weapon_bat                   = { name = 'weapon_bat', label = 'Bat', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bat.png', unique = true, useable = false, description = 'Used for hitting a ball in sports (or other things)' },
    weapon_bottle                = { name = 'weapon_bottle', label = 'Broken Bottle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bottle.png', unique = true, useable = false, description = 'A broken bottle' },
    weapon_crowbar               = { name = 'weapon_crowbar', label = 'Crowbar', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_crowbar.png', unique = true, useable = false, description = 'An iron bar with a flattened end, used as a lever' },
    weapon_flashlight            = { name = 'weapon_flashlight', label = 'Flashlight', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_flashlight.png', unique = true, useable = false, description = 'A battery-operated portable light' },
    weapon_golfclub              = { name = 'weapon_golfclub', label = 'Golfclub', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_golfclub.png', unique = true, useable = false, description = 'A club used to hit the ball in golf' },
    weapon_hammer                = { name = 'weapon_hammer', label = 'Hammer', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hammer.png', unique = true, useable = false, description = 'Used for jobs such as breaking things (legs) and driving in nails' },
    weapon_hatchet               = { name = 'weapon_hatchet', label = 'Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_hatchet.png', unique = true, useable = false, description = 'A small axe with a short handle for use in one hand' },
    weapon_knuckle               = { name = 'weapon_knuckle', label = 'Knuckle', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knuckle.png', unique = true, useable = false, description = 'A metal guard worn over the knuckles in fighting, especially to increase the effect of the blows' },
    weapon_knife                 = { name = 'weapon_knife', label = 'Knife', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_knife.png', unique = true, useable = false, description = 'An instrument composed of a blade fixed into a handle, used for cutting or as a weapon' },
    weapon_machete               = { name = 'weapon_machete', label = 'Machete', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_machete.png', unique = true, useable = false, description = 'A broad, heavy knife used as a weapon' },
    weapon_switchblade           = { name = 'weapon_switchblade', label = 'Switchblade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_switchblade.png', unique = true, useable = false, description = 'A knife with a blade that springs out from the handle when a button is pressed' },
    weapon_nightstick            = { name = 'weapon_nightstick', label = 'Nightstick', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_nightstick.png', unique = true, useable = false, description = 'A police officer\'s club or billy' },
    weapon_wrench                = { name = 'weapon_wrench', label = 'Wrench', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_wrench.png', unique = true, useable = false, description = 'A tool used for gripping and turning nuts, bolts, pipes, etc' },
    weapon_battleaxe             = { name = 'weapon_battleaxe', label = 'Battle Axe', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_battleaxe.png', unique = true, useable = false, description = 'A large broad-bladed axe used in ancient warfare' },
    weapon_poolcue               = { name = 'weapon_poolcue', label = 'Poolcue', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_poolcue.png', unique = true, useable = false, description = 'A stick used to strike a ball, usually the cue ball (or other things)' },
    weapon_briefcase             = { name = 'weapon_briefcase', label = 'Briefcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase.png', unique = true, useable = false, description = 'A briefcase for storing important documents' },
    weapon_briefcase_02          = { name = 'weapon_briefcase_02', label = 'Suitcase', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_briefcase2.png', unique = true, useable = false, description = 'Wonderfull for nice vacation to Liberty City' },
    weapon_garbagebag            = { name = 'weapon_garbagebag', label = 'Garbage Bag', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_garbagebag.png', unique = true, useable = false, description = 'A garbage bag' },
    weapon_handcuffs             = { name = 'weapon_handcuffs', label = 'Handcuffs', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_handcuffs.png', unique = true, useable = false, description = 'A pair of lockable linked metal rings for securing a prisoner\'s wrists' },
    weapon_bread                 = { name = 'weapon_bread', label = 'Baquette', weight = 1000, type = 'weapon', ammotype = nil, image = 'baquette.png', unique = true, useable = false, description = 'Bread...?' },
    weapon_stone_hatchet         = { name = 'weapon_stone_hatchet', label = 'Stone Hatchet', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stone_hatchet.png', unique = true, useable = true, description = 'Stone Hatchet' },
    weapon_candycane             = { name = 'weapon_candycane', label = 'Candy Cane', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_candycane', unique = true, useable = true, description = 'Candy Cane' },

    -- Handguns
    weapon_pistol                = { name = 'weapon_pistol', label = 'Walther P99', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand' },
    weapon_pistol_mk2            = { name = 'weapon_pistol_mk2', label = 'Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol_mk2.png', unique = true, useable = false, description = 'An upgraded small firearm designed to be held in one hand' },
    weapon_combatpistol          = { name = 'weapon_combatpistol', label = 'Combat Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_combatpistol.png', unique = true, useable = false, description = 'A combat version small firearm designed to be held in one hand' },
    weapon_appistol              = { name = 'weapon_appistol', label = 'AP Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_appistol.png', unique = true, useable = false, description = 'A small firearm designed to be held in one hand that is automatic' },
    weapon_stungun               = { name = 'weapon_stungun', label = 'Taser', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stungun.png', unique = true, useable = false, description = 'A weapon firing barbs attached by wires to batteries, causing temporary paralysis' },
    weapon_pistol50              = { name = 'weapon_pistol50', label = 'Pistol .50', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistol50.png', unique = true, useable = false, description = 'A .50 caliber firearm designed to be held with both hands' },
    weapon_snspistol             = { name = 'weapon_snspistol', label = 'SNS Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol.png', unique = true, useable = false, description = 'A very small firearm designed to be easily concealed' },
    weapon_heavypistol           = { name = 'weapon_heavypistol', label = 'Heavy Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_heavypistol.png', unique = true, useable = false, description = 'A hefty firearm designed to be held in one hand (or attempted)' },
    weapon_vintagepistol         = { name = 'weapon_vintagepistol', label = 'Vintage Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_vintagepistol.png', unique = true, useable = false, description = 'An antique firearm designed to be held in one hand' },
    weapon_flaregun              = { name = 'weapon_flaregun', label = 'Flare Gun', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flaregun.png', unique = true, useable = false, description = 'A handgun for firing signal rockets' },
    weapon_marksmanpistol        = { name = 'weapon_marksmanpistol', label = 'Marksman Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_marksmanpistol.png', unique = true, useable = false, description = 'A very accurate small firearm designed to be held in one hand' },
    weapon_revolver              = { name = 'weapon_revolver', label = 'Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver.png', unique = true, useable = false, description = 'A pistol with revolving chambers enabling several shots to be fired without reloading' },
    weapon_revolver_mk2          = { name = 'weapon_revolver_mk2', label = 'Violence', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_revolver_mk2.png', unique = true, useable = true, description = 'da Violence' },
    weapon_doubleaction          = { name = 'weapon_doubleaction', label = 'Double Action Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_doubleaction.png', unique = true, useable = true, description = 'Double Action Revolver' },
    weapon_snspistol_mk2         = { name = 'weapon_snspistol_mk2', label = 'SNS Pistol Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_snspistol_mk2.png', unique = true, useable = true, description = 'SNS Pistol MK2' },
    weapon_raypistol             = { name = 'weapon_raypistol', label = 'Up-n-Atomizer', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_raypistol.png', unique = true, useable = true, description = 'Weapon Raypistol' },
    weapon_ceramicpistol         = { name = 'weapon_ceramicpistol', label = 'Ceramic Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_ceramicpistol.png', unique = true, useable = true, description = 'Weapon Ceramicpistol' },
    weapon_navyrevolver          = { name = 'weapon_navyrevolver', label = 'Navy Revolver', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_navyrevolver.png', unique = true, useable = true, description = 'Weapon Navyrevolver' },
    weapon_gadgetpistol          = { name = 'weapon_gadgetpistol', label = 'Perico Pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_gadgetpistol.png', unique = true, useable = true, description = 'Weapon Gadgetpistol' },
    weapon_pistolxm3             = { name = 'weapon_pistolxm3', label = 'Pistol XM3', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_pistolxm3.png', unique = true, useable = true, description = 'Pistol XM3' },

    -- Submachine Guns
    weapon_microsmg              = { name = 'weapon_microsmg', label = 'Micro SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_microsmg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                            weight machine gun' },
    weapon_smg                   = { name = 'weapon_smg', label = 'SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg.png', unique = true, useable = false, description = 'A handheld light                                                                                                                                                                                                                                                                                                                                                                 weight machine gun' },
    weapon_smg_mk2               = { name = 'weapon_smg_mk2', label = 'SMG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_smg_mk2.png', unique = true, useable = true, description = 'SMG MK2' },
    weapon_assaultsmg            = { name = 'weapon_assaultsmg', label = 'Assault SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_assaultsmg.png', unique = true, useable = false, description = 'An assault version of a handheld light                                                                                                                                                                                                                                                                                                                                    weight machine gun' },
    weapon_combatpdw             = { name = 'weapon_combatpdw', label = 'Combat PDW', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_combatpdw.png', unique = true, useable = false, description = 'A combat version of a handheld light                                                                                                                                                                                                                                                                                                                                       weight machine gun' },
    weapon_machinepistol         = { name = 'weapon_machinepistol', label = 'Tec-9', weight = 1000, type = 'weapon', ammotype = 'AMMO_PISTOL', image = 'weapon_machinepistol.png', unique = true, useable = false, description = 'A self-loading pistol capable of burst or fully automatic fire' },
    weapon_minismg               = { name = 'weapon_minismg', label = 'Mini SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_minismg.png', unique = true, useable = false, description = 'A mini handheld light                                                                                                                                                                                                                                                                                                                                                        weight machine gun' },
    weapon_raycarbine            = { name = 'weapon_raycarbine', label = 'Unholy Hellbringer', weight = 1000, type = 'weapon', ammotype = 'AMMO_SMG', image = 'weapon_raycarbine.png', unique = true, useable = true, description = 'Weapon Raycarbine' },

    -- Shotguns
    weapon_pumpshotgun           = { name = 'weapon_pumpshotgun', label = 'Pump Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun.png', unique = true, useable = false, description = 'A pump-action smoothbore gun for firing small shot at short range' },
    weapon_sawnoffshotgun        = { name = 'weapon_sawnoffshotgun', label = 'Sawn-off Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_sawnoffshotgun.png', unique = true, useable = false, description = 'A sawn-off smoothbore gun for firing small shot at short range' },
    weapon_assaultshotgun        = { name = 'weapon_assaultshotgun', label = 'Assault Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_assaultshotgun.png', unique = true, useable = false, description = 'An assault version of asmoothbore gun for firing small shot at short range' },
    weapon_bullpupshotgun        = { name = 'weapon_bullpupshotgun', label = 'Bullpup Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_bullpupshotgun.png', unique = true, useable = false, description = 'A compact smoothbore gun for firing small shot at short range' },
    weapon_musket                = { name = 'weapon_musket', label = 'Musket', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_musket.png', unique = true, useable = false, description = 'An infantryman\'s light gun with a long barrel, typically smooth-bored, muzzleloading, and fired from the shoulder' },
    weapon_heavyshotgun          = { name = 'weapon_heavyshotgun', label = 'Heavy Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_heavyshotgun.png', unique = true, useable = false, description = 'A large smoothbore gun for firing small shot at short range' },
    weapon_dbshotgun             = { name = 'weapon_dbshotgun', label = 'Double-barrel Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_dbshotgun.png', unique = true, useable = false, description = 'A shotgun with two parallel barrels, allowing two single shots to be fired in quick succession' },
    weapon_autoshotgun           = { name = 'weapon_autoshotgun', label = 'Auto Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_autoshotgun.png', unique = true, useable = false, description = 'A shotgun capable of rapid continous fire' },
    weapon_pumpshotgun_mk2       = { name = 'weapon_pumpshotgun_mk2', label = 'Pumpshotgun Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_pumpshotgun_mk2.png', unique = true, useable = true, description = 'Pumpshotgun MK2' },
    weapon_combatshotgun         = { name = 'weapon_combatshotgun', label = 'Combat Shotgun', weight = 1000, type = 'weapon', ammotype = 'AMMO_SHOTGUN', image = 'weapon_combatshotgun.png', unique = true, useable = true, description = 'Weapon Combatshotgun' },

    -- Assault Rifles
    weapon_assaultrifle          = { name = 'weapon_assaultrifle', label = 'Assault Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle.png', unique = true, useable = false, description = 'A rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_assaultrifle_mk2      = { name = 'weapon_assaultrifle_mk2', label = 'Assault Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_assaultrifle_mk2.png', unique = true, useable = true, description = 'Assault Rifle MK2' },
    weapon_carbinerifle          = { name = 'weapon_carbinerifle', label = 'Carbine Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle.png', unique = true, useable = false, description = 'A light                                                                                                                                                                                                                                                                                                                                                               weight automatic rifle' },
    weapon_carbinerifle_mk2      = { name = 'weapon_carbinerifle_mk2', label = 'Carbine Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_carbinerifle_mk2.png', unique = true, useable = true, description = 'Carbine Rifle MK2' },
    weapon_advancedrifle         = { name = 'weapon_advancedrifle', label = 'Advanced Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_advancedrifle.png', unique = true, useable = false, description = 'An assault version of a rapid-fire, magazine-fed automatic rifle designed for infantry use' },
    weapon_specialcarbine        = { name = 'weapon_specialcarbine', label = 'Special Carbine', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine.png', unique = true, useable = false, description = 'An extremely versatile assault rifle for any combat situation' },
    weapon_bullpuprifle          = { name = 'weapon_bullpuprifle', label = 'Bullpup Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle.png', unique = true, useable = false, description = 'A compact automatic assault rifle' },
    weapon_compactrifle          = { name = 'weapon_compactrifle', label = 'Compact Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_compactrifle.png', unique = true, useable = false, description = 'A compact version of an assault rifle' },
    weapon_specialcarbine_mk2    = { name = 'weapon_specialcarbine_mk2', label = 'Special Carbine Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_specialcarbine_mk2.png', unique = true, useable = true, description = 'Weapon Wpecialcarbine MK2' },
    weapon_bullpuprifle_mk2      = { name = 'weapon_bullpuprifle_mk2', label = 'Bullpup Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_bullpuprifle_mk2.png', unique = true, useable = true, description = 'Bull Puprifle MK2' },
    weapon_militaryrifle         = { name = 'weapon_militaryrifle', label = 'Military Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_RIFLE', image = 'weapon_militaryrifle.png', unique = true, useable = true, description = 'Weapon Militaryrifle' },

    -- Light Machine Guns
    weapon_mg                    = { name = 'weapon_mg', label = 'Machinegun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_mg.png', unique = true, useable = false, description = 'An automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_combatmg              = { name = 'weapon_combatmg', label = 'Combat MG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg.png', unique = true, useable = false, description = 'A combat version of an automatic gun that fires bullets in rapid succession for as long as the trigger is pressed' },
    weapon_gusenberg             = { name = 'weapon_gusenberg', label = 'Thompson SMG', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_gusenberg.png', unique = true, useable = false, description = 'An automatic rifle commonly referred to as a tommy gun' },
    weapon_combatmg_mk2          = { name = 'weapon_combatmg_mk2', label = 'Combat MG Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_MG', image = 'weapon_combatmg_mk2.png', unique = true, useable = true, description = 'Weapon Combatmg MK2' },

    -- Sniper Rifles
    weapon_sniperrifle           = { name = 'weapon_sniperrifle', label = 'Sniper Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_sniperrifle.png', unique = true, useable = false, description = 'A high-precision, long-range rifle' },
    weapon_heavysniper           = { name = 'weapon_heavysniper', label = 'Heavy Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper.png', unique = true, useable = false, description = 'An upgraded high-precision, long-range rifle' },
    weapon_marksmanrifle         = { name = 'weapon_marksmanrifle', label = 'Marksman Rifle', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle.png', unique = true, useable = false, description = 'A very accurate single-fire rifle' },
    weapon_remotesniper          = { name = 'weapon_remotesniper', label = 'Remote Sniper', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER_REMOTE', image = 'weapon_remotesniper.png', unique = true, useable = false, description = 'A portable high-precision, long-range rifle' },
    weapon_heavysniper_mk2       = { name = 'weapon_heavysniper_mk2', label = 'Heavy Sniper Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_heavysniper_mk2.png', unique = true, useable = true, description = 'Weapon Heavysniper MK2' },
    weapon_marksmanrifle_mk2     = { name = 'weapon_marksmanrifle_mk2', label = 'Marksman Rifle Mk II', weight = 1000, type = 'weapon', ammotype = 'AMMO_SNIPER', image = 'weapon_marksmanrifle_mk2.png', unique = true, useable = true, description = 'Weapon Marksmanrifle MK2' },

    -- Heavy Weapons
    weapon_rpg                   = { name = 'weapon_rpg', label = 'RPG', weight = 1000, type = 'weapon', ammotype = 'AMMO_RPG', image = 'weapon_rpg.png', unique = true, useable = false, description = 'A rocket-propelled grenade launcher' },
    weapon_grenadelauncher       = { name = 'weapon_grenadelauncher', label = 'Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_grenadelauncher.png', unique = true, useable = false, description = 'A weapon that fires a specially-designed large-caliber projectile, often with an explosive, smoke or gas warhead' },
    weapon_grenadelauncher_smoke = { name = 'weapon_grenadelauncher_smoke', label = 'Smoke Grenade Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_GRENADELAUNCHER', image = 'weapon_smokegrenade.png', unique = true, useable = false, description = 'A bomb that produces a lot of smoke when it explodes' },
    weapon_minigun               = { name = 'weapon_minigun', label = 'Minigun', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_minigun.png', unique = true, useable = false, description = 'A portable machine gun consisting of a rotating cluster of six barrels and capable of variable rates of fire of up to 6,000 rounds per minute' },
    weapon_firework              = { name = 'weapon_firework', label = 'Firework Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_firework.png', unique = true, useable = false, description = 'A device containing gunpowder and other combustible chemicals that causes a spectacular explosion when ignited' },
    weapon_railgun               = { name = 'weapon_railgun', label = 'Railgun', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgun.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_railgunxm3            = { name = 'weapon_railgunxm3', label = 'Railgun XM3', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_railgunxm3.png', unique = true, useable = false, description = 'A weapon that uses electromagnetic force to launch high velocity projectiles' },
    weapon_hominglauncher        = { name = 'weapon_hominglauncher', label = 'Homing Launcher', weight = 1000, type = 'weapon', ammotype = 'AMMO_STINGER', image = 'weapon_hominglauncher.png', unique = true, useable = false, description = 'A weapon fitted with an electronic device that enables it to find and hit a target' },
    weapon_compactlauncher       = { name = 'weapon_compactlauncher', label = 'Compact Launcher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_compactlauncher.png', unique = true, useable = false, description = 'A compact grenade launcher' },
    weapon_rayminigun            = { name = 'weapon_rayminigun', label = 'Widowmaker', weight = 1000, type = 'weapon', ammotype = 'AMMO_MINIGUN', image = 'weapon_rayminigun.png', unique = true, useable = true, description = 'Weapon Rayminigun' },

    -- Throwables
    weapon_grenade               = { name = 'weapon_grenade', label = 'Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_grenade.png', unique = true, useable = false, description = 'A handheld throwable bomb' },
    weapon_bzgas                 = { name = 'weapon_bzgas', label = 'BZ Gas', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_bzgas.png', unique = true, useable = false, description = 'A cannister of gas that causes extreme pain' },
    weapon_molotov               = { name = 'weapon_molotov', label = 'Molotov', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_molotov.png', unique = true, useable = false, description = 'A crude bomb made of a bottle filled with a flammable liquid and fitted with a wick for lighting' },
    weapon_stickybomb            = { name = 'weapon_stickybomb', label = 'C4', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_stickybomb.png', unique = true, useable = false, description = 'An explosive charge covered with an adhesive that when thrown against an object sticks until it explodes' },
    weapon_proxmine              = { name = 'weapon_proxmine', label = 'Proxmine Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_proximitymine.png', unique = true, useable = false, description = 'A bomb placed on the ground that detonates when going within its proximity' },
    weapon_snowball              = { name = 'weapon_snowball', label = 'Snowball', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_snowball.png', unique = true, useable = false, description = 'A ball of packed snow, especially one made for throwing at other people for fun' },
    weapon_pipebomb              = { name = 'weapon_pipebomb', label = 'Pipe Bomb', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_pipebomb.png', unique = true, useable = false, description = 'A homemade bomb, the components of which are contained in a pipe' },
    weapon_ball                  = { name = 'weapon_ball', label = 'Ball', weight = 1000, type = 'weapon', ammotype = 'AMMO_BALL', image = 'weapon_ball.png', unique = true, useable = false, description = 'A solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a game' },
    weapon_smokegrenade          = { name = 'weapon_smokegrenade', label = 'Smoke Grenade', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_c4.png', unique = true, useable = false, description = 'An explosive charge that can be remotely detonated' },
    weapon_flare                 = { name = 'weapon_flare', label = 'Flare pistol', weight = 1000, type = 'weapon', ammotype = 'AMMO_FLARE', image = 'weapon_flare.png', unique = true, useable = false, description = 'A small pyrotechnic devices used for illumination and signalling' },

    -- Miscellaneous
    weapon_petrolcan             = { name = 'weapon_petrolcan', label = 'Petrol Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_petrolcan.png', unique = true, useable = false, description = 'A robust liquid container made from pressed steel' },
    weapon_fireextinguisher      = { name = 'weapon_fireextinguisher', label = 'Fire Extinguisher', weight = 1000, type = 'weapon', ammotype = nil, image = 'weapon_fireextinguisher.png', unique = true, useable = false, description = 'A portable device that discharges a jet of water, foam, gas, or other material to extinguish a fire' },
    weapon_hazardcan             = { name = 'weapon_hazardcan', label = 'Hazardous Jerry Can', weight = 1000, type = 'weapon', ammotype = 'AMMO_PETROLCAN', image = 'weapon_hazardcan.png', unique = true, useable = true, description = 'Weapon Hazardcan' },

    -- Weapon Attachments
    clip_attachment              = { name = 'clip_attachment', label = 'Clip', weight = 1000, type = 'item', image = 'clip_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A clip for a weapon' },
    drum_attachment              = { name = 'drum_attachment', label = 'Drum', weight = 1000, type = 'item', image = 'drum_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A drum for a weapon' },
    flashlight_attachment        = { name = 'flashlight_attachment', label = 'Flashlight', weight = 1000, type = 'item', image = 'flashlight_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A flashlight for a weapon' },
    suppressor_attachment        = { name = 'suppressor_attachment', label = 'Suppressor', weight = 1000, type = 'item', image = 'suppressor_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A suppressor for a weapon' },
    smallscope_attachment        = { name = 'smallscope_attachment', label = 'Small Scope', weight = 1000, type = 'item', image = 'smallscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A small scope for a weapon' },
    medscope_attachment          = { name = 'medscope_attachment', label = 'Medium Scope', weight = 1000, type = 'item', image = 'medscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A medium scope for a weapon' },
    largescope_attachment        = { name = 'largescope_attachment', label = 'Large Scope', weight = 1000, type = 'item', image = 'largescope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A large scope for a weapon' },
    holoscope_attachment         = { name = 'holoscope_attachment', label = 'Holo Scope', weight = 1000, type = 'item', image = 'holoscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A holo scope for a weapon' },
    advscope_attachment          = { name = 'advscope_attachment', label = 'Advanced Scope', weight = 1000, type = 'item', image = 'advscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'An advanced scope for a weapon' },
    nvscope_attachment           = { name = 'nvscope_attachment', label = 'Night Vision Scope', weight = 1000, type = 'item', image = 'nvscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A night vision scope for a weapon' },
    thermalscope_attachment      = { name = 'thermalscope_attachment', label = 'Thermal Scope', weight = 1000, type = 'item', image = 'thermalscope_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A thermal scope for a weapon' },
    flat_muzzle_brake            = { name = 'flat_muzzle_brake', label = 'Flat Muzzle Brake', weight = 1000, type = 'item', image = 'flat_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    tactical_muzzle_brake        = { name = 'tactical_muzzle_brake', label = 'Tactical Muzzle Brake', weight = 1000, type = 'item', image = 'tactical_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brakee for a weapon' },
    fat_end_muzzle_brake         = { name = 'fat_end_muzzle_brake', label = 'Fat End Muzzle Brake', weight = 1000, type = 'item', image = 'fat_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    precision_muzzle_brake       = { name = 'precision_muzzle_brake', label = 'Precision Muzzle Brake', weight = 1000, type = 'item', image = 'precision_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    heavy_duty_muzzle_brake      = { name = 'heavy_duty_muzzle_brake', label = 'HD Muzzle Brake', weight = 1000, type = 'item', image = 'heavy_duty_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    slanted_muzzle_brake         = { name = 'slanted_muzzle_brake', label = 'Slanted Muzzle Brake', weight = 1000, type = 'item', image = 'slanted_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    split_end_muzzle_brake       = { name = 'split_end_muzzle_brake', label = 'Split End Muzzle Brake', weight = 1000, type = 'item', image = 'split_end_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    squared_muzzle_brake         = { name = 'squared_muzzle_brake', label = 'Squared Muzzle Brake', weight = 1000, type = 'item', image = 'squared_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    bellend_muzzle_brake         = { name = 'bellend_muzzle_brake', label = 'Bellend Muzzle Brake', weight = 1000, type = 'item', image = 'bellend_muzzle_brake.png', unique = false, useable = true, shouldClose = true, description = 'A muzzle brake for a weapon' },
    barrel_attachment            = { name = 'barrel_attachment', label = 'Barrel', weight = 1000, type = 'item', image = 'barrel_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A barrel for a weapon' },
    grip_attachment              = { name = 'grip_attachment', label = 'Grip', weight = 1000, type = 'item', image = 'grip_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A grip for a weapon' },
    comp_attachment              = { name = 'comp_attachment', label = 'Compensator', weight = 1000, type = 'item', image = 'comp_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A compensator for a weapon' },
    luxuryfinish_attachment      = { name = 'luxuryfinish_attachment', label = 'Luxury Finish', weight = 1000, type = 'item', image = 'luxuryfinish_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A luxury finish for a weapon' },
    digicamo_attachment          = { name = 'digicamo_attachment', label = 'Digital Camo', weight = 1000, type = 'item', image = 'digicamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A digital camo for a weapon' },
    brushcamo_attachment         = { name = 'brushcamo_attachment', label = 'Brushstroke Camo', weight = 1000, type = 'item', image = 'brushcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A brushstroke camo for a weapon' },
    woodcamo_attachment          = { name = 'woodcamo_attachment', label = 'Woodland Camo', weight = 1000, type = 'item', image = 'woodcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A woodland camo for a weapon' },
    skullcamo_attachment         = { name = 'skullcamo_attachment', label = 'Skull Camo', weight = 1000, type = 'item', image = 'skullcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A skull camo for a weapon' },
    sessantacamo_attachment      = { name = 'sessantacamo_attachment', label = 'Sessanta Nove Camo', weight = 1000, type = 'item', image = 'sessantacamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A sessanta nove camo for a weapon' },
    perseuscamo_attachment       = { name = 'perseuscamo_attachment', label = 'Perseus Camo', weight = 1000, type = 'item', image = 'perseuscamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A perseus camo for a weapon' },
    leopardcamo_attachment       = { name = 'leopardcamo_attachment', label = 'Leopard Camo', weight = 1000, type = 'item', image = 'leopardcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A leopard camo for a weapon' },
    zebracamo_attachment         = { name = 'zebracamo_attachment', label = 'Zebra Camo', weight = 1000, type = 'item', image = 'zebracamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A zebra camo for a weapon' },
    geocamo_attachment           = { name = 'geocamo_attachment', label = 'Geometric Camo', weight = 1000, type = 'item', image = 'geocamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A geometric camo for a weapon' },
    boomcamo_attachment          = { name = 'boomcamo_attachment', label = 'Boom Camo', weight = 1000, type = 'item', image = 'boomcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A boom camo for a weapon' },
    patriotcamo_attachment       = { name = 'patriotcamo_attachment', label = 'Patriot Camo', weight = 1000, type = 'item', image = 'patriotcamo_attachment.png', unique = false, useable = true, shouldClose = true, description = 'A patriot camo for a weapon' },

    -- Weapon Tints
    weapontint_0                 = { name = 'weapontint_0', label = 'Default Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Default/Black Weapon Tint' },
    weapontint_1                 = { name = 'weapontint_1', label = 'Green Tint', weight = 1000, type = 'item', image = 'weapontint_green.png', unique = false, useable = true, shouldClose = true, description = 'Green Weapon Tint' },
    weapontint_2                 = { name = 'weapontint_2', label = 'Gold Tint', weight = 1000, type = 'item', image = 'weapontint_gold.png', unique = false, useable = true, shouldClose = true, description = 'Gold Weapon Tint' },
    weapontint_3                 = { name = 'weapontint_3', label = 'Pink Tint', weight = 1000, type = 'item', image = 'weapontint_pink.png', unique = false, useable = true, shouldClose = true, description = 'Pink Weapon Tint' },
    weapontint_4                 = { name = 'weapontint_4', label = 'Army Tint', weight = 1000, type = 'item', image = 'weapontint_army.png', unique = false, useable = true, shouldClose = true, description = 'Army Weapon Tint' },
    weapontint_5                 = { name = 'weapontint_5', label = 'LSPD Tint', weight = 1000, type = 'item', image = 'weapontint_lspd.png', unique = false, useable = true, shouldClose = true, description = 'LSPD Weapon Tint' },
    weapontint_6                 = { name = 'weapontint_6', label = 'Orange Tint', weight = 1000, type = 'item', image = 'weapontint_orange.png', unique = false, useable = true, shouldClose = true, description = 'Orange Weapon Tint' },
    weapontint_7                 = { name = 'weapontint_7', label = 'Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_plat.png', unique = false, useable = true, shouldClose = true, description = 'Platinum Weapon Tint' },
    weapontint_mk2_0             = { name = 'weapontint_mk2_0', label = 'Classic Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_1             = { name = 'weapontint_mk2_1', label = 'Classic Gray Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Gray Weapon Tint for MK2 Weapons' },
    weapontint_mk2_2             = { name = 'weapontint_mk2_2', label = 'Classic Two-Tone Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Two-Tone Weapon Tint for MK2 Weapons' },
    weapontint_mk2_3             = { name = 'weapontint_mk2_3', label = 'Classic White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_4             = { name = 'weapontint_mk2_4', label = 'Classic Beige Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Beige Weapon Tint for MK2 Weapons' },
    weapontint_mk2_5             = { name = 'weapontint_mk2_5', label = 'Classic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_6             = { name = 'weapontint_mk2_6', label = 'Classic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_7             = { name = 'weapontint_mk2_7', label = 'Classic Earth Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Earth Weapon Tint for MK2 Weapons' },
    weapontint_mk2_8             = { name = 'weapontint_mk2_8', label = 'Classic Brown & Black Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Classic Brown & Black Weapon Tint for MK2 Weapons' },
    weapontint_mk2_9             = { name = 'weapontint_mk2_9', label = 'Red Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Red Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_10            = { name = 'weapontint_mk2_10', label = 'Blue Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Blue Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_11            = { name = 'weapontint_mk2_11', label = 'Yellow Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Yellow Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_12            = { name = 'weapontint_mk2_12', label = 'Orange Contrast Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Orange Contrast Weapon Tint for MK2 Weapons' },
    weapontint_mk2_13            = { name = 'weapontint_mk2_13', label = 'Bold Pink Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Pink Weapon Tint for MK2 Weapons' },
    weapontint_mk2_14            = { name = 'weapontint_mk2_14', label = 'Bold Purple & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Purple & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_15            = { name = 'weapontint_mk2_15', label = 'Bold Orange Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Orange Weapon Tint for MK2 Weapons' },
    weapontint_mk2_16            = { name = 'weapontint_mk2_16', label = 'Bold Green & Purple Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Green & Purple Weapon Tint for MK2 Weapons' },
    weapontint_mk2_17            = { name = 'weapontint_mk2_17', label = 'Bold Red Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Red Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_18            = { name = 'weapontint_mk2_18', label = 'Bold Green Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Green Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_19            = { name = 'weapontint_mk2_19', label = 'Bold Cyan Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Cyan Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_20            = { name = 'weapontint_mk2_20', label = 'Bold Yellow Features Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Yellow Features Weapon Tint for MK2 Weapons' },
    weapontint_mk2_21            = { name = 'weapontint_mk2_21', label = 'Bold Red & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Red & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_22            = { name = 'weapontint_mk2_22', label = 'Bold Blue & White Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Bold Blue & White Weapon Tint for MK2 Weapons' },
    weapontint_mk2_23            = { name = 'weapontint_mk2_23', label = 'Metallic Gold Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Gold Weapon Tint for MK2 Weapons' },
    weapontint_mk2_24            = { name = 'weapontint_mk2_24', label = 'Metallic Platinum Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Platinum Weapon Tint for MK2 Weapons' },
    weapontint_mk2_25            = { name = 'weapontint_mk2_25', label = 'Metallic Gray & Lilac Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Gray & Lilac Weapon Tint for MK2 Weapons' },
    weapontint_mk2_26            = { name = 'weapontint_mk2_26', label = 'Metallic Purple & Lime Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Purple & Lime Weapon Tint for MK2 Weapons' },
    weapontint_mk2_27            = { name = 'weapontint_mk2_27', label = 'Metallic Red Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Red Weapon Tint for MK2 Weapons' },
    weapontint_mk2_28            = { name = 'weapontint_mk2_28', label = 'Metallic Green Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Green Weapon Tint for MK2 Weapons' },
    weapontint_mk2_29            = { name = 'weapontint_mk2_29', label = 'Metallic Blue Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Blue Weapon Tint for MK2 Weapons' },
    weapontint_mk2_30            = { name = 'weapontint_mk2_30', label = 'Metallic White & Aqua Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic White & Aqua Weapon Tint for MK2 Weapons' },
    weapontint_mk2_31            = { name = 'weapontint_mk2_31', label = 'Metallic Orange & Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Orange & Yellow Weapon Tint for MK2 Weapons' },
    weapontint_mk2_32            = { name = 'weapontint_mk2_32', label = 'Metallic Red and Yellow Tint', weight = 1000, type = 'item', image = 'weapontint_black.png', unique = false, useable = true, shouldClose = true, description = 'Metallic Red and Yellow Weapon Tint for MK2 Weapons' },
    -- ITEMS

    -- Ammo ITEMS
    pistol_ammo                  = { name = 'pistol_ammo', label = 'Pistol ammo', weight = 200, type = 'item', image = 'pistol_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Pistols' },
    rifle_ammo                   = { name = 'rifle_ammo', label = 'Rifle ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Rifles' },
    smg_ammo                     = { name = 'smg_ammo', label = 'SMG ammo', weight = 500, type = 'item', image = 'smg_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Sub Machine Guns' },
    shotgun_ammo                 = { name = 'shotgun_ammo', label = 'Shotgun ammo', weight = 500, type = 'item', image = 'shotgun_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Shotguns' },
    mg_ammo                      = { name = 'mg_ammo', label = 'MG ammo', weight = 1000, type = 'item', image = 'mg_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Machine Guns' },
    snp_ammo                     = { name = 'snp_ammo', label = 'Sniper ammo', weight = 1000, type = 'item', image = 'rifle_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for Sniper Rifles' },
    emp_ammo                     = { name = 'emp_ammo', label = 'EMP Ammo', weight = 200, type = 'item', image = 'emp_ammo.png', unique = false, useable = true, shouldClose = true, description = 'Ammo for EMP Launcher' },

    -- Card ITEMS
    id_card                      = { name = 'id_card', label = 'ID Card', weight = 0, type = 'item', image = 'id_card.png', unique = true, useable = true, shouldClose = false, description = 'A card containing all your information to identify yourself' },
    driver_license               = { name = 'driver_license', label = 'Drivers License', weight = 0, type = 'item', image = 'driver_license.png', unique = true, useable = true, shouldClose = false, description = 'Permit to show you can drive a vehicle' },
    lawyerpass                   = { name = 'lawyerpass', label = 'Lawyer Pass', weight = 0, type = 'item', image = 'lawyerpass.png', unique = true, useable = true, shouldClose = false, description = 'Pass exclusive to lawyers to show they can represent a suspect' },
    weaponlicense                = { name = 'weaponlicense', label = 'Weapon License', weight = 0, type = 'item', image = 'weapon_license.png', unique = true, useable = true, shouldClose = true, description = 'Weapon License' },
    bank_card                    = { name = 'bank_card', label = 'Bank Card', weight = 0, type = 'item', image = 'bank_card.png', unique = true, useable = true, shouldClose = true, description = 'Used to access ATM' },
    security_card_01             = { name = 'security_card_01', label = 'Security Card A', weight = 0, type = 'item', image = 'security_card_01.png', unique = false, useable = true, shouldClose = true, description = 'A security card... I wonder what it goes to' },
    security_card_02             = { name = 'security_card_02', label = 'Security Card B', weight = 0, type = 'item', image = 'security_card_02.png', unique = false, useable = true, shouldClose = true, description = 'A security card... I wonder what it goes to' },

    -- Eat ITEMS
    tosti                        = { name = 'tosti', label = 'Grilled Cheese Sandwich', weight = 200, type = 'item', image = 'tosti.png', unique = false, useable = true, shouldClose = true, description = 'Nice to eat' },
    twerks_candy                 = { name = 'twerks_candy', label = 'Twerks', weight = 100, type = 'item', image = 'twerks_candy.png', unique = false, useable = true, shouldClose = true, description = 'Some delicious candy :O' },
    snikkel_candy                = { name = 'snikkel_candy', label = 'Snikkel', weight = 100, type = 'item', image = 'snikkel_candy.png', unique = false, useable = true, shouldClose = true, description = 'Some delicious candy :O' },
    sandwich                     = { name = 'sandwich', label = 'Sandwich', weight = 200, type = 'item', image = 'sandwich.png', unique = false, useable = true, shouldClose = true, description = 'Nice bread for your stomach' },

    -- Drink ITEMS
    water_bottle                 = { name = 'water_bottle', label = 'Bottle of Water', weight = 500, type = 'item', image = 'water_bottle.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    coffee                       = { name = 'coffee', label = 'Coffee', weight = 200, type = 'item', image = 'coffee.png', unique = false, useable = true, shouldClose = true, description = 'Pump 4 Caffeine' },
    kurkakola                    = { name = 'kurkakola', label = 'Cola', weight = 500, type = 'item', image = 'cola.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },

    -- Alcohol
    beer                         = { name = 'beer', label = 'Beer', weight = 500, type = 'item', image = 'beer.png', unique = false, useable = true, shouldClose = true, description = 'Nothing like a good cold beer!' },
    whiskey                      = { name = 'whiskey', label = 'Whiskey', weight = 500, type = 'item', image = 'whiskey.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    vodka                        = { name = 'vodka', label = 'Vodka', weight = 500, type = 'item', image = 'vodka.png', unique = false, useable = true, shouldClose = true, description = 'For all the thirsty out there' },
    grape                        = { name = 'grape', label = 'Grape', weight = 100, type = 'item', image = 'grape.png', unique = false, useable = true, shouldClose = false, description = 'Mmmmh yummie, grapes' },
    wine                         = { name = 'wine', label = 'Wine', weight = 300, type = 'item', image = 'wine.png', unique = false, useable = true, shouldClose = false, description = 'Some good wine to drink on a fine evening' },
    grapejuice                   = { name = 'grapejuice', label = 'Grape Juice', weight = 200, type = 'item', image = 'grapejuice.png', unique = false, useable = true, shouldClose = false, description = 'Grape juice is said to be healthy' },

    -- Drugs
    joint                        = { name = 'joint', label = 'Joint', weight = 0, type = 'item', image = 'joint.png', unique = false, useable = true, shouldClose = true, description = 'Sidney would be very proud at you' },
    cokebaggy                    = { name = 'cokebaggy', label = 'Bag of Coke', weight = 0, type = 'item', image = 'cocaine_baggy.png', unique = false, useable = true, shouldClose = true, description = 'To get happy real quick' },
    crack_baggy                  = { name = 'crack_baggy', label = 'Bag of Crack', weight = 0, type = 'item', image = 'crack_baggy.png', unique = false, useable = true, shouldClose = true, description = 'To get happy faster' },
    xtcbaggy                     = { name = 'xtcbaggy', label = 'Bag of XTC', weight = 0, type = 'item', image = 'xtc_baggy.png', unique = false, useable = true, shouldClose = true, description = 'Pop those pills baby' },
    coke_brick                   = { name = 'coke_brick', label = 'Coke Brick', weight = 1000, type = 'item', image = 'coke_brick.png', unique = true, useable = false, shouldClose = true, description = 'Heavy package of cocaine, mostly used for deals and takes a lot of space' },
    weed_brick                   = { name = 'weed_brick', label = 'Weed Brick', weight = 1000, type = 'item', image = 'weed_brick.png', unique = false, useable = false, shouldClose = true, description = '1KG Weed Brick to sell to large customers.' },
    coke_small_brick             = { name = 'coke_small_brick', label = 'Coke Package', weight = 350, type = 'item', image = 'coke_small_brick.png', unique = true, useable = false, shouldClose = true, description = 'Small package of cocaine, mostly used for deals and takes a lot of space' },
    oxy                          = { name = 'oxy', label = 'Prescription Oxy', weight = 0, type = 'item', image = 'oxy.png', unique = false, useable = true, shouldClose = true, description = 'The Label Has Been Ripped Off' },
    meth                         = { name = 'meth', label = 'Meth', weight = 100, type = 'item', image = 'meth_baggy.png', unique = false, useable = true, shouldClose = true, description = 'A baggie of Meth' },
    rolling_paper                = { name = 'rolling_paper', label = 'Rolling Paper', weight = 0, type = 'item', image = 'rolling_paper.png', unique = false, useable = false, shouldClose = true, description = 'Paper made specifically for encasing and smoking tobacco or cannabis.' },

    -- Seed And Weed
    weed_whitewidow              = { name = 'weed_whitewidow', label = 'White Widow 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g White Widow' },
    weed_skunk                   = { name = 'weed_skunk', label = 'Skunk 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g Skunk' },
    weed_purplehaze              = { name = 'weed_purplehaze', label = 'Purple Haze 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g Purple Haze' },
    weed_ogkush                  = { name = 'weed_ogkush', label = 'OGKush 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g OG Kush' },
    weed_amnesia                 = { name = 'weed_amnesia', label = 'Amnesia 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g Amnesia' },
    weed_ak47                    = { name = 'weed_ak47', label = 'AK47 2g', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'A weed bag with 2g AK47' },
    weed_whitewidow_seed         = { name = 'weed_whitewidow_seed', label = 'White Widow Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = false, description = 'A weed seed of White Widow' },
    weed_skunk_seed              = { name = 'weed_skunk_seed', label = 'Skunk Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Skunk' },
    weed_purplehaze_seed         = { name = 'weed_purplehaze_seed', label = 'Purple Haze Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Purple Haze' },
    weed_ogkush_seed             = { name = 'weed_ogkush_seed', label = 'OGKush Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of OG Kush' },
    weed_amnesia_seed            = { name = 'weed_amnesia_seed', label = 'Amnesia Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of Amnesia' },
    weed_ak47_seed               = { name = 'weed_ak47_seed', label = 'AK47 Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, description = 'A weed seed of AK47' },
    empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight = 0, type = 'item', image = 'weed_baggy_empty.png', unique = false, useable = true, shouldClose = true, description = 'A small empty bag' },
    weed_nutrition               = { name = 'weed_nutrition', label = 'Plant Fertilizer', weight = 2000, type = 'item', image = 'weed_nutrition.png', unique = false, useable = true, shouldClose = true, description = 'Plant nutrition' },

    -- Material
    plastic                      = { name = 'plastic', label = 'Plastic', weight = 100, type = 'item', image = 'plastic.png', unique = false, useable = false, shouldClose = false, description = 'RECYCLE! - Greta Thunberg 2019' },
    metalscrap                   = { name = 'metalscrap', label = 'Metal Scrap', weight = 100, type = 'item', image = 'metalscrap.png', unique = false, useable = false, shouldClose = false, description = 'You can probably make something nice out of this' },
    copper                       = { name = 'copper', label = 'Copper', weight = 100, type = 'item', image = 'copper.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    aluminum                     = { name = 'aluminum', label = 'Aluminium', weight = 100, type = 'item', image = 'aluminum.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    aluminumoxide                = { name = 'aluminumoxide', label = 'Aluminium Powder', weight = 100, type = 'item', image = 'aluminumoxide.png', unique = false, useable = false, shouldClose = false, description = 'Some powder to mix with' },
    iron                         = { name = 'iron', label = 'Iron', weight = 100, type = 'item', image = 'iron.png', unique = false, useable = false, shouldClose = false, description = 'Handy piece of metal that you can probably use for something' },
    ironoxide                    = { name = 'ironoxide', label = 'Iron Powder', weight = 100, type = 'item', image = 'ironoxide.png', unique = false, useable = false, shouldClose = false, description = 'Some powder to mix with.' },
    steel                        = { name = 'steel', label = 'Steel', weight = 100, type = 'item', image = 'steel.png', unique = false, useable = false, shouldClose = false, description = 'Nice piece of metal that you can probably use for something' },
    rubber                       = { name = 'rubber', label = 'Rubber', weight = 100, type = 'item', image = 'rubber.png', unique = false, useable = false, shouldClose = false, description = 'Rubber, I believe you can make your own rubber ducky with it :D' },
    glass                        = { name = 'glass', label = 'Glass', weight = 100, type = 'item', image = 'glass.png', unique = false, useable = false, shouldClose = false, description = 'It is very fragile, watch out' },

    -- Tools
    lockpick                     = { name = 'lockpick', label = 'Lockpick', weight = 300, type = 'item', image = 'lockpick.png', unique = false, useable = true, shouldClose = true, description = 'Very useful if you lose your keys a lot.. or if you want to use it for something else...' },
    advancedlockpick             = { name = 'advancedlockpick', label = 'Advanced Lockpick', weight = 500, type = 'item', image = 'advancedlockpick.png', unique = false, useable = true, shouldClose = true, description = 'If you lose your keys a lot this is very useful... Also useful to open your beers' },
    electronickit                = { name = 'electronickit', label = 'Electronic Kit', weight = 100, type = 'item', image = 'electronickit.png', unique = false, useable = true, shouldClose = true, description = 'If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?' },
    gatecrack                    = { name = 'gatecrack', label = 'Gatecrack', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, description = 'Handy software to tear down some fences' },
    thermite                     = { name = 'thermite', label = 'Thermite', weight = 1000, type = 'item', image = 'thermite.png', unique = false, useable = true, shouldClose = true, description = 'Sometimes you\'d wish for everything to burn' },
    trojan_usb                   = { name = 'trojan_usb', label = 'Trojan USB', weight = 0, type = 'item', image = 'usb_device.png', unique = false, useable = false, shouldClose = true, description = 'Handy software to shut down some systems' },
    screwdriverset               = { name = 'screwdriverset', label = 'Toolkit', weight = 1000, type = 'item', image = 'screwdriverset.png', unique = false, useable = false, shouldClose = false, description = 'Very useful to screw... screws...' },
    drill                        = { name = 'drill', label = 'Drill', weight = 20000, type = 'item', image = 'drill.png', unique = false, useable = false, shouldClose = false, description = 'The real deal...' },

    -- Vehicle Tools
    nitrous                      = { name = 'nitrous', label = 'Nitrous', weight = 1000, type = 'item', image = 'nitrous.png', unique = false, useable = true, shouldClose = true, description = 'Speed up, gas pedal! :D' },
    repairkit                    = { name = 'repairkit', label = 'Repairkit', weight = 2500, type = 'item', image = 'repairkit.png', unique = false, useable = true, shouldClose = true, description = 'A nice toolbox with stuff to repair your vehicle' },
    advancedrepairkit            = { name = 'advancedrepairkit', label = 'Advanced Repairkit', weight = 4000, type = 'item', image = 'advancedkit.png', unique = false, useable = true, shouldClose = true, description = 'A nice toolbox with stuff to repair your vehicle' },
    cleaningkit                  = { name = 'cleaningkit', label = 'Cleaning Kit', weight = 250, type = 'item', image = 'cleaningkit.png', unique = false, useable = true, shouldClose = true, description = 'A microfiber cloth with some soap will let your car sparkle again!' },
    tunerlaptop                  = { name = 'tunerlaptop', label = 'Tunerchip', weight = 2000, type = 'item', image = 'tunerchip.png', unique = true, useable = true, shouldClose = true, description = 'With this tunerchip you can get your car on steroids... If you know what you\'re doing' },
    harness                      = { name = 'harness', label = 'Race Harness', weight = 1000, type = 'item', image = 'harness.png', unique = true, useable = true, shouldClose = true, description = 'Racing Harness so no matter what you stay in the car' },
    jerry_can                    = { name = 'jerry_can', label = 'Jerrycan 20L', weight = 20000, type = 'item', image = 'jerry_can.png', unique = false, useable = true, shouldClose = true, description = 'A can full of Fuel' },
    tirerepairkit                = { name = 'tirerepairkit', label = 'Tire Repair Kit', weight = 1000, type = 'item', image = 'tirerepairkit.png', unique = false, useable = true, shouldClose = true, description = 'A kit to repair your tires' },

    -- Mechanic Parts
    veh_toolbox                  = { name = 'veh_toolbox', label = 'Toolbox', weight = 1000, type = 'item', image = 'veh_toolbox.png', unique = false, useable = true, shouldClose = true, description = 'Check vehicle status' },
    veh_armor                    = { name = 'veh_armor', label = 'Armor', weight = 1000, type = 'item', image = 'veh_armor.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle armor' },
    veh_brakes                   = { name = 'veh_brakes', label = 'Brakes', weight = 1000, type = 'item', image = 'veh_brakes.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle brakes' },
    veh_engine                   = { name = 'veh_engine', label = 'Engine', weight = 1000, type = 'item', image = 'veh_engine.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle engine' },
    veh_suspension               = { name = 'veh_suspension', label = 'Suspension', weight = 1000, type = 'item', image = 'veh_suspension.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle suspension' },
    veh_transmission             = { name = 'veh_transmission', label = 'Transmission', weight = 1000, type = 'item', image = 'veh_transmission.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle transmission' },
    veh_turbo                    = { name = 'veh_turbo', label = 'Turbo', weight = 1000, type = 'item', image = 'veh_turbo.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle turbo' },
    veh_interior                 = { name = 'veh_interior', label = 'Interior', weight = 1000, type = 'item', image = 'veh_interior.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle interior' },
    veh_exterior                 = { name = 'veh_exterior', label = 'Exterior', weight = 1000, type = 'item', image = 'veh_exterior.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle exterior' },
    veh_wheels                   = { name = 'veh_wheels', label = 'Wheels', weight = 1000, type = 'item', image = 'veh_wheels.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle wheels' },
    veh_neons                    = { name = 'veh_neons', label = 'Neons', weight = 1000, type = 'item', image = 'veh_neons.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle neons' },
    veh_xenons                   = { name = 'veh_xenons', label = 'Xenons', weight = 1000, type = 'item', image = 'veh_xenons.png', unique = false, useable = true, shouldClose = true, description = 'Upgrade vehicle xenons' },
    veh_tint                     = { name = 'veh_tint', label = 'Tints', weight = 1000, type = 'item', image = 'veh_tint.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle tint' },
    veh_plates                   = { name = 'veh_plates', label = 'Plates', weight = 1000, type = 'item', image = 'veh_plates.png', unique = false, useable = true, shouldClose = true, description = 'Install vehicle plates' },

    -- Medication
    firstaid                     = { name = 'firstaid', label = 'First Aid', weight = 2500, type = 'item', image = 'firstaid.png', unique = false, useable = true, shouldClose = true, description = 'You can use this First Aid kit to get people back on their feet' },
    bandage                      = { name = 'bandage', label = 'Bandage', weight = 0, type = 'item', image = 'bandage.png', unique = false, useable = true, shouldClose = true, description = 'A bandage works every time' },
    ifaks                        = { name = 'ifaks', label = 'ifaks', weight = 200, type = 'item', image = 'ifaks.png', unique = false, useable = true, shouldClose = true, description = 'ifaks for healing and a complete stress remover.' },
    painkillers                  = { name = 'painkillers', label = 'Painkillers', weight = 0, type = 'item', image = 'painkillers.png', unique = false, useable = true, shouldClose = true, description = 'For pain you can\'t stand anymore, take this pill that\'d make you feel great again' },
    walkstick                    = { name = 'walkstick', label = 'Walking Stick', weight = 1000, type = 'item', image = 'walkstick.png', unique = false, useable = true, shouldClose = true, description = 'Walking stick for ya\'ll grannies out there.. HAHA' },

    -- Communication
    phone                        = { name = 'phone', label = 'Phone', weight = 700, type = 'item', image = 'phone.png', unique = true, useable = false, shouldClose = false, description = 'Neat phone ya got there' },
    radio                        = { name = 'radio', label = 'Radio', weight = 2000, type = 'item', image = 'radio.png', unique = true, useable = true, shouldClose = true, description = 'You can communicate with this through a signal' },
    iphone                       = { name = 'iphone', label = 'iPhone', weight = 1000, type = 'item', image = 'iphone.png', unique = false, useable = false, shouldClose = true, description = 'Very expensive phone' },
    samsungphone                 = { name = 'samsungphone', label = 'Samsung S10', weight = 1000, type = 'item', image = 'samsungphone.png', unique = false, useable = false, shouldClose = true, description = 'Very expensive phone' },
    laptop                       = { name = 'laptop', label = 'Laptop', weight = 4000, type = 'item', image = 'laptop.png', unique = false, useable = false, shouldClose = true, description = 'Expensive laptop' },
    tablet                       = { name = 'tablet', label = 'Tablet', weight = 2000, type = 'item', image = 'tablet.png', unique = false, useable = false, shouldClose = true, description = 'Expensive tablet' },
    fitbit                       = { name = 'fitbit', label = 'Fitbit', weight = 500, type = 'item', image = 'fitbit.png', unique = true, useable = true, shouldClose = true, description = 'I like fitbit' },
    radioscanner                 = { name = 'radioscanner', label = 'Radio Scanner', weight = 1000, type = 'item', image = 'radioscanner.png', unique = false, useable = false, shouldClose = true, description = 'With this you can get some police alerts. Not 100% effective however' },
    pinger                       = { name = 'pinger', label = 'Pinger', weight = 1000, type = 'item', image = 'pinger.png', unique = false, useable = false, shouldClose = true, description = 'With a pinger and your phone you can send out your location' },
    cryptostick                  = { name = 'cryptostick', label = 'Crypto Stick', weight = 200, type = 'item', image = 'cryptostick.png', unique = true, useable = true, shouldClose = true, description = 'Why would someone ever buy money that doesn\'t exist.. How many would it contain..?' },

    -- Theft and Jewelry
    rolex                        = { name = 'rolex', label = 'Golden Watch', weight = 1500, type = 'item', image = 'rolex.png', unique = false, useable = false, shouldClose = true, description = 'A golden watch seems like the jackpot to me!' },
    diamond_ring                 = { name = 'diamond_ring', label = 'Diamond Ring', weight = 1500, type = 'item', image = 'diamond_ring.png', unique = false, useable = false, shouldClose = true, description = 'A diamond ring seems like the jackpot to me!' },
    diamond                      = { name = 'diamond', label = 'Diamond', weight = 1000, type = 'item', image = 'diamond.png', unique = false, useable = false, shouldClose = true, description = 'A diamond seems like the jackpot to me!' },
    goldchain                    = { name = 'goldchain', label = 'Golden Chain', weight = 1500, type = 'item', image = 'goldchain.png', unique = false, useable = false, shouldClose = true, description = 'A golden chain seems like the jackpot to me!' },
    tenkgoldchain                = { name = 'tenkgoldchain', label = '10k Gold Chain', weight = 2000, type = 'item', image = '10kgoldchain.png', unique = false, useable = false, shouldClose = true, description = '10 carat golden chain' },
    goldbar                      = { name = 'goldbar', label = 'Gold Bar', weight = 7000, type = 'item', image = 'goldbar.png', unique = false, useable = false, shouldClose = true, description = 'Looks pretty expensive to me' },

    -- Cops Tools
    armor                        = { name = 'armor', label = 'Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, description = 'Some protection won\'t hurt... right?' },
    heavyarmor                   = { name = 'heavyarmor', label = 'Heavy Armor', weight = 5000, type = 'item', image = 'armor.png', unique = false, useable = true, shouldClose = true, description = 'Some protection won\'t hurt... right?' },
    handcuffs                    = { name = 'handcuffs', label = 'Handcuffs', weight = 100, type = 'item', image = 'handcuffs.png', unique = false, useable = true, shouldClose = true, description = 'Comes in handy when people misbehave. Maybe it can be used for something else?' },
    police_stormram              = { name = 'police_stormram', label = 'Stormram', weight = 18000, type = 'item', image = 'police_stormram.png', unique = false, useable = true, shouldClose = true, description = 'A nice tool to break into doors' },
    empty_evidence_bag           = { name = 'empty_evidence_bag', label = 'Empty Evidence Bag', weight = 0, type = 'item', image = 'evidence.png', unique = false, useable = false, shouldClose = false, description = 'Used a lot to keep DNA from blood, bullet shells and more' },
    filled_evidence_bag          = { name = 'filled_evidence_bag', label = 'Evidence Bag', weight = 200, type = 'item', image = 'evidence.png', unique = true, useable = false, shouldClose = false, description = 'A filled evidence bag to see who committed the crime >:(' },

    -- Firework Tools
    firework1                    = { name = 'firework1', label = '2Brothers', weight = 1000, type = 'item', image = 'firework1.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework2                    = { name = 'firework2', label = 'Poppelers', weight = 1000, type = 'item', image = 'firework2.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework3                    = { name = 'firework3', label = 'WipeOut', weight = 1000, type = 'item', image = 'firework3.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },
    firework4                    = { name = 'firework4', label = 'Weeping Willow', weight = 1000, type = 'item', image = 'firework4.png', unique = false, useable = true, shouldClose = true, description = 'Fireworks' },

    -- Sea Tools
    dendrogyra_coral             = { name = 'dendrogyra_coral', label = 'Dendrogyra', weight = 1000, type = 'item', image = 'dendrogyra_coral.png', unique = false, useable = false, shouldClose = true, description = 'Its also known as pillar coral' },
    antipatharia_coral           = { name = 'antipatharia_coral', label = 'Antipatharia', weight = 1000, type = 'item', image = 'antipatharia_coral.png', unique = false, useable = false, shouldClose = true, description = 'Its also known as black corals or thorn corals' },
    diving_gear                  = { name = 'diving_gear', label = 'Diving Gear', weight = 30000, type = 'item', image = 'diving_gear.png', unique = true, useable = true, shouldClose = true, description = 'An oxygen tank and a rebreather' },
    diving_fill                  = { name = 'diving_fill', label = 'Diving Tube', weight = 3000, type = 'item', image = 'diving_tube.png', unique = true, useable = true, shouldClose = true, description = 'An oxygen tube and a rebreather' },

    -- Other Tools
    casinochips                  = { name = 'casinochips', label = 'Casino Chips', weight = 0, type = 'item', image = 'casinochips.png', unique = false, useable = false, shouldClose = false, description = 'Chips For Casino Gambling' },
    stickynote                   = { name = 'stickynote', label = 'Sticky note', weight = 0, type = 'item', image = 'stickynote.png', unique = true, useable = false, shouldClose = false, description = 'Sometimes handy to remember something :)' },
    moneybag                     = { name = 'moneybag', label = 'Money Bag', weight = 0, type = 'item', image = 'moneybag.png', unique = true, useable = true, shouldClose = true, description = 'A bag with cash' },
    parachute                    = { name = 'parachute', label = 'Parachute', weight = 30000, type = 'item', image = 'parachute.png', unique = true, useable = true, shouldClose = true, description = 'The sky is the limit! Woohoo!' },
    binoculars                   = { name = 'binoculars', label = 'Binoculars', weight = 600, type = 'item', image = 'binoculars.png', unique = false, useable = true, shouldClose = true, description = 'Sneaky Breaky...' },
    lighter                      = { name = 'lighter', label = 'Lighter', weight = 0, type = 'item', image = 'lighter.png', unique = false, useable = false, shouldClose = true, description = 'On new years eve a nice fire to stand next to' },
    certificate                  = { name = 'certificate', label = 'Certificate', weight = 0, type = 'item', image = 'certificate.png', unique = false, useable = false, shouldClose = true, description = 'Certificate that proves you own certain stuff' },
    markedbills                  = { name = 'markedbills', label = 'Marked Money', weight = 1000, type = 'item', image = 'markedbills.png', unique = true, useable = false, shouldClose = true, description = 'Money?' },
    labkey                       = { name = 'labkey', label = 'Key', weight = 500, type = 'item', image = 'labkey.png', unique = true, useable = true, shouldClose = true, description = 'Key for a lock...?' },
    printerdocument              = { name = 'printerdocument', label = 'Document', weight = 500, type = 'item', image = 'printerdocument.png', unique = true, useable = true, shouldClose = true, description = 'A nice document' },
    newscam                      = { name = 'newscam', label = 'News Camera', weight = 100, type = 'item', image = 'newscam.png', unique = true, useable = true, shouldClose = true, description = 'A camera for the news' },
    newsmic                      = { name = 'newsmic', label = 'News Microphone', weight = 100, type = 'item', image = 'newsmic.png', unique = true, useable = true, shouldClose = true, description = 'A microphone for the news' },
    newsbmic                     = { name = 'newsbmic', label = 'Boom Microphone', weight = 100, type = 'item', image = 'newsbmic.png', unique = true, useable = true, shouldClose = true, description = 'A Useable BoomMic' },
    
--NEW QB ITEMS:
ngd_tobaccotrimmer = { name = 'ngd_tobaccotrimmer', label = 'Tobacco Trimmer', weight = 0, type = 'item', image = 'ngd_tobaccotrimmer.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigtobaccoleaf = { name = 'ngd_cigtobaccoleaf', label = 'Cigarette Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_cigtobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_pipetobaccoleaf = { name = 'ngd_pipetobaccoleaf', label = 'Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_pipetobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigartobaccoleaf = { name = 'ngd_cigartobaccoleaf', label = 'Cigar Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_cigartobaccoleaf.png', unique = true, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drypipetobacco = { name = 'ngd_drypipetobacco', label = 'Dried Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drypipetobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drycigtobacco = { name = 'ngd_drycigtobacco', label = 'Dried Cigarette Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycigtobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drycigartobacco = { name = 'ngd_drycigartobacco', label = 'Dried Cigar Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycigartobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drycherrytobacco = { name = 'ngd_drycherrytobacco', label = 'Dried Cherry Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drycherrytobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drymapletobacco = { name = 'ngd_drymapletobacco', label = 'Dried Maple Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drymapletobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drylemontobacco = { name = 'ngd_drylemontobacco', label = 'Dried Lemon Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drylemontobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_drywintergtobacco = { name = 'ngd_drywintergtobacco', label = 'Dried Wintergreen Pipe Tobacco Leaves', weight = 0, type = 'item', image = 'ngd_drywintergtobacco.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigrollingpaper = { name = 'ngd_cigrollingpaper', label = 'Cigarette Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_premcigrollingpaper = { name = 'ngd_premcigrollingpaper', label = 'Premium Cigarette Rolling Paper', weight = 0, type = 'item', image = 'ngd_premcigrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigfilter = { name = 'ngd_cigfilter', label = 'Cigarette Filter', weight = 0, type = 'item', image = 'ngd_cigfilter.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigarrollingpaper = { name = 'ngd_cigarrollingpaper', label = 'Cigar Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigarrollingpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigarbinder = { name = 'ngd_cigarbinder', label = 'Cigar Binder', weight = 0, type = 'item', image = 'ngd_cigarbinder.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cigarillopaper = { name = 'ngd_cigarillopaper', label = 'Cigarillo Rolling Paper', weight = 0, type = 'item', image = 'ngd_cigarillopaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_menthol = { name = 'ngd_menthol', label = 'Menthol', weight = 0, type = 'item', image = 'ngd_menthol.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_premiumcigarpaper = { name = 'ngd_premiumcigarpaper', label = 'Premium Cigar Rolling Paper', weight = 0, type = 'item', image = 'ngd_premiumcigarpaper.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_importcuban = { name = 'ngd_importcuban', label = 'Imported Cuban Tobacco', weight = 0, type = 'item', image = 'ngd_importcuban.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_cig1 = { name = 'ngd_cig1', label = 'Standard Cigarette', weight = 0, type = 'item', image = 'ngd_cig1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cig2 = { name = 'ngd_cig2', label = 'Premium Cigarette', weight = 0, type = 'item', image = 'ngd_cig2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cig3 = { name = 'ngd_cig3', label = 'Cigarillo', weight = 0, type = 'item', image = 'ngd_cig3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cig4 = { name = 'ngd_cig4', label = 'Menthol Cigarette', weight = 0, type = 'item', image = 'ngd_cig4.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cigar1 = { name = 'ngd_cigar1', label = 'Standard Cigar', weight = 0, type = 'item', image = 'ngd_cigar1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cigar2 = { name = 'ngd_cigar2', label = 'Premium Cigar', weight = 0, type = 'item', image = 'ngd_cigar2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cigar3 = { name = 'ngd_cigar3', label = 'Cuban Cigar', weight = 0, type = 'item', image = 'ngd_cigar3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_pipe1 = { name = 'ngd_pipe1', label = 'Ivory Pipe', weight = 0, type = 'item', image = 'ngd_pipe1.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_pipe2 = { name = 'ngd_pipe2', label = 'Cherrywood Pipe', weight = 0, type = 'item', image = 'ngd_pipe2.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_pipe3 = { name = 'ngd_pipe3', label = 'Cocobolo Pipe', weight = 0, type = 'item', image = 'ngd_pipe3.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_pipe4 = { name = 'ngd_pipe4', label = 'Corncob Pipe', weight = 0, type = 'item', image = 'ngd_pipe4.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_pipe5 = { name = 'ngd_pipe5', label = 'Churchwarden Pipe', weight = 0, type = 'item', image = 'ngd_pipe5.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cherryoil = { name = 'ngd_cherryoil', label = 'Cherry Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_cherryoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_mapleoil = { name = 'ngd_mapleoil', label = 'Maple Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_mapleoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_lemonoil = { name = 'ngd_lemonoil', label = 'Lemon Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_lemonoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_wintergreenoil = { name = 'ngd_wintergreenoil', label = 'Wintergreen Tobacco Flavoring', weight = 0, type = 'item', image = 'ngd_wintergreenoil.png', unique = false, useable = false, shouldClose = false, combinable = nil, description = '' },
ngd_standardcigpack = { name = 'ngd_standardcigpack', label = 'Pack Of Cigarettes', weight = 0, type = 'item', image = 'ngd_standardcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_premiumcigpack = { name = 'ngd_premiumcigpack', label = 'Pack Of Premium Cigarettes', weight = 0, type = 'item', image = 'ngd_premiumcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cigarillopack = { name = 'ngd_cigarillopack', label = 'Pack Of Cigarillos', weight = 0, type = 'item', image = 'ngd_cigarillopack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_mentholcigpack = { name = 'ngd_mentholcigpack', label = 'Pack Of Menthol Cigarettes', weight = 0, type = 'item', image = 'ngd_mentholcigpack.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_stdcigarbox = { name = 'ngd_stdcigarbox', label = 'Box Of Cigars', weight = 0, type = 'item', image = 'ngd_stdcigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_premiumcigarbox = { name = 'ngd_premiumcigarbox', label = 'Premium Box Of Cigars', weight = 0, type = 'item', image = 'ngd_premiumcigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_cubancigarbox = { name = 'ngd_cubancigarbox', label = 'Box Of Cuban Cigars', weight = 0, type = 'item', image = 'ngd_cubancigarbox.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },
ngd_tobaccowhisky = { name = 'ngd_tobaccowhisky', label = 'Whisky', weight = 0, type = 'item', image = 'ngd_tobaccowhisky.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = '' },

    ['smallbackpack'] 			= {['name'] = 'smallbackpack', 			['label'] = 'Small Backpack',            	['weight'] = 250,     ['type'] = 'item',      ['image'] = 'smallbackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['mediumbackpack'] 			= {['name'] = 'mediumbackpack', 		['label'] = 'Medium Backpack',            	['weight'] = 450,     ['type'] = 'item',      ['image'] = 'mediumbackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['largebackpack'] 			= {['name'] = 'largebackpack', 			['label'] = 'Large Backpack',            	['weight'] = 650,     ['type'] = 'item',      ['image'] = 'largebackpack.png',         	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},


    -- Jim-Recycle Items
["recyclablematerial"]  = {["name"] = "recyclablematerial",   ["label"] = "Recycle Box",      ["weight"] = 100, ["type"] = "item", 		["image"] = "recyclablematerial.png",   ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A box of Recyclable Materials"},
["bottle"]              = {["name"] = "bottle",               ["label"] = "Empty Bottle",     ["weight"] = 10,  ["type"] = "item", 		["image"] = "bottle.png",               ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "A glass bottle"},
["can"]                 = {["name"] = "can",                  ["label"] = "Empty Can",        ["weight"] = 10,  ["type"] = "item", 		["image"] = "can.png",                  ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false, ["combinable"] = nil,   ["description"] = "An empty can, good for recycling"},

    -- Required
    ['id_scanner'] = {    ['name'] = 'id_scanner',    ['label'] = 'Card Scanner',    ['weight'] = 5000,    ['type'] = 'item',    ['image'] = 'id_scanner.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = true,    ['combinable'] = nil,    ['description'] = 'Device used to scan cards & ids for any counterfit hints.'},
    -- Optional
	['fishinglicense'] = {    ['name'] = 'fishinglicense',    ['label'] = 'Fishing License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'fishinglicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Fish'},

    ['huntinglicense'] = {    ['name'] = 'huntinglicense',    ['label'] = 'Hunting License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'huntinglicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Hunt'},

    ['waterslicense'] = {    ['name'] = 'waterslicense',    ['label'] = 'Waters License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'waterslicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Drive a Boat'},

    ["kq_outfitbag"] 			 	 = {["name"] = "kq_outfitbag", 				    ["label"] = "Outfit bag",	 		    ["weight"] = 4000, 		["type"] = "item", 		["image"] = "kq_outfitbag.png", 	    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Holds different outfits"},

    
    ['radiocar_dismounter'] = { ['name'] = 'radiocar_dismounter', ['label'] = 'radiocar_dismounter', ['weight'] = 100, ['type'] = 'item', ['image'] = 'radiocar.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'radiocar_dismounter' },
['radiocar'] = { ['name'] = 'radiocar', ['label'] = 'radiocar gray style', ['weight'] = 100, ['type'] = 'item', ['image'] = 'radiocar.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'radiocar' },
['radiocar_blue'] = { ['name'] = 'radiocar_blue', ['label'] = 'radiocar blue style', ['weight'] = 100, ['type'] = 'item', ['image'] = 'radiocar.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'radiocar' },

    ["casino_beer"] = {
        ["name"] = "casino_beer",
        ["label"] = "Casino Beer",
        ["weight"] = 0,
        ["type"] = "item",
        ['image'] = 'casino_beer.png',
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Beer"
    },
    ["casino_burger"] = {
        ["name"] = "casino_burger",
        ["label"] = "Casino Burger",
        ["weight"] = 0,
        ["type"] = "item",
        ['image'] = 'casino_burger.png',
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Burger"
    },
    ["casino_chips"] = {
        ["name"] = "casino_chips",
        ["label"] = "Casino Chips",
        ["weight"] = 0,
        ["type"] = "item",
        ['image'] = 'casino_chips.png',
        ["unique"] = false,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Chips"
    },
    ["casino_coffee"] = {
        ["name"] = "casino_coffee",
        ["label"] = "Casino Coffee",
        ["weight"] = 0,
        ["type"] = "item",
        ['image'] = 'casino_coffee.png',
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Coffee"
    },
    ["casino_coke"] = {
        ["name"] = "casino_coke",
        ["label"] = "Casino Kofola",
        ["weight"] = 0,
        ["type"] = "item",
        ['image'] = 'casino_coke.png',
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Kofola"
    },
    ["casino_donut"] = {
        ["name"] = "casino_donut",
        ["label"] = "Casino Donut",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_donut.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Donut"
    },
    ["casino_ego_chaser"] = {
        ["name"] = "casino_ego_chaser",
        ["label"] = "Casino Ego Chaser",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_ego_chaser.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Ego Chaser"
    },
    ["casino_luckypotion"] = {
        ["name"] = "casino_luckypotion",
        ["label"] = "Casino Lucky Potion",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_luckypotion.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Lucky Potion"
    },
    ["casino_psqs"] = {
        ["name"] = "casino_psqs",
        ["label"] = "Casino Ps & Qs",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_psqs.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Ps & Qs"
    },
    ["casino_sandwitch"] = {
        ["name"] = "casino_sandwitch",
        ["label"] = "Casino Sandwitch",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_sandwitch.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Sandwitch"
    },
    ["casino_sprite"] = {
        ["name"] = "casino_sprite",
        ["label"] = "Casino Sprite",
        ["weight"] = 0,
        ["type"] = "item",
        ["image"] = "casino_sprite.png",
        ["unique"] = true,
        ["useable"] = false,
        ["shouldClose"] = false,
        ["combinable"] = nil,
        ["description"] = "Casino Sprite"
    },

    
    ['sprunk'] = {
        name = 'sprunk', 
        label = 'Sprunk',
        weight = 100,
        type = 'item',
        image = 'sprunk.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['sludgie'] = {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 100,
        type = 'item',
        image = 'sludgie.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['ecola_light'] = {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 100,
        type = 'item',
        image = 'ecola_light.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['ecola'] = { 
        name = 'ecola',
        label = 'Ecola',
        weight = 100,
        type = 'item',
        image = 'ecola.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['coffee'] = {
        name = 'coffee',
        label = 'Coffee',
        weight = 100,
        type = 'item',
        image = 'ecola.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['water'] = {
        name = 'water',
        label = 'Water',
        weight = 100,
        type = 'item',
        image = 'water.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['fries'] = {
        name = 'fries',
        label = 'Fries',
        weight = 100,
        type = 'item',
        image = 'fries.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['pizza_ham'] = {
        name = 'pizza_ham',
        label = 'Pizza Ham',
        weight = 100,
        type = 'item',
        image = 'pizza_ham.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['chips'] = {
        name = 'chips',
        label = 'Chips',
        weight = 100,
        type = 'item',
        image = 'chips.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['donut'] = {
        name = 'donut',
        label = 'Donut',
        weight = 100,
        type = 'item',
        image = 'donut.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    ['cigarrete'] = {
        name = 'cigarrete',
        label = 'Cigarrete',
        weight = 100,
        type = 'item',
        image = 'cigarrete.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
    },
    
    ['weed_white-widow']      = { ['name'] = 'weed_white-widow', ['label'] = 'White Widow 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g White Widow' },
['weed_skunk']            = { ['name'] = 'weed_skunk', ['label'] = 'Skunk 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g Skunk' },
['weed_purple-haze']      = { ['name'] = 'weed_purple-haze', ['label'] = 'Purple Haze 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g Purple Haze' },
['weed_og-kush']          = { ['name'] = 'weed_og-kush', ['label'] = 'OGKush 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g OG Kush' },
['weed_amnesia']          = { ['name'] = 'weed_amnesia', ['label'] = 'Amnesia 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g Amnesia' },
['weed_ak47']             = { ['name'] = 'weed_ak47', ['label'] = 'AK47 2g', ['weight'] = 200, ['type'] = 'item', ['image'] = 'weed_baggy.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed bag with 2g AK47' },
['weed_white-widow_seed'] = { ['name'] = 'weed_white-widow_seed', ['label'] = 'White Widow Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A weed seed of White Widow' },
['weed_skunk_seed']       = { ['name'] = 'weed_skunk_seed', ['label'] = 'Skunk Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A weed seed of Skunk' },
['weed_purple-haze_seed'] = { ['name'] = 'weed_purple-haze_seed', ['label'] = 'Purple Haze Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A weed seed of Purple Haze' },
['weed_og-kush_seed']     = { ['name'] = 'weed_og-kush_seed', ['label'] = 'OGKush Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A weed seed of OG Kush' },
['weed_amnesia_seed']     = { ['name'] = 'weed_amnesia_seed', ['label'] = 'Amnesia Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A weed seed of Amnesia' },
['weed_ak47_seed']        = { ['name'] = 'weed_ak47_seed', ['label'] = 'AK47 Seed', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_seed.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A weed seed of AK47' },
['empty_weed_bag']        = { ['name'] = 'empty_weed_bag', ['label'] = 'Empty Weed Bag', ['weight'] = 0, ['type'] = 'item', ['image'] = 'weed_baggy_empty.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A small empty bag' },
['weed_nutrition']        = { ['name'] = 'weed_nutrition', ['label'] = 'Plant Fertilizer', ['weight'] = 2000, ['type'] = 'item', ['image'] = 'weed_nutrition.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Plant nutrition' },
['lockpick']              = { ['name'] = 'lockpick', ['label'] = 'Lockpick', ['weight'] = 100, ['type'] = 'item', ['image'] = 'lockpick.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'No description' },
['police_stormram']       = { ['name'] = 'police_stormram', ['label'] = 'Police Storm Ram', ['weight'] = 2000, ['type'] = 'item', ['image'] = 'police_stormram.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'No description' },
    

['nikon'] 			 	 	     = {['name'] = 'nikon', 					    ['label'] = 'Nikoff G900', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'nikon.png', 				['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Caught in 4K'},
	["gsrtestkit"] 					 = {["name"] = "gsrtestkit", 			  		["label"] = "GSR Field Test Kit", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "gsrtestkit.png", 			["unique"] = false,		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = 'A field GSR test kit containing several test strips'},
	["dnatestkit"] 					 = {["name"] = "dnatestkit", 			  		["label"] = "DNA Field Swab Kit", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "dnatestkit.png", 			["unique"] = false,		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = 'A field DNA swab kit containing several vials and swabs'},
	["drugtestkit"] 				 = {["name"] = "drugtestkit", 			  		["label"] = "Drug Test Kit", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "drugtestkit.png", 			["unique"] = false,		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = 'A multipanel field test kit used to test for popular drugs in a suspects saliva, it\'s probably accurate.'},
	["breathalyzer"] 				 = {["name"] = "breathalyzer", 			  		["label"] = "Breathalyzer", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "breathalyzer.png", 		["unique"] = false,		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = 'A vintage 2000\'s WiWang breathalyzer engraved Property of LSPD'},
	['accesstool']					 = {['name'] = 'accesstool', 					['label'] = 'Access Tool',			 	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'accesstool.png', 			['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Snap into an access tool.'},
	["fingerprintreader"] 			 = {["name"] = "fingerprintreader", 			["label"] = "Pro Tech XFR8001", 		["weight"] = 200, 		["type"] = "item", 		["image"] = "fingerprintreader.png", 	["unique"] = true,		["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = 'A Pro Tech mobile fingerprint reader that looks like it\'s seen better days, currently stuck in french.'},
	['sdcard'] 			 	 	     = {['name'] = 'sdcard', 					    ['label'] = 'SD Card', 				    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sdcard.png', 				['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'People still use these??'},
	['microfibercloth'] 	 	     = {['name'] = 'microfibercloth', 			    ['label'] = 'Microfiber Cloth', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'microfibercloth.png', 		['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Polyester, but fluffy'},
	['blox'] 	 					 = {['name'] = 'blox', 							['label'] = 'Blox Multisurface', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'blox.png', 				['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Kills everything!'},
	['fingerprintkit'] 	 			 = {['name'] = 'fingerprintkit', 			    ['label'] = 'Fingerprint Kit', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fingerprintkit.png', 		['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A small kit that includes fingerprint dust, chemicals, and a brush for developing fingerprints'},
	['mikrosil']	 	 			 = {['name'] = 'mikrosil', 						['label'] = 'Mikrosil',		 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'mikrosil.png', 			['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Two tubes of silicon casting material used to lift fingerprints from irregular surfaces'},
	['fingerprinttape']	 			 = {['name'] = 'fingerprinttape', 			    ['label'] = 'Fingerprint Tape', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'fingerprinttape.png', 		['unique'] = true,		['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Extra clear tape used to lift fingerprints from smooth, nonporous surfaces'},


    ['cone'] 						 = {['name'] = 'cone', 	  	  					['label'] = 'Cone', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cone.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An orange safety cone, or a hat if you\'ve had enough to drink.'},
	['barricade'] 					 = {['name'] = 'barricade', 	  	  			['label'] = 'Barricade', 				['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'barricade.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A police barricade to close off entry'},
	['roadblock'] 					 = {['name'] = 'roadblock', 	  	  			['label'] = 'Road Block', 				['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'roadblock.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A large sign to block off a road.'},
	['tent'] 						 = {['name'] = 'tent', 	  	  					['label'] = 'Canopy', 					['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'canopy.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable tent.'},
	['light'] 						 = {['name'] = 'light', 	  	  				['label'] = 'Mobile Lighting',			['weight'] = 20000, 	['type'] = 'item', 		['image'] = 'lighting.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable construction light.'},
	['medbag'] 					     = {['name'] = 'medbag', 	  					['label'] = 'Medical Bag', 				['weight'] = 3000, 		['type'] = 'item', 		['image'] = 'medbag.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A medical bag with medical supplies.'},
	['stoppedvehicles'] 			 = {['name'] = 'stoppedvehicles',  	  			['label'] = 'Caution Sign', 			['weight'] = 5000, 		['type'] = 'item', 		['image'] = 'cautionsign.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A sign to warn vehicles of other stopped vehicles ahead.'},
	['generator'] 					 = {['name'] = 'generator', 	  	  			['label'] = 'Generator', 				['weight'] = 20000, 	['type'] = 'item', 		['image'] = 'generator.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A portable generator to supply power in the field.'},
	['cooler'] 						 = {['name'] = 'cooler',		  	  			['label'] = 'Drink Cooler',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'cooler.png',	 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Keep your drinks cool!'},
	['spikestrip'] 					 = {['name'] = 'spikestrip',		  	  		['label'] = 'Spike Strip',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'spikestrip.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'No tires for you!'},
	['bomb'] 					     = {['name'] = 'bomb',			  	    		['label'] = 'Bomb',						['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bomb.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An actual bomb.'},
	['diffusedbomb'] 			     = {['name'] = 'diffusedbomb',			   		['label'] = 'Diffused Bomb',			['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bomb.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'An actual bomb, but with its wires cut and detonator disabled.'},
	['foldingchair'] 		 		 = {['name'] = 'foldingchair', 			   		['label'] = 'Folding Chair', 			['weight'] = 2000,  	['type'] = 'item', 		['image'] = 'foldingchair1.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Take a load off'},
	['foldingchair2'] 		 		 = {['name'] = 'foldingchair2', 			   	['label'] = 'Folding Chair', 			['weight'] = 2000, 	    ['type'] = 'item', 		['image'] = 'foldingchair2.png',		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Take a load off'},
	['campfire']				     = {['name'] = 'campfire',		  	    		['label'] = 'Campfire Kit',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'campfire.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A bundle of logs and a firestarter'},
	['camptent'] 				     = {['name'] = 'camptent',		  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent2'] 				     = {['name'] = 'camptent2', 	  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent2.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent3'] 				     = {['name'] = 'camptent3',		  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent3.png',	 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['camptent4'] 				     = {['name'] = 'camptent4', 	  	    		['label'] = 'Camping Tent',				['weight'] = 10000,		['type'] = 'item', 		['image'] = 'camptent4.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Your new home!'},
	['cdplayer'] 				     = {['name'] = 'cdplayer',		 	    		['label'] = 'CD Player',				['weight'] = 5000,		['type'] = 'item', 		['image'] = 'cdplayer.png',		 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Looks like it came fresh from the goodwill'},
	['picnictable']				     = {['name'] = 'picnictable',	  	    		['label'] = 'Folding Picnic Table',		['weight'] = 4000,		['type'] = 'item', 		['image'] = 'picnictable.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A folding picnic table that will never be as good as a real one'},
	['umbrella'] 				     = {['name'] = 'umbrella',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['umbrella2'] 				     = {['name'] = 'umbrella2',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['umbrella3'] 				     = {['name'] = 'umbrella3',		  	    		['label'] = 'Beach Umbrella',			['weight'] = 4000,		['type'] = 'item', 		['image'] = 'umbrella.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just because you\'re outside doesn\'t mean you have to burn'},
	['beachtowel'] 				     = {['name'] = 'beachtowel',	 	    		['label'] = 'Beach Towel',				['weight'] = 2000,		['type'] = 'item', 		['image'] = 'beachtowel.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Grants +5 to avoiding sand in places you don\'t wan it.'},
	['boombox'] 				     = {['name'] = 'boombox',		  	    		['label'] = 'Boombox',					['weight'] = 5000,		['type'] = 'item', 		['image'] = 'boombox.png',				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A vintage WiWang Boom Box, circa 1993'},
	['miniradio'] 				     = {['name'] = 'miniradio',		 	    		['label'] = 'Mini Radio',				['weight'] = 1000,		['type'] = 'item', 		['image'] = 'miniradio.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A little portable radio'},
	['monobloc'] 					 = {['name'] = 'monobloc',			     		['label'] = 'Monobloc Chair',			['weight'] = 5000,		['type'] = 'item', 		['image'] = 'monobloc.png',	 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The classic white chair that looks bad everywhere'},
	['bbq'] 					     = {['name'] = 'bbq',			  	    		['label'] = 'BBQ',						['weight'] = 10000,		['type'] = 'item', 		['image'] = 'bbq.png',		 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ooooh, we gonna have a cookout'},
	['foldingtable'] 				 = {['name'] = 'foldingtable',			  	   	['label'] = 'Folding Table',			['weight'] = 5000,		['type'] = 'item', 		['image'] = 'foldingtable.png',		 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just need some red solo cups'},

---- container items ----------

	['containerkey'] 			 	 = {['name'] = 'containerkey', 						['label'] = 'Padlock Key', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'labkey.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A generic padlock key stamped San Andreas Lock & Key'},
	['storagecontract'] 			 = {['name'] = 'storagecontract', 				['label'] = 'Storage Contract', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'printerdocument.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A rental agreement for a storage container.'},
	['anglegrinder']		 		 = {['name'] = 'anglegrinder', 			    	['label'] = 'Angle Grinder', 			['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'anglegrinder.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = '"A PowerMetal H420 Angle Grinder has never been used for an illegal activity. Ever." - Former CEO of PowerMetal Inc"'},


--- food items and ingredients -----

	['burger']				 		 = {['name'] = 'burger',	 		  	  		['label'] = 'Burger',					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'burger.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A hamburger made out of meat on a bun with cheese, add ketchup if you want"},
	['hotdog'] 				 		 = {['name'] = 'hotdog', 			  	  		['label'] = 'Hot Dog',					['weight'] = 200, 		['type'] = 'item', 		['image'] = 'hotdog.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A sandwich"},
	["burger_raw"] 				 	 = {["name"] = "burger_raw", 			 		["label"] = "Hamburger Patty",			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A raw, frozen hamburger patty"},
	["burger_bun"] 				 	 = {["name"] = "burger_bun", 			 	  	["label"] = "Bun", 						["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_bun.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Minutes from being stale"},
	["americancheese"] 			 	 = {["name"] = "americancheese",		 	  	["label"] = "American Cheese",			["weight"] = 125, 		["type"] = "item", 		["image"] = "americancheese.png",    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "The classic plastic cheese everyone loves"},
	['coldweiner'] 					 = {['name'] = 'coldweiner',	 		  		['label'] = 'coldweiner',				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'coldweiner.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just a single serving of cold weiner'},
	['hotdogbun']					 = {['name'] = 'hotdogbun',				  		['label'] = 'hotdogbun',				['weight'] = 125, 		['type'] = 'item', 		['image'] = 'hotdogbun.png',			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A nice bun to hold that weiner'},

    
    -- QS Phone
    classic_phone = {
        ["name"] = "classic_phone",
        ["label"] = "Classic Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "classic_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    black_phone = {
        ["name"] = "black_phone",
        ["label"] = "Black Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "black_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    blue_phone = {
        ["name"] = "blue_phone",
        ["label"] = "Blue Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "blue_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    gold_phone = {
        ["name"] = "gold_phone",
        ["label"] = "Gold Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "gold_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    red_phone = {
        ["name"] = "red_phone",
        ["label"] = "Red Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "red_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    green_phone = {
        ["name"] = "green_phone",
        ["label"] = "Green Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "green_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    greenlight_phone = {
        ["name"] = "greenlight_phone",
        ["label"] = "Green Light Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "greenlight_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    pink_phone = {
        ["name"] = "pink_phone",
        ["label"] = "Pink Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "pink_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    white_phone = {
        ["name"] = "white_phone",
        ["label"] = "White Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "white_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_phone = {
        ["name"] = "wet__phone",
        ["label"] = "Wet Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_classic_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_classic_phone = {
        ["name"] = "wet_classic_phone",
        ["label"] = "Wet Classic Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_classic_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_black_phone = {
        ["name"] = "wet_black_phone",
        ["label"] = "Wet Black Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_black_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_blue_phone = {
        ["name"] = "wet_blue_phone",
        ["label"] = "Wet Blue Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_blue_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_gold_phone = {
        ["name"] = "wet_gold_phone",
        ["label"] = "Wet Gold Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_gold_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_red_phone = {
        ["name"] = "wet_red_phone",
        ["label"] = "Wet Red Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_red_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Did you really think that swimming in the ocean with your phone was a good idea?"
    },
    
    wet_green_phone = {
        ["name"] = "wet_green_phone",
        ["label"] = "Wet Green Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_green_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_greenlight_phone = {
        ["name"] = "wet_greenlight_phone",
        ["label"] = "Wet Green Light Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_greenlight_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_pink_phone = {
        ["name"] = "wet_pink_phone",
        ["label"] = "Wet Pink Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_pink_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    wet_white_phone = {
        ["name"] = "wet_white_phone",
        ["label"] = "Wet White Phone",
        ["weight"] = 700,
        ["type"] = "item",
        ["image"] = "wet_white_phone.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "They say that Quasar Smartphone is the same as an iPhone, what do you think?"
    },
    
    phone_module = {
        ["name"] = "phone_module",
        ["label"] = "Phone Module",
        ["weight"] = 300,
        ["type"] = "item",
        ["image"] = "phone_module.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "It seems that we can fix a wet phone with this module, interesting."
    },
    
    powerbank = {
        ["name"] = "powerbank",
        ["label"] = "Power Bank",
        ["weight"] = 150,
        ["type"] = "item",
        ["image"] = "powerbank.png",
        ["unique"] = true,
        ["useable"] = true,
        ["shouldClose"] = true,
        ["combinable"] = nil,
        ["description"] = "Incredible portable charger!"
    },

    -- Smart Taser
    ['taser_cartridge']   = {
        ['name'] = 'taser_cartridge',                             
        ['label'] = 'Taser Cartridge',              
        ['weight'] = 1500,         
        ['type'] = 'item',         
        ['image'] = nil,                   
        ['unique'] = false,         
        ['useable'] = true,     
        ['shouldClose'] = true,      
        ['combinable'] = nil,   
        ['description'] = 'Ammo for your taser'
    },

    ['contract'] = {['name'] = 'contract', ['label'] = 'Contract', ['weight'] = 1, ['type'] = 'item', ['image'] = 'contract.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'A contract'},
    
    ['protein']         = {['name']     = 'protein',        ['label'] = 'Protein',          ['weight'] = 1000, ['type'] = 'item', ['image'] = 'protein.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Protein'},
    ['creatine']        = {['name']     = 'creatine',       ['label'] = 'Creatine',         ['weight'] = 1000, ['type'] = 'item', ['image'] = 'creatine.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Creatine'},
    ['preworkout']      = {['name']     = 'preworkout',     ['label'] = 'Preworkout',       ['weight'] = 1000, ['type'] = 'item', ['image'] = 'preworkout.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Preworkout'},
    ['testosterone']    = {['name']     = 'testosterone',   ['label'] = 'Testosterone',     ['weight'] = 1000, ['type'] = 'item', ['image'] = 'testosterone.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Testosterone'},

   -- wasabi_ambulance
    medbag        = { name = 'medbag',        label = 'Medical Bag',    weight = 2500, type = 'item', image = 'medbag.png',     unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'A bag of medic tools' },
    tweezers      = { name = 'tweezers',      label = 'Tweezers',       weight = 50,   type = 'item', image = 'tweezers.png',   unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'For picking out bullets' },
    suturekit     = { name = 'suturekit',     label = 'Suture Kit',     weight = 60,   type = 'item', image = 'suturekit.png',  unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'For stitching your patients' },
    icepack       = { name = 'icepack',       label = 'Ice Pack',       weight = 110,  type = 'item', image = 'icepack.png',    unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'To help reduce swelling' },
    burncream     = { name = 'burncream',     label = 'Burn Cream',     weight = 125,  type = 'item', image = 'burncream.png',  unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'To help with burns' },
    defib         = { name = 'defib',         label = 'Defibrillator',  weight = 1120, type = 'item', image = 'defib.png',      unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'Used to revive patients' },
    sedative      = { name = 'sedative',      label = 'Sedative',       weight = 20,   type = 'item', image = 'sedative.png',   unique = false, useable = true,  shouldClose = true, combinable = nil,   description = 'If needed, this will sedate patient' },
    morphine30    = { name = 'morphine30',    label = 'Morphine 30MG',  weight = 2,    type = 'item', image = 'morphine30.png', unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    morphine15    = { name = 'morphine15',    label = 'Morphine 15MG',  weight = 2,    type = 'item', image = 'morphine15.png', unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    perc30        = { name = 'perc30',        label = 'Percocet 30MG',  weight = 2,    type = 'item', image = 'perc30.png',     unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    perc10        = { name = 'perc10',        label = 'Percocet 10MG',  weight = 2,    type = 'item', image = 'perc10.png',     unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    perc5         = { name = 'perc5',         label = 'Percocet 5MG',   weight = 2,    type = 'item', image = 'perc5.png',      unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    vic10         = { name = 'vic10',         label = 'Vicodin 10MG',   weight = 2,    type = 'item', image = 'vic10.png',      unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },
    vic5          = { name = 'vic5',          label = 'Vicodin 5MG',    weight = 2,    type = 'item', image = 'vic5.png',       unique = false, useable = true,  shouldClose = true, combinable = true,  description = 'A controlled substance to control pain' },

    --JIM-CATCAFE
bmochi                      = { name = "bmochi", label = "Blue Mochi", weight = 100, type = "item", image = "mochiblue.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
pmochi                      = { name = "pmochi", label = "Pink Mochi", weight = 100, type = "item", image = "mochipink.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
gmochi                      = { name = "gmochi", label = "Green Mochi", weight = 100, type = "item", image = "mochigreen.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
omochi                      = { name = "omochi", label = "Orange Mochi", weight = 100, type = "item", image = "mochiorange.png",		unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

--Drinks
bobatea                     = { name = "bobatea", label = "Boba Tea", weight = 100, type = "item", image = "bubbletea.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },
bbobatea                    = { name = "bbobatea", label = "Blue Boba Tea", weight = 100, type = "item", image = "bubbleteablue.png",	unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },
gbobatea                    = { name = "gbobatea", label = "Green Boba Tea", weight = 100, type = "item", image = "bubbleteagreen.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },
pbobatea                    = { name = "pbobatea", label = "Pink Boba Tea", weight = 100, type = "item", image = "bubbleteapink.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },
obobatea                    = { name = "obobatea", label = "Orange Boba Tea", weight = 100, type = "item", image = "bubbleteaorange.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },

nekolatte                   = { name = "nekolatte", label = "Neko Latte", weight = 100, type = "item", image = "latte.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(20, 30) },
catcoffee                   = { name = "catcoffee", label = "Cat Coffee", weight = 100, type = "item", image = "catcoffee.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(20, 30) },

sake                        = { name = "sake", label = "Sake", weight = 100, type = "item", image = "sake.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },

miso                        = { name = "miso", label = "Miso Soup", weight = 100, type = "item", image = "miso.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
cake                        = { name = "cake", label = "Strawberry Cake", weight = 100, type = "item", image = "cake.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
bento                       = { name = "bento", label = "Bento Box", weight = 500, type = "item", image = "bento.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

riceball                    = { name = "riceball", label = "Neko Onigiri", weight = 100, type = "item", image = "catrice.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

nekocookie                  = { name = "nekocookie", label = "Neko Cookie", weight = 100, type = "item", image = "catcookie.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
nekodonut                   = { name = "nekodonut", label = "Neko Donut", weight = 100, type = "item", image = "catdonut.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

--Ingredients
boba                        = { name = "boba", label = "Boba", weight = 100, type = "item", image = "boba.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
flour                       = { name = "flour", label = "Flour", weight = 100, type = "item", image = "flour.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
rice                        = { name = "rice", label = "Bowl of Rice", weight = 100, type = "item", image = "rice.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
sugar                       = { name = "sugar", label = "Sugar", weight = 100, type = "item", image = "sugar.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
nori                        = { name = "nori", label = "Nori", weight = 100, type = "item", image = "nori.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "" },
blueberry                   = { name = "blueberry", label = "Blueberry", weight = 100, type = "item", image = "blueberry.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
strawberry                  = { name = "strawberry", label = "Strawberry", weight = 100, type = "item", image = "strawberry.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
orange                      = { name = "orange", label = "Orange", weight = 200, type = "item", image = "orange.png", unique = false, usable = false, shouldClose = false, combinable = nil, description = "An Orange." },
mint                        = { name = "mint", label = "Matcha", weight = 100, type = "item", image = "matcha.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "" },
tofu                        = { name = "tofu", label = "Tofu", weight = 100, type = "item", image = "tofu.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

mocha                       = { name = "mocha", label = "Mocha Meow", weight = 100, type = "item", image = "mochameow.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", thirst = math.random(40, 50) },

cakepop                     = { name = "cakepop", label = "Cat Cake-Pop", weight = 100, type = "item", image = "cakepop.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
pancake                     = { name = "pancake", label = "PawCake", weight = 100, type = "item", image = "pawcakes.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
pizza                       = { name = "pizza", label = "Kitty Pizza", weight = 100, type = "item", image = "catpizza.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
purrito                     = { name = "purrito", label = "Purrito", weight = 100, type = "item", image = "purrito.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

noodlebowl                  = { name = "noodlebowl", label = "Bowl of Noodles", weight = 100, type = "item", image = "noodlebowl.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },
noodles                     = { name = "noodles", label = "Instant Noodles", weight = 100, type = "item", image = "noodles.png", unique = false, usable = false, shouldClose = true, combinable = nil, description = "" },
ramen						= { name = "ramen", label = "Bowl of Ramen", weight = 100, type = "item", image = "ramen.png", unique = false, usable = true, shouldClose = true, combinable = nil, description = "", hunger= math.random(40, 50) },

milk                        = { name = "milk", label = "Milk", weight = 300, type = "item",  image = "burger-milk.png",  unique = false,   usable = true,   shouldClose = true,   combinable = nil,  description = "Carton of Milk", thirst = math.random(35, 54) },
onion                       = { name = "onion", label = "Onion", weight = 500, type = "item",  image = "burger-onion.png", unique = false,   usable = false,  shouldClose = false,  combinable = nil,  description = "An onion"},

    -- Prescription Stuff 
    prescription 			= {name = 'prescription',			    label = 'Prescription Receipt',			weight = 100,			type = 'item',		image = 'prescription.png',			        unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    prescription_pad 		= {name = 'prescription_pad',			label = 'Prescription Pad',			weight = 100,			type = 'item',		image = 'prescription_pad.png',				unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    adrenaline 			    = {name = 'adrenaline',				    label = 'Adrenaline',			        weight = 100,			type = 'item',		image = 'adrenaline.png',				unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},

    --oxy 			 	    = {name = 'oxy',				        label = 'Oxycodone',			        weight = 100,			type = 'item',		image = 'oxy.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    xanax 			 	    = {name = 'xanax',				        label = 'Xanax',				weight = 100,			type = 'item',		image = 'xanax.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    steroids 			    = {name = 'steroids',				    label = 'Steroids',			        weight = 100,			type = 'item',		image = 'steroids.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    valium 			 	    = {name = 'valium',				        label = 'Valium',			        weight = 100,			type = 'item',		image = 'valium.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},

    -- Lean Stuff
    cough_syrup 			= {name = 'cough_syrup',			    label = 'Cough Syrup',			        weight = 1000,			type = 'item',		image = 'cough_syrup.png',				unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = 'Warning: Contains Codeine and Promethazine'},
    sprunk_bottle 			= {name = 'sprunk_bottle',			    label = 'Bottle of Sprunk',			weight = 1000,			type = 'item',		image = 'sprunk_bottle.png',				unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    lean 			 	    = {name = 'lean',				        label = 'Cup of Lean',			        weight = 1000,			type = 'item',		image = 'lean.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = 'That Purple Sizzurp'},
    lean_cup 			    = {name = 'lean_cup',				    label = 'Styrofoam Cup',			weight = 1000,			type = 'item',		image = 'lean_cup.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = ''},
    narkan 			        = {name = 'narkan',				        label = 'Narkan',			        weight = 1000,			type = 'item',		image = 'narkan.png',					unique = true,		useable = true,		shouldClose = true,	   combinable = nil,   description = 'Administer to prevent fatalities in overdosing patients'},

    -- RTX TV
    ['tvremote'] = {['name'] = 'tvremote', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'tvremote.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'TV Remote'},
    ['vehicletv'] = {['name'] = 'vehicletv', ['label'] = 'TV Remote', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'vehicletv.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Vehicle TV'},

    --BurgerShot
	["potato"] 						 = {["name"] = "potato",					["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Potatos"},
	["slicedpotato"] 				 = {["name"] = "slicedpotato",				["label"] = "Sliced Potatoes",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedpotato.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Potato"},
	["slicedonion"] 				 = {["name"] = "slicedonion",				["label"] = "Sliced Onions",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedonion.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Onion"},
	["icecream"] 					 = {["name"] = "icecream",					["label"] = "Ice Cream",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-icecream.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Ice Cream."},
	["milk"] 						 = {["name"] = "milk",						["label"] = "Milk",						["weight"] = 500,		["type"] = "item",		["image"] = "burger-milk.png",			["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Carton of Milk", ['thirst'] = math.random(35, 54) },
	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["onion"] 						 = {["name"] = "onion",						["label"] = "Onion",					["weight"] = 500,		["type"] = "item",		["image"] = "burger-onion.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "An onion"},
	["frozennugget"] 				 = {["name"] = "frozennugget",				["label"] = "Frozen Nuggets",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-frozennugget.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Frozen Nuggets"},
	["cheddar"] 					 = {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
	["burgerbun"] 		 			 = {["name"] = "burgerbun",       		    ["label"] = "Burger Bun",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "burgerbun.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Some big burger brother"},
	["burgerpatty"] 				 = {["name"] = "burgerpatty",				["label"] = "Burger Patty",				["weight"] = 500,		["type"] = "item",		["image"] = "burgerpatty.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Raw Patty"},
	["burgermeat"] 				 	 = {["name"] = "burgermeat",				["label"] = "Burger Meat",				["weight"] = 500,		["type"] = "item",		["image"] = "burgermeat.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Cooked Burger Meat"},
	["milkshake"] 					 = {["name"] = "milkshake",					["label"] = "Milkshake",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-milkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "BurgerShot Milkshake", ['thirst'] = math.random(35, 54) },
	["shotnuggets"] 				 = {["name"] = "shotnuggets", 			  	["label"] = "Shot Nuggets", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotnuggets.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Nuggets", ['hunger'] = math.random(40, 50) },
	["shotrings"] 				 	 = {["name"] = "shotrings", 			  	["label"] = "Ring Shots", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotrings.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Onion Rings", ['hunger'] = math.random(40, 50) },
	["heartstopper"] 			 	 = {["name"] = "heartstopper",       		["label"] = "HeartStopper",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-heartstopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Heartstopper", ['hunger'] = math.random(50, 60) },
	["shotfries"] 		 			 = {["name"] = "shotfries",       			["label"] = "Shot Fries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-fries.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Shot Fries", ['hunger'] = math.random(40, 50) },
	["moneyshot"] 		 			 = {["name"] = "moneyshot",       			["label"] = "Money Shot",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-moneyshot.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Money Shot", ['hunger'] = math.random(40, 50) },
	["meatfree"] 		 			 = {["name"] = "meatfree",       			["label"] = "Meat Free",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-meatfree.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Meat Free", ['hunger'] = math.random(40, 50) },
	["bleeder"] 		 			 = {["name"] = "bleeder",       			["label"] = "The Bleeder",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-bleeder.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "The Bleeder", ['hunger'] = math.random(40, 50) },
	["bscoffee"] 		 			 = {["name"] = "bscoffee",       			["label"] = "BurgerShot Coffee",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-coffee.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Coffee", ['thirst'] = math.random(35, 54) },
	["bscoke"] 		 				 = {["name"] = "bscoke",       				["label"] = "BurgerShot Coke",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-softdrink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cola", ['thirst'] = math.random(35, 54) },
	["torpedo"] 		 			 = {["name"] = "torpedo",       			["label"] = "Torpedo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-torpedo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Torpedo", ['hunger'] = math.random(40, 50) },
	["rimjob"] 		 				 = {["name"] = "rimjob",  	     			["label"] = "Rim Job",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-rimjob.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Donut", ['hunger'] = math.random(40, 50) },
	["creampie"] 		 			 = {["name"] = "creampie",  	     		["label"] = "Creampie",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-creampie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Apple Pie", ['hunger'] = math.random(40, 50) },
	["cheesewrap"] 					 = {["name"] = "cheesewrap", 				["label"] = "BS Cheese Wrap", 	     	["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-chickenwrap.png", 	["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cheese Wrap", ['hunger'] = math.random(40, 50) },
	["chickenwrap"] 				 = {["name"] = "chickenwrap", 				["label"] = "BS Goat Cheese Wrap", 	    ["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-goatwrap.png", 		["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Goat Cheese Wrap", ['hunger'] = math.random(40, 50)},
	["murderbag"] 					 = {["name"] = "murderbag", 				["label"] = "Murder Bag", 	   			["weight"] = 0, 		["type"] = "item", 		["image"] = "burgerbag.png", 			["unique"] = true,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Grab a Murder Bag of Burgers", },



    --AUTO GENERATED BY 17MOVEMENT VEHICLE DIRT SYSTEM
    ['mov_advanced_wax']                     = { ['name'] = 'mov_advanced_wax', ['label'] = 'Advanced Wax', ['weight'] = 10, ['type'] = 'item', ['image'] = 'mov_advanced_wax.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['description'] = 'After application on the car, the car is highly resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.'},
    ['mov_basic_ceramic']                     = { ['name'] = 'mov_basic_ceramic', ['label'] = 'Basic Ceramic', ['weight'] = 10, ['type'] = 'item', ['image'] = 'mov_basic_ceramic.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['description'] = 'After application on the car, dirt does not stick to the bodywork, making it much easier to wash off at the car wash. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.'},
    ['mov_basic_wax']                     = { ['name'] = 'mov_basic_wax', ['label'] = 'Basic Wax', ['weight'] = 10, ['type'] = 'item', ['image'] = 'mov_basic_wax.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['description'] = 'After application on the car, the car is resistant to external dirt, such as driving on unpaved roads, etc. It will still get dirty, but much more slowly. It lasts about 3 days on the car, after which time reapplication is required to maintain the effect.'},
    ['mov_advanced_ceramic']                     = { ['name'] = 'mov_advanced_ceramic', ['label'] = 'Premium Ceramic', ['weight'] = 10, ['type'] = 'item', ['image'] = 'mov_advanced_ceramic.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['description'] = 'After application on the car, dirt does not stick to the bodywork at all, so at the car wash, it only needs to be rinsed off. It lasts about 7 days on the car, after which time reapplication is required to maintain the effect.'},





    -- Tools
	['drug_shears'] 			    = {['name'] = 'drug_shears', 		        	['label'] = 'Trimming Shears', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'drug_shears.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A set of high quality trimming shears.'},	
	['drug_grinder'] 			    = {['name'] = 'drug_grinder', 		        	['label'] = 'Tobacco Grinder', 		    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'drug_grinder.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A tobacco grinder or something more..'},	
	['rollingpapers'] 				= {['name'] = 'rollingpapers', 					['label'] = 'Rolling Papers', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'rollingpapers.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	['lighter'] 			 		= {['name'] = 'lighter', 						['label'] = 'Lighter', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A lighter, everybody has to have one of these on hand!'},
	['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			    ['label'] = 'Resealable Bag', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['gummybearmould'] 				= {['name'] = 'gummybearmould', 			    ['label'] = 'Gummy Bear Mould', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'gummybearmould.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A BPA free mould, shaped like a bear!'},
	['wwmenu'] 						= {['name'] = 'wwmenu', 			    		['label'] = 'White Widow Menu', 		['weight'] = 10, 		['type'] = 'item', 		['image'] = 'wwmenu.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A menu for the white widoe medical dispensary!'},

	-- Ingredients
	['gelatine'] 					= {['name'] = 'gelatine', 			    		['label'] = 'Gelatine', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'gelatine.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A packet of gelatine, good for making sweets!'},
	['rawhoney'] 					= {['name'] = 'rawhoney', 			    		['label'] = 'Raw Honey', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'rawhoney.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A jar of rawhoney, good for making sweets!'},

	-- Crops
	['weed_skunk_cbd_crop'] 	 	= {['name'] = 'weed_skunk_cbd_crop', 			['label'] = 'CBD Skunk Crop', 			['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd_crop.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Skunk!'},
	['weed_og-kush_cbd_crop'] 	 	= {['name'] = 'weed_og-kush_cbd_crop', 			['label'] = 'CBD OG Kush Crop', 		['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd_crop.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD OG Kush'},
	['weed_white-widow_cbd_crop'] 	= {['name'] = 'weed_white-widow_cbd_crop',  	['label'] = 'CBD White Widow Crop', 	['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd_crop.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD White Widow'},
	['weed_ak47_cbd_crop'] 		 	= {['name'] = 'weed_ak47_cbd_crop', 	    	['label'] = 'CBD AK 47 Crop', 			['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd_crop.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD AK47!'},
	['weed_amnesia_cbd_crop'] 		= {['name'] = 'weed_amnesia_cbd_crop',  		['label'] = 'CBD Amnesia Crop', 		['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd_crop.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Amnesia!'},
	['weed_purple-haze_cbd_crop'] 	= {['name'] = 'weed_purple-haze_cbd_crop', 	    ['label'] = 'CBD Purple-Haze Crop', 	['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_cbd_crop.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Purple-Haze!'},
	['weed_gelato_cbd_crop'] 		= {['name'] = 'weed_gelato_cbd_crop',  			['label'] = 'CBD Gelato Crop', 			['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_gelato_cbd_crop.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Gelato!'},
	['weed_zkittlez_cbd_crop'] 		= {['name'] = 'weed_zkittlez_cbd_crop',  		['label'] = 'CBD Zkittlez Crop', 		['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_cbd_crop.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Zkittlez!'},

	-- Bags
	['weed_skunk_cbd'] 			 	= {['name'] = 'weed_skunk_cbd', 				['label'] = 'CBD Skunk 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Skunk!'},
	['weed_og-kush_cbd'] 		 	= {['name'] = 'weed_og-kush_cbd', 				['label'] = 'CBD OGKush 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD OG Kush!'},
	['weed_white-widow_cbd'] 	 	= {['name'] = 'weed_white-widow_cbd', 	    	['label'] = 'CBD White Widow 2g', 		['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD White Widow!'},
	['weed_ak47_cbd'] 			 	= {['name'] = 'weed_ak47_cbd', 					['label'] = 'CBD AK47 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD AK47!'},
	['weed_amnesia_cbd'] 			= {['name'] = 'weed_amnesia_cbd',  				['label'] = 'CBD Amnesia 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Amnesia!'},
	['weed_purple-haze_cbd'] 		= {['name'] = 'weed_purple-haze_cbd', 	    	['label'] = 'CBD Purple-Haze 2g', 		['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_cbd.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Purple-Haze!'},
	['weed_gelato_cbd'] 			= {['name'] = 'weed_gelato_cbd',  				['label'] = 'CBD Gelato 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_gelato_cbd.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Gelato!'},
	['weed_zkittlez_cbd'] 			= {['name'] = 'weed_zkittlez_cbd',  			['label'] = 'CBD Zkittles 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Zkittlez!'},
	
	-- Joints
	['weed_skunk_cbd_joint'] 	    = {['name'] = 'weed_skunk_cbd_joint', 			['label'] = 'CBD Skunk Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that skunk son!'},
	['weed_og-kush_cbd_joint'] 		= {['name'] = 'weed_og-kush_cbd_joint', 		['label'] = 'CBD OG Kush Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that og kush son!'},
	['weed_white-widow_cbd_joint'] 	= {['name'] = 'weed_white-widow_cbd_joint', 	['label'] = 'CBD White Widow Joint', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd_joint.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that white widow son!'},
	['weed_ak47_cbd_joint'] 		= {['name'] = 'weed_ak47_cbd_joint', 			['label'] = 'CBD AK 47 Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that ak47 son!'},
	['weed_amnesia_cbd_joint'] 		= {['name'] = 'weed_amnesia_cbd_joint',  		['label'] = 'CBD Amnesia Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that amnesia son!'},
	['weed_purple-haze_cbd_joint'] 	= {['name'] = 'weed_purple-haze_cbd_joint', 	['label'] = 'CBD Purple-Haze Joint', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that purple haze son!'},
	['weed_gelato_cbd_joint'] 		= {['name'] = 'weed_gelato_cbd_joint',  		['label'] = 'CBD Gelato Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that gelato son!'},
	['weed_zkittlez_cbd_joint'] 	= {['name'] = 'weed_zkittlez_cbd_joint',  		['label'] = 'CBD Zkittlez Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that zkittlez son!'},

	-- Edibles
	['gummy_skunk_cbd'] 			= {['name'] = 'gummy_skunk_cbd', 			    ['label'] = 'CBD Skunk Gummy', 			['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_skunk_cbd.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd skunk gummy bear!'},
	['gummy_og-kush_cbd'] 			= {['name'] = 'gummy_og-kush_cbd', 			    ['label'] = 'CBD OG-Kush Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_og-kush_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd og kush gummy bear!'},
	['gummy_white-widow_cbd'] 		= {['name'] = 'gummy_white-widow_cbd', 			['label'] = 'CBD White-Widow Gummy', 	['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_white-widow_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd white widow gummy bear!'},
	['gummy_ak47_cbd'] 				= {['name'] = 'gummy_ak47_cbd', 			    ['label'] = 'CBD AK47 Gummy', 			['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_ak47_cbd.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd ak47 gummy bear!'},
	['gummy_amnesia_cbd'] 			= {['name'] = 'gummy_amnesia_cbd', 			    ['label'] = 'CBD Amnesia Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_amnesia_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd og kush gummy bear!'},
	['gummy_purple-haze_cbd'] 		= {['name'] = 'gummy_purple-haze_cbd', 			['label'] = 'CBD Purple-Haze Gummy', 	['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_purple-haze_cbd.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd purple haze gummy bear!'},
	['gummy_gelato_cbd'] 			= {['name'] = 'gummy_gelato_cbd', 			    ['label'] = 'CBD Gelato Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_gelato_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd gelato gummy bear!'},
	['gummy_zkittlez_cbd'] 			= {['name'] = 'gummy_zkittlez_cbd', 			['label'] = 'CBD Zkittlez Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_zkittlez_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd zkittlez gummy bear!'},
	




-- Tools
	['drug_shears'] 			    = {['name'] = 'drug_shears', 		        	['label'] = 'Trimming Shears', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'drug_shears.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A set of high quality trimming shears.'},	
	['drug_grinder'] 			    = {['name'] = 'drug_grinder', 		        	['label'] = 'Tobacco Grinder', 		    ['weight'] = 100, 		['type'] = 'item', 		['image'] = 'drug_grinder.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A tobacco grinder or something more..'},	
	['rollingpapers'] 				= {['name'] = 'rollingpapers', 					['label'] = 'Rolling Papers', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'rollingpapers.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	['lighter'] 			 		= {['name'] = 'lighter', 						['label'] = 'Lighter', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A lighter, everybody has to have one of these on hand!'},
	['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			    ['label'] = 'Resealable Bag', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['gummybearmould'] 				= {['name'] = 'gummybearmould', 			    ['label'] = 'Gummy Bear Mould', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'gummybearmould.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A BPA free mould, shaped like a bear!'},
	['bbmenu'] 						= {['name'] = 'bbmenu', 			    		['label'] = 'Best Buds Menu', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'bbmenu.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A menu for the best buds medical dispensary!'},

	-- Ingredients
	['gelatine'] 					= {['name'] = 'gelatine', 			    		['label'] = 'Gelatine', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'gelatine.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A packet of gelatine, good for making sweets!'},
	['rawhoney'] 					= {['name'] = 'rawhoney', 			    		['label'] = 'Raw Honey', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'rawhoney.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A jar of rawhoney, good for making sweets!'},

	-- Crops
	['weed_skunk_cbd_crop'] 	 	= {['name'] = 'weed_skunk_cbd_crop', 			['label'] = 'CBD Skunk Crop', 			['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd_crop.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Skunk!'},
	['weed_og-kush_cbd_crop'] 	 	= {['name'] = 'weed_og-kush_cbd_crop', 			['label'] = 'CBD OG Kush Crop', 		['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD OG Kush'},
	['weed_white-widow_cbd_crop'] 	= {['name'] = 'weed_white-widow_cbd_crop',  	['label'] = 'CBD White Widow Crop', 	['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd_crop.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD White Widow'},
	['weed_ak47_cbd_crop'] 		 	= {['name'] = 'weed_ak47_cbd_crop', 	    	['label'] = 'CBD AK 47 Crop', 			['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd_crop.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD AK47!'},
	['weed_amnesia_cbd_crop'] 		= {['name'] = 'weed_amnesia_cbd_crop',  		['label'] = 'CBD Amnesia Crop', 		['weight'] = 1200, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A crop of CBD Amnesia!'},

	-- Bags
	['weed_skunk_cbd'] 			 	= {['name'] = 'weed_skunk_cbd', 				['label'] = 'CBD Skunk 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Skunk!'},
	['weed_og-kush_cbd'] 		 	= {['name'] = 'weed_og-kush_cbd', 				['label'] = 'CBD OGKush 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD OG Kush!'},
	['weed_white-widow_cbd'] 	 	= {['name'] = 'weed_white-widow_cbd', 	    	['label'] = 'CBD White Widow 2g', 		['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD White Widow!'},
	['weed_ak47_cbd'] 			 	= {['name'] = 'weed_ak47_cbd', 					['label'] = 'CBD AK47 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD AK47!'},
	['weed_amnesia_cbd'] 			= {['name'] = 'weed_amnesia_cbd',  				['label'] = 'CBD Amnesia 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of CBD Amnesia!'},
	
	-- Joints
	['weed_skunk_cbd_joint'] 	    = {['name'] = 'weed_skunk_cbd_joint', 			['label'] = 'CBD Skunk Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that skunk son!'},
	['weed_og-kush_cbd_joint'] 		= {['name'] = 'weed_og-kush_cbd_joint', 		['label'] = 'CBD OG Kush Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that og kush son!'},
	['weed_white-widow_cbd_joint'] 	= {['name'] = 'weed_white-widow_cbd_joint', 	['label'] = 'CBD White Widow Joint', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_cbd_joint.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that white widow son!'},
	['weed_ak47_cbd_joint'] 		= {['name'] = 'weed_ak47_cbd_joint', 			['label'] = 'CBD AK 47 Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_cbd_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that ak47 son!'},
	['weed_amnesia_cbd_joint'] 		= {['name'] = 'weed_amnesia_cbd_joint',  		['label'] = 'CBD Amnesia Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_cbd_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Light up that amnesia son!'},

	-- Edibles
	['gummy_skunk_cbd'] 			= {['name'] = 'gummy_skunk_cbd', 			    ['label'] = 'CBD Skunk Gummy', 			['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_skunk_cbd.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd skunk gummy bear!'},
	['gummy_og-kush_cbd'] 			= {['name'] = 'gummy_og-kush_cbd', 			    ['label'] = 'CBD OG-Kush Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_og-kush_cbd.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd og kush gummy bear!'},
	['gummy_white-widow_cbd'] 		= {['name'] = 'gummy_white-widow_cbd', 			['label'] = 'CBD White-Widow Gummy', 	['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_white-widow_cbd.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd white widow gummy bear!'},
	['gummy_ak47_cbd'] 				= {['name'] = 'gummy_ak47_cbd', 			    ['label'] = 'CBD AK47 Gummy', 			['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_ak47_cbd.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd ak47 gummy bear!'},
	['gummy_amnesia_cbd'] 			= {['name'] = 'gummy_amnesia_cbd', 			    ['label'] = 'CBD Amnesia Gummy', 		['weight'] = 4, 		['type'] = 'item', 		['image'] = 'gummy_amnesia_cbd.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A edible cbd og kush gummy bear!'},
	


    
-- Hunting
	["skin_shark"]         	     = {["name"] = "skin_shark",         		["label"] = "Shark Skin",    			["weight"] = 1750,      ["type"] = "item",      ["image"] = "skin_shark.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Shark skin. Highly illegal!"},
	["skin_dolphin"]             = {["name"] = "skin_dolphin",         		["label"] = "Dolphin Skin",    			["weight"] = 850,       ["type"] = "item",      ["image"] = "skin_dolphin.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Dolphin skin. Highly illegal!"},
	["skin_stingray"]         	 = {["name"] = "skin_stingray",         	["label"] = "Stingray Skin",    		["weight"] = 850,       ["type"] = "item",      ["image"] = "skin_stingray.png",     	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stingray skin. Highly illegal!"},
	["skin_mtlion"]         	 = {["name"] = "skin_mtlion",         		["label"] = "Mt Lion Hide",    			["weight"] = 1050,      ["type"] = "item",      ["image"] = "skin_mtlion.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Mt. Lion hide. Highly illegal!"},
	["skin_coyote"]         	 = {["name"] = "skin_coyote",         		["label"] = "Coyote Hide",    			["weight"] = 750,       ["type"] = "item",      ["image"] = "skin_coyote.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coyote hide."},
	["skin_deer"]         		 = {["name"] = "skin_deer",         		["label"] = "Deer Hide",    			["weight"] = 950,       ["type"] = "item",      ["image"] = "skin_deer.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Deer hide."},
	["skin_cow"]         	 	 = {["name"] = "skin_cow",         			["label"] = "Cow Hide",    				["weight"] = 1250,      ["type"] = "item",      ["image"] = "skin_cow.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cow hide."},
	["skin_boar"]         	 	 = {["name"] = "skin_boar",         		["label"] = "Boar Hide",    			["weight"] = 1250,      ["type"] = "item",      ["image"] = "skin_boar.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Boar hide."},
	["skin_pig"]         	 	 = {["name"] = "skin_pig",         			["label"] = "Pig Skin",    				["weight"] = 850,       ["type"] = "item",      ["image"] = "skin_pig.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pig skin."},
	["skin_rabbit"]         	 = {["name"] = "skin_rabbit",         		["label"] = "Rabbit Hide",    			["weight"] = 550,       ["type"] = "item",      ["image"] = "skin_rabbit.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rabbit hide."},
	["skin_rat"]         	 	 = {["name"] = "skin_rat",         			["label"] = "Rat Hide",    				["weight"] = 150,       ["type"] = "item",      ["image"] = "skin_rat.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rat hide."},
	["skin_whale"]         		 = {["name"] = "skin_whale",         		["label"] = "Whale Skin",    			["weight"] = 7500,      ["type"] = "item",      ["image"] = "skin_whale.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Whale skin. Highly illegal"},
	["meat_shark"]         	     = {["name"] = "meat_shark",         		["label"] = "Shark Meat",   	   	    ["weight"] = 1200,      ["type"] = "item",      ["image"] = "meat_shark.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Shark meat!"},
	["meat_stingray"]            = {["name"] = "meat_stingray",         	["label"] = "Stingray Meat",    		["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_stingray.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stingray meat!"},
	["meat_dolphin"]             = {["name"] = "meat_dolphin",         		["label"] = "Dolphin Meat",    			["weight"] = 850,       ["type"] = "item",      ["image"] = "meat_dolphin.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Dolphin meat!"},
	["meat_whale"]         		 = {["name"] = "meat_whale",         		["label"] = "Whale Meat",    			["weight"] = 6000,      ["type"] = "item",      ["image"] = "meat_whale.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Whale meat!"},
	["meat_boar"]            	 = {["name"] = "meat_boar",         		["label"] = "Boar Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_boar.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Boar meat!"},
	["meat_chickenhawk"]         = {["name"] = "meat_chickenhawk",         	["label"] = "Chickenhawk Meat",    		["weight"] = 400,       ["type"] = "item",      ["image"] = "meat_chickenhawk.png",     ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chickenhawk meat!"},
	["meat_cormorant"]           = {["name"] = "meat_cormorant",         	["label"] = "Cormorant Meat",    		["weight"] = 400,       ["type"] = "item",      ["image"] = "meat_cormorant.png",       ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cormorant meat!"},
	["meat_coyote"]              = {["name"] = "meat_coyote",         	    ["label"] = "Coyote Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_coyote.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coyote meat!"},
	["meat_deer"]            	 = {["name"] = "meat_deer",         	    ["label"] = "Venison",    				["weight"] = 850,       ["type"] = "item",      ["image"] = "meat_deer.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Deer meat!"},
	["meat_mtlion"]            	 = {["name"] = "meat_mtlion",         		["label"] = "Mt Lion Meat",    			["weight"] = 1000,      ["type"] = "item",      ["image"] = "meat_mtlion.png",          ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Mt Lion meat!"},
	["meat_rabbit"]              = {["name"] = "meat_rabbit",         		["label"] = "Rabbit Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_rabbit.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rabbit meat!"},
	["meat_cow"]            	 = {["name"] = "meat_cow",         			["label"] = "Beef Meat",    			["weight"] = 1000,      ["type"] = "item",      ["image"] = "meat_cow.png",        		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cow meat!"},
	["meat_pig"]            	 = {["name"] = "meat_pig",         			["label"] = "Pork Meat",    			["weight"] = 750,       ["type"] = "item",      ["image"] = "meat_pig.png",        		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pig meat!"},
	["meat_chicken"]             = {["name"] = "meat_chicken",         		["label"] = "Chicken Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_chicken.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chicken meat!"},
	["meat_rat"]            	 = {["name"] = "meat_rat",         		 	["label"] = "Rat Meat",    				["weight"] = 200,       ["type"] = "item",      ["image"] = "meat_rat.png",        		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rat meat!"},
	["huntinglicense"] 			 = {["name"] = "huntinglicense", 			["label"] = "Hunting License", 			["weight"] = 1, 		["type"] = "item", 		["image"] = "huntinglicense.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Permit to show officals that you can legally hunt."},


    -- Items
	['clean_plate'] 				= {['name'] = 'clean_plate', 			    	['label'] = 'Clean Plate', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_plate.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean dinner plate!'},
	['dirty_plate'] 				= {['name'] = 'dirty_plate', 			    	['label'] = 'Dirty Plate', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_plate.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty dinner plate!'},
	['clean_cup'] 					= {['name'] = 'clean_cup', 			    		['label'] = 'Clean Cup', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_cup.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean cup!'},
	['dirty_cup'] 					= {['name'] = 'dirty_cup', 			    		['label'] = 'Dirty Bowl', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_cup.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty cup!'},
	['clean_glass'] 				= {['name'] = 'clean_glass', 			    	['label'] = 'Clean Glass', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_glass.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean glass!'},
	['dirty_glass'] 				= {['name'] = 'dirty_glass', 			    	['label'] = 'Dirty Glass', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_glass.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty glass!'},
	['clean_smallglass'] 			= {['name'] = 'clean_smallglass', 			    ['label'] = 'Clean Small Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_smallglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean small glass!'},
	['dirty_smallglass'] 			= {['name'] = 'dirty_smallglass', 			    ['label'] = 'Dirty Small Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_smallglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty small glass!'},
	['clean_pintglass'] 			= {['name'] = 'clean_pintglass', 			    ['label'] = 'Clean Pint Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_pintglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean pint glass!'},
	['dirty_pintglass'] 			= {['name'] = 'dirty_pintglass', 			    ['label'] = 'Dirty Pint Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_pintglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty pint glass!'},
	['clean_wineglass'] 			= {['name'] = 'clean_wineglass', 			    ['label'] = 'Clean Wine Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_wineglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean wine glass!'},
	['dirty_wineglass'] 			= {['name'] = 'dirty_wineglass', 			    ['label'] = 'Dirty Wine Glass', 		['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_wineglass.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty wine glass!'},
	['clean_cocktailglass'] 		= {['name'] = 'clean_cocktailglass', 			['label'] = 'Clean Cocktail Glass', 	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'clean_cocktailglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A clean cocktail glass!'},
	['dirty_cocktailglass'] 		= {['name'] = 'dirty_cocktailglass', 			['label'] = 'Dirty Cocktail Glass', 	['weight'] = 50, 		['type'] = 'item', 		['image'] = 'dirty_cocktailglass.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A dirty cocktail glass!'},
	['livemouse']         	     	= {['name'] = 'livemouse',         				['label'] = 'Live Mouse',    			['weight'] = 450,       ['type'] = 'item',      ['image'] = 'livemouse.png',     	   	 		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A mouse! A snakes favorite meal!'},
	
	-- Ingredients
	['cherry']            			= {['name'] = 'cherry',             			['label'] = 'Cherry',     				['weight'] = 20,        ['type'] = 'item',      ['image'] = 'cherry.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Cherry!'},
	['lime']            		 	= {['name'] = 'lime',             				['label'] = 'Lime',     				['weight'] = 40,        ['type'] = 'item',      ['image'] = 'lime.png',        		    		['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lime!'},
	['lemon']            		 	= {['name'] = 'lemon',             				['label'] = 'Lemon',     				['weight'] = 40,        ['type'] = 'item',      ['image'] = 'lemon.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lemon!'},	
	['pineapple']                	= {['name'] = 'pineapple',             			['label'] = 'Pineapple',     			['weight'] = 60,        ['type'] = 'item',      ['image'] = 'pineapple.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Lemon!'},
	['coconut']            		 	= {['name'] = 'coconut',             			['label'] = 'Coconut',     				['weight'] = 80,        ['type'] = 'item',      ['image'] = 'coconut.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Coconut!'},
	['cranberry']            	 	= {['name'] = 'cranberry',             			['label'] = 'Cranberry',     			['weight'] = 20,        ['type'] = 'item',      ['image'] = 'cranberry.png',        			['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Cranberry!'},
	['apple']              	 		= {['name'] = 'apple',               			['label'] = 'Apple',                	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'apple.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh apple!'},
	['orange']              	 	= {['name'] = 'orange',               			['label'] = 'Orange',                	['weight'] = 100,       ['type'] = 'item',      ['image'] = 'orange.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh orange!'},
	['tomato']              	 	= {['name'] = 'tomato',               			['label'] = 'Tomato',                	['weight'] = 100,      	['type'] = 'item',      ['image'] = 'tomato.png',        				['unique'] = false,     ['useable'] = false,    ['shouldClose'] = false,    	['combinable'] = nil,   ['description'] = 'A fresh tomato!'},

	-- Drinks
	['cocacola'] 				 	= {['name'] = 'cocacola', 			  	  		['label'] = 'CocaCola', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'cocacola.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_cocacola', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring a Glass Of CocaCola..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'CocaCola, Taste The Feeling!'},
	['pepsi'] 				 		= {['name'] = 'pepsi', 			  	  			['label'] = 'Pepsi', 					['weight'] = 330, 		['type'] = 'item', 		['image'] = 'pepsi.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_pepsi', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Pepsi..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Every Pepsi Refreshes The World!'},
	['drpepper'] 				 	= {['name'] = 'drpepper', 			  	  		['label'] = 'Dr Pepper', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'drpepper.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_drpepper', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Dr Pepper..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Dr Pepper, whats the worst that can happen!'},
	['mountaindew'] 				= {['name'] = 'mountaindew', 			  	  	['label'] = 'Mountain Dew', 			['weight'] = 330, 		['type'] = 'item', 		['image'] = 'mountaindew.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_mountaindew', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Mountain Dew..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Do the DEW!'},
	['lemonade'] 					= {['name'] = 'lemonade', 			  	  		['label'] = 'Lemonade', 				['weight'] = 330, 		['type'] = 'item', 		['image'] = 'lemonade.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_lemonade', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Lemonade..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'The Secret Lemonade Drinker!'},
	['water'] 						= {['name'] = 'water', 			  	  			['label'] = 'Water', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'water.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = {accept = {'clean_glass'}, reward = 'glass_water', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Pouring A Glass Of Water..', ['timeOut'] = math.random(3550,6500)}},  	['description'] = 'Water the way nature intended.'},
    ['glass_cocacola']           	= {['name'] = 'glass_cocacola',             	['label'] = 'Glass of CocaCola',        ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_cocacola.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of cocacola!'},
    ['glass_pepsi']           		= {['name'] = 'glass_pepsi',             		['label'] = 'Glass of Pepsi',       	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_pepsi.png',        			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of pepsi!'},
    ['glass_drpepper']           	= {['name'] = 'glass_drpepper',             	['label'] = 'Glass of Dr Pepper',       ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_drpepper.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of dr pepper!'},
    ['glass_mountaindew']           = {['name'] = 'glass_mountaindew',             	['label'] = 'Glass of Mountain Dew',    ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_mountaindew.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of mountain dew!'},
    ['glass_lemonade']           	= {['name'] = 'glass_lemonade',             	['label'] = 'Glass of Lemonade',    	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_lemonade.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of lemonade!'},
    ['glass_water']           		= {['name'] = 'glass_water',             		['label'] = 'Glass of Water',    		['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_water.png',        			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,  	['description'] = 'A refreshing glass of water!'},
    ['cup_coffee']                	= {['name'] = 'cup_coffee',                		['label'] = 'Cup of Coffee',            ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'cup_coffee.png',            		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'glass_whiskey'}, reward = 'irishcoffee', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Making Irish Coffee..', ['timeOut'] = math.random(3550,6500)}},   ['description'] = 'A cup of coffee.'},
	['cup_tea']                	 	= {['name'] = 'cup_tea',                			['label'] = 'Cup of Tea',               ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'cup_tea.png',            			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cup of tea.'},
 
	
	-- Alocohol
    ['pint_ambeer']              	= {['name'] = 'pint_ambeer',               		['label'] = 'Pint of AM Beer',          ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_ambeer.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Morning sun!'},
    ['pint_piswasser']           	= {['name'] = 'pint_piswasser',            		['label'] = 'Pint of Piswasser',        ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_piswasser.png',       		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Your in for a good time!'},
    ['pint_logger']              	= {['name'] = 'pint_logger',               		['label'] = 'Pint of Logger',           ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_logger.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'The beer that brings the forest down!'},
    ['pint_dusche']              	= {['name'] = 'pint_dusche',               		['label'] = 'Pint of Dusche Gold',      ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pint_dusche.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Golden shower!'},
    ['glass_whiskey']            	= {['name'] = 'glass_whiskey',             		['label'] = 'Glass of Whiskey',         ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_whiskey.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'cocacola'}, reward = 'glass_whiskeycoke', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Whiskey and Coke..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of whiskey!'},
    ['glass_vodka']              	= {['name'] = 'glass_vodka',               		['label'] = 'Glass of Vodka',           ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_vodka.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'lemonade'}, reward = 'glass_vodkalemon', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Vodka Lemonade..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of vodka!'},
    ['glass_rum']                	= {['name'] = 'glass_rum',                 		['label'] = 'Glass of Rum',             ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_rum.png',          			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = {accept = {'lemonade'}, reward = 'glass_rumlemon', anim = {['dict'] = 'anim@amb@clubhouse@bar@drink@one', ['lib'] = 'one_bartender', ['text'] = 'Mixing Rum and Lemonade..', ['timeOut'] = 5500,}},   ['description'] = 'A small glass of vodka!'},	
    ['glass_whiskeycoke']        	= {['name'] = 'glass_whiskeycoke',         		['label'] = 'Glass of Whiskey Coke',    ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_whiskeycoke.png',    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of whiskey and coke!'},
    ['glass_rumlemon']          	= {['name'] = 'glass_rumlemon',          		['label'] = 'Glass of Rum Lemonade',  	['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_rumlemon.png',     			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of rum lemonade!'},	
	['glass_vodkalemon']         	= {['name'] = 'glass_vodkalemon',          		['label'] = 'Glass of Vodka Lemonade',  ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'glass_vodkalemon.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A small glass of vodka lemonade!'},
	['whiskeysour']            	 	= {['name'] = 'whiskeysour',             		['label'] = 'Whiskey Sour',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'whiskeysour.png',        			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Whiskey Sour!'},
	['whiskeysmash']             	= {['name'] = 'whiskeysmash',             		['label'] = 'Whiskey Smash',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'whiskeysmash.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Whiskey Smash!'},
	['bloodandsand']            	= {['name'] = 'bloodandsand',             		['label'] = 'Blood and Sand',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'bloodandsand.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Blood & Sand!'},
	['pinacolada']               	= {['name'] = 'pinacolada',             		['label'] = 'Pina Colada',     	    	['weight'] = 400,       ['type'] = 'item',      ['image'] = 'pinacolada.png',           		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Pina Colada!'},
	['zombie']                  	= {['name'] = 'zombie',             			['label'] = 'Zombie',     	    		['weight'] = 400,       ['type'] = 'item',      ['image'] = 'zombie.png',           			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Zombie!'},
	['maitai']               	 	= {['name'] = 'maitai',             			['label'] = 'Mai Tai',     	    		['weight'] = 400,       ['type'] = 'item',      ['image'] = 'maitai.png',           			['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Mai Tai!'},
	['appletini']                	= {['name'] = 'appletini',             			['label'] = 'Appletini',     	    	['weight'] = 400,       ['type'] = 'item',      ['image'] = 'appletini.png',            		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Cubra Libre!'},
	['cosmopolitan']             	= {['name'] = 'cosmopolitan',             		['label'] = 'Cosmopolitan',     	    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'cosmopolitan.png',         		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Cosmopolitan!'},
	['bloodymary']             		= {['name'] = 'bloodymary',             		['label'] = 'bloodymary',     	        ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'bloodymary.png',           		['unique'] = false,     ['useable'] = true,    	['shouldClose'] = true,     	['combinable'] = nil,   ['description'] = 'Bloody Mary!'},
	['irishcoffee']              	= {['name'] = 'irishcoffee',               		['label'] = 'Irish Coffee',             ['weight'] = 200,       ['type'] = 'item',      ['image'] = 'irishcoffee.png',          		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cup of irish coffee.'},
	['chardonnay'] 				 	= {['name'] = 'chardonnay', 			  	  	['label'] = 'Chardonnay', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'chardonnay.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'Chardonnay for after a really long, hard day.'},
	['barolo'] 				 		= {['name'] = 'barolo', 			  	  		['label'] = 'Barolo', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'barolo.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'The King of Wines and the Wine of Kings.'},
	['pinotgrigio'] 				= {['name'] = 'pinotgrigio', 			  	  	['label'] = 'Pinot Grigio', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'pinotgrigio.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'One should always be drunk. Thats all that matters.'},
	['pinotnoir'] 					= {['name'] = 'pinotnoir', 			  	  		['label'] = 'Pinot Noir', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'pinotnoir.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'If you drink no noir, you will pinot noir.'},
	['glass_chardonnay'] 			= {['name'] = 'glass_chardonnay', 			  	['label'] = 'Glass of Chardonnay', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_chardonnay.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'Chardonnay for after a really long, hard day.'},
	['glass_barolo'] 				= {['name'] = 'glass_barolo', 			  	  	['label'] = 'Glass of Barolo', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_barolo.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'The King of Wines and the Wine of Kings.'},
	['glass_pinotgrigio'] 			= {['name'] = 'glass_pinotgrigio', 			  	['label'] = 'Glass of Pinot Grigio', 	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_pinotgrigio.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'One should always be drunk. Thats all that matters.'},
	['glass_pinotnoir'] 			= {['name'] = 'glass_pinotnoir', 			  	['label'] = 'Glass of Pinot Noir', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'glass_pinotnoir.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,  	['description'] = 'If you drink no noir, you will pinot noir.'},

	-- Food
	['steakpie']         	     	= {['name'] = 'steakpie',         				['label'] = 'Microwavable Steak Pie',   ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'steakpie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable steak pie!'},
	['chickenpie']         	     	= {['name'] = 'chickenpie',         			['label'] = 'Microwavable Chicken Pie', ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'chickenpie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable chicken and mushroom pie!'},
	['meatpie']         	     	= {['name'] = 'meatpie',         				['label'] = 'Microwavable Meat Pie',    ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'meatpie.png',     	        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable meat pie!'},
	['cheesepie']         	     	= {['name'] = 'cheesepie',         	    		['label'] = 'Microwavable Cheese Pie',  ['weight'] = 400,       ['type'] = 'item',      ['image'] = 'cheesepie.png',     	    		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable cheese and onion pie!'},
	['cookedsteakpie']         	 	= {['name'] = 'cookedsteakpie',         		['label'] = 'Steak Pie',    			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedsteakpie.png',     			['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked steak pie!'},
	['cookedchickenpie']         	= {['name'] = 'cookedchickenpie',         		['label'] = 'Chicken Pie',       		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedchickenpie.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked chicken and mushroom pie!'},
	['cookedmeatpie']         	 	= {['name'] = 'cookedmeatpie',         			['label'] = 'Meat Pie',       			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmeatpie.png',        		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked meat pie!'},
	['cookedcheesepie']          	= {['name'] = 'cookedcheesepie',         		['label'] = 'Cheese Pie',       		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedcheesepie.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked cheese and onion pie!'},
	['mwburger']          		 	= {['name'] = 'mwburger',         				['label'] = 'Microwave Burger',   		['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable burger!'},
	['mwcburger']          		 	= {['name'] = 'mwcburger',         				['label'] = 'Microwave Cheeseburger',   ['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwcburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable cheeseburger!'},
	['mwbcburger']          	 	= {['name'] = 'mwbcburger',         			['label'] = 'Microwave Bacon Burger',   ['weight'] = 300,       ['type'] = 'item',      ['image'] = 'mwbcburger.png',      				['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A microwavable bacon cheeseburger!'},
	['cookedmwburger']           	= {['name'] = 'cookedmwburger',        			['label'] = 'Burger',   				['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwburger.png',       		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable burger!'},
	['cookedmwcburger']          	= {['name'] = 'cookedmwcburger',        		['label'] = 'Cheeseburger',   			['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwcburger.png',      		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable cheeseburger!'},
	['cookedmwbcburger']         	= {['name'] = 'cookedmwbcburger',        		['label'] = 'Bacon Cheeseburger',   	['weight'] = 300,       ['type'] = 'item',      ['image'] = 'cookedmwbcburger.png',     		['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A cooked microwavable bacon cheeseburger!'},


    -- Drugsales
	['burnerphone']                	 = {['name'] = 'burnerphone',               	['label'] = 'Burner Phone',             ['weight'] = 250,       ['type'] = 'item',      ['image'] = 'burnerphone.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A burner phone, what do you need one of these for?'},

        -- Weed
        -- Tools
        ['drug_shears'] 			    = {['name'] = 'drug_shears', 		        	['label'] = 'Trimming Shears', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'drug_shears.png', 					['unique'] = false,    	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A set of high quality trimming shears.'},	
        ['drug_scales'] 		 	    = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
        ['drug_grinder'] 		 	    = {['name'] = 'drug_grinder', 					['label'] = 'Grinder', 					['weight'] = 150, 	    ['type'] = 'item', 		['image'] = 'drug_grinder.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A grinder for grinding herbs.. or other things..'},
        ['rollingpapers'] 				= {['name'] = 'rollingpapers', 					['label'] = 'Rolling Papers', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'rollingpapers.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
        ['lighter'] 			 		= {['name'] = 'lighter', 						['label'] = 'Lighter', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A lighter, everybody has to have one of these on hand!'},
        ['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			    ['label'] = 'Resealable Bag', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 				['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'A small empty bag'},
        ['weed_fertilizer'] 			= {['name'] = 'weed_fertilizer', 				['label'] = 'Big Bud Fertilizer', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'weed_fertilizer.png', 		        ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	  	['combinable'] = nil,   ['description'] = 'Get that big bug energy!'},
        ['distilled_water'] 				    = {['name'] = 'distilled_water', 			    	['label'] = 'Distilled Water', 		    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'distilled_water.png', 		            ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Distilled water for your plants or other uses..'},
        ['trowel'] 			 	         = {['name'] = 'trowel', 			  			['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = false, 	['shouldClose'] = false,	   	['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
        
        -- Seeds
        -- Male
        ['weed_skunk_seed_m'] 			= {['name'] = 'weed_skunk_seed_m', 				['label'] = 'Skunk: Seed (M)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male skunk seed!'},
        ['weed_og-kush_seed_m'] 		= {['name'] = 'weed_og-kush_seed_m', 			['label'] = 'OG-Kush: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male og-kush seed!'},
        ['weed_white-widow_seed_m'] 	= {['name'] = 'weed_white-widow_seed_m', 		['label'] = 'White-Widow: Seed (M)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male white-widow seed!'},
        ['weed_ak47_seed_m'] 			= {['name'] = 'weed_ak47_seed_m', 				['label'] = 'AK47: Seed (M)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male ak47 seed!'},
        ['weed_amnesia_seed_m'] 		= {['name'] = 'weed_amnesia_seed_m', 			['label'] = 'Amnesia: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male amnesia seed!'},
        ['weed_purple-haze_seed_m'] 	= {['name'] = 'weed_purple-haze_seed_m', 		['label'] = 'Purple-Haze: Seed (M)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male purple-haze seed!'},
        ['weed_gelato_seed_m'] 			= {['name'] = 'weed_gelato_seed_m', 			['label'] = 'Gelato: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_seed_m.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male gelato seed!'},
        ['weed_zkittlez_seed_m'] 		= {['name'] = 'weed_zkittlez_seed_m', 			['label'] = 'Zkittlez: Seed (M)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_seed_m.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A male zkittlez seed!'},
    
        -- Feminized
        ['weed_skunk_seed_f'] 			= {['name'] = 'weed_skunk_seed_f', 				['label'] = 'Skunk: Seed (F)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized skunk seed.'},
        ['weed_og-kush_seed_f'] 		= {['name'] = 'weed_og-kush_seed_f', 			['label'] = 'OG-Kush: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized og-kush seed.'},
        ['weed_white-widow_seed_f'] 	= {['name'] = 'weed_white-widow_seed_f', 		['label'] = 'White-Widow: Seed (F)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized white-widow seed.'},
        ['weed_ak47_seed_f'] 			= {['name'] = 'weed_ak47_seed_f', 				['label'] = 'AK47: Seed (F)', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized ak47 seed.'},
        ['weed_amnesia_seed_f'] 		= {['name'] = 'weed_amnesia_seed_f', 			['label'] = 'Amnesia: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized amnesia seed.'},
        ['weed_purple-haze_seed_f'] 	= {['name'] = 'weed_purple-haze_seed_f', 		['label'] = 'Purple-Haze: Seed (F)', 	['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized purple-haze seed.'},
        ['weed_gelato_seed_f'] 			= {['name'] = 'weed_gelato_seed_f', 			['label'] = 'Gelato: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_seed_f.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized gelato seed.'},
        ['weed_zkittlez_seed_f'] 		= {['name'] = 'weed_zkittlez_seed_f', 			['label'] = 'Zkittlez: Seed (F)', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_seed_f.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A feminized zkittlez seed.'},
        
        -- Crops
        ['weed_skunk_crop'] 			= {['name'] = 'weed_skunk_crop', 				['label'] = 'Skunk: Crop', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_skunk_crop.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest skunk flower!'},
        ['weed_og-kush_crop'] 			= {['name'] = 'weed_og-kush_crop', 				['label'] = 'OG-Kush: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_og-kush_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest og-kush flower!'},
        ['weed_white-widow_crop'] 		= {['name'] = 'weed_white-widow_crop', 			['label'] = 'White-Widow: Crop', 		['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_white-widow_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest white-widow flower!'},
        ['weed_ak47_crop'] 				= {['name'] = 'weed_ak47_crop', 				['label'] = 'AK47: Crop', 				['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_ak47_crop.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest ak47 flower!'},
        ['weed_amnesia_crop'] 			= {['name'] = 'weed_amnesia_crop', 				['label'] = 'Amnesia: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_amnesia_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest amnesia flower!'},
        ['weed_purple-haze_crop'] 		= {['name'] = 'weed_purple-haze_crop', 			['label'] = 'Purple-Haze: Crop', 		['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_crop.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest purple-haze flower!'},
        ['weed_gelato_crop'] 			= {['name'] = 'weed_gelato_crop', 				['label'] = 'Gelato: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_gelato_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest gelato flower!'},
        ['weed_zkittlez_crop'] 			= {['name'] = 'weed_zkittlez_crop', 			['label'] = 'Zkittlez: Crop', 			['weight'] = 400, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_crop.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A freshly harvested crop of the finest zkittlez flower!'},
    
        -- Bags 
        ['weed_skunk'] 				  	= {['name'] = 'weed_skunk', 			 		['label'] = 'Skunk: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_skunk.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest skunk flower!'},
        ['weed_og-kush'] 				= {['name'] = 'weed_og-kush', 			 		['label'] = 'OG-Kush: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_og-kush.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest og-kush flower!'},
        ['weed_white-widow'] 			= {['name'] = 'weed_white-widow', 				['label'] = 'White-Widow: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_white-widow.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest white-widow flower!'},
        ['weed_ak47'] 				    = {['name'] = 'weed_ak47', 			 			['label'] = 'AK47: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_ak47.png', 			        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest ak47 flower!'},
        ['weed_amnesia'] 				= {['name'] = 'weed_amnesia', 			 		['label'] = 'Amnesia: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_amnesia.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest amnesia flower!'},
        ['weed_purple-haze'] 			= {['name'] = 'weed_purple-haze', 				['label'] = 'Purple-Haze: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_purple-haze.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest purple-haze flower!'},
        ['weed_gelato'] 				= {['name'] = 'weed_gelato', 			 		['label'] = 'Gelato: 2g', 				['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_gelato.png', 			    	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest gelato flower!'},
        ['weed_zkittlez'] 			 	= {['name'] = 'weed_zkittlez', 					['label'] = 'Zkittlez: 2g', 			['weight'] = 2, 		['type'] = 'item', 		['image'] = 'weed_zkittlez.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 2g bag of the finest zkittlez flower!'},
    
        -- Joint
        ['weed_skunk_joint'] 			= {['name'] = 'weed_skunk_joint', 				['label'] = 'Skunk: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_skunk_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest skunk!'},
        ['weed_og-kush_joint'] 			= {['name'] = 'weed_og-kush_joint', 			['label'] = 'OG-Kush: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_og-kush_joint.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest og-kush!'},
        ['weed_white-widow_joint'] 		= {['name'] = 'weed_white-widow_joint', 		['label'] = 'White-Widow: Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_white-widow_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest white-widow!'},
        ['weed_ak47_joint'] 			= {['name'] = 'weed_ak47_joint', 				['label'] = 'AK47: Joint', 				['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_ak47_joint.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest ak47!'},
        ['weed_amnesia_joint'] 			= {['name'] = 'weed_amnesia_joint', 			['label'] = 'Amnesia: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_amnesia_joint.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest amnesia!'},
        ['weed_purple-haze_joint'] 		= {['name'] = 'weed_purple-haze_joint', 		['label'] = 'Purple-Haze: Joint', 		['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_purple-haze_joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest purple-haze!'},
        ['weed_gelato_joint'] 		 	= {['name'] = 'weed_gelato_joint', 				['label'] = 'Gelato: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_gelato_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest gelato!'},
        ['weed_zkittlez_joint'] 		= {['name'] = 'weed_zkittlez_joint', 			['label'] = 'Zkittlez: Joint', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'weed_zkittlez_joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A 1g joint of the finest zkittlez!'},
    
        -- Heroin
        -- Tools
        ['razorblade'] 			 		 = {['name'] = 'razorblade', 					['label'] = 'Razor Blade', 				['weight'] = 10, 		['type'] = 'item', 		['image'] = 'razorblade.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A sharp razorblade, be careful not to cut yourself!'},
        ['syringe'] 			 		 = {['name'] = 'syringe', 						['label'] = 'Syringe', 					['weight'] = 50, 		['type'] = 'item', 		['image'] = 'syringe.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A sterile syringe, dont share!'},
        ['plasticjerrycan'] 			 = {['name'] = 'plasticjerrycan', 				['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
        ['emptyvial'] 			 		 = {['name'] = 'emptyvial', 					['label'] = 'Empty Vial', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'emptyvial.png', 			['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty sterile vial for storing liquid meds.'},
        ['drug_scales'] 		 	     = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
        ['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 				['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},
    
    
        -- Drug materials
        ['cement'] 						 = {['name'] = 'cement',			 			['label'] = 'Cement', 			    	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cement.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Just a regular bag of builders cement.'},	
        ['slakedlime'] 			 		 = {['name'] = 'slakedlime', 					['label'] = 'Slaked Lime', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'slakedlime.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Supposed to be used in preparation of dry mixer for painting and white washing.. However..'},
        ['ammonia'] 			 		 = {['name'] = 'ammonia', 						['label'] = 'Ammonia', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ammonia.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Ammonia is a colorless, highly irritating gas with a pungent, suffocating odor.'},
        ['aceticacid'] 			 		 = {['name'] = 'aceticacid', 					['label'] = 'Acetic Acid', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'aceticacid.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Acetic Acid is a clear colourless liquid which has a pungent, vinegar-like odour.'},
        ['hydrochloricacid'] 			 = {['name'] = 'hydrochloricacid', 				['label'] = 'Hydrochloric Acid', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'hydrochloricacid.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'Disolves food pretty well..'},
        ['ether'] 			 		 	 = {['name'] = 'ether', 						['label'] = 'Petroleum Ether', 		    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'ether.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Petroleum ether is the petroleum fraction consisting of aliphatic hydrocarbons, commonly used as a laboratory solvent.'},
        ['sodiumcarbonate'] 			 = {['name'] = 'sodiumcarbonate', 				['label'] = 'Sodium Carbonate', 		['weight'] = 200, 		['type'] = 'item', 		['image'] = 'sodiumcarbonate.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Sodium Carbonate is the disodium salt of carbonic acid with alkalinizing property.'},
        ['opium'] 			 		 	 = {['name'] = 'opium', 						['label'] = 'Opium Sap', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'opium.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Opium, do you know how to refine it?'},
        ['morphinebase'] 				 = {['name'] = 'morphinebase', 					['label'] = 'Morphine Base', 			['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'morphinebase.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Morphine base. You can turn this into morphine or heroin.'},
        ['heroinbase'] 				 	 = {['name'] = 'heroinbase', 					['label'] = 'Heroin Base', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'heroinbase.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin base. Refine this into heroin powder.'},
        ['sterilewater'] 			 	 = {['name'] = 'sterilewater', 					['label'] = 'Sterile Water', 			['weight'] = 50, 		['type'] = 'item', 		['image'] = 'sterilewater.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A vial of sterile water for injecting meds.'},
    
        -- Drugs
        ['morphine'] 			 		 = {['name'] = 'morphine', 						['label'] = 'Morphine', 				['weight'] = 10, 		['type'] = 'item', 		['image'] = 'morphine.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Morphine. Good for pain but also a good time!'},
        ['morphinebaggy'] 			 	= {['name'] = 'morphinebaggy', 				['label'] = 'Bag of Morphine', 				['weight'] = 1, 		['type'] = 'item', 		['image'] = 'morphinebaggy.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  	['combinable'] = nil,   ['description'] = 'Morphine. Good for pain but also a good time!'},
        ['heroin_1oz'] 			 	 	 = {['name'] = 'heroin_1oz', 					['label'] = 'Ounce of Heroin', 			['weight'] = 280, 		['type'] = 'item', 		['image'] = 'heroin_1oz.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A large amount of heroin.'},
        ['heroinbaggy'] 			 	 = {['name'] = 'heroinbaggy', 					['label'] = 'Bag of Heroin', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'heroinbaggy.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin. Destroying lives since 1898!'},
        ['liquidheroin'] 			 	 = {['name'] = 'liquidheroin', 					['label'] = 'Liquid Heroin', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'liquidheroin.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'Heroin. Destroying lives since 1898!'},
    
        -- Meth
       -- Tools
        ['plasticjerrycan'] 			= {['name'] = 'plasticjerrycan', 			['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 				['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
        ['trowel'] 			 	        = {['name'] = 'trowel', 			  		['label'] = 'Trowel', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Just a simple gardening tool.'},
        ['drug_scales'] 		 	    = {['name'] = 'drug_scales', 				['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
        ['drug_cuttingkit'] 			= {['name'] = 'drug_cuttingkit', 			['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},
        ['empty_weed_bag'] 				= {['name'] = 'empty_weed_bag', 			['label'] = 'Resealable Bags', 			['weight'] = 1, 		['type'] = 'item', 		['image'] = 'empty_weed_bag.png', 		        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A small empty bag'},
        
        -- Drug Materials
        ['hydrochloricacid'] 			= {['name'] = 'hydrochloricacid', 			['label'] = 'Hydrochloric Acid', 		['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'hydrochloricacid.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'Disolves food pretty well..'},
        ['acetone'] 					= {['name'] = 'acetone', 					['label'] = 'Acetone', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'acetone.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A highly volitile and flamable liquid..'},
        ['lithium'] 			 	    = {['name'] = 'lithium', 					['label'] = 'Lithium', 				    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'lithium.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Lithium, for batteries or maybe or things?'},
         ['methylamine'] 			 	= {['name'] = 'methylamine', 				['label'] = 'Methylamine', 				['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'methylamine.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Methylamine? What is this breaking bad?'},
        -- Drugs
        ['meth'] 			 	        = {['name'] = 'meth', 						['label'] = '1g of Meth', 			    ['weight'] = 10, 		['type'] = 'item', 		['image'] = 'meth.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A gram of the finest teeth rotting goodness!'},	
        ['meth_1oz'] 			 	    = {['name'] = 'meth_1oz', 					['label'] = 'Ounce of Meth', 			['weight'] = 280, 		['type'] = 'item', 		['image'] = 'meth_1oz.png', 					['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'A ounce of the finest teeth rotting goodness!'},	
    
        -- Cocaine
        -- Tools
        ['drug_scales'] 		 	     = {['name'] = 'drug_scales', 					['label'] = 'Scale', 					['weight'] = 1500, 	    ['type'] = 'item', 		['image'] = 'drug_scales.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   		['combinable'] = nil,   ['description'] = 'A set of premium scales for weighing out decimals..'},
        ['drug_cuttingkit'] 			 = {['name'] = 'drug_cuttingkit', 				['label'] = 'Cutting Kit', 				['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'drug_cuttingkit.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	  		['combinable'] = nil,   ['description'] = 'A mirror, a razor blade.. obviously this is a make up kit..'},
        ['plasticjerrycan'] 			 = {['name'] = 'plasticjerrycan', 				['label'] = 'Plastic Jerrycan', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'plasticjerrycan.png', 		['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	  ['combinable'] = nil,   ['description'] = 'A empty jerry can for storing liquids.'},
        ['trowel'] 			 	         = {['name'] = 'trowel', 			  			['label'] = 'Trowel', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'trowel.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Small handheld garden shovel'},
        ['lighter'] 				 	 = {['name'] = 'lighter', 			  	  		['label'] = 'Lighter', 					['weight'] = 5, 		['type'] = 'item', 		['image'] = 'lighter.png', 						['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'On new years eve a nice fire to stand next to'},
        ['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
    
        -- Drug materials
        ['cement'] 						 = {['name'] = 'cement',			 			['label'] = 'Cement', 			    	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'cement.png', 						['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Just a regular bag of builders cement.'},	
        ['cocaleaf'] 				     = {['name'] = 'cocaleaf', 						['label'] = 'Cocaine Leaf', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'cocaineleaf.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,  		['combinable'] = nil,   ['description'] = 'Makes that premium nose candy!'},	
        ['sodiumbicarbonate'] 			 = {['name'] = 'sodiumbicarbonate', 			['label'] = 'Baking Soda', 			    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'sodiumbicarbonate.png', 			['unique'] = false,    	['useable'] = true, 	['shouldClose'] = true,	   		['combinable'] = nil,   ['description'] = 'Baking soda ey? What you cooking?'},	
        ['illegalgasoline'] 			 = {['name'] = 'illegalgasoline', 				['label'] = 'Illegal Gasoline', 		['weight'] = 2500, 		['type'] = 'item', 		['image'] = 'illegalgasoline.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Stolen gasoline? What are you doing with this?'},
        ['benzocaine'] 					 = {['name'] = 'benzocaine', 			  		['label'] = 'Benzocaine', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'benzocaine.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'Benzo? You got a toothache mate?'},
        ['water_jerrycan'] 				 = {['name'] = 'water_jerrycan', 			['label'] = 'Water Jerrycan', 				['weight'] = 3500, 		['type'] = 'item', 		['image'] = 'water_jerrycan.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   	['combinable'] = nil,   ['description'] = 'Water from a tanker.. it could be a dirty but who cares..'},
        
        -- Drugs
        ['cokebaggy'] 					 = {['name'] = 'cokebaggy', 			  		['label'] = '1g Bag of Coke', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'cocaine_baggy.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A gram of the finest nose candy!'},
        ['coke_1oz'] 					 = {['name'] = 'coke_1oz', 			  	  		['label'] = 'Ounce of Cocaine', 	    ['weight'] = 280, 		['type'] = 'item', 		['image'] = 'coke_1oz.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    		['combinable'] = nil,   ['description'] = 'A ounce of the finest nose candy!'},
        ['crack_1oz'] 				     = {['name'] = 'crack_1oz', 			  		['label'] = 'Ounce of Crack', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'crack_1oz.png', 		            ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	        ['combinable'] = nil,   ['description'] = 'For all the thirsty out there'},
        ['crack_baggy'] 			     = {['name'] = 'crack_baggy', 			  		['label'] = '1g Bag of Crack', 			['weight'] = 10, 		['type'] = 'item', 		['image'] = 'crack_baggy.png', 		            ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,         ['combinable'] = nil,   ['description'] = 'Man your about to lose some teeth!'},
    
       --<!>-- KETAMINE --<!>--
       -- Tools
       ['tracker_remover']                	 = {['name'] = 'tracker_remover',               	['label'] = 'Tracking Chip Remover',             ['weight'] = 1000,       ['type'] = 'item',      ['image'] = 'tracker_remover.png',        	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A tracking chip remover!'},
    
       -- Processing
       ['liquidketamine']                	 = {['name'] = 'liquidketamine',               	['label'] = 'Liquid Ketamine',             ['weight'] = 500,       ['type'] = 'item',      ['image'] = 'liquidketamine.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A vial of liquid ketamine!'},
    
       -- Drugs
       ['ketamine_1oz']                	 = {['name'] = 'ketamine_1oz',               	['label'] = 'Ounce of Ketamine',             ['weight'] = 2800,       ['type'] = 'item',      ['image'] = 'ketamine_1oz.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A ounce of ketamine!'},
       ['ketamine']                	 = {['name'] = 'ketamine',               	['label'] = 'Bag of Ketamine',             ['weight'] = 100,       ['type'] = 'item',      ['image'] = 'ketamine.png',        	['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A bag of ketamine!'},

       -- Return items
    ['empty_glass_bottle'] 			= {['name'] = 'empty_glass_bottle', 			 	['label'] = 'Empty Glass Bottle', 		['weight'] = 750, 		['type'] = 'item', 		['image'] = 'empty_glass_bottle.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'A scrap glass drinking bottle..'},
    ['empty_plastic_bottle'] 			= {['name'] = 'empty_plastic_bottle', 			 	['label'] = 'Empty Plastic Bottle', 		['weight'] = 750, 		['type'] = 'item', 		['image'] = 'empty_plastic_bottle.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'A scrap plastic drinking bottle..'},
    ['empty_can'] 			= {['name'] = 'empty_can', 			 	['label'] = 'Empty Can', 		['weight'] = 450, 		['type'] = 'item', 		['image'] = 'empty_can.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'A scrap aluminum drinks can..'},
    ['cardboard'] 					= {['name'] = 'cardboard', 			 	 		['label'] = 'Cardboard', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'cardboard.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'Some scrap cardboard..'},
    ['wrapper'] 					= {['name'] = 'wrapper', 			 	 		['label'] = 'Wrapper', 				['weight'] = 50, 		['type'] = 'item', 		['image'] = 'wrapper.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = 'A used candy wrapper..'},
    
    -- Alcohol
    ['beer_am'] 				 		= {['name'] = 'beer_am', 			  	  		['label'] = 'beer_am', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_am.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of AM Beer!'},
    ['beer_logger'] 				 		= {['name'] = 'beer_logger', 			  	  		['label'] = 'beer_logger', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_logger.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Logger!'},
    ['beer_piss'] 				 		= {['name'] = 'beer_piss', 			  	  		['label'] = 'beer_piss', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_piss.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Pisshwasser!'},
    ['beer_dusche'] 				 		= {['name'] = 'beer_dusche', 			  	  		['label'] = 'beer_dusche', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_dusche.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Dusche Gold!'},
    ['beer_patriot'] 				 		= {['name'] = 'beer_patriot', 			  	  		['label'] = 'beer_patriot', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_patriot.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Patriot!'},
    ['beer_stz'] 				 		= {['name'] = 'beer_stz', 			  	  		['label'] = 'beer_stz', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_stz.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Stronzo!'},
    ['beer_pride'] 				 		= {['name'] = 'beer_pride', 			  	  		['label'] = 'beer_pride', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_pride.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Pride!'},
    ['beer_jakey'] 				 		= {['name'] = 'beer_jakey', 			  	  		['label'] = 'beer_jakey', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_jakey.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Jakeys!'},
    ['beer_bar'] 				 		= {['name'] = 'beer_bar', 			  	  		['label'] = 'beer_bar', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_bar.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Barracho!'},
    ['beer_blr'] 				 		= {['name'] = 'beer_blr', 			  	  		['label'] = 'beer_blr', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer_blr.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Blarneys!'},
    ['whiskey_mount'] 				 		= {['name'] = 'whiskey_mount', 			  	  		['label'] = 'Mount Whiskey', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'whiskey_mount.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Mount Whiskey!'},
    ['whiskey_macbeth'] 				 		= {['name'] = 'whiskey_macbeth', 			  	  		['label'] = 'Macbeth Whiskey', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'whiskey_mount.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Macbeth Whiskey!'},
    ['whiskey_richards'] 				 		= {['name'] = 'whiskey_richards', 			  	  		['label'] = 'Richards Whiskey', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'whiskey_richards.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Richards Whiskey!'},
    ['vodka'] 				 		= {['name'] = 'vodka', 			  	  		['label'] = 'Vodka', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'vodka.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Vodka!'},
    ['rum'] 				 		= {['name'] = 'rum', 			  	  		['label'] = 'Rum', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'rum.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Rum!'},
    ['tequila'] 				 		= {['name'] = 'tequila', 			  	  		['label'] = 'Tequila', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'tequila.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Tequila!'},
    ['brandy_cardi'] 				 		= {['name'] = 'brandy_cardi', 			  	  		['label'] = 'Cardiaque Brandy', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'brandy_cardi.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Cardiaque Brandy!'},
    ['brandy_cognac'] 				 		= {['name'] = 'brandy_cognac', 			  	  		['label'] = 'Cognac Brandy', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'brandy_cognac.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Cognac Brandy!'},
    ['wine_red'] 				 		= {['name'] = 'wine_red', 			  	  		['label'] = 'Red Wine', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'wine_red.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Red Wine!'},
    ['wine_rose'] 				 		= {['name'] = 'wine_rose', 			  	  		['label'] = 'Rose Wine', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'wine_rose.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of Rose Wine!'},
    ['wine_white'] 				 		= {['name'] = 'wine_white', 			  	  		['label'] = 'White Wine', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'wine_white.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'A bottle of White Wine!'},

    -- Drinks
    ['water'] 						= {['name'] = 'water', 			  	  			['label'] = 'Water', 					['weight'] = 800, 		['type'] = 'item', 		['image'] = 'water.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'Water the way nature intended.'},
    ['dirtywater'] 						= {['name'] = 'dirtywater', 			  	  			['label'] = 'Dirty Water', 					['weight'] = 800, 		['type'] = 'item', 		['image'] = 'dirtywater.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'Water the way nature intended. Sort of..'},
    ['ecola'] 						= {['name'] = 'ecola', 			  	  			['label'] = 'E-Cola', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'ecola.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'Deliciously Infectious!'},
    ['sprunk'] 						= {['name'] = 'sprunk', 			  	  			['label'] = 'Sprunk', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'sprunk.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'The Essence of Life!'},
    ['orangotang'] 						= {['name'] = 'orangotang', 			  	  			['label'] = 'Orang-O-Tang', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'orangotang.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'The New Munkey Juice!'},
    ['coffee'] 						= {['name'] = 'coffee', 			  	  			['label'] = 'Coffee', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'coffee.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'Free The Bean!'},
    ['tea'] 						= {['name'] = 'tea', 			  	  			['label'] = 'Tea', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tea.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,  ['description'] = 'Not as good as yorkshire tea..'},

    -- Food items
	['eggsandwich'] 				= {['name'] = 'eggsandwich', 			 	  	['label'] = 'Egg Sandwich', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'eggsandwich.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A risky looking egg mayonaise sandwich..'},
	['hamsandwich'] 				= {['name'] = 'hamsandwich', 			 	  	['label'] = 'Ham Sandwich', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'hamsandwich.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A risky looking ham sandwich..'},
	['tunasandwich'] 				= {['name'] = 'tunasandwich', 			 	  	['label'] = 'Tuna Sandwich', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'tunasandwich.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A risky looking tuna mayonaise sandwich..'},
    ['psnqs'] 				= {['name'] = 'psnqs', 			 	  	['label'] = 'Ps & Qs', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'psnqs.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A packet of Ps & Qs!'},
    ['meteorite'] 				= {['name'] = 'meteorite', 			 	  	['label'] = 'Meteorite', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'meteorite.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Meteorite chocolate bar!'},
    ['egochaser'] 				= {['name'] = 'egochaser', 			 	  	['label'] = 'Egochaser', 			['weight'] = 380, 		['type'] = 'item', 		['image'] = 'egochaser.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A Egochaser chocolate bar!'},


















}




