/*
**  usage:
**      vector_world_add(line,persistent);
**
**  given:
**      line        vector line object
**      persistent  whether or not to make the level boundry objects persistent (True or False)
**
**  returns:
**      Nothing
**
**  RamboFox of GMLscripts.com
*/

with (instance_create(0,0,argument0)){
pointx_1=0
pointy_1=0
pointx_2=room_width
pointy_2=0
vector_wallset();
visible=true;
image_yscale=100
image_xscale*=2
}
//if argument1{oo.persistent=1}

with (instance_create(0,0,argument0)){
pointx_1=room_width-1
pointy_1=0
pointx_2=room_width-1
pointy_2=room_height
vector_wallset();
visible=true;
image_yscale=100
image_xscale*=2}
//if argument1{oo.persistent=1}

with (instance_create(0,0,argument0)){
pointx_1=room_width
pointy_1=room_height-1
pointx_2=0
pointy_2=room_height-1
vector_wallset();
visible=true;
image_yscale=100
image_xscale*=2}
//if argument1{oo.persistent=1}

with (instance_create(0,0,argument0)){
pointx_1=0
pointy_1=room_height
pointx_2=0
pointy_2=0
vector_wallset();
visible=true;
image_yscale=100
image_xscale*=2}
//if argument1{oo.persistent=1}
