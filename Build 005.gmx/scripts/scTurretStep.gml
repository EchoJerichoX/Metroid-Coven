if (instance_exists(oPlayer))
{
    var inRange = point_distance(x,y,oPlayer.x,oPlayer.y) <= range;
    var hasLOS = !collision_line(x,y,oPlayer.x,oPlayer.y,oBlockParent,true,false);
    var dirToPlayer = point_direction(x,y,oPlayer.x,oPlayer.y);
    var angleDiffPrimary = abs(angle_difference(primarydir,dirToPlayer));
    var inSightCone = angleDiffPrimary <= sightconesize/2;

    if (inRange) and (hasLOS) and (inSightCone) target = 1;
    else target = 0;
    
    if (target)
    {
        angleDiffTurn = angle_difference(direction,dirToPlayer);
        if (abs(angleDiffTurn) <= turnrate) direction = dirToPlayer;
        else direction -= sign(angleDiffTurn)*turnrate;
    }
}

if (abs(angleDiffTurn) <= turnrate) and (target = 1) and (shotready > 0) shotready -= 1;
if (target = 0) and (shotready > 1) shotready -= 1;
if (shotready = 0) and (pulse < 3)
{
    if (pulseready > 0) pulseready -= 1;
    else
    {
        if (!target)
            { pulse = 0; pulseready = pulsedelay; shotready = shotdelay; exit; }
        pulse += 1;
        pulseready = pulsedelay;
        with (instance_create(x+lengthdir_x(15,direction),y+lengthdir_y(15,direction),oProjectile))
        {
            scDefineProjectileOther(Projectiles.pTurret);
            speed = 5;
            direction = other.direction+random_range(-10,10);
            image_angle = direction;
        }
        if (pulse = 3)
            { pulse = 0; shotready = shotdelay; }
    }
}

if (damaged > 0) damaged -= 0.1;

image_angle = direction;
image_index = target;
