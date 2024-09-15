This resource is NOT drag and drop. 
Please do not modify this resource unless you are familiar 
with working in lua and Fivem.

If you choose to continue, do so with this guidance.

-------------------------------

EDITING THE CONFIG:

Items are defined in Config.Objects by their spawn name, make
sure that you match this to the name you give the item in your
shared items resource. 

["bomb"] = {model = `ch_prop_ch_ld_bomb_01a`, rotation = vector3(-90.0, 0.0, 0.0), freeze = true, speedzone = true, speedlimit = 0, broken = 'diffusedbomb', zoffset = 0.1},

As seen here, they contain several variables that can be set to determine how
they are handled by the script. The most important are:


------ model -------- 

this is the model you are spawning, a helpful resource 
to find models is https://mwojtasik.dev/tools/gtav/objects

------ freeze -------

this is a boolean, either TRUE or FALSE, which determines if
the object is fixed in place or affected by GTA's phsyics model.

----- speedzone ------

this is a boolean, either TRUE or FALSE, which when activated
will create a speedzone that will slow or stop traffic in the
surrounding area. when using this YOU must specify a speedlimit
varable in the config.


Other variables are used on a case by case basis. 

-------- rotation ------------

This will rotate the object after it has been placed, when using 
this it will not place the object on the ground again, so please
specify a zoffset to move it into place. For the bomb item this is
0.1 GTA units.

--------- broken -----------

This variable will specify the item that a player will recieve when
picking up an item that is flagged as broken when picked up. You can
activate this broken pick up by adding broken = true to the qb-target
paramaters, at which point the delete object event will search for 
the broken item in the config. 


--------- inventory -----------

This variable will specify that the item can be used as a stash, you will
need to set inventory up as a table which specifies the items maxweight, or
these will default to default values in the script.

inventory = {maxweight = 100000, slots = 25, icon = "fas fa-snowflake", label = 'Open Cooler'},


--------- give -----------

This variable can be set up to create items which give items, or which
allow crafting. You need to create a table which contains some basic values
and a crafting menu for this to be used correctly.

--------- bomb/wires ------------

This variable sets an object up as an explosive. You will need to specify it as a bomb
and provide a list of colors for it to use.

wires = {'blue', 'red', 'green', 'yellow', 'purple', 'pink'},
bomb = true


--------- sit ----------------

This variable when set to true will set the item up as a chair. This object needs to be set
up as a chair in qb-sit as well for it to work properly. 

--------- nopickup ----------

This variable, when set to true, means that you cannot pick it back up. This is enabled
by default on the campfire object.

------------------------------------

ADDING SPECIAL CASE OBJECTS

All items by default are only able to be picked up. These items serve
no functional value. If you wish to make an object which does more, you
need to create a value in the config, then create the target options in
the r14-obj:client:createtarget event that will allow access to custom
events.
