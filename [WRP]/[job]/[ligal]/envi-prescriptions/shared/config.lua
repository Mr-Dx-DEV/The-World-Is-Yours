Config = {}

Config.TestMode = false -- set to true to write prescriptions for yourself instead of the closest player
Config.Target = true -- set to true if you want to use either ox_target, qb-target or qtarget. Set to false to use zones and TextUI

Config.Job = 'ambulance' -- job name
Config.MinimumGrade = 2 -- minimum job grade
Config.ItemUse = true -- use item from inventory to activiate menu (true) or use command (false)
Config.ItemName = 'prescription_pad' -- item name - only if Config.ItemUse is set to 'true'
Config.CommandName = 'prescription' -- command name - only if Config.ItemUse is set to 'false'

Config.PrescriptionItem = 'prescription' -- item name for prescription receipt

Config.PayForMedication = true -- set to true if you want to charge the player for the medication when collecting. If set to false, the player will not be charged.
Config.PaymentType = 'cash' -- 'cash' or 'bank' or another account name
Config.MedicationCost = 500 -- cost of medication

Config.Medications = {               -- Add more drugs/medications here (you could add more effects and animations in bridge/shared/client.lua)
    {item = 'adrenaline', label = 'Adrenaline', total = 3, effects = 'speed', sideEffects = 'blurryvision', anim = 'needle'},
    {item = 'oxy', label = 'Oxycontin', total = 10, effects = 'heal', sideEffects = 'drowsy', anim = 'pill'},
    {item = 'steroids', label = 'Steroids', total = 5, effects = 'strength', sideEffects = 'headaches', anim = 'pill'},
    {item = 'valium', label = 'Valium', total = 15, effects = 'stress', sideEffects = 'slow', anim = 'pill'},
    {item = 'xanax', label = 'Xanax', total = 20, effects = 'armor', sideEffects = 'drowsy', anim = 'pill'},
    
      -- Total = Max amount that can be prescribed! 
 
    -- THIS IS HOW TO ADD ITEMS TO BE PRESCRIBED, BUT THE EFFECTS WILL BE HANDLED IN ANOTHER SCRIPT
    {item = 'cough_syrup', label = 'Cough Syrup'},  -- Needed for Lean Crafting 

    -- Uncomment the lines below if you want to use together with Wasabi Ambulance
    -- Download it here: https://store.wasabiscripts.com/package/5306547

     {item = 'morphine30', label = 'Morphine 30MG'},
     {item = 'morphine15', label = 'Morphine 15MG'},
     {item = 'perc30', label = 'Percocet 30MG'},
     {item = 'perc10', label = 'Percocet 10MG'},
     {item = 'perc5', label = 'Percocet 5MG'},
     {item = 'vic10', label = 'Vicodin 10MG'},
     {item = 'vic5', label = 'Vicodin 5MG'},
    


    -- [❗ PLEASE NOTE ❗] -- 
    -- Please see the documentation for more detailed set-up instructions
}

Config.SideEffectsChance = 5 -- % chance of side effects

Config.CoughSyrupItem = 'cough_syrup' -- item name for cough syrup - (use this item to craft Lean)
Config.LeanCupItem = 'lean_cup' -- item name for lean cup - (must have this item on you to craft Lean)
Config.SprunkItem = 'sprunk_bottle' -- item name for sprunk - (must have this item on you to craft Lean)
Config.LeanItem = 'lean' -- item name for lean - (Final Lean item)

Config.NarcanItem = 'narkan' -- item name for narcan - (use this item on another player stop them overdosing)

Config.MeleeWeapons = {'WEAPON_UNARMED','WEAPON_KNIFE', 'WEAPON_KNUCKLE', 'WEAPON_NIGHTSTICK', 'WEAPON_HAMMER', 'WEAPON_BAT', 'WEAPON_GOLFCLUB', 'WEAPON_CROWBAR', 'WEAPON_BOTTLE', 'WEAPON_DAGGER', 'WEAPON_HATCHET', 'WEAPON_MACHETE', 'WEAPON_SWITCHBLADE', 'WEAPON_BATTLEAXE', 'WEAPON_POOLCUE', 'WEAPON_WRENCH', 'WEAPON_FLASHLIGHT', 'WEAPON_STONE_HATCHET'}

Config.ServerSidePeds = true -- set to false if you want to use client-side peds instead of server-side peds (added for those with OneSync issues)

Config.Pharmacies = {
  -- ['pharmacy1'] = {
  --     id = 1,  -- ID for this pharmacy
  --     PedModel = "s_m_m_scientist_01",
  --     PedSpawnCoords = vector4(-1253.8384, -1436.7432, 4.373, 127.0),
  --     PedBlip = {
  --         sprite = 51,
  --         scale = 0.75,
  --         colour = 38,
  --         display = 2,
  --         name = 'Pop\'s Pills - Pharmacy',
  --         shortRange = true,
  --     },
  --     PedWalkCoords = vector4(-1254.5278, -1434.0822, 4.3739, 300.0),
  --     PharmacyAnimation = {
  --         dict = "anim@amb@business@bgen@bgen_inspecting@",
  --         anim = "inspecting_med_counting_02_inspector",
  --         flag = 49
  --     }
  -- },
  ['pharmacy2'] = {
      id = 2,  -- ID for this pharmacy
      PedModel = "s_m_m_scientist_01",
      PedSpawnCoords = vector4(-492.22, -342.66, 42.32, 350.23),
      PedBlip = {
          sprite = 51,
          scale = 0.75,
          colour = 38,
          display = 2,
          name = 'Pharmacy',
          shortRange = true,
      },
      PedWalkCoords = vector4(-492.22, -342.66, 42.32, 350.23),
      PharmacyAnimation = {
          dict = "anim@amb@business@bgen@bgen_inspecting@",
          anim = "inspecting_med_counting_02_inspector",
          flag = 49
      }
  },
  -- ['pharmacy3'] = {                        -- [PILLBOX HOSPTIAL]
  --     id = 3,  -- ID for this pharmacy
  --     PedModel = "s_m_m_scientist_01",
  --     PedSpawnCoords = vector4(311.4, -594.02, 43.28, 340.34),
  --     PedBlip = {
  --         sprite = 51,
  --         scale = 0.75,
  --         colour = 38,
  --         display = 2,
  --         name = 'Pillbox - Pharmacy',
  --         shortRange = true,
  --     },
  --     PedWalkCoords = vector4(310.45, -596.99, 43.28, 155.66),
  --     PharmacyAnimation = {
  --         dict = "anim@amb@business@bgen@bgen_inspecting@",
  --         anim = "inspecting_med_counting_02_inspector",
  --         flag = 49
  --     }
  -- },
}

function Notify(message, type, time)
  lib.notify({
      id = 'prescription',
      title = 'Pillbox Prescriptions',
      description = message,
      position = 'top',
      style = {
          backgroundColor = '#141517',
          color = '#909296'
      },
      icon = 'heartbeat',
      iconColor = '#C53030',
      length = time
  }) 
end

function TextUI(textUILabel)
  lib.showTextUI(textUILabel, {
      position = "top-center",
      icon = 'fas fa-prescription-bottle-alt',
      style = {
          borderRadius = 3,
          backgroundColor = 'teal',
          color = 'white'
      }
  })
end

Config.Lang = {
    -- client-side 
      -- notifications
    ['no_patient_nearby'] = 'No patient nearby',
    ['failed_to_get_patient_info'] = 'Failed to get patient info',
    ['no_medication_selected'] = 'No medication selected',
    ['not_a_doctor'] = 'You are not a doctor!',
    ['prescription_written'] = function(itemLabel, name) return 'Prescription for '..itemLabel.. ' has been written for ' .. name end,
    ['prescription_expired'] = 'Your prescription has expired',
    ['prescription_ready'] = 'Your prescription is ready.',
    ['select_medication_confirm'] = 'You must select a medication and dosage before confirming.',
      -- menu
    ['prescriptions_menu_title'] = '🧾 Prescriptions Menu 🧾',

    ['unique_prescription_id'] = 'Unique Prescription ID',
    ['citizen_gov_name'] = 'Citizen\'s Government Name',
    ['citizen_dob'] = 'Citizen\'s Date of Birth',
    ['prescription_number'] = function(prescriptionId) return '🔢 Prescription #: ' .. prescriptionId end,
    ['patient_name'] = function(name) return '🧑 Patient Name: ' .. name end,
    ['patient_dob'] = function(dob) return '📆 Patient DOB: ' .. dob end,
    ['prescribed_medication'] = '💊 Prescribed Medication 💊',
    ['select_medication'] = 'Select the medication to be prescribed.',
    ['signed'] = function(docGrade, doctor) return '🖋️ Signed - ' .. docGrade .. ' ' .. doctor end,
    ['confirm_selection'] = '✅ [ Confirm Selection ] ✅',
    ['confirm_your_selection'] = 'Confirm your selected medication and sign the prescription.',
    ['choose_meds'] = 'Pick your Poison..',

    ['prescribed_doses'] = '💊 Prescribed Doses 💊',          -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['select_dose'] = 'Select the amount of doses to be prescribed.', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['no_dose_selected'] = 'You must select a dosage!', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['cant_do_that_much'] = 'You can\'t prescribe that many doses of this drug! Max: ', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    
    ['narkan_use'] = 'Someone had admisitered Narkan to you!', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['narkan_use2'] = 'You\'re starting to come back around!', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['narkan_use3'] = 'You start to feel better!', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
    ['used_narcan'] = 'You have admisitered Narkan!', -- <<<< THIS IS NEW - DONT MISS IT WHEN UPDATING
      -- metadata
      ['metadata_description'] = function(prescriptionId, dob, itemLabel, docGrade, doctor, expiry) return '**Prescription #:** *' .. prescriptionId .. '* | **Patient DOB:** *' .. dob .. '* | **Prescribed Medication:** *' .. itemLabel .. '* | **Signed by:** *' .. docGrade .. ' ' .. doctor .. '* | **Expires:** *' .. expiry .. '*' end,
      -- pharmacy notifications
    ['collect_medication_start'] = 'You here to collect your prescription? Please allow me a moment to check my records..',
    ['collect_medication_processing'] = 'Please wait a moment we process your prescription. Feel free to take a seat!',
    ['collect_medication_ready'] = 'Here you go, your prescription is ready for collection. Take care of yourself and have a nice day!',
    ['collect_medication_no_prescription'] = 'Sorry, it looks like we don\'t have any prescriptions pending under your name..',
      -- target label
    ['target_collect_medication'] = 'Collect Medication',
    -- Server-side
        -- webhook info
    ['prescription_collected'] = 'Prescription Collected',
    ['player_medication_batchid_patientdob'] = function(name, medication, prescriptionId, dob) return '**Player:** ' .. name .. '\n**Medication:** ' .. medication .. '\n**Batch ID #:** ' .. prescriptionId .. '\n**Patient DOB:** ' .. dob end,
    ['prescription_written_hook'] = 'Prescription Written',
    ['doctor_medication_information_expirydate'] = function(doctor, medication, metadata, expiryDate) return '**Doctor:** ' .. doctor .. '\n**Medication:** ' .. medication .. '\n**Information:** ' .. metadata .. '\n**Expiry Date:** ' .. expiryDate end,
    ['med_metadata_description'] = function(batchId, dob) return '**Batch ID #:** *' .. batchId .. '* | | **Patient DOB:** *' .. dob .. '* *Take 4 times per day or as otherwise directed.* **⚠️ DO NOT EXCEED MAXIMUM DOSAGE ⚠️**' end,


        --QB inv
        ['metadata_prescription'] = function(prescriptionId) return '' .. prescriptionId .. ' ' end,
        ['metadata_patient_name'] = function(name) return '' .. name .. ' ' end,
        ['metadata_patient_dob'] = function(dob) return '' .. dob .. ' ' end,
        ['metadata_prescribed_medication'] = function(itemLabel) return '' .. itemLabel .. ' ' end,
        ['metadata_signed_by'] = function(docGrade, doctor) return '' .. docGrade .. ' ' .. doctor .. '' end,
        ['metadata_expires'] = function(expiry) return '' .. expiry .. ' ' end,
        ['metadata_warning'] = 'DO NOT EXCEED MAXIMUM DOSAGE',
        ['metadata_take4timesperday'] = 'Take 4 times per day or as otherwise directed.',

      ['no_money'] = 'You don\'t have enough money to pay for the medication!',
      ['ran_out_of'] = 'Looks like you\'re all out of',
      ['you_took'] = 'You\'ve taken',
      ['amount_remaining'] = 'Doses Left: ',
      
      -- [NEWLY ADDED (WAS MISSING oops ) ] -- 
      ['missing_lean_items'] = 'You need a cup, cough syrup and sprunk to make lean!',

}

Config.Webhook = '' -- Discord webhook for logging
