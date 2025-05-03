# BOII | Development - Advanced Weed System

**MAKE SURE YOU HAVE READ THE INCLUDED EULA IN FULL**
**IF YOU HAVE PURCHASED THE ESCROW VERSION OF THIS RESOURCE REMOVE THE -ESCROW TAG FROM THE RESOURCE NAME**

## 🌍 Overview

Welcome to the most advanced and immersive weed cultivation system in FiveM. 
This isn’t just another planting script – it’s a fully dynamic and realistic growing system that reacts to the environment, player actions, and progression.

Unlike anything else in FiveM, this script mimics real-world agricultural mechanics, making cultivation more than just a waiting game. 
Every aspect of growing, from weather conditions to soil type, altitude, and pest control, plays a role in how well your plants develop. 
Skill and strategy matter.

Your choices determine success. 
Planting in favourable conditions increases yield, while poor decisions lead to disease, pests, and weak crops. 
Beware a pest infestation can destroy an entire grow operation if not controlled.

With XP-based progression, dynamic environmental factors and fully interactive drug processing, this system rewards effort and strategy. 
The processing tables feature two XP modes – personal and public – allowing high-level tables to benefit newer players.

Whether you"re a solo grower refining your craft or an entrepreneur building an empire, this is the most advanced, feature-rich, and immersive weed script in FiveM – period. 🚀

## 🌐 Features  

- **Multi-Framework Compatible:** Works with multiple frameworks out of the box. Any unsupported frameworks can be added into `boii_utils` – just get in touch.
- **Environmental Growth Factors:** Altitude, weather, and soil types affect plant all plant rates. Certain strains thrive in specific locations.  
- **Pest & Disease Mechanics:** Plants can be infested with pests or contract diseases if neglected. Failure to treat them reduces yield and can kill plants over time.  
- **Processing XP System:** Tables feature two XP types: personal (player-based) and public (shared XP), allowing low-level players to benefit from high-level processing tables.  
- **Male & Female Plants:** Grow both male and female plants, male plants reward seeds and females reward buds.
- **Plant Pollination:** Players must take extra care with their male plants. Male plants can pollinate nearby females turning your entire field male if your not careful.
- **Realistic Plant Care:** Requires watering, feeding, pest control, and disease management to maintain peak health and maximize yield.
- **Usable Bongs & Joints:** Players can smoke either joints they create or by using a baggy with a bong.
- **Synced Smoking and Drug Effects:** All smoking effects are synced for nearby players, and all drug effects can be disabled for those with motion sickness issues.  
- **Police Interaction:** Law enforcement can destroy plants and processing tables. Destroying a processing table wipes all XP stored in it permanently.  
- **Strain-Based Progression:** Default setup includes five unique strains, each with individual XP progression and distinct growth attributes.
- **Immersive DUI & UI System:** Interact with plants and tables through a fully custom and unique interface.
- **Interactive Guide Book UI:** Includes a interactive guide book UI that can be opened by using an item, this covers details on how mechanics work and displays experience stats.   
- **Customizable UI:** Modify the color palette easily in the configuration to match your server theme.  
- **Data Persistence:** Table and plant data are stored server-side and synchronized in real-time for all clients.  
- **Optimized Performance:** Caching implemented throughout to ensure better optimization with DUI elements and database actions.  

## 💹 Dependencies

- **[OxMySQL](https://github.com/overextended/oxmysql/releases)**
- **[BOII Utils](https://github.com/boiidevelopment/boii_utils/releases/tag/v2.0.0)**

## 📦 Getting Started

Prior to installation make sure you have all of the dependencies listed above in your server and you have completed their setup steps in full.

1. Configuration:

Configuration for the resource is split into multiple LUA files found in `configs`.
Most of these settings can remain unchanged however some notable settings: 

`configs/config.lua`:

- `config.police` - Here you can modify police jobs and on duty requirement.
- `config.plant_limit` - Changed the max amount of plants players are allowed to have at any given time.
- `config.weather_modifiers` - Contains plant status rate modifiers for all weather types.
- `config.ground_modifiers` - Contains plant status rate modifiers for all ground types.

`configs/consumables.lua`:

Here you can modify consumable values for smoking joints or bongs.
An example of how to do this is provided in the file.

`configs/strains.lua`:

Here you can add new strains.
The rest of the configs are generated dynamically based off the strains added here.

`configs/recipes.lua`:

If you want to add any additional processing recipes, or modify the existing ones you can do here.

2. UI Customisation: 

If you want to change the UI colour palette you can do do so here: `ui/css/root.css`
All of the UI elements use the root colours except one or two things changing these colours will change everything.

3. Adding Database Tables:

Included is a database file `sql.sql` you are **REQUIRED** to add this table into your database.
The script **will not** work without it.

4. Adding Required Items: 

- Add the following item into your inventory/framework method. 
If your framework / inventory is not covered here just use the same item name you should be fine. Any issues reach out through discord.

- QB Inventory

Copy the item list inside `README/QB_ITEMS.MD` and paste the items into your `qb-core/shared/items.lua`.

- Ox Inventory

Copy the item list inside `README/OX_ITEMS.MD` and paste the items into your `ox_inventory/data/items.lua`.

## 📦 Usage

1. Growing Weed:

- Plant a Seed – Use a seed item to start the growing process.
- Monitor Growth – Check water levels, food, weather effects, and soil conditions.
- Control Pests & Diseases – Keep your plants healthy by treating infestations.
- Harvest at Peak Growth – Higher XP levels lead to better yields.

2. Processing Weed:

- Use a Processing Table – Players can trim buds or craft ounces, bags and joints.
- XP Affects Yield – Higher XP increases production efficiency.
- Manage XP Type – Tables can use personal or shared XP (toggleable by the owner).

## 📝 Notes

- You need to add your own methods to obtain the items used in the script. Recommendation is to create a store in your stores resource.

## 📝 Documentation

- Documentation for this resource has not yet been completed; it will be available soon.

## 🤝 Suggestions

Suggestions for additions to the resouce are more than welcomed. 
If you have an idea for something you think it could include leave a suggestion in the resources forum section in our discord.

## 📹 Preview

**[YouTube](https://www.youtube.com/watch?v=OYovzQWcIb8)**

## 📷 Screenshots

- Guide Book:

![image](https://i.ibb.co/TMx9896c/image-2025-02-16-075901431.png)
![image](https://i.ibb.co/Mk9RH8gH/image-2025-02-16-075843784.png)
![image](https://i.ibb.co/0VRStsdk/image-2025-02-16-075924288.png)
![image](https://i.ibb.co/rf6CYpf1/image-2025-02-16-075941580.png)

- Plant Placing:

![image](https://i.ibb.co/ZRqdSQDD/image-2025-02-16-075607216.png)

- Plant UI:

![image](https://i.ibb.co/ZRqdSQDD/image-2025-02-16-075607216.png)

- Table Placing:

![image](https://i.ibb.co/s9TVKJyW/image-2025-02-16-075637224.png)

- Table UI:

![image](https://i.ibb.co/wrxkXbBx/image-2025-02-16-075650363.png)
![image](https://i.ibb.co/SDcvLGt0/image-2025-02-16-075715922.png)

- Smoking & Effects:

![image](https://i.ibb.co/nszWdRT1/image-2025-02-16-075757624.png)
![image](https://i.ibb.co/xqMppnrj/image-2025-02-16-075734777.png)
![image](https://i.ibb.co/XZ0tQ6SV/image-2025-02-16-075806775.png)

## 📩 Support

**[Discord](https://discord.gg/MUckUyS5Kq)**