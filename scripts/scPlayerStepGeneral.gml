// Point player towards mouse.
// This is temporary, since we need a method to smoothly turn towards the mouse.
//   image_angle = point_direction(x,y,mouse_x,mouse_y);
var pd = point_direction(x,y,eId.x,eId.y);
var dd = angle_difference(image_angle,pd);
image_angle -= min(abs(dd),9)*sign(dd);

// Point weapon separately (not in use).
if (WeaponDistanceOffset != 0)
{
    var irecoil;
    irecoil = 0;
    WeaponXPosition = x+lengthdir_x(WeaponDistanceOffset+irecoil,WeaponDirectionOffset+image_angle);
    WeaponYPosition = y+lengthdir_y(WeaponDistanceOffset+irecoil,WeaponDirectionOffset+image_angle);
}
else 
    { WeaponXPosition = x; WeaponYPosition = y; }
//WeaponAim = point_direction(WeaponXPosition,WeaponYPosition,mouse_x,mouse_y);
var pw = point_direction(x,y,eId.x,eId.y);
var dw = angle_difference(WeaponAim,pw);
WeaponAim -= min(abs(dw),11)*sign(dw);

// Draw footsteps.
if (point_distance(x,y,stepx,stepy) > 20)
{
    var o;
    o = instance_create(x,y,oDoodad);
    
    o.sprite_index = sprFootPrint;
    o.image_single = MorphBall;
    o.image_angle = point_direction(x,y,stepx,stepy);
    o.alarm[0] = 5;
    o.depth = 20;
    stepx = x;
    stepy = y;    
}

// Add energy if we just got a pickup.
if (GainEnergy > 0)
{
    if (Energy < 100)
    {
        Energy += 1;
        if (Energy = 100)
        {
            if (FullTanks < EnergyTanks)
            {
                FullTanks += 1;
                Energy = 1;
                eId.etflash = 2; // Gained a tank.
                eId.etflashreset = eId.animdelay;
            }
            else GainEnergy = 0;
        }
        GainEnergy -= 1;
    }
    else GainEnergy = 0;
}

// Flashlight controller.
with (torchSlave)
{
    if (other.KeyTorch) AmIOn = !AmIOn;
        
    if (AmIOn)
    {
        if (!other.MorphBall)
        {
            LightSprite = sprLightTorch;
            AmbLightSprite = sprLightTorch;
            image_angle = master.image_angle;
            image_xscale = 1;
            image_yscale = 1.4;
            HasLight = .45;
            HasAmbient = .25;
            
            var ix,iy,ix2,iy2,i;
            ix = x; ix2 = x;
            iy = y; iy2 = y;
            for (i = 1; i < 300; i += 10)
            {
                ix = x+lengthdir_x(i,image_angle+2)
                iy = y+lengthdir_y(i,image_angle+2)
                ix2 = x+lengthdir_x(i,image_angle-2)
                iy2 = y+lengthdir_y(i,image_angle-2)
                MyDestScale = i/229;
                if (collision_point(ix,iy,oVectorLine,true,true)) || (collision_point(ix2,iy2,oVectorLine,true,true)) break;
            }
            if (image_xscale != MyDestScale)
                { image_xscale = mean(image_xscale,image_xscale,image_xscale,image_xscale,MyDestScale) }
        }
        else
        {
            HasLight = 0;
            HasAmbient = 0;
            /*
            LightSprite2 = sprLightEffectBright;
            AmbLightSprite2 = sprLightFog;
            image_xscale = .8;
            image_yscale = .8;
            */
        }
    }
}

// Suit light controller.
with (suitSlave)
{
    x = other.x;
    y = other.y;
    if (other.MorphBall = true)
    {
        if (image_xscale < .6) image_xscale += 0.05;
        if (image_yscale < .6) image_yscale += 0.05;
        if (HasLight < 1) HasLight += 0.05;
    }
    else
    {
        if (image_xscale > .4) image_xscale -= 0.05;
        if (image_yscale > .4) image_yscale -= 0.05;
        if (HasLight > .7) HasLight -= 0.05;
    }
}

// Reset the Pulse Beam counter if the key is released.
if (KeyFireReleased) and (HoldingWeaponId = Weapons.wPulseBeam)
    { pulseshot = 0; ShotTimer = RateOfFire*6; }
    
// Temporary player death sequence.
if (Energy <= 0) instance_destroy();
if (Energy < 30) && (!sound_isplaying(snSamusBreathe)) sound_play(snSamusBreathe);
