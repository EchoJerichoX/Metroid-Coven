KeyUp                = keyboard_check(ord("W"));
KeyLeft              = keyboard_check(ord("A"));
KeyDown              = keyboard_check(ord("S"));
KeyRight             = keyboard_check(ord("D"));

KeyPowerBeam         = keyboard_check_pressed(ord("1"));
KeyWaveBeam          = keyboard_check_pressed(ord("2"));
KeyPlasmaBeam        = keyboard_check_pressed(ord("3"));
KeySpazerBeam        = keyboard_check_pressed(ord("4"));
KeyPulseBeam         = keyboard_check_pressed(ord("5"));
KeyIceBeam           = keyboard_check_pressed(ord("6"));
KeyRuptureBeam       = keyboard_check_pressed(ord("7"));
KeyPhazonBeam        = keyboard_check_pressed(ord("8"));

KeySecondaryHeld     = keyboard_check(vk_shift);
KeySecondaryReleased = keyboard_check_released(vk_shift);
KeySecondarySwitch   = keyboard_check_pressed(vk_control);
KeyMorph             = keyboard_check_pressed(ord("Z"));
KeyVisor             = keyboard_check_pressed(ord("X"));

KeyFireNormal        = mouse_check_button(mb_left);
KeyFireClickSpeed    = mouse_check_button_pressed(mb_left);
KeyFireReleased      = mouse_check_button_released(mb_left);

KeyChargeUp          = mouse_check_button(mb_right);
KeyChargePressed     = mouse_check_button_pressed(mb_right);
KeyChargeReleased     = mouse_check_button_released(mb_right);

KeyBoost             = mouse_check_button(mb_middle);
KeyBoostPressed      = mouse_check_button_pressed(mb_middle);
KeyBoostReleased     = mouse_check_button_released(mb_middle);

// Dodge code currently not used.
KeyDodge             = keyboard_check_pressed(vk_space);
KeyDodgeHold         = keyboard_check(vk_space);
KeyTorch             = keyboard_check_pressed(ord("F"));
// ^

if (!MorphBall) and (eId.HasArcDash)
{
    // Release boost key.
    if (KeyBoostReleased) and (!boosting)
    {
        if (sound_isplaying(snArcDashReadyIdle)) sound_stop(snArcDashReadyIdle);
        sound_volume(snArcDashReadyIdle,0);
        if (boostchargelevel = boostchargemax)
        and (!boosting)
        and (!boostdelay)
        {
            boostdir = round(point_direction(x,y,mouse_x,mouse_y));
            destboostdir = boostdir;
            destdirdelay = 3;
            boosting = 1;
            boosttrail = boosttraildelay;
        }
        boostchargelevel = 0;
        startboostcharge = 0;
        boostdelay = boostdelaymax;
    }
    
    // Press boost key.
    if (KeyBoostPressed) and (!boostdelay) and (!startboostcharge) and (!boosting)
    {
        if (!sound_isplaying(snArcDashReadyIdle)) sound_loop(snArcDashReadyIdle);
        startboostcharge = 1;
        with (instance_create(x,y,oEffect))
        {
            sound_play(snArcDashStart);
            sound_play(snArcDashCharge);
            sprite_index = sprArcDashReady;
            image_alpha = 0;
            image_speed = image_alpha;
            image_xscale = 3;
            image_yscale = image_xscale;
            image_angle = random(360);
        }
    }
    if (KeyBoostPressed) and (boosting) scPlayerBoostCollide(2);
    
    // Hold boost key.
    if (KeyBoost) and (startboostcharge) and (boostchargelevel < boostchargemax) and (!boosting) boostchargelevel += 1;
    if (boostalpha <= 0) boostalpha = boostalphaset;
    boostfaderate = boostchargelevel/1000;
    if (boostalpha > 0) boostalpha -= boostfaderate;
    if (boostchargelevel > 0) and (!boosting)
    {
        sound_volume(snArcDashReadyIdle,boostchargelevel/boostchargemax);
        var ce = random(boostchargelevel);
        if (abs(ce-boostchargemax) > boostchargemax/3) and (!boosteffectdelay)
        {
            boosteffectdelay = boosteffectdelaytimer;
            with (instance_create(x+random_range(boostchargelevel/boosteffectrangemod,boostchargelevel/-boosteffectrangemod),
                                  y+random_range(boostchargelevel/boosteffectrangemod,boostchargelevel/-boosteffectrangemod),oEffect))
            {
                var s = random(other.boostchargelevel)+random(other.boostchargemax/3);
                if (s > 40) sound_play(choose(snCrackleShort1,
                                              snCrackleShort2,
                                              snCrackleShort3,
                                              snCrackleShort4,
                                              snCrackleShort5));
                sprite_index = sprArcDashSpark;
                image_speed = 1;
                image_alpha = ((random(other.boostchargelevel))/other.boostchargemax)*0.9;
                image_alpha = clamp(image_alpha,0,1);
                image_angle = random(360);
                image_xscale = random_range(0.75,1.25);
                image_yscale = image_xscale;
                depth = other.depth+round(random_range(-2,1));
            }
        }
    }
    
    // Miscellaneous boost stuff.
    if (boosting)
    {
        motion_add(boostdir,boostspeed);
        with (instance_create(x+random_range(boostchargelevel/boosteffectrangemod,boostchargelevel/-boosteffectrangemod),
                              y+random_range(boostchargelevel/boosteffectrangemod,boostchargelevel/-boosteffectrangemod),
                              oEffect))
        {
            var s = round(random(10));
            if (s > 4) sound_play(choose(snCrackleShort1,
                                         snCrackleShort2,
                                         snCrackleShort3,
                                         snCrackleShort4,
                                         snCrackleShort5));
            sprite_index = sprArcDashSpark;
            image_speed = 1;
            image_alpha = 0.6+random(0.4);
            image_alpha = clamp(image_alpha,0,1);
            image_angle = random(360);
            image_xscale = random_range(0.75,1.25);
            image_yscale = image_xscale;
            depth = other.depth+round(random_range(-2,1));
            speed = random(2);
            direction = random(360);
        }
        if (boosttrail > 0) boosttrail -= 1;
        if (boosttrail = 0)
        {
            if (boosttrail = 0) boosttrail = boosttraildelay;
            else boosttrail -= 1;
            with (instance_create(x,y,oEffect))
            {
                depth = other.depth-1;
                sprite_index = sprArcDashTrail;
                direction = other.direction;
                speed = other.speed/2;
                image_angle = other.boostdir;
                image_alpha = 1;
                image_speed = 0.5;
                //flex = 1;
            }
        }
    }
    if (boosteffectdelay > 0) boosteffectdelay -= 1;
    if (boostdelay > 0) boostdelay -= 1;
}

// Toggle Morph Ball.
if (KeyMorph = true)
and (eId.HasMorphBall = true)
and (!Overheated)
and (!boosting)
and (!boostchargelevel)
{
    if (MorphBall) and (collision_circle(x,y,8,oBlockParent,true,false)) exit;
    MorphBall = !MorphBall;
    if (MorphBall = false) sound_play(snSamusUnmorph)
    else sound_play(snSamusMorph)
    me = instance_create(x,y,oEffect);
    me.image_alpha = 1;
    me.image_angle = random(360);
    me.depth = 1;
    switch (Suit)
    {
        case Other.sPowerSuit: me.sprite_index = sprMorphPower; break;
        case Other.sVariaSuit: me.sprite_index = sprMorphVaria; break;
        case Other.sGravitySuit: me.sprite_index = sprMorphGravity; break;
        case Other.sCorruptionSuit: me.sprite_index = sprMorphCorruption; break;
    }
}

// Set sprite depending on whether we are in Morph Ball or not.
if (boosting) 
{
    sprite_index = sprPlayerArcDash;
    if (instance_exists(oCannon)) oCannon.sprite_index = sprCannonsArcDash;
}
else
{
    if (instance_exists(oCannon)) oCannon.sprite_index = sprCannons;
    if (MorphBall = false) && (sprite_index != sprPlayer)
        { sprite_index = sprPlayer; image_single = AnimationStart; mask_index = sprPlayerMask; }
    if (MorphBall = true) && (sprite_index != sprPlayerMorphBall)
        { sprite_index = sprPlayerMorphBall; image_single = BallAnimationStart; mask_index = sprPlayerMorphBallMask; }
}

// Toggle scan and combat visor.
if (KeyVisor) and (boosting+boostchargelevel = 0) eId.visor = !eId.visor;

// Check whether or not we are standing on ice tiles.
if (tile_layer_find(1999,x,y))
and (!tile_layer_find(1001,x,y))
and (boosting+boostchargelevel = 0)
{
    if (MorphBall) SpeedInterval = 35;
    else SpeedInterval = 45;
    OnIce = true;
}
else
{
    if (MorphBall) SpeedInterval = 10;
    else SpeedInterval = 5;
    OnIce = false;
}

// Dodge code (currently unused)
/*
if (DodgeCooldown > 0) DodgeCooldown -= 1;
if (Dodge > 0)
{
    if (!KeyDodgeHold) Dodge = 1;
    if (Dodge = 1)
        { MorphBall = false; sprite_index = sprPlayer; }
    Dodge -= 1;
    DodgeCooldown += 2;
}
else
{
*/

moving_direction_previous = moving_direction;
moving_direction = 0;
moving = true;

if (boosting+boostchargelevel = 0)
{
    if (KeyUp)
        { mvspeed -= MaxSpeed/(SpeedInterval/1.5); moving_direction = 90; }
    if (KeyLeft)
        { mhspeed -= MaxSpeed/(SpeedInterval/1.5); moving_direction = 180; }
    if (KeyDown)
        { mvspeed += MaxSpeed/(SpeedInterval/1.5); moving_direction = 270; }
    if (KeyRight)
        { mhspeed += MaxSpeed/(SpeedInterval/1.5); moving_direction = 0; }
}

if (boosting+boostchargelevel = 0)
    { hspeed = mhspeed; vspeed = mvspeed; }

if (MorphBall) maxs = MaxBallSpeed;
else maxs = MaxSpeed;

if (KeyRight) and (KeyUp) moving_direction = 45;
if (KeyRight) and (KeyDown) moving_direction = 315;
if (KeyLeft) and (KeyUp) moving_direction = 135;
if (KeyLeft) and (KeyDown) moving_direction = 225;

if (boosting+boostchargelevel = 0) speed = min(speed,maxs);

if ((KeyUp+KeyLeft+KeyDown+KeyRight) = 0)
or (boosting+boostchargelevel > 0)
{
    moving_direction = -1;
    if (OnIce) speed = max(speed*0.95,0);
    else speed = max(speed*0.55,0);
    if (abs(speed) < 0.5) speed = 0;
    moving = false;
}

if (alarm[3] > 0)
    { speed = 5; direction = KnockbackDir; }

mhspeed = lengthdir_x(speed,direction);
mvspeed = lengthdir_y(speed,direction);

// Animate sprite.
if (boosting+boostchargelevel = 0)
{
    if (MorphBall)
    {
        if ((KeyUp + KeyLeft + KeyDown + KeyRight) = 0)
            { AnimationTimer = 0; }
        else AnimationTimer += 1;
        
        if (AnimationTimer = BallAnimationLimit)
        {
            if (BallAnimationStart != BallAnimationEnd)
            {
                image_single += 1;
                if (image_single > BallAnimationEnd) image_single = BallAnimationStart;
            }
            AnimationTimer = 0;
        }
        if (speed > maxs) speed = maxs;
        image_angle = direction;
    }
    else
    {
        if ((KeyUp + KeyLeft + KeyDown + KeyRight) = 0)
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
    }
}
else
{
    image_single = AnimationStart;
    
    var pd;
    if (boosting) pd = boostdir;
    else pd = point_direction(x,y,eId.x,eId.y);
    
    var dd = angle_difference(image_angle,pd);
    image_angle -= min(abs(dd),9)*sign(dd);
    
    var dw = angle_difference(WeaponAim,pd);
    WeaponAim -= min(abs(dw),11)*sign(dw);
}

move_step_ext(x+mhspeed,y+mvspeed,sign(0)*min(1,abs(0)),oBlockParent);
speed = 0;

// Stop boosting if we hit a wall at a bad angle.
if (boosting)
{
    prevdir = point_direction(xprevious,yprevious,x,y);
    if (point_distance(x,y,xprevious,yprevious) < 3)  scPlayerBoostCollide(0);
    if (angle_difference(prevdir,boostdir) > boostdirblocklimit)  scPlayerBoostCollide(0);
    else
    {
        if (destdirdelay = 0) destboostdir = floor(prevdir);
        else destdirdelay -= 1;
    }
    if (boostdir != destboostdir)
    {
        var dbd = round(angle_difference(boostdir,destboostdir));
        boostdir -= (min(abs(dbd),1)*sign(dbd));
    }
}
boostdir = round(boostdir);
