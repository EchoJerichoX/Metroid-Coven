/// CURRENTLY UNUSED!!!

// Argument 0 = Path name.
// Argument 1 = Path's goal x.
// Argument 2 = Path's goal y.
// Argument 3 = Start path at end of script (true or false).
//
//

var sx = x; // Starting location.
var sy = y; // ^
var fx = argument0; // Location to find a path to.
var fy = argument1; //   We determine this on demand.

if (!mp_grid_path(eId.aigrid,eId.aipath,sx,sy,fx,fy,true)) // Check if there is a possible route
    { show_message("No path set!"); return false; }        //   between start and finish locations.
else
{
    path_set_kind(eId.aipath,1);
    path_set_precision(eId.aipath,8);
    return true;
}
