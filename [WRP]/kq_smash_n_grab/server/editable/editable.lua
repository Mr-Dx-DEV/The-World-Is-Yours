
-- This function gets called when a player performs an action which normally should be impossible. Meaning that they could be running a lua injector or other cheat
function InvalidLootingDetected(player, message)
    print(player, message)
end
