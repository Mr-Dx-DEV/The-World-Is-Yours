local function sendDiscordLog(title, message)
    local embed = {
        {
            ['title'] = title,
            ['description'] = message,
            ['type'] = 'rich',
            ['color'] = 16711680,
        }
    }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), {['Content-Type'] = 'application/json'})
end

RegisterServerEvent('envi-prescriptions:giveMedication')
AddEventHandler('envi-prescriptions:giveMedication', function(source, medicationToGive, playerName, dobirth, dosage)
    local player = Framework.GetPlayer(source)
    local name = player.Firstname .. ' ' .. player.Lastname or player.Name
    local dob = player.DateOfBirth
    local prescriptionId = math.random(100000, 999999)
    local total = nil
    local effects = nil
    local sideEffects = nil
    local anim = nil
    for _, medication in ipairs(Config.Medications) do
        if medication.item == medicationToGive then
            total = medication.total
            effects = medication.effects
            sideEffects = medication.sideEffects
            anim = medication.anim 
            break
        end
    end
    local info = {}
    info.prescription = Config.Lang['metadata_prescription'](prescriptionId)   -- PRESCRIPTION ID
    info.name = Config.Lang['metadata_patient_name'](name)                    -- PATIENT NAME
    info.dob = Config.Lang['metadata_patient_dob'](dob)                     -- PATIENT DOB 
    info.type = ' - '..name
    info.total = dosage --or total                                        -- REMAINING DOSES
    info.dosage = Config.Lang['metadata_take4timesperday']                 -- DOSAGE INFO  (ONE BEFORE BOTTOM)
    info.warning = Config.Lang['metadata_warning']                       -- WARNING INFO (BOTTOM)  
    info.effects = effects
    info.sideEffects = sideEffects
    info.anim = anim
    if info.effects then
        Framework.AddItem(source, medicationToGive, 1, info)
    else
        Framework.AddItem(source, medicationToGive, dosage, info)
    end
    local logTitle = Config.Lang['prescription_collected']
    local logMessage = Config.Lang['player_medication_batchid_patientdob'](name, medicationToGive, prescriptionId, dob)
    sendDiscordLog(logTitle, logMessage)

end)

Framework.CreateCallback('envi-prescriptions:checkMedication', function(source, cb, entity)
    local player = Framework.GetPlayer(source)
    local playerName = player.Firstname .. ' ' .. player.Lastname or player.Name
    local dobirth = player.DateOfBirth
    local medicationToGive = nil
    local dosage = nil
    local noMoney = false
    for _, medication in ipairs(Config.Medications) do
        local script = Config.PrescriptionItem
        local src = source
        local playerItems = Framework.GetItem(src, script)
        for _, item in ipairs(playerItems) do
            if item.metadata and item.metadata.type == ' - ' .. playerName then
                if Config.PayForMedication then
                    if player.GetMoney(Config.PaymentType) >= Config.MedicationCost then
                        player.RemoveMoney(Config.PaymentType, Config.MedicationCost)
                        medicationToGive = item.metadata.meds
                        dosage = item.metadata.doses
                        Framework.RemoveItem(src, script, 1)
                        break
                    else
                        noMoney = true
                        break
                    end
                else
                    medicationToGive = item.metadata.meds
                    dosage = item.metadata.doses
                    Framework.RemoveItem(src, script, 1)
                    break
                end
            end
        end
    
        if medicationToGive then
            break
        end
    end
    if noMoney then
        Framework.Notify(source, Config.Lang['no_money'], 'error')
        cb(false)
    else
        cb(medicationToGive)
    end
    if medicationToGive then
        Wait(21000)        
        TriggerEvent('envi-prescriptions:giveMedication', source, medicationToGive, playerName, dobirth, dosage)
    end
end)

RegisterServerEvent('envi-prescriptions:writePrescription')
AddEventHandler('envi-prescriptions:writePrescription', function(medication, prescriptionId, dob, itemLabel, name, docGrade, doctor, expiry, doses)
    local xPlayer = Framework.GetPlayer(source)
    local expiryTime = os.time() + 172800
    local expiryDate = os.date('%Y-%m-%d %H:%M:%S', expiryTime)
    local info = {}
    info.prescription = Config.Lang['metadata_prescription'](prescriptionId)   -- PRESCRIPTION ID
    info.name = Config.Lang['metadata_patient_name'](name)                      -- PATIENT NAME
    info.dob = Config.Lang['metadata_patient_dob'](dob)                         -- PATIENT DOB
    info.itemLabel = Config.Lang['metadata_prescribed_medication'](itemLabel)   -- MEDICATION ITEM LABEL
    info.signed = Config.Lang['metadata_signed_by'](docGrade, doctor)        -- DOCTOR GRADE & NAME
    info.expiry = Config.Lang['metadata_expires'](expiry)                    -- EXPIRY DATE 
    info.meds = medication                                                 
    info.type = ' - '..name                                                
    info.doses = doses                                                    -- DOSES
    Framework.AddItem(source, Config.PrescriptionItem, 1, info)
    local logTitle = Config.Lang['prescription_written_hook']
    local logMessage = Config.Lang['doctor_medication_information_expirydate'](xPlayer.Name, medication, json.encode(info), expiryDate)
    sendDiscordLog(logTitle, logMessage)
end)

local registered = {}

for _, medication in ipairs(Config.Medications) do

    if medication.effects then
        if not registered[medication.item] then
            --print('creating useable item', medication.item, medication.effects)
            Framework.CreateUseableItem(medication.item, function(source, item, data)
                TriggerClientEvent('envi-prescriptions:drugEffects', source, data.metadata.effects, data.metadata.anim, data.metadata.sideEffects)
                if data.metadata.total and data.metadata.total > 0 then
                    data.metadata.total = data.metadata.total - 1
                    if data.metadata.total <= 0 then
                        Framework.Notify(source, Config.Lang['ran_out_of']..' '..data.label, 'error')
                        Framework.RemoveItem(source, item, 1)
                    else
                        Framework.Notify(source, Config.Lang['you_took']..' '..data.label..' - '..Config.Lang['amount_remaining']..data.metadata.total, 'error')
                    --  print(json.encode(data.metadata))
                        Framework.SetItemMetadata(source, data.slot, data.metadata)
                    end
                end
                registered[medication.item] = true
            end)
        end
    end
end

Framework.CreateCallback('envi-prescriptions:getPlayerInfo', function(source, cb, closestPlayerServerId)
    local xPlayer = Framework.GetPlayer(closestPlayerServerId)
    if xPlayer then
    cb({
        name = xPlayer.Firstname .. ' ' .. xPlayer.Lastname or xPlayer.Name,
        dob = xPlayer.DateOfBirth
    })
    else
    cb(nil)
    end
end)