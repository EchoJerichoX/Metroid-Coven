// Fade hidden areas out when making contact (see scPlayerEndStep).
// argument0 = base tile layer.
// argument1 = destination tile alpha.
for (var layer = argument0; layer >= argument0-2; layer -= 1) // Check the three layers associated with the hidden area.
// ^ This part isn't even needed in your project, but it is in mine.
//   It is safe to leave in, since it won't run the below for loop if there are no tiles.
{
    var tiles = tile_get_ids_at_depth(layer); // Find id of every tile on a layer.
    for (var i = 0; i < array_length_1d(tiles); i++;) // Only run this loop enough times to grab each tile.
        { if (tile_exists(tiles[i])) tile_set_alpha(tiles[i],argument1); } // If the tile exists, change the alpha.
}

// Old method.
/*
var tile, // Tile we check.
    ix,iy, // X and Y location of tile.
    layer; // Layer tile is on that we check.
// If using different sizes of tile, change the 16s into whatever size tiles you use.
// I use 16x16 tiles in my case.
for (var layer = argument0; layer >= argument0-2; layer -= 1) // Check the three layers associated with the hidden area.
for (ix = 0; ix <= room_width; ix += 16) // Locate each tile on a 16x grid.
for (iy = 0; iy <= room_height; iy += 16)
{
    tile = tile_layer_find(layer,ix,iy); // Find the tile.
    if (tile != -1) tile_set_alpha(tile,argument1); // Set the alpha.
}
*/
