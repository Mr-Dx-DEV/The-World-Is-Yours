-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {}
CustomDP.PropEmotes = {
    --Jim-CatCafe
    ["uwu1"] = {
        "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu2"] = {
        "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = {0.03, 0.0, -0.08, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu3"] = {
        "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_cup_straw', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu4"] = {
        "'amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_mug', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu5"] = {
        "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
        { Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = {0.16, 0.06, -0.03, -50.0, 16.0, 60.0},
            EmoteMoving = true, }},
    ["uwu6"] = {
        "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
        { Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, 20.0, 60.0},
            EmoteMoving = true, }},
    ["uwu7"] = {
        "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
        { Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = {0.18, 0.03, 0.02, -50.0, 16.0, 60.0},
            EmoteMoving = true, }},
    ["uwu8"] = {
        "amb@world_human_seat_wall_eating@male@both_hands@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_eggroll', PropBone = 60309, PropPlacement = {0.10, 0.03, 0.08, -95.0, 60.0, 0.0},
            EmoteMoving = true, }},
    ["uwu9"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions =
        { Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
            SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = {0.0, 0.0 ,0.0, 0.0, 0.0, 0.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu10"] = {
        "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
        { Prop = 'uwu_sandy', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.05, -225.0, 20.0, 60.0},
            EmoteMoving = true, }},
    ["uwu11"] = {
        "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_cupcake', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.03, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu12"] = {
        "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
        { Prop = 'uwu_btea', PropBone = 28422, PropPlacement = {0.02, 0.0, -0.05, 0.0, 0.0, 130.0},
            EmoteLoop = true, EmoteMoving = true, }},
    ["uwu13"] = {
        "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
        { Prop = 'uwu_gdasik', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.02, -225.0, 20.0, 60.0},
            EmoteMoving = true, }},
}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

-- Add the custom emotes to RPEmotes main array
for arrayName, array in pairs(CustomDP) do
    if RP[arrayName] then
        for emoteName, emoteData in pairs(array) do
            RP[arrayName][emoteName] = emoteData
        end
    end
    -- Free memory
    CustomDP[arrayName] = nil
end
-- Free memory
CustomDP = nil
