return {
    --- Client side language
    client = {        
        --- Plant Actions
        destroying_plant = "Destroying Plant...",
        feeding_plant = "Feeding Plant...",
        watering_plant = "Watering Plant...",
        curing_plant = "Curing Plant...",
        harvesting_plant = "Harvesting Plant...",
        watering_can_header = "WATERING CANS",
        filling_watering_can = "Filling Watering Can...",
        not_near_water = "You need to be in water to fill up a watering can...",
    }, 

    --- Server side language
    server = {
        --- General
        no_permission = "You dont have permission to do this...",

        --- Notifications
        planting_header = "DRUG PLANTING",
        processing_header = "DRUG PROCESSING",
        consumables_header = "CONSUMABLES",
        
        --- Planting
        plant_not_found = "Plant not found...",
        too_close_to_plant = "Too close to another plant...",
        too_many_plants = "You cant place any more plants right now, destroy one first...",
        strain_missing = "Cant spawn plant, strain doesnt exist...",
        watered_plant = "Watered with %s, increased water by %d",
        fed_plant = "Fed with %s, increased food by %d",
        harvested_plant = "Harvested %d of %s",
        no_pests = "No pests to cure...",
        no_diseases = "No diseases to cure...",
        cured_plant = "%s cured successfully.",
        not_mature_enough = "Plant is not mature enough to harvest...",
        invalid_strain_or_yeild = "Invalid strain or yield not defined...",
        harvest_item_missing = "Harvest item not found for this strain...",

        --- Tables
        too_many_tables = "You have too many tables down already pick one up...",
        table_not_found = "Table not found...",    
        invalid_strain = "Invalid strain selected...",
        invalid_recipe = "Invalid recipe type...",
        recipe_not_found = "Recipe not found...", 
        missing_ingredients = "Missing: %s",
        processing_received = "You received x%d %s",
        table_picked_up = "Table picked up successfully!",
        
        --- Consumables
        no_lighter = "You need a lighter to smoke...",
        no_bong = "You dont have a bong to smoke with..."
    }
}
