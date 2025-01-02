--[[
████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗███████╗
╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝██╔════╝
   ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   ███████╗
   ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   ╚════██║
   ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   ███████║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝                                                       
--]]

-- Target On K9 Home For Spawning
function setupK9TargetZone(location, coords, heading)
    local zoneName = 'Spawn-K9-' .. location -- Dynamically name each zone based on location

    exports['qb-target']:AddBoxZone(zoneName, coords, 3, 3, {
        name = zoneName,
        heading = heading,
        debugPoly = false,
        minZ = coords.z - 1.0,
        maxZ = coords.z + 1.0,
    }, {
        options = {
            {
                type = 'client',
                event = 'evo-k9:client:PurchaseDog',
                icon = 'fas fa-paw',
                label = 'Call Dog',
                job = { ['police'] = 0 }, -- Restrict to police jobs
            },
        },
        distance = 2.0
    })
end



-- After Spawning K9 Dog
function setupK9TargetEntity(dogEntity, k9active)
    exports['qb-target']:AddTargetEntity(dogEntity, {
        options = {
            {
                type = "client",
                event = "evo-k9:client:petdoggo",
                icon = "fas fa-hand-holding-medical",
                label = "Pet Dog",
            },
            {
                type = "client",
                event = "evo-k9:client:carryPet",
                icon = "fas fa-dog",
                label = "Carry Pet",
            },
        },
        distance = 2.0
    })
end

-- When Cage Door Is Close 
function setupClosedCageTarget(cage)
    exports['qb-target']:AddTargetEntity(cage, {
        options = {
            {
                type = "client",
                event = "evo-k9:CLIENT:OPEN_CAGE_DOOR",
                icon = "fas fa-door-open",
                label = "Open Cage Door",
                cage = cage,
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:PICKUP_CAGE",
                icon = "fas fa-hand-holding",
                label = "Pickup Cage",
                cage = cage,
            },
        },
        distance = 2.0
    })
end

-- When Cage Door Is Open
function setupOpenCageTarget(openCage)
    exports['qb-target']:AddTargetEntity(openCage, {
        options = {
            {
                type = 'client',
                event = 'evo-k9:CLIENT:FETCH_AND_SPAWN_DOG',
                icon = 'fas fa-paw',
                label = 'Call Dog',
                job = { ['police'] = 0 },
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:Call_Dog_Cage",
                icon = "fas fa-hand-pointer",
                label = "Call Dog Inside",
                cage = openCage,
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:CLOSE_CAGE_DOOR",
                icon = "fas fa-door-closed",
                label = "Close Cage Door",
                cage = openCage,
            }
        },
        distance = 2.0
    })
end

function setupCageTarget2(cage)
    exports['qb-target']:AddTargetEntity(cage, {
        options = {
            {
                type = 'client',
                event = 'evo-k9:CLIENT:FETCH_AND_SPAWN_DOG',
                icon = 'fas fa-paw',
                label = 'Call Dog',
                job = { ['police'] = 0 },
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:Call_Dog_Cage",
                icon = "fas fa-hand-pointer",
                label = "Call Dog Inside",
                cage = openCage,
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:PICKUP_CAGE2",
                icon = "fas fa-hand-holding",
                label = "Pickup Cage",
                cage = cage,
            }
        },
        distance = 2.0
    })
end

function setupCage2Target(cage2)
    exports['qb-target']:AddTargetEntity(cage2, {
        options = {
            {
                type = 'client',
                event = 'evo-k9:CLIENT:FETCH_AND_SPAWN_DOG_CAGE2',
                icon = 'fas fa-paw',
                label = 'Call Dog',
                job = { ['police'] = 0 },
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:Call_Dog_Cage2",
                icon = "fas fa-hand-pointer",
                label = "Call Dog Inside",
                cage2 = cage2,
            },
            {
                type = "client",
                event = "evo-k9:CLIENT:PICKUP_CAGE2",
                icon = "fas fa-hand-holding",
                label = "Pickup Cage",
                cage2 = cage2,
            }
        },
        distance = 2.0
    })
end



-- For Remove Target After Picking Up Then Cage
function removeCageTargetEntity(cage)
    exports['qb-target']:RemoveTargetEntity(cage)
end

function removeCage2TargetEntity(cage2)
    exports['qb-target']:RemoveTargetEntity(cage2)
end
                                  