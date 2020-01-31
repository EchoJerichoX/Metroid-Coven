// Insert death sequence or precursor to death sequence. Below is placeholder.
with (instance_create(x,y,oDeathAnim))
{
    sprite_index = sprPlayerDeath;
    image_angle = other.image_angle;
    image_speed = 0;
    sound_play(SamusHurt6);
    
    // Create the death animation light.
    slave = instance_create(x,y,oLight);
    slave.master = id;
    slave.image_xscale = .4;
    slave.image_yscale = .4;
    slave.HasAmbient = .7;
    slave.DestScale = 0;
}
// The remainder of the death restart code is run within oDeathAnim.
