# V1.0.0

```diff
### Key
! Modified
- Removed
+ Added
####

! Switched from key_utils to boii_utils v2.0
```

# V0.0.4

```diff
### Key
! Modified
- Removed
+ Added
####

> Processing works again, requires key_utils v1.1.0 *(renamed fivem_utils)*.
! Plants server: Now sends back to client to remove is_placing flag if placing fails due to range.
! Loader: Updated to use new key_utils over fivem_utils.
```

# V0.0.3

```diff
### Key
! Modified
- Removed
+ Added
####

# Config
+ New database section to allow for more control over how plant saving works, make sure to set these how you prefer.

# Loader
! Removed config callback no longer needed.

# Objects
! Server: Now requests objects properly all duplication issues should be solved, amateur mistake.

# Plants
+ Config: Removed update timer from here, cycle now uses correct config.update_timer from main config.
+ Server: All plant actions updated to respects new config flag.
+ Server: Plant update thread now respects new config flag and correct timer.
+ Server: Added a opptional periodic save thread toggle in config.
+ Client + Server: New events to handle filling watering cans.

# Items
+ Config: Added new register item for watering_can_empty can now be filled at a body of water.
+ Config: New option for return_item added to water items can specify if it should return an item or not e.g. filling with full can returning empty can.

# Locale
+ New locales for watering can actions
```

# V0.0.2

```diff
### Key
! Modified
- Removed
+ Added
####

# config.lua
+ Added config.altitudes to store altitude modifers.
! Update timer set back to default 1 min.

# /plants
! Server: Modified degrade cycle, now works correctly and incorporates all environment effects.
! Server: Plant genders are now saved to database correctly.
! Server: Male plants now return seeds on harvest with a chance for a % of yield to be female seeds.
! Server: All plant actions now hide DUI when performing an action then show again once finished.
! Client: Feed action now displays the correct message instead of destroying.
! Client: Added find ground to model change event so changed plants stop floating.

# ui/css/dui.css
+ DUI CSS: Added grid class for progressbars.

# ui/js/PlantDUI.js
! PlantDUI: Added grid to progressbars container to allow for a single bar on tables and flex on plants.
! PlantDUI: Added indicator to top right of header for M + F for male/feminized plants.

# ui/js/TableDUI.js
! TableDUI: UI now shows the tables XP type instead of it only being shown when processing.

# DUI
! DUI: Added cooldowns to keypresses to stop spamming.

# README/OX_ITEMS
! Item list now includes everything it should do for ox inv. 
```