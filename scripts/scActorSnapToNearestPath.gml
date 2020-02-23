// scActorSnapToNearestPath(path_index,x,y,precision);
// By bojack29 on the YYG forums.

var p_path, px, py, i, xx, yy, xy, solution;

p_path = argument0;
px = argument1;
py = argument2;
prec = argument3; // Smaller numbers are more precise, but more CPU-intensive.

pri = ds_priority_create();

for (i = 0;i <= 1;i += prec / path_get_length(p_path))
{
     xx = path_get_x(p_path, i);
     yy = path_get_y(p_path, i);
     xy = xx + yy / 100;
     ds_priority_add(pri, xy, point_distance(xx, yy, px, py));
}

solution = ds_priority_find_min(pri);
ds_priority_destroy(pri);
return solution;
