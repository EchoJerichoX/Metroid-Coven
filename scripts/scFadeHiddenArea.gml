// Fade hidden areas out when making contact (see scPlayerEndStep).
// argument0 = base tile layer.
// argument1 = destination tile alpha.
for (var layer = argument0; layer >= argument0-2; layer -= 1) { // Check the three layers associated with the hidden area.
// This loop will not run if there are no tiles on the associated layer.
    var tiles = tile_get_ids_at_depth(layer); // Find id of every tile on a layer.
    for (var i = 0; i < array_length_1d(tiles); i++;) { // Only run this loop enough times to grab each tile.
        if (tile_exists(tiles[i])) tile_set_alpha(tiles[i],argument1); // If the tile exists, change the alpha.
} }
