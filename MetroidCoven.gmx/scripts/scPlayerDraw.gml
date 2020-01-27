if (instance_exists(oCannon))
{
    if (MorphBall = false) oCannon.image_alpha = 1;
    else oCannon.image_alpha = 0;
}
if (CanTakeHit = false)
    { col = choose(.8,.5); var blend = c_red; }
else
    { col = 1; var blend = c_white; }
draw_sprite_ext(sprite_index,image_single,x,y,image_xscale,image_yscale,image_angle,blend,col);
if (!MorphBall) draw_sprite_ext(sprPlayerFeet,image_single,x,y,image_xscale,image_yscale,image_angle,blend,col);
if (boostchargelevel > 0) draw_sprite_ext(sprPlayerArcDash,image_single,x,y,image_xscale,image_yscale,image_angle,c_white,boostalpha);
