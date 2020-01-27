// Size, Color, Color 2, Ambient Amount.

slave = instance_create(x,y,oLight)
with (slave)
{
    master = other.id;
    image_xscale = 1;
    image_yscale = 1;
    image_blend = c_white;
    ImageNumber = other.AnimationStart;
    AmbImageNumber = ImageNumber;
    LightSprite = other.sprite_index;
    AmbLightSprite = LightSprite;
    image_angle = other.image_angle;
    HasAmbient = 0;
    HasLight = .4;
    Radius = sprite_get_width(LightSprite);
}
