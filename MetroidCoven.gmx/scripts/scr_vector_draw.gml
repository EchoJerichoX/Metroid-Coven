/*
**  usage:
**      scr_vector_draw(path,x,y,texture);
**
**  given:
**      path     path index used to trace out a polygon
**      x        x point to place from
**      y        y point to place from
**      texture  texture id to draw the polygon with
**
**  note:
**      Only supports concave drawing (convex models will be drawn incorrectly).
**
**  returns:
**      Nothing.
**
**  RamboFox of GMLscripts.com
*/
var xx,yy,oo,dir,dis;
d3d_set_culling(1)
draw_set_color(c_white)
texture_set_repeat(1)
draw_primitive_begin_texture(pr_trianglefan,argument3)
{
  for (i=0; i<=(path_get_number(argument0)-1); i+=1)
  {
  draw_vertex_texture(path_get_point_x(argument0,i),path_get_point_y(argument0,i),(path_get_point_x(argument0,i)+argument1)/128,(path_get_point_y(argument0,i)+argument2)/128)
  }
}
draw_primitive_end()
