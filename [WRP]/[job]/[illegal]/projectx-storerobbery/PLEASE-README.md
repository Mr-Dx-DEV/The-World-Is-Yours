# Project X Store Robbery

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[Zip-With-All-Minigames-Required](https://drive.google.com/file/d/1mPvEB0JnQS74QvFDlT52AiXB_rwvDVtE/view?usp=sharing)

### Required Dependencies if you want to use the script as is

[QBCore-QBOX]
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

[ESX]
[linden_outlawalert](https://github.com/thelindat/linden_outlawalert)

### Installation

- Step 1: Extract the script from the zip file and place it into your scripts folder.
- Step 2: Add the minigames that are found in the zip file above into your standalone/dependencies folder (Make sure they are not in the same folder as the robbery script).
- Step 3: Add the items from below and the images from the images folder to your inventory.
- Step 4: Configure the config.lua file to work with your server by changing the Framework, Inventory, Dispatch, Target name.
- Step 5: Make sure that the Framework, ox_lib, your Target, Dispatch, Inventory, and Minigames are started before the robbery script.

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
```

### Images done by Artwork Inventory

[Discord](https://discord.gg/Z2awpnXKdw) -- Use code ProjectX for 10% off!

-- For qb-inventory:

```lua
    ['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['x_circuittester']        = {['name'] = 'x_circuittester',       ['label'] = 'X Circuit Tester',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_circuittester.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_harddrive']        = {['name'] = 'x_harddrive',       ['label'] = 'X Hard Drive',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_harddrive.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['storekey']        = {['name'] = 'storekey',       ['label'] = 'Store Key',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'storekey.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['advancedlockpick']                = {['name'] = 'advancedlockpick',                  ['label'] = 'Advanced Lockpick',         ['weight'] = 500,          ['type'] = 'item',         ['image'] = 'advancedlockpick.png',        ['unique'] = false,         ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'If you lose your keys a lot this is very useful... Also useful to open your beers'},
```

-- For ox_inventory:

```lua
  ["x_device"] = {
  label = "X Device",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_device.png",
  }
 },
  ["x_circuittester"] = {
  label = "X Circuit Tester",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_circuittester.png",
  }
 },
  ["x_harddrive"] = {
  label = "X Harddrive",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_harddrive.png",
  }
 },
  ["storekey"] = {
  label = "Store Key",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "storekey.png",
  }
 },
  ["advancedlockpick"] = {
  label = "Advanced Lockpick",
  weight = 500,
  stack = true,
  close = true,
  description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
  client = {
   image = "advancedlockpick.png",
  }
 },
 ```
