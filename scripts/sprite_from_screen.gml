/// sprite_from_screen(x,y,w,h,removeback,smooth,xorig,yorig);
/*
Replacement for "sprite_create_from_screen();".
Basically could be called "sprite_create_from_application_surface();".
*/
var xx = argument0, yy = argument1, w = argument2, h = argument3,
    removeback = argument4, smooth = argument5,
    xorig = argument6, yorig = argument7;
return sprite_create_from_surface(application_surface,xx,yy,w,h,removeback,smooth,xorig,yorig);
// CREDIT: Oinklguana on GitHub.
// https://github.com/OinkIguana/cat/blob/master/scripts/sprite_from_screen.gml





/* Alternate way of doing things. Remove this line to activate.
        
var xx = argument0, yy = argument1, w = argument2, h = argument3,
    removeback = argument4, smooth = argument5,
    xorig = argument6, yorig = argument7;
var screen = surface_create(640,480);
surface_set_target(screen);
draw_clear_alpha(c_white, 0);
with(all) {
    if(sprite_index >= 0) {
        if(visible) {
            draw_self();
        }
    }
}
var spr = sprite_create_from_surface(screen, xx, yy, w, h, removeback, smooth, xorig, yorig);
surface_reset_target();
surface_free(screen);
return spr;
