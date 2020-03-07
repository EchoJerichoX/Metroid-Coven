texture_set_interpolation(true);
surface_set_target(surAmbient);
draw_clear(AmbientColor);
if (AmbientColor != c_white)
{
    draw_set_blend_mode(bm_add);
    if (room = rmIntro2) and (instance_exists(oShipIntro))
    {
        with (oShipIntro)
        {
            draw_sprite_ext(sprGunshipHatch,hatchimg,x,y,scale,scale,image_angle,c_white,image_alpha);
            draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,image_angle,c_white,image_alpha);
        }
    }
    with (oLight)
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
    if (eId.RoomBrightness > 0)
    {
        draw_set_alpha(eId.RoomBrightness);
        draw_set_color(c_white);
        draw_rectangle(0,0,room_width,room_height,false);
        draw_set_alpha(1);
    }
    //with (oActor) scActorLight();
    draw_set_blend_mode(bm_normal);
}
surface_reset_target();
texture_set_interpolation(false);
