---@alias RawOfficer [number, string, string?, string?, [ number, number ], number, boolean ]

---@type { [number]: { blip: number, hasJob: (fun(): boolean), ped?: number } }
local gameBlips = {}

---@param officers StrippedOfficer[]
---@param hasJob fun(): boolean
local function RefreshDutyBlips(officers, hasJob)
    if not Config.DutyBlipOptions or not Config.DutyBlipOptions.Show then
        return
    end

    for i = 1, #officers do
        local officer = officers[i]
        local player = GetPlayerFromServerId(officer.source)
        ---@type number?
        local ped = player ~= -1 and GetPlayerPed(player) or nil
        local oldBlip = gameBlips[officer.source]
        local blip = oldBlip and oldBlip.blip

        if ped and ped ~= 0 and DoesEntityExist(ped) then
            if oldBlip and oldBlip.ped == ped then
                goto continue
            end

            if oldBlip then
                RemoveBlip(oldBlip.blip)
            end

            blip = AddBlipForEntity(ped)
        else
            ped = nil

            if oldBlip then
                SetBlipCoords(oldBlip.blip, officer.coords.x, officer.coords.y, 0.0)
            else
                blip = AddBlipForCoord(officer.coords.x, officer.coords.y, 0.0)
            end
        end

        if Config.DutyBlipOptions.Category then
            SetBlipCategory(blip, Config.DutyBlipOptions.Category)
        end

        SetBlipSprite(blip, Config.DutyBlipOptions.Sprite or 1)
        SetBlipColour(blip, Config.DutyBlipOptions.Color or 0)
        SetBlipScale(blip, Config.DutyBlipOptions.Scale or 0.9)
        SetBlipAsShortRange(blip, Config.DutyBlipOptions.ShortRange == true)
        DisplayPlayerNameTagsOnBlips(true)
        ShowHeightOnBlip(blip, false)

        if Config.DutyBlipOptions.ShowHeading then
            SetBlipRotation(blip, math.floor(officer.heading))
            ShowHeadingIndicatorOnBlip(blip, true)
        end

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(FormatString(Config.DutyBlipOptions.Name, {
            name = officer.name,
            callsign = officer.callsign
        }))
        EndTextCommandSetBlipName(blip)

        gameBlips[officer.source] = {
            blip = blip,
            hasJob = hasJob,
            ped = ped
        }

        ::continue::
    end

    for source, blip in pairs(gameBlips) do
        if not blip.hasJob() then
            RemoveBlip(blip.blip)

            gameBlips[source] = nil
        end
    end
end

---@param officer? RawOfficer
---@return StrippedOfficer | nil
local function FormatOfficer(officer)
    if not officer then
        debugprint("FormatOfficer: officer is nil")
        return
    end

    ---@type StrippedOfficer
    return {
        source = officer[1],
        name = officer[2],
        callsign = officer[3],
        avatar = officer[4],
        coords = vector2(officer[5][1], officer[5][2]),
        heading = officer[6],
        inVehicle = officer[7]
    }
end

---@param event string
---@param nuiEvent string
---@param hasJob fun(): boolean
function RegisterDutyBlipsListener(event, nuiEvent, hasJob)
    ---@param officerBlips RawOfficer[]
    RegisterNetEvent(event, function(officerBlips)
        if not hasJob() then
            debugprint(event .. ": does not have job")
            return
        end

        local formattedOfficers = {}
        local playerSource = GetPlayerServerId(PlayerId())

        for i = 1, #officerBlips do
            local officer = FormatOfficer(officerBlips[i])

            if officer and officer.source ~= playerSource then
                formattedOfficers[#formattedOfficers+1] = officer
            end
        end

        SendReactMessage(nuiEvent, formattedOfficers)
        RefreshDutyBlips(formattedOfficers, hasJob)
    end)
end

if Config.DutyBlipOptions and Config.DutyBlipOptions.Show then
    AddEventHandler("lb-tablet:jobUpdated", function()
        for source, blip in pairs(gameBlips) do
            if not blip.hasJob() then
                RemoveBlip(blip.blip)

                gameBlips[source] = nil
            end
        end
    end)
end
