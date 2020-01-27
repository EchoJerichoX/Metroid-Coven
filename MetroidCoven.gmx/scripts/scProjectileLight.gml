//size,color,color,ambientamt
// argument0 = Radius.
// argument1 = Center light color.
// argument2 = Ambient light color.
// argument3 = Brightness.

slave = instance_create(x,y,oLight);
with (slave)
{
    master = other.id;
    image_xscale = argument0;
    image_yscale = argument0;
    image_blend = argument1;
    sprite_index = sprLightEffectBright;
    AmbientBlend = argument2;
    HasAmbient = argument3;
    Radius = sprite_get_width(LightSprite);
}
