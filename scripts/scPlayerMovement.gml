if (KeyUp) motion_add(90,0.75);
if (KeyLeft) motion_add(180,0.75);
if (KeyDown) motion_add(270,0.75);
if (KeyRight) motion_add(0,0.75);

if (speed > MaxSpeed) speed = MaxSpeed;
if ((KeyUp+KeyLeft+KeyDown+KeyRight) = 0)
    { image_single = AnimationStart; AnimationTimer = 0; }
else AnimationTimer += 1;
if (AnimationTimer = 2)
{
    if (AnimationStart != AnimationEnd)
    {
        image_single += 1;
        if (image_single > AnimationEnd) image_single = AnimationStart;
    }
    AnimationTimer = 0;
}

// Dodge code. Uncomment to activate.
/*
if (KeyDodge) and (DodgeCooldown = 0)
{
    sound_play(SamusDodge);
    DodgeCooldown = 10;
    MorphBall = true;
    sprite_index = sprPlayerMorphBall;
    
    motion_add(direction,speed*1.75);
    Dodge = 15;
    friction = 0;
}
