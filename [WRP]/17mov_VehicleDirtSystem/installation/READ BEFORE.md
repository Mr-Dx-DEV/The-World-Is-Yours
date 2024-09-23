# Welcome!

Thank you for purchasing our script. I would like to inform you that it has an automatic installation feature for your server.

> What will be done?
- Items will be automatically added to your framework
- Images will be automatically copied to your inventory system
- The previous car wash script will be disabled (as long as ours is enabled)

Unfortunately, it would be impossible to support every framework, so here is the list of supported ones:

- qb-core
- qbx_core
- es_extended

- qb-inventory
- ox_inventory

If you are using another framework, or your framework is heavily modified, disable all options in Config.Installer, and then install the script manually:

Add these items to your framework:

```lua
    ['mov_basic_ceramic'] = {
        label = Config.Items["mov_basic_ceramic"].label,
        description = Config.Items["mov_basic_ceramic"].description,
        image = 'mov_basic_ceramic.png',
        weight = 10,
    },

    ['mov_advanced_ceramic'] = {
        label = Config.Items["mov_advanced_ceramic"].label,
        description = Config.Items["mov_advanced_ceramic"].description,
        image = 'mov_advanced_ceramic.png',
        weight = 10,
    },

    ['mov_basic_wax'] = {
        label = Config.Items["mov_basic_wax"].label,
        description = Config.Items["mov_basic_wax"].description,
        image = 'mov_basic_wax.png',
        weight = 10,
    },

    ['mov_advanced_wax'] = {
        label = Config.Items["mov_advanced_wax"].label,
        description = Config.Items["mov_advanced_wax"].description,
        image = 'mov_advanced_wax.png',
        weight = 10,
    },
```

Copy the images from the installation/images folder and paste them into your inventory system.

Thank you once again for your support. If you have any problems, feel free to contact us on Discord: https://discord.17movement.net/
**17 Movement**