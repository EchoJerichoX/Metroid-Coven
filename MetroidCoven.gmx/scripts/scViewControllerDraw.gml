// Check transition scripts for more manipulation of some variables in this object (oViewController).
// If the player just got hit, tell the game it is okay to flash the screen.
if instance_exists(oPlayer)
    { if (oPlayer.CanTakeHit = true) alarm[9] = 2; }
// Draw the red screen flash from the player taking damage.
if (DrawRed = true)
{
    draw_set_alpha(.2);
    draw_set_color(c_red);
    draw_rectangle(view_xview,view_yview,view_xview+view_wview,view_yview+view_hview,false);
    draw_set_alpha(.5);
    DrawRed = false;
}
