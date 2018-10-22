/*
**  usage:
**      vector_path_add(line,path,x,y,flip);
**
**  given:
**      line  vector line object
**      path  path index used to trace out a wall
**      x     x point to place from
**      y     y point to place from
**      invert  whether or not to invert the vector (true or false, 1 or 0)
**
**  returns:
**      True on succesfull path creation.
**
**  RamboFox of GMLscripts.com
*/
var xx,yy,oo,dir,dis;
{
  for (i=0; i<=(path_get_number(argument1)-2); i+=1)
  {
  xx=path_get_point_x(argument1,i)
  yy=path_get_point_y(argument1,i)
  if !argument4
    {
    oo=instance_create(0,0,argument0)
    oo.pointx_1=xx
    oo.pointy_1=yy
    oo.pointx_2=path_get_point_x(argument1,min(i+1,path_get_number(argument1)-1))
    oo.pointy_2=path_get_point_y(argument1,min(i+1,path_get_number(argument1)-1))
    with (oo){vector_wallset();}
    }
    else
    {
    oo=instance_create(0,0,argument0)
    oo.pointx_1=path_get_point_x(argument1,min(i+1,path_get_number(argument1)-1))
    oo.pointy_1=path_get_point_y(argument1,min(i+1,path_get_number(argument1)-1))
    oo.pointx_2=xx+argument2
    oo.pointy_2=yy+argument3
    with (oo){vector_wallset();}
    }
  }
}
return 1;
