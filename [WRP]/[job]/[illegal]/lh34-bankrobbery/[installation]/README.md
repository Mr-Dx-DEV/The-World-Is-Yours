Made by Lionh34rt
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
Bank robbery script for FiveM using Gabz MLO's and UncleJust Maze Bank

Features:
- Optimized and secured
- Server synced
- Highly configurable regarding minigames, rewards and various settings
- Full heist resets

# Dependencies
* [mkalasers by mkafrin](https://github.com/mkafrin/mka-lasers)
* [Gabz MLO's](https://www.gabzv.com/)
* [Maze Bank MLO by UncleJust (optional)](https://unclejust.tebex.io/)
* [Memorygame by pushkart2](https://github.com/pushkart2/memorygame)
* [Hackinig Minigames by Kylend](https://github.com/dnelyk/Hacking_Minigames)
* [Hack minigame by Jasper-Hustad](https://github.com/Jesper-Hustad/NoPixel-minigame)
* [NoPixel Minigames by Sharkiller](https://github.com/sharkiller/nopixel_minigame)
* [lh34-powerplant by Lionh34rt](https://lionh34rt.tebex.io/)

# Installation
* **Install all the dependencies.**
* **Add the doorlocks file to qb-doorlock/configs and remove other bankrelated doors.**
* **Add the items to your inventory**
* **In cfx-gabz-mapdata, disable entitysets for fleeca, paleto and pacific.**

# Config for qb-scoreboard: make sure your banks are named like this or remove the qb-scoreboard triggers in bankrobberies
```lua
["fleeca"] = {
    minimumPolice = 0,
    busy = false,
    label = "Fleeca Bank"
},
["maze"] = {
    minimumPolice = 0,
    busy = false,
    label = "Maze Bank"
},
["paleto"] = {
    minimumPolice = 0,
    busy = false,
    label = "Paleto Bank"
},
["pacific"] = {
    minimumPolice = 0,
    busy = false,
    label = "Pacific Bank"
},
```

# Nightvision: add this to your qb-smallresources
```lua
-- Server side:
QBCore.Functions.CreateUseableItem("nightvision", function(source)
    TriggerClientEvent("nightvision:UseNightvision", source)
end)

-- Client Side: create nightvision.lua
local QBCore = exports['qb-core']:GetCoreObject()

local nightvision = false

RegisterNetEvent("nightvision:UseNightvision", function()
    nightvision = not nightvision
    QBCore.Functions.Progressbar("remove_gear", "Nightvision..", 250, false, true, {}, {}, {}, {}, function()
        if nightvision then
            SetNightvision(true)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "nv", 0.25)
            SetPedPropIndex(PlayerPedId(), 0, 117, 0, true)
        else
            SetNightvision(false)
            SetPedPropIndex(PlayerPedId(), 0, 116, 0, true)
        end
    end)
end)
```