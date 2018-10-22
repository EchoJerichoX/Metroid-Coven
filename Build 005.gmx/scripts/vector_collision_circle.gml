/*
**  usage:
**      vector_collision_circle(circle,id,bounce);
**
**  given:
**      circle  vector circle object
**      id      id of instance that is calling the collision checking
**      bounce  whether or not to bounce (real) "true" or "false" (1 or 0)
**
**  returns:
**      Nothing.
**
**  RamboFox of GMLscripts.com
*/
with (argument0)
{
    while collision_circle(pointx_1,pointy_1,rad,argument1,1,1)
    {
    var dir;
    dir=point_direction(pointx_1,pointy_1,argument1.x,argument1.y);
    argument1.x+=lengthdir_x(.1,dir);argument1.y+=lengthdir_y(.1,dir);
    if argument2
    {argument1.direction+=-((((((argument1.direction-(dir+90)) mod 360) + 540) mod 360)-180)*2)}
    }
}
