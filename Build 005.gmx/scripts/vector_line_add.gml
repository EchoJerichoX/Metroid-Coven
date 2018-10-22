/*
**  usage:
**      vector_line_add(line,x1,y1,z2,y2,flip);
**
**  given:
**      line   vector line object
**      x1     x point one
**      y1     y point one
**      x2     x point two
**      y2     y point two
**      flip   whether or not to flip the vector (true or false)
**
**  returns:
**      The created vector's id.
**
**  RamboFox of GMLscripts.com
*/
var oo;
if !argument5
{
    oo=instance_create(0,0,argument0)
    oo.pointx_1=argument1
    oo.pointy_1=argument2
    oo.pointx_2=argument3
    oo.pointy_2=argument4
    with (oo){vector_wallset();}
    return oo.id
}
else
{
    oo=instance_create(0,0,argument0)
    oo.pointx_1=argument3
    oo.pointy_1=argument4
    oo.pointx_2=argument1
    oo.pointy_2=argument2
    with (oo){vector_wallset();}
    return oo.id
}
