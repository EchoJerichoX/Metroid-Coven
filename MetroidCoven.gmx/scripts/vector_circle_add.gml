/*
**  usage:
**      vector_circle_add(circle,x1,y1,radius);
**
**  given:
**      circle  vector circle object
**      x1      x point one
**      y1      y point one
**      radius  radius
**
**  returns:
**      The created vector's id.
**
**  RamboFox of GMLscripts.com
*/
var oo;
oo=instance_create(0,0,argument0)
oo.pointx_1=argument1
oo.pointy_1=argument2
oo.rad=argument3
with (oo){event_perform(ev_other,ev_user0)}
return oo.id
