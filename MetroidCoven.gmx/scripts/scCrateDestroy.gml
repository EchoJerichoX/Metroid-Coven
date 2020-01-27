repeat ((3*size)+(round(random(6*size))))
{
    with (instance_create((x-sprite_width/4)+(random(sprite_width/2)),(y-sprite_height/4)+(random(sprite_height/2)),oDoodad))
    {
        sprite_index = sprCratePart;
        depth = other.depth-choose(0,1);
        image_angle = random(360);
        image_xscale = (0.4*other.size)+(random(0.2*other.size));
        image_yscale = (0.4*other.size)+(random(0.2*other.size));
        alarm[0] = 500-max(instance_number(oDoodad),1);
        image_single = round(random(6));
        speed = 1+random(2);
        friction = .1;
        direction = random(360);
    }
}
with (instance_create(x,y,oDestroyAnim))
{
    image_speed = .25;
    if (other.size = 1)
        { sound_play(MissileExplosion); sprite_index = sprMissileExplosion; }
    else
        { sound_play(SuperMissileExplosion); sprite_index = sprLargeCrateExplosion; }
    depth = other.depth-2;
}
//scDropLoot();
// ^ Implement once the system is properly implemented.
