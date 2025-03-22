Config = {}

Config.debug = false

-- Islands blip information - https://docs.fivem.net/docs/game-references/blips/
Config.blips = {
    enabled = true,
    sprite = 304,
    color = 10,
    scale = 0.7,
}

-- The best values in my opinion are between 550 and 750
-- Minimum = 400
-- Maximum = 1000
-- Larger maximum disance will require islands to be further apart as you should not render more than one island at a time
Config.renderDistance = 650.0

-- Value between 1 and 25 (faster speeds look better but are more performance intensive)
Config.renderSpeed = 15


--- label = Island label (displayed on map legend)
--- name = Name used programmatically
--- coords = vector3 of the island location in game
--- seed = Seed used for the procedural generation of the island. Changing it will result in a totally unique island
--- treeDensity = Density of the trees 0 - 100
--- bushDensity = Density of the bushes 0 - 100
--- disableSpecialElements = Whether or not to disable special elements on the islands (wrecked cars, rusted towers etc.)
--- size = Size of the islands; Options = 'tiny', 'small', 'medium', 'big', 'giant' + 'insane' (Make sure to test 'insane' sized islands. Stability issues may occur.)
--- forceZCoordinate = whether or not to force the Z coordinate to be the coordinate from the config (Not recommended unless using a custom ocean map)
---
--- <ADVANCED> (v1.0.3)
--- You can now also define the size using numbers. 1 - 25. This will set the amount of modules the island will be made out of.
--- BEWARE! When set to a value of 10 or higher the foliage rendering system will be changed for a more precise system to accomodate for the large island sizes.
--- This does make the foliage rendering significantly slower!
Config.islands = {
    {
        label = 'Isla de la fruta',
        name = 'isla_de_la_fruta',
        coords = vector3(-4600.0, -1600.0, -5.0),
        seed = 1035880,
        treeDensity = 55,
        bushDensity = 25,
        disableSpecialElements = false,
        size = 'medium',
    },
    {
        label = 'Isla de el duende',
        name = 'isla_de_el_duende',
        coords = vector3(-6880.0, -220.0, -5.0),
        seed = 2286013,
        treeDensity = 80,
        bushDensity = 15,
        disableSpecialElements = false,
        size = 'giant',
    },
    {
        label = 'Isla de el trigo',
        name = 'isla_de_el_trigo',
        coords = vector3(-5717.0, 560.0, -5.0),
        seed = 4294912,
        treeDensity = 70,
        bushDensity = 100,
        disableSpecialElements = false,
        size = 'big',
    },
    {
        label = 'Isla del radar',
        name = 'isla_del_radar',
        coords = vector3(5438.0, -560.0, -5.0),
        seed = 7439735,
        treeDensity = 90,
        bushDensity = 50,
        disableSpecialElements = false,
        size = 'medium',
    },
    {
        label = 'Isla del paso',
        name = 'isla_del_paso',
        coords = vector3(-3474.0, 7100.0, -5.0),
        seed = 6107109,
        treeDensity = 70,
        bushDensity = 30,
        disableSpecialElements = false,
        size = 'big',
    },
    {
        label = 'Isla de los olvidados',
        name = 'isla_de_los_olvidados',
        coords = vector3(-8600.0, -2000.0, -5.0),
        seed = 1453935,
        treeDensity = 100,
        bushDensity = 100,
        disableSpecialElements = false,
        size = 'tiny',
    },
    {
        label = 'Isla de la tortuga',
        name = 'isla_de_la_tortuga',
        coords = vector3(-4905, 6400.0, -5.0),
        seed = 3211383,
        treeDensity = 60,
        bushDensity = 40,
        disableSpecialElements = false,
        size = 'medium',
    },
    {
        label = 'Isla de la estrella fugaz',
        name = 'isla_de_la_estrella_fugaz',
        coords = vector3(-6700.0, 1200.0, -5.0),
        seed = 3344848,
        treeDensity = 50,
        bushDensity = 90,
        disableSpecialElements = false,
        size = 'small',
    },
}
