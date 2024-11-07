# Project X Store Robbery

Store Robbery - Project X

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Tebex](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[Zip-With-All-Minigames-Required](https://drive.google.com/file/d/14e8v2LkYxrTCbxRDuKB4r7iQiPVgK-3e/view?usp=sharing)

### Required Dependencies if you want to use the script as is

[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (QBCore Only) (For the pre-configured dispatch)

## Installation

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
```

-- For qb-inventory:

```lua
    ['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['x_circuittester']        = {['name'] = 'x_circuittester',       ['label'] = 'X Circuit Tester',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_circuittester.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_harddrive']        = {['name'] = 'x_harddrive',       ['label'] = 'X Hard Drive',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_harddrive.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['storekey']        = {['name'] = 'storekey',       ['label'] = 'Store Key',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'storekey.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},

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
 ```
