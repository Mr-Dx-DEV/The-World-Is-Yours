-- Zones for Menus
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'false' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    police = {
        vector3(447.16, -974.31, 30.47),
        vector3(461.45, -986.2, 30.73),
    },
    ambulance = {
        vector3(311.21, -599.36, 43.29),
        vector3(335.46, -594.52, 43.28),
    },
    cardealer = {
        vector3(-32.94, -1114.64, 26.42),
        vector3(-27.47, -1107.13, 27.27),
    },
    mechanic = {
        vector3(-347.59, -133.35, 39.01),
        vector3(-339.53, -156.44, 44.59),
    },
    realestate = {
        vector3(-716.11, 261.21, 84.14),
    },
    taxi = {
        vector3(907.24, -150.19, 74.17),
    },
    cannabiscafe = {
        vector3(182.21, -251.98, 53.1),
    },
    hookahlounge = { 
        vector3(-443.88, -37.63, 40.92), 
    },
    dunkin = {
        vector3(-584.77, -883.61, 25.95),
    },
    wingstop = {
        vector3(1244.08, -352.53, 69.18),
    },
    popeyes = {
        vector3(179.1, -1456.12, 29.13),
    },
    cookies = {
        vector3(-934.1, -1168.34, 5.11),
    },
    lspd = {
        vector3(-1099.21, -830.7, 34.28),
        vector3(626.008, -28.235, 90.507),
    },
    bcso = {
        vector3(1824.92, 3671.98, 38.86),
        vector3(1825.174, 3692.048, 39.127),
    },
    lsso = {
        vector3(364.94, -1582.53, 33.36),
        vector3(387.119, -1626.17, 34.174),
    },
    safw = {
        vector3(1681.09, 4875.88, 42.3),
        vector3(-798.651, 5397.358, 36.06),
    },
    sahp = {
        vector3(1540.89, 814.85, 82.13),
        vector3(1540.549, 815.003, 82.131),
    },
    sadoc = {
        vector3(1838.7, 2575.35, 46.01),
        vector3(1838.7, 2575.35, 46.01),
    },
    dhs = {
        vector3(460.74, -985.55, 30.73),
    },
    fbi = {
        vector3(122.06, -768.14, 45.75),
    },
    usms = {
        vector3(-811.25, -712.82, 28.06),
        vector3(-813.0, -713.491, 28.06),
    },
    ss = {
        vector3(856.73, -1301.2, 28.26),
        vector3(856.79, -1301.27, 28.258),
    },
    bennys = {
        vector3(-194.94, -1315.84, 31.3),
        vector3(-195.61, -1316.61, 31.3),
    },
    burgershot = {
        vector3(-1178.19, -895.68, 13.97),
    },
    catcafe = {
        vector3(-1178.19, -895.68, 13.97),
    },
    icebox = {
        vector3(-1258.61, -805.02, 17.09),
    },
}


Config.GangMenus = {
    lostmc = {
        vector3(0, 0, 0),
    },
    ballas = {
        vector3(0, 0, 0),
    },
    vagos = {
        vector3(0, 0, 0),
    },
    cartel = {
        vector3(0, 0, 0),
    },
    families = {
        vector3(0, 0, 0),
    },
}
