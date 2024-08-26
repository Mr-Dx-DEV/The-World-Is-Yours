cfg = {
    framework = 'qb', -- qb / esx
    cuffItem = 'electronic_cuffs',
    removeItemOnUse = true,
    cuffListCommand = 'cufflist',
    jobs = { 'police' }, -- false,
    commandUseAreas = false,
    -- commandUseAreas = {
    --     vector3(441.28, -978.19, 30.69),
    -- },
    commandUseAreaSize = 20.0,
    blip = {
        sprite = 58,
        scale = 0.7,
        colour = 1,
    },
    locales = {
        days = 'day(s)',
        hours = 'hour(s)',
        minutes = 'minute(s)',
        gpsmode = 'GPS Mode',
        cufftime = 'Cuff Time',
        shock = 'Shock',
        gps = 'GPS',
        unlock = 'Unlock',
        coupleofsecondsago = 'Couple of seconds ago.',
        wearingcuff = 'This person already wearing a cuff.',
        noonenearby = 'There\'s no one nearby',
        successfullyshocked = 'You have successfully shocked the person.',
        successfullyremoved = 'You successfully removed the handcuffs from the person.',
        changedgpsmode = 'You changed the person\'s GPS mode.',
        joberror = 'Your job is inappropriate for this command.',
        shockLog = '**Tazed a player!**\n\n**Player Info**;\n',
        gpsStateLog = '**GPS State Changed**\n\n**Player Info**;\n',
        installLog = '**Installed handcuffs on a player!**\n\n**Player Info**;\n',
        unlockLog = '**Unlocked handcuffs on a player!**\n\n**Player Info**;\n',
    },

    debug = false,
}

local jobs = {}
for i = 1, #cfg.jobs do
    jobs[cfg.jobs[i]] = true
end
cfg.jobs = jobs
