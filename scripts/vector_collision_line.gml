/*
**  usage:
**      vector_collision_line(line,id,bounce);
**
**  given:
**      line  vector line object
**      id    id of instance that is calling the collision checking
**      bounce  whether or not to bounce (real) "true" or "false" (1 or 0)
**
**  returns:
**      Nothing.
**
**  RamboFox of GMLscripts.com
*/
with (argument0)
{
    if abs(((((argument1.direction - (point_direction(pointx_1,pointy_1,pointx_2,pointy_2)+180-90)) mod 360) + 540) mod 360) - 180)<90
    while collision_line(pointx_1,pointy_1,pointx_2,pointy_2,argument1,1,1)
    {
    var ang,dir,xx;
    dir=point_direction(pointx_1,pointy_1,pointx_2,pointy_2)
    ang=max(0,min((90-max(0,min(90,abs(((((argument1.direction-dir-90) mod 360) + 540) mod 360) - 180))))/3,argument1.speed));
    argument1.x+=lengthdir_x(.1,dir-90);argument1.y+=lengthdir_y(.1,dir-90);
    if argument2
    {argument1.direction+=-((((((argument1.direction-(point_direction(pointx_1,pointy_1,pointx_2,pointy_2)+180)) mod 360) + 540) mod 360)-180)*2)}
    }
}
