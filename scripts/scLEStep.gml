texture_set_interpolation(true);
surface_set_target(surAmbient);
draw_clear(AmbientColor);
if (AmbientColor != c_white)
{
    draw_set_blend_mode(bm_add);
    with(oLight)
    {
        if (fade < 1) && (point_in_view_ext(0,x,y,Radius*3*image_xscale))
        {
            draw_sprite_ext(LightSprite,
                            ImageNumber,
                            x-view_xview,
                            y-view_yview,
                            image_xscale,
                            image_yscale,
                            image_angle,
                            image_blend,
                            (HasLight-fade)*eId.LightAlphaMult);
            if (HasAmbient != 0)
            {
                draw_sprite_ext(AmbLightSprite,
                                AmbImageNumber,
                                x-view_xview,
                                y-view_yview,
                                image_xscale*2.3,
                                image_yscale*2.3,
                                image_angle,
                                AmbientBlend,
                                HasAmbient-fade);
            }
        }
    }
    with (oActor) scActorLight();
    draw_set_blend_mode(bm_normal);
}
surface_reset_target();
texture_set_interpolation(false);
