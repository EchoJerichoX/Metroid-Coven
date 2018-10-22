/*if (sprite != 0) */draw_sprite_ext(sprite,image_index,x,y,1,1,rot,c_white,1);

if (flash_timer mod 2)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite,image_index,x,y,1,1,rot,make_color_rgb(254,254,254),1);
    draw_set_blend_mode(bm_normal);
}
