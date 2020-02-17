draw_self();
if (hitfade > 0)
    { draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,make_color_rgb(220,220,220),hitfade); hitfade -= 0.1; }

