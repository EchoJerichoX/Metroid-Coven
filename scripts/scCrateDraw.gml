draw_self();
if (hitfade > 0)
{
    draw_sprite_ext(hitspr,image_index,x,y,1,1,image_angle,make_color_hsv(254,0,254),hitfade);
    hitfade -= eId.hiteffectfadespeed;
}

