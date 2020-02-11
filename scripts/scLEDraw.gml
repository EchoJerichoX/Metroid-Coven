texture_set_interpolation(true);
draw_set_blend_mode_ext(9,1);
if (surface_exists(surAmbient)) draw_surface(surAmbient,view_xview[0],view_yview[0]);
else surAmbient = surface_create(view_wview,view_hview);
draw_set_blend_mode(bm_normal);
texture_set_interpolation(false);
draw_set_color(c_white);
