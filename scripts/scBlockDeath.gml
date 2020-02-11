// Init audio-visual effects.
sound_play(choose(snCrumble1,snCrumble2,snCrumble3,snCrumble4,snCrumble5,snCrumble6));
with (instance_create(x,y,oDestroyAnim))
{
    if (other.object_index = oBlock16) sprite_index = sprBlockBreak16;
    if (other.object_index = oBlock8) sprite_index = sprBlockBreak8;
    image_speed = .25;
    if (other.myid = Blocks.bReform) r = 1;
}
// Erase the tile above us if it is on the secret layer.
var ii = tile_layer_find(eId.secrettilelayer,x+sprite_width/2,y+sprite_height/2);
if (ii) tile_set_visible(ii,false);
// Clear the cell for AI.
mp_grid_clear_cell(eId.aigrid,x/16,y/16);
