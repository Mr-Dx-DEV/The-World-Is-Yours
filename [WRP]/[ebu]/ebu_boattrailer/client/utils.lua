RegisterKeyMapping("+boatAttachn", "Attach/Detach Boat (inside)", "keyboard", "g")
RegisterKeyMapping("+boatWarpn", "Get In Boat (outside)", "keyboard", "f")
RegisterKeyMapping("+boatInteractn", Config.Controlmessages.BoatReleaseMessage, "keyboard", "e")
RegisterKeyMapping('+boanchor', 'Toggle Anchor', 'keyboard', 'B')

--Event for manually placing a boat onto a trailer. Must be configured in the config file
-- manualattach(trailer, boat) (entity, entity)
RegisterNetEvent('ebu_boattrailer:attachBoat')
AddEventHandler('ebu_boattrailer:attachBoat', function(trailer, boat)
    if DoesEntityExist(trailer) and DoesEntityExist(boat) and has_value(trailers, GetEntityModel(trailer)) then
        manualattach(trailer, boat)
        Citizen.Wait(100)
    end
end)

function NotiAtt() -- Attached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

function NotiDet() -- Detached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiUnLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

function NotiAnchored(state) -- Detached notification
    if state == 1 then
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName('Boat anchored')
        EndTextCommandThefeedPostTicker(true, true)
    else
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName('Boat unanchored')
        EndTextCommandThefeedPostTicker(true, true)
    end
end

-- Use this function for job locking. If the job is correct, return true.
-- Please refer to your framework's job system for how to implement, I do not support
-- job checking integration. -Theebu
function allowed()
    return true
end

--This function returns if the vehicle is locked or not when trying to get in the loaded vehicle from next to the trailer
--false = NOT locked  true == LOCKED
function IsVehicleLocked(car)

    return DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 2 or DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 10
end

--Help Text Messages
function message(lineOne, lineTwo, lineThree, duration)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")
  
    -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
    EndTextCommandDisplayHelp(0, false, false, duration or 5000)
end