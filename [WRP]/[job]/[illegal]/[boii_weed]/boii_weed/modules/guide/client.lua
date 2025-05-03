--- @section Events

--- Event to open guide book.
--- @param data table: Table containing players skills.
RegisterNetEvent("boii_weed:cl:open_guide", function(growing_skills, processing_skills)
    if not growing_skills and not processing_skills then return end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open_guide",
        growing_skills = growing_skills,
        processing_skills = processing_skills
    })
end)