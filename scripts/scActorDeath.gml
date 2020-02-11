switch (myid)
{
    case Enemies.eZoomer: scZoomerPathClear(); break;
}

if (despawn) exit; // Check if we are naturally despawning the enemy, 
                           //   rather than awarding loot and running the death
                           // animation.
switch (myid)
{
    case Enemies.eZoomer:
        repeat (5)
        {
            with (instance_create(x,y,oDoodad))
            {
                sprite_index = sprZoomerPart;
                depth = other.depth+1;
                image_angle = random(360);
                image_xscale = 1.5;
                image_yscale = 1.5;
                alarm[0] = 500-max(instance_number(oDoodad),1);
                image_single = round(random(6));
                speed = 2+random(2);
                friction = .1;
                direction = other.TakeHitDirection+random_range(40,-40);
            }
        }
        with (instance_create(x,y,oDestroyAnim))
            { image_speed = .25; sprite_index = sprZoomerDie; depth = other.depth; }
        //scDropLoot();
        // ^ Implement once the system is properly implemented.
        sound_play(snZoomerDeath);
        break;
    case Enemies.eTurret:
        repeat (5)
        {
            with (instance_create(x,y,oDoodad))
            {
                sprite_index = sprTurretPart;
                depth = other.depth+1;
                image_angle = random(360);
                image_xscale = 0.5+random(0.75);
                image_yscale = 0.5+random(0.75);
                alarm[0] = 500-max(instance_number(oDoodad),1);
                image_single = round(random(4));
                speed = 1+random(2);
                friction = .1;
                direction = other.TakeHitDirection+random_range(70,-70);
            }
        }
        with (instance_create(x,y,oDestroyAnim))
            { image_speed = .25; sprite_index = sprMissileExplosion; depth = other.depth; image_blend = c_yellow; }
        //scDropLoot();
        // ^ Implement once the system is properly implemented.
        sound_play(MissileExplosion);
        break;
}
