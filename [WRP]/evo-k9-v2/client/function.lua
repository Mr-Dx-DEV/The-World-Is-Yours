local QBCore = exports['qb-core']:GetCoreObject()


function GetPlayerJob()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData and playerData.job then
        return playerData.job.name
    else
        return nil -- If job data is not available
    end
end


--[[
 █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝                                                                         
]]

function loadAnimDict( dict )
    while (not HasAnimDictLoaded( dict )) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 



function Laydog()
    loadAnimDict( "gestures@f@standing@casual" )
    TaskPlayAnim( PlayerPedId(), "gestures@f@standing@casual", "gesture_hand_down", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end

function Sitdog()
    loadAnimDict( "swat" )
    TaskPlayAnim( PlayerPedId(), "swat", "freeze", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end

function Search()
    loadAnimDict( "swat" )
    TaskPlayAnim( PlayerPedId(), "swat", "you_fwd", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end

function SearchArea()
    loadAnimDict( "swat" )
    TaskPlayAnim( PlayerPedId(), "swat", "rally_point", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end

function Attackdog()
    loadAnimDict( "swat" )
    TaskPlayAnim( PlayerPedId(), "swat", "you_fwd", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end

function PetdogAnim()
    loadAnimDict( "creatures@rottweiler@tricks@" )
    TaskPlayAnim( PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0, 4.0, -1, 48, 0, 0, 0, 0 )
end



RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerEvent('evo-k9:client:starthouseobject')
end)

-----------------------------------------------------------------------------------------



function PetDogStress()
    TriggerServerEvent('hud:server:RelieveStress', 20)
end

function CustomNotify(message, type, duration)
    QBCore.Functions.Notify(message, type, duration)
end