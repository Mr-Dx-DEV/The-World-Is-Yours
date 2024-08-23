# Features
* Any Framework depending function is Open Source
* Simple Identification Forgery System
* "Craft" or "Purchase" Identification Cards
* Waters, Weapon, Fishing, Hunting, Drivers, and ID Cards
* Experience System to unlock new cards, or perfect known ones.
* Police ID Scanner to find out if a card is forged or not
* Multiple Locations, each with their own IDs
* Legal & Illegal Forge, for any server's need.
* Intricate Notifications
* Logs System Included
* Highly Configurable System
* Every card created contains `info.forged = true`, which let's you differentiate between real and fake cards.

# Dependencies
- [bob74_ipl](https://github.com/Bob74/bob74_ipl)
- [qb-input](https://github.com/qbcore-framework/qb-input)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-target](https://github.com/berkiebb/qb-target)

# Inventory Image Credits
Thank You OG Panda#6041 for providing us with some fantastic Fishing, Hunting, and Waters License PNG's! :)

# Compatibility
- An internal (Open Source) integration of a conversion system for bl_idcards. ['https://github.com/Byte-Labs-Studio/bl_idcard']
- KeyNames can be modified to fit any id system
- Entire useable item function can be modified to fit any id system
- Open a ticket on discord to request additional interal integrations of other resources

# Exports
Use `CheckIsForged` to find out if a card is forged or not.
```
-- Checks if a specified item is forged
---@param source number Player source
---@param item any number (slot) or table (item or item metadata) to check for
---@return boolean - is Item forged?
function CheckIsForged(source, item)
```

# Experience & Card Quality
- This script offers an optional experience & Card Quality System
- To use it, you need to add `PlayerData.metadata['forgeryXp'] = PlayerData.metadata['forgeryXp'] or 0` in qbcore/server/player.lua (Without the ``)
- Crafting certain cards can be locked behind a certain xp
- Crafting cards give a configurable amount of xp
- When crafted, card quality is calculated via `PlayerXP / PerfectionXP * 100`
- The chance of the id scanner detecting the card being forged depends on the quality of the card.

# Installation #

# qb-core/shared/items.lua

- Id Scanner is required. Extra licenses only if you want to add them.
```lua
    -- Required
    ['id_scanner'] = {    ['name'] = 'id_scanner',    ['label'] = 'Card Scanner',    ['weight'] = 5000,    ['type'] = 'item',    ['image'] = 'id_scanner.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = true,    ['combinable'] = nil,    ['description'] = 'Device used to scan cards & ids for any counterfit hints.'},
    -- Optional
	['fishinglicense'] = {    ['name'] = 'fishinglicense',    ['label'] = 'Fishing License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'fishinglicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Fish'},

    ['huntinglicense'] = {    ['name'] = 'huntinglicense',    ['label'] = 'Hunting License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'huntinglicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Hunt'},

    ['waterslicense'] = {    ['name'] = 'waterslicense',    ['label'] = 'Waters License',    ['weight'] = 0,    ['type'] = 'item',    ['image'] = 'waterslicense.png',    ['unique'] = true,    ['useable'] = true,    ['shouldClose'] = false,    ['combinable'] = nil,    ['description'] = 'Permit to show you can Drive a Boat'},

```


# QB Compatibility & Adding new Licenses

- For each license used with this system, you need to do the following :
- Examples are given with the driver's & weapons licenses, simply copy paste & edit the name & type for each license used
- This should work with any qb-inventory based inv. LJ & PS inv work with these procedures.
- Read carefully each instructions & make sure they apply for the scripts you use in your server

## qb-inventory/server/main.lua | Add the following below the GiveItem QBCore.Commands(id_card & driver_license section specifically)
* This step can be skipped if using bl_idcards
* `id_card` can be excluded from these instructions.
```
				elseif itemData["name"] == "driver_license" then
					info.citizenid = Player.PlayerData.citizenid
					info.firstname = Player.PlayerData.charinfo.firstname
					info.lastname = Player.PlayerData.charinfo.lastname
					info.birthdate = Player.PlayerData.charinfo.birthdate
					info.gender = Player.PlayerData.charinfo.gender
					info.nationality = Player.PlayerData.charinfo.nationality
					info.type = "Class C Driver License"
                elseif itemData["name"] == "weaponlicense" then
					info.citizenid = Player.PlayerData.citizenid
					info.firstname = Player.PlayerData.charinfo.firstname
					info.lastname = Player.PlayerData.charinfo.lastname
					info.birthdate = Player.PlayerData.charinfo.birthdate
					info.gender = Player.PlayerData.charinfo.gender
					info.nationality = Player.PlayerData.charinfo.nationality
					info.type = "Class One Weapon License"
```

- Extra Ids for your convenience
```

				elseif itemData["name"] == "huntinglicense" then
					info.citizenid = Player.PlayerData.citizenid
					info.firstname = Player.PlayerData.charinfo.firstname
					info.lastname = Player.PlayerData.charinfo.lastname
					info.birthdate = Player.PlayerData.charinfo.birthdate
					info.gender = Player.PlayerData.charinfo.gender
					info.nationality = Player.PlayerData.charinfo.nationality
					info.type = "Hunting License"
				elseif itemData["name"] == "fishinglicense" then
					info.citizenid = Player.PlayerData.citizenid
					info.firstname = Player.PlayerData.charinfo.firstname
					info.lastname = Player.PlayerData.charinfo.lastname
					info.birthdate = Player.PlayerData.charinfo.birthdate
					info.gender = Player.PlayerData.charinfo.gender
					info.nationality = Player.PlayerData.charinfo.nationality
					info.type = "Deep Sea Fishing License"
				elseif itemData["name"] == "waterslicense" then
					info.citizenid = Player.PlayerData.citizenid
					info.firstname = Player.PlayerData.charinfo.firstname
					info.lastname = Player.PlayerData.charinfo.lastname
					info.birthdate = Player.PlayerData.charinfo.birthdate
					info.gender = Player.PlayerData.charinfo.gender
					info.nationality = Player.PlayerData.charinfo.nationality
					info.type = "Waters License"
```

Image: https://gyazo.com/bf02611912b052caa9739081a491244e


## qb-inventory/html/js/app.js | search for `FormatItemInfo` function, replace the given License Lines with the entire snippet below
- The snipets bellow support Item Quality, you can edit the last line of each card to reflect the proper "item info" showed at the bottom of the description box.
* If using bl_idcards, the keyNames (ie. `citizenid`) need to be modified to their equivalent
* `id_card` can be excluded from these instructions.

```
        } else if (itemData.name == "driver_license") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p><p><strong>Nationality: </strong><span>" +
                itemData.info.nationality +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "weaponlicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
				"</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p><p><strong>Nationality: </strong><span>" +
                itemData.info.nationality +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
```
- Extra Ids for your convenience
```

        } else if (itemData.name == "waterslicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
				"</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p><p><strong>Nationality: </strong><span>" +
                itemData.info.nationality +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "huntinglicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
				"</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p><p><strong>Nationality: </strong><span>" +
                itemData.info.nationality +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        } else if (itemData.name == "fishinglicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
				"</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p><p><strong>Nationality: </strong><span>" +
                itemData.info.nationality +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p><p style=\"font-size:11px\"><b>Weight: </b>" + itemData.weight + " | <b>Amount: </b> " + itemData.amount + " | <b>Quality: </b> " + "<a style=\"font-size:11px;color:green\">" + Math.floor(itemData.info.quality) + "</a>"
            );
        }
```

## qb-multicharacter/server/main.lua | If using qb-multicharacter based scripts, Replace the following snippet below for the GiveStarterItems Function
* This step can be skipped if using bl_idcards
- Simply replace the below snippet within the Function

```
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
			info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.type = "Class C Driver License"
        end
```

## qb-cityhall Configuration

# qb-cityhall/server/main.lua | Replace the Following "giveStarterItems" Function with the Below Snippet
* This step can be skipped if using bl_idcards
```
function giveStarterItems(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end
```

# qb-cityhall/server/main.lua | Replace the Following Event with the below Snippet
* This step can be skipped if using bl_idcards
```
RegisterNetEvent('qb-cityhall:server:requestId', function(item, hall)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney('cash', itemInfo.cost) then return TriggerClientEvent('QBCore:Notify', src, ('You don\'t have enough money on you, you need %s cash'):format(itemInfo.cost), 'error') end
    local info = {}
    if item == 'id_card' then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == 'driver_license' then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Class C Driver License"
    elseif identityData.item == "weaponlicense" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Class One Weapon License"
    else
        return false -- DropPlayer(src, 'Attempted exploit abuse')
    end
    if not Player.Functions.AddItem(item, 1, nil, info) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)
```

- If using additional cards, add them by following the driver_license snippet
```
    elseif item == 'driver_license' then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Class C Driver License"
```

- Extra Ids for your convenience
```
    elseif identityData.item == "huntinglicense" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Hunting License"
    elseif identityData.item == "fishinglicense" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Deep Sea Fishing License"
    elseif identityData.item == "waterslicense" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.type = "Waters License"
```

# qb-cityhall/locales/YOUR_CHOSEN_LOCALE.lua | Add any missing ID name in the `info` section
* This step can be skipped if using bl_idcards
- Follow the template `item_name = Item Label`

- Extra Ids for your convenience :
```
        fishinglicense = 'Deep Sea Fishing License',
        huntinglicense = 'Hunting License',
        waterslicense = 'Waters License',
```

## qb-smallresources/server/logs.lua | if using qb-smallresources, Add the following within ```local Webhooks {}```

```
    ['identificationforgery'] = 'YOUR_WEBHOOK_HERE',
```

# FOR CUSTOM CARDS / CARDS FROM OTHER RESOURCES
* The cards need to be following the same templates as original cards.
* You can add as many cards as you would like by following the instruction aboves, but changing the item names by any cards you would like.
* Do not follow the "GiveStarterItem" snipet if you do not want the cards to be given upon character creation
* Add a new entry in the Config.Licences by following the instructions below :

```
    ["Drivers License"] = {                    <-- The Name here will be displayed on different UIs and Menus (ie. "Forge 'Drivers License' ")
        Available = true,                       -- True = Can be crafted | False = Can't be crafted
        Pay = true,                             -- True = Requires Payment | False = No Payment Required
        MoneyType = "cash",                     -- If payment is required, money type used to forge a card ("cash, crypto, bank, or any custom currency")
        Cost = 35000,                           -- If payment is required, Cost of making the card.
        Item = true,                            -- True = Requires items to craft | False = No items required to craft a card.
        RequiredItems = {                       -- List of items required to craft a card.
                                                -- You can add as many items as wanted by following the template
                                                -- [ITEM_NUMBER] = {item = "ITEM_HASH", amount = "AMOUNT_REQUIRED"}
        [1] = {item = "plastic", amount = 2},
        [2] = {item = "dye", amount = 1}
        },
        Card = "driver_license",                --Card Item Given ("item hash")
        Description = "CLASS G DRIVER LICENSE"  -- Card Description
        ShownOptions = {                        -- Options shown for both when making the ID and showing the ID
            ['CID'] = true,
            ['Name'] = true,
            ['DOB'] = true,
            ['Gender'] = true,
            ['Nat'] = true,
        }
    },
```
