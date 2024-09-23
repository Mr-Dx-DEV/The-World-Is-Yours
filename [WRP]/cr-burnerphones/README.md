# Features
- Order Random/Illegal Items through a burnerphone.
- Phone breaks at random or after a configured used amount
- Random Item Received chosen through a configured list, with item probability
- Configurable prop + animation for each configured item
- Configurable Dispatch Alert on drop off, VPN item to suppress it
- Modular, can have an infinite amount of different phones & loot tables
- Everything is synced, other players / police can find someone's drop off
- No Duplicate Drop-offs, someone else will not get the same drop off point if one is currently "busy"
- Multiple Cooldown Options (Global, Personal, Per Player, Per Phone Type, Server Start Cooldown)
- Highly Configurable, Every single Framework or Ressource Dependent function is open.
- Locales File

# Dependencies
Either
- [qb-core](https://github.com/qbcore-framework/qb-core)
Or
- [ESX Legacy](https://github.com/esx-framework/esx-legacy)

One version of rpemotes (Not required, but used for the animations)

# Optional Supports
- [ps-ui](https://github.com/Project-Sloth/ps-ui)
- [qb-target](https://github.com/berkiebb/qb-target)
- [okokDrawText] & [okokNotify](https://okok.tebex.io/)
- [mythic_notify](https://github.com/JayMontana36/mythic_notify)
- [nh-context](https://github.com/nerohiro/nh-context)
- [rprogress](https://github.com/Mobius1/rprogress)
- [mythic_progbar](https://github.com/HalCroves/mythic_progbar)
- [oxlib], [ox_inventory], [ox_target](https://github.com/overextended)

# Installation #
-- Add the following code snippets to the files mentionned above them.

## QBCcore Inventories Instalation (qb/lj-inventory)
- Add the following items in `qb-core/shared/items.lua`
- Add the item images in your inventory's `hmtl/images` folder.

```
	['burnerphone'] = {    ['name'] = 'burnerphone',    ['label'] = 'Burner Phone',    ['weight'] = 150,    ['type'] = 'item',    ['image'] = 'burnerphone.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Somekind of lost Phone?'},

	['burnerphone_wep'] = {    ['name'] = 'burnerphone_wep',    ['label'] = 'Burner Phone',    ['weight'] = 150,    ['type'] = 'item',    ['image'] = 'burnerphone_wep9.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Somekind of lost Phone?'},

    ['burnerphonevpn'] = {    ['name'] = 'burnerphonevpn',    ['label'] = 'Soleware VPN',    ['weight'] = 250,    ['type'] = 'item',    ['image'] = 'burnerphonevpn.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Somekind of lost VPN from Soleware?'},
```

## Ox_Inventory Instalation
- Add the following items in `ox_inventory/data/items.lua`
- Add the item images in `ox_inventory/web/images.lua`.

```
['burnerphone'] = { label = 'Burner Phone', weight = 150, stack = false, close = true, description = 'Some kind of old phone?' },

['burnerphone_wep'] = { label = 'Burner Phone', weight = 150, stack = false, close = true, description = 'Some kind of old phone?' },

['burnerphonevpn'] = { label = 'Soleware VPN', weight = 250, stack = false, close = true, description = 'Some kind of lost VPN from Soleware?' },
```

## Default ESX Instalation
- Add the items to the database by inserting the items.sql file accordingly

# If using ox_lib | Open the fxmanifest.lua and remove the comments on line 11 to enable ox_lib

# (QBCore) If using Logs --> qb-smallresources/server/logs.lua | Add the following within ```local Webhooks {}```

```
    ['burnerphones'] = 'YOUR_WEBHOOK_HERE',
```

## RPEmotes
- You can change the name of the emote script in cl_framework.lua to your desired script. (All the ones similar to RPEmotes should be working as intended)


# Project Sloth Dispatch Integration

* New PS-Dispatch Configuration (See below for old ps-dispatch version)
    - If using ps-dispatch --> Add this function in 'ps-dispatch/client/cl_alerts.lua'
    - You can change the information here to match the your desired configurations.
    - If you have multiple police jobs, don't forget to add them all here too.

```lua
local function CRBurnerphones(coords, tenCode, message)
    local dispatchData = {
        message = message,
        codeName = 'crburnerphones',
        code = tenCode,
        icon = 'fas fa-box',
        priority = 2,
        coords = coords,
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords),
        alertTime = nil,
        jobs = {'leo'}
    } TriggerServerEvent('ps-dispatch:server:notify', dispatchData)
end exports('CRBurnerphones', CRBurnerphones)
```
* You also need to add these lines in config.lua
    - You can change the information here to match the your desired configurations.

```lua
["crburnerphones"] = {
        radius = 0,
        sprite = 306,
        color = 1,
        scale = 1.5,
        length = 2,
        sound = "robberysound",
        sound2 = 'GTAO_FM_Events_Soundset',
        offset = false,
        blipflash = false
}
```

* OLD PS-Dispatch Configuration
    - If using ps-dispatch --> Add this function in 'ps-dispatch/client/cl_extraalerts.lua'
    - You can change the information here to match the your desired configurations.
    - If you have multiple police jobs, don't forget to add them all here too.

```lua
local function CRBurnerphones(coords, tenCode, message, policeJobs)
    local currentPos = coords
    local locationInfo = GetStreetAndZone(currentPos)
    local gender = GetPlayerGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "crburnerphones",
        dispatchCode = tenCode,
        firstStreet = locationInfo,
        gender = gender,
        camId = nil,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = message, -- message
        job = policeJobs -- jobs that will get the alerts
    })
end exports('CRBurnerphones', CRBurnerphones)
```

* You also need to add these lines in ps-dispatch/server/sv_dispatchcodes.lua
    - Be sure to add all of your police jobs in the table.

```lua
["crburnerphones"] =  {displayCode = '911', description = "Suspicious Package Drop Off", radius = 0, recipientList = {'police'}, blipSprite = 306, blipColour = 1, blipScale = 1.5, blipLength = 2, sound = "robberysound"},
```