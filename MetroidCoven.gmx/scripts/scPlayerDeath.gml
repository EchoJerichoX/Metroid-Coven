// Insert death sequence or precursor to death sequence. Below is placeholder.
room_restart();

// Old death sequence
/*
// Create the death animation placeholder.
with (instance_create(x,y,oFreezeAnim))
{
    sprite_index = sprPlayerDie;
    image_angle = other.image_angle;
    image_speed = .25;
    sound_play(SamusDeath);
    sound_play(SamusHurt6);
    
    // Create the death animation light.
    slave = instance_create(x,y,oLight);
    slave.master = id;
    slave.image_xscale = .4;
    slave.image_yscale = .4;
    slave.HasAmbient = .7
    slave.DestScale = 0;
}
