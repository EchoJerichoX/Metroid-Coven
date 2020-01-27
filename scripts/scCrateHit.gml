if (other.myid = Weapons.wPowerBomb) instance_destroy();
if (other.myid = Weapons.wBallBomb)
{
    if (ImmuneToBomb) exit;
    else ImmuneToBomb = 6;
}
hp -= other.Damage; // Reduce health by a value determined by the projectile.
if (hp <= 0)
    { instance_destroy(); exit; }
hitfade = 1;
var crumble = choose(1,2,3,4);
if (crumble = 1)
{
    if (soundcanplay = 0)
        { sound_play(choose(Crumble1,Crumble2,Crumble3,Crumble4,Crumble5,Crumble6)) soundcanplay += 5+round(random(25)); }
    repeat ((1*size)+(round(random(3*size))))
    {
        with (instance_create((x-sprite_width/2)+(random(sprite_width)),(y-sprite_height/2)+(random(sprite_height)),oDoodad))
        {
            sprite_index = sprCratePart;
            depth = other.depth-choose(0,1);
            image_angle = random(360);
            image_xscale = (0.4*other.size)+(random(0.2*other.size));
            image_yscale = (0.4*other.size)+(random(0.2*other.size));
            alarm[0] = 500-max(instance_number(oDoodad),1);
            image_single = round(random(6));
            speed = 0.5+random(1);
            friction = .1;
            direction = random(360);
        }
    }
}
