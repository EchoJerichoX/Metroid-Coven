if (eId.transitioning) or (eId.paused > 0) impaused = 1;
else impaused = 0;
if (impaused)
{
    if (!alarmsheld)
    {
        for (var i = 0; i < 6; i++)
        {
            c_alarm[i] = alarm[i];
            alarm[i] = -1;
        }
        alarmsheld = 1;
        inputspeed = speed;
        speed = 0;
    }
    exit;
}
if (!impaused) and (alarmsheld)
{
    speed = inputspeed;
    for (var g = 0; g < 6; g++) alarm[g] = c_alarm[g];
    alarmsheld = 0;
}

age += 1; // Tells Spazer Beam to stop spreading projectiles after a certain number of frames (see case below).

/*if (collision_line(x,y,x+lengthdir_x(speed,direction),y+lengthdir_y(speed,direction),oBlockParent,true,true)) then
{
    move_contact_object(speed,direction,oBlockParent); // Cleanly collide with wall.
    alarm[2] = 2; // Destroy object after cleanly colliding with the wall.
}*/

switch (myid)
{
// ===== Player Beams =====
// --- Power Beam ---
    case Weapons.wPowerBeam:
        trail = instance_create(x,y,oEffect);
        trail.sprite_index = sprite_index;
        trail.direction = direction;
        trail.speed = speed/2;
        trail.image_angle = other.image_angle;
        trail.image_alpha = other.image_alpha/1.5;
        trail.flex = 1;
        break;
// --- Wave Beam ---
    case Weapons.wWaveBeam:
        // Changing "wavewidth" affects the spread of the two projectiles.
        // Changing "wavespeed" affects how quickly the two projectiles move along their curve width-wise.
        var wavewidth,wavespeed;
        if (Charger > 0)
            { wavewidth = 16; wavespeed = 18; }
        else
            { wavewidth = 12; wavespeed = 14; }
        if (SwingPositive)
        {
            x -= lengthdir_x(wavewidth*sin(degtorad(t)),direction+90); 
            y -= lengthdir_y(wavewidth*sin(degtorad(t)),direction+90); 
            t += wavespeed;
            x += lengthdir_x(wavewidth*sin(degtorad(t)),direction+90); 
            y += lengthdir_y(wavewidth*sin(degtorad(t)),direction+90);           
        }
        else
        {
            x += lengthdir_x(wavewidth*sin(degtorad(t)),direction+90); 
            y += lengthdir_y(wavewidth*sin(degtorad(t)),direction+90); 
            t += wavespeed;
            x -= lengthdir_x(wavewidth*sin(degtorad(t)),direction+90); 
            y -= lengthdir_y(wavewidth*sin(degtorad(t)),direction+90);
        }
        break;
// --- Plasma Beam ---
    case Weapons.wPlasmaBeam:
        trail = instance_create(x,y,oEffect);
        trail.sprite_index = sprite_index;
        trail.direction = direction;
        trail.speed = speed/2;
        trail.image_angle = other.image_angle;
        trail.image_alpha = other.image_alpha/1.5;
        trail.flex = 1;
        
        tail = instance_create(x,y,oEffect);
        tail.sprite_index = sprPlasmaTrail;
        tail.direction = random(360);
        tail.speed = random(3);
        tail.startspeed = speed;
        tail.image_alpha = other.image_alpha/1.5;
        tail.image_speed = 1;
        break;
// --- Spazer Beam ---
    case Weapons.wSpazerBeam:
        if (Charger < 60) and (speed < 9) speed += .5;
        if (Charger >= 60) and (speed < 13) speed += .75;
        if (age > 8) // After this number of steps, stop spreading outside projectiles, start leaving trails.
        {
            trail = instance_create(x,y,oEffect);
            trail.sprite_index = sprite_index;
            trail.direction = direction;
            trail.speed = speed/2;
            trail.image_angle = other.image_angle;
            trail.image_alpha = other.image_alpha/1.5;
            trail.flex = 1;
        }
        else
        {
            switch (side)
            {
                case 0: // Left.
                    x += 2*cos(degtorad(90+direction));
                    y -= 2*sin(degtorad(90+direction));
                    break;
                case 2: // Right.
                    x -= 2*cos(degtorad(90+direction));
                    y += 2*sin(degtorad(90+direction));
                    break;
            }
        }
        break;
// --- Pulse Beam --- 
    case Weapons.wPulseBeam:
        trail = instance_create(x,y,oEffect);
        trail.sprite_index = sprite_index;
        trail.direction = direction;
        trail.speed = speed/2;
        trail.image_angle = other.image_angle;
        trail.image_alpha = other.image_alpha/1.5;
        trail.flex = 1;
        break;
// --- Ice Beam ---
// This beam is handled in the oProjectile object.
// The only event that handles this beam is alarm 1.
// --- Rupture Beam ---
    case Weapons.wRuptureBeam:
        trail = instance_create(x+lengthdir_x(random_range(-3,3),image_angle),y+lengthdir_y(random_range(-3,3),image_angle),oEffect);
        trail.sprite_index = sprRuptureTrail;
        trail.direction = direction-180;
        trail.speed = random_range(1,2);
        trail.startspeed = speed;
        trail.image_alpha = other.image_alpha/1.5;
        trail.image_speed = 0.5;
        break;
// --- Rupture Beam Particle ---
// Also see oProjectile object for trail information.
    case Projectiles.pRuptureBeamParticle:
        if (instance_exists(oActor)) then
        {
           var tar;
           tar = instance_nearest(x,y,oActor);
           if (point_distance(x,y,tar.x,tar.y) < 100)
           and (!collision_line(x,y,tar.x,tar.y,oVectorLine,true,false)) then
           {
              var DiffDir;
              DiffDir = point_direction(x,y,tar.x,tar.y)-direction;
              if (abs(DiffDir) <= 180) direction += median(-15,15,DiffDir) 
              else direction += median(-15,15,DiffDir-sign(DiffDir)*360);      
              speed += .2;
           }
        }
        break;
// --- Phazon Beam ---
    case Weapons.wPhazonBeam:
        trail = instance_create(x,y,oEffect);
        trail.sprite_index = sprite_index;
        trail.direction = direction;
        trail.speed = speed/2;
        trail.image_angle = other.image_angle;
        trail.image_alpha = other.image_alpha/1.5;
        trail.flex = 1;
        break;

// ===== Player Secondary and Addon Weapons =====
// --- Missile Launcher ---
    case Weapons.wMissileLauncher:
        if (speed < 25) speed += .25;
        with (instance_create(x,y,oDestroyAnim))
        {
            sprite_index = sprMissileSmoke;
            direction = random(360);
            image_angle = direction;
            speed = .25;
            image_speed = .5+random(.5);
        }
        break;
    case Weapons.wSuperMissile:
        if (speed < 35) speed += .2;
        with (instance_create(x,y,oDestroyAnim))
        {
            sprite_index = sprSuperMissileSmoke;
            direction = random(360);
            image_angle = direction;
            speed = .35;
            image_speed = .35;
        }
        break;
// --- Ball Bomb
    case Weapons.wBallBomb:
        if (speed > 0)
            { fadeout = false; alarm[0] = 70; }
        else fadeout = true;
        if (fadeout) image_speed += .0125;//*(1+global.accel); // Uncomment this when accel tanks are added.
        if (image_speed >= .5-(image_speed/3)) and (createeffect = 0) then
        {
            createeffect = 1;
            with (instance_create(x,y,oEffect))
                { sprite_index = sprBallBombCharge; image_speed = .5; image_alpha = 1; }
        }
        if (image_speed >= .5) instance_destroy();
        if (speed > 0) speed -= .15;
        if (speed <= 0) speed = 0;
        break;
// --- Power Bomb
    case Weapons.wPowerBomb:
        if (speed > 0)
            { fadeout = false; alarm[0] = 100; }
        else fadeout = true;
        if (fadeout) image_speed += .015;//*(1+global.accel); // Uncomment this when accel tanks are added.
        if (image_speed >= 1.25)
            { instance_create(x,y,oPowerBombExplosion); instance_destroy(); }
        break;

// ===== Enemy Beams =====
// --- Turret Bolt ---
    case Projectiles.pTurret:
        trail = instance_create(x,y,oEffect);
        trail.sprite_index = sprite_index;
        trail.direction = direction;
        trail.speed = speed/2;
        trail.image_angle = other.image_angle;
        trail.image_alpha = other.image_alpha/1.5;
        trail.image_blend = c_red;
        trail.flex = 1;
        break;
}

if (fadeout)
and (myid != Weapons.wBallBomb)
and (myid != Weapons.wPowerBomb) image_alpha -= 0.15;
if (image_alpha <= 0) instance_destroy();
