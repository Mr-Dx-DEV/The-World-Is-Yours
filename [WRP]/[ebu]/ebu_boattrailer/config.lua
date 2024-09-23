Config = {}

Config.InvulTime        = 5         --Time in seconds after the disconnect the boat won't take damage
Config.InteractDistance = 3.0   --Distance to get into boat from outside
Config.LockDist         = 6.0   -- Distance to check for boat trailer

Config.useAnchor        = true

--========Markers & Prompts=======--
--Increases tick rate from 0.01 to 0.08 - 0.1 when in range
Config.CheckDistance = 11           -- Distance to check for nearby trailers to add markers
Config.WaitTimer = 3000             -- Update rate to check for nearby trailer seconds * 1000 (Default 3000)
Config.ShowMarkers = true           -- Display markers at interaction points
Config.ShowHelp = true              -- Display help prompts
Config.MessageDistance = 2.0        -- Distance from point to display message (Default 2.0)
Config.Marker = {
    type = 1,                      -- marker shape: https://docs.fivem.net/docs/game-references/markers/ (Default 27)

    Size = 1.0,                     -- marker size (Default 2.0)

    Color = {                       -- RGBA color
        red = 100,
        green = 200,
        blue = 200,
        alpha = 150
    },
    heightOffset = 0.0,             -- Height from ground for marker. Marker at ground Z (Default 0.0)
    Bob = false,                    -- Marker bobbing up and down (Default false)
    faceCamera = false,             -- Marker always faces camera (Default false)
    rotate = false                  -- Marker rotates (Default false)
}
Config.Controlmessages = {
    BoatReleaseMessage = " release boat from trailer",
    AttachVehicle = " Attach/Detach boat"
}

--========Trailers & Boats=======--

Config.Trailers = {
    [`boattrailer`] = {                                                          --model name [`] not ['] or ["]
        boats = {                                                                --models that can attach specific positioning
            [`dinghy`] = vector3(0.0, -1.0, 0.275),
            [`dinghy2`] = vector3(0.0, -1.0, 0.275),
            [`dinghy3`] = vector3(0.0, -1.0, 0.275),
            [`dinghy4`] = vector3(0.0, -1.0, 0.275),
            [`dinghy5`] = vector3(0.0, -1.0, 0.275),
            [`squalo`] = vector3(0.0, -1.0, 0.6),
            [`suntrap`] = vector3(0.0, -1.0, 0.3),
            [`tropic`] = vector3(0.0, -1.0, 0.4),
            [`tropic2`]= vector3(0.0, -1.0, 0.4)
        },                                                       
        Position = vector3(0.0, -1.0, 0.2),                                     --offset point for attach check
        DetachPoints = {vector3(0.7, 1.8, -0.4), vector3(-0.7, 1.8, -0.4)},     --external detach points
    },
    [`seadoohauler`] = {  
        boats = {
            [`seadoogti215`] = vector3(0.0, -0.25, 0.225),
            [`seashark`] = vector3(0.0, -0.25, 0.225),
            [`seashark3`] = vector3(0.0, -0.25, 0.225),
            [`rxt260`] = vector3(0.0, -0.25, 0.225),
            [`c3pwc`] = vector3(0.0, -0.25, 0.225),
            [`c3pwcb`] = vector3(0.0, -0.25, 0.225),
        },                                                       
        Position = vector3(0.0, -0.25, 0.2),                                           
        DetachPoints = {vector3(0.7, 1.8, -0.4), vector3(-0.7, 1.8, -0.4)},             
    },
    [`yftrailer`] = {  
        boats = {
            [`42ftyellowfin`] = vector3(0.0, -0.225, 1.5),
            [`contender39`] = vector3(0.0, -0.225, 1.5),
            [`VPDYellowfin`] = vector3(0.0, -0.225, 1.5),
            [`c343ftfin`] = vector3(0.0, -0.225, 1.5),
            [`c343ftfinb`] = vector3(0.0, -0.225, 1.5),
        },
        Position = vector3(0.0, -0.225, 0.2),
        DetachPoints = {vector3(1.0, 5.75, -0.4), vector3(-1.0, 5.75, -0.4)},
    },
    [`sstrailer`] = {  
        boats = {
           [`speedster200`] = vector3(0.0, -0.32, 0.575),
        },
        Position = vector3(0.0, -0.32, 0.2),
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
    [`ptrailer`] = {  
        boats = {
            [`tritoon`] = vector3(0.0, -0.80, 0.88),
        },
        Position = vector3(0.0, -0.80, 0.2),
        DetachPoints = {vector3(1.8, 1.8, -0.4), vector3(-1.8, 1.8, -0.4)},
    },
    [`nbtrailer`] = {  
        boats = {
            [`nitroboat`] = vector3(0.15, -0.9, 0.2),
        },
        Position = vector3(0.15, -0.9, 0.4),
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
    [`ktrailer`] = {  
        boats = {
            [`keywest`] = vector3(0.0, -0.39, 0.790),
            [`c3rhib`] = vector3(0.0, -1.25, 0.2),
            [`c3rhibblue`] = vector3(0.0, -1.25, 0.2),
            [`26ftyellowfin`] = vector3(0.0, -0.39, 0.320),
        },
        Position = vector3(0.0, -0.39, 0.2),
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
    [`wildlifetrailer1`] = {  
        boats = {
            [`wildlifeboat1`] = vector3(0.0, -0.39, 0.05),
        },
        Position = vector3(0.0, -0.35, -0.0),
        DetachPoints = {vector3(1.0, 2.1, -0.4), vector3(-1.0, 2.1, -0.4)},
    },
    [`wildlifetrailer2`] = {  
        boats = {
            [`wildlifeboat2`]  = vector3(0.0, -0.39, 0.05),
        },
        Position = vector3(0.0, 0.1, -0.0),
        DetachPoints = {vector3(1.0, 5.5, -0.8), vector3(-1.0, 5.5, -0.8)},
    },
    [`formtrl`] = {  
        boats = {
            [`robsfl`] = vector3(0.0, -0.39, 0.3),
        },
        Position = vector3(0.0, 0.0, 0.2),
        DetachPoints = {vector3(1.0, 5.8, 0.0), vector3(-1.0, 5.8, 0.0)},
    },
    [`mystictrailer`] = {
        boats = {
            [`mystic`] = vector3(0.0, -0.39, 1.05),
        },                                                       
        Position = vector3(0.0, -3.0, 1.8),                                            
        DetachPoints = {vector3(2.5, 4.8, -0.4), vector3(-2.5, 4.8, -0.4)},            
    },
    [`mystic800trailer`] = {  
        boats = {
            [`mystic800`] = vector3(0.0, -0.39, 1.05), 
        },                                                       
        Position = vector3(0.0, 0.0, 1.5),                                            
        DetachPoints = {vector3(2.5, 4.8, -0.2), vector3(-2.5, 4.8, -0.2)},             
    },
    [`ftrailer`] = {  
        boats = {
            [`freeman`] = vector3(0.0, -0.39, 1.40),
            [`c3hs53pd`] = vector3(0.0, -0.39, 1.40),
            [`c3hs53pdb`] = vector3(0.0, -0.39, 1.40),
        },                                                       
        Position = vector3(0.0, 0.0, 1.5),
        DetachPoints = {vector3(2.5, 4.8, -0.2), vector3(-2.5, 4.8, -0.2)},
    },
    [`abtrailer`] = {  
        boats = {
            [`airboat`] = vector3(0.0, -0.85, 0.4),
            [`c3airboat`] = vector3(0.0, -0.85, 0.4),
            [`c3airboatb`] = vector3(0.0, -0.85, 0.4),
        },
        Position = vector3(0.0, 0.1, 0.0),
        DetachPoints = {vector3(1.0, 3.0, -0.8), vector3(-1.0, 3.0, -0.8)},
    },
    [`gtrailer`] = {  
        boats = {
            [`gradywhite`] = vector3(0.0, -0.65, 0.0),
        },
        Position = vector3(0.0, -0.6, 0.0),
        DetachPoints = {vector3(2.0, 1.8, -1.0), vector3(-2.0, 1.8, -1.0)},
    },
}

