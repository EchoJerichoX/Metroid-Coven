// Runs within all collision events of oCrateParent.
if (other.object_index = oPowerBombExplosion) instance_destroy();
if (other.object_index = oEffect)
    { if (other.sprite_index = sprArcDashTrail) instance_destroy(); }
if (other.object_index = oPlayer)
    { if (other.boosting) instance_destroy(); }
if (other.object_index = oProjectile)
{
    if (other.myid = Weapons.wBallBomb)
    {
        if (ImmuneToBomb) exit;
        else ImmuneToBomb = 6;
    }
    hp -= other.Damage; // Reduce health by a value determined by the projectile.
}
if (hp <= 0)
    { instance_destroy(); exit; }
hitfade = 1;
var csndchance = 5;
if (random(100) < csndchance)
{
    if (soundcanplay = 0)
        { sound_play(choose(snCrumble1,snCrumble2,snCrumble3,snCrumble4,snCrumble5)) soundcanplay += 5+round(random(25)); }
    repeat (round(random(size)))
    {
        with (instance_create((x-sprite_width/2)+(random(sprite_width)),(y-sprite_height/2)+(random(sprite_height)),oDoodad))
        {
            sprite_index = sprCratePart;
            depth = other.depth+1;
            image_angle = random(360);
            image_xscale = (0.4*other.size)+(random(0.2*other.size));
            image_yscale = (0.4*other.size)+(random(0.2*other.size));
            alarm[0] = 500-max(instance_number(oDoodad),1);
            image_index = round(random(7));
            speed = 0.5+random(1);
            friction = .075;
            direction = random(360);
        }
    }
}
