// Initialization script for all player projectiles.
// First, assign the projectile an engine ID. Typically, it is just copied from the current
//   player weapon equipped. There are no longer separate enums for projectiles. The ONLY
//   EXCEPTION is the Rupture Beam homing particles. May change in the future just to remove
//   one more potentially redundant enum.
myid = argument0;
// Next, hand out common variables standard to every projectile. Changes may be made in the
//   switch statement, below if needed.
mask_index = sprProjectileMaskDoorChecker; // If the player is butted up against a door, open it.
impaused = 0; // Is the game paused?
for (var i = 0; i < 6; i++) c_alarm[i] = -1; // Build array to store alarm counts when pausing.
alarmsheld = 0; // Tells the object if its alarm states are currently held.
alarm[4] = 2; // Revert to the proper mask_index after it has moved few frames.
playerweapon = 1; // All projectiles in this script are player-owned. Used in calls for collision
                  //   to make sure certain colliding objects behave correctly.
hittype = 1; // Tells all player projectiles that they are beam weapons (by default).
             // 1 = Beam.
             // 2 = Missile.
             // 3 = Super Missile.
DiesOnContact = true; // By default, destroy the instance when it hits something.
if (Charger < 60) charged = 0; // Determine if the player fired the projectile using the Charge
else charged = 1;              //   Beam.
blend = c_white; // Used for image_blend'ing the projectile light.
lightalpha = 0.1; // Alpha value of the projectile light.
lightradius = 0.6; // Radius of the projectile light.
if (charged) // Make changes to common variables if the player fired the projectile using the
             //   Charge Beam.
{
    lightalpha = lightalpha*2;
    lightradius = lightradius*2;
}
pop = instance_create(x,y,oParticle); // Create a small particle burst.
pop.myid = myid;                      // ^
pop.c = charged;                      // ^
image_speed = 0.5;
switch (myid)
{
// =========
// = BEAMS =
// =========
// --- Power Beam ---
    case Weapons.wPowerBeam:
        if (!charged)
            { sprite = sprPower; Damage = 1; }
        else
            { sprite = sprPowerCharge; Damage = 8; }
        sprite_index = sprite;
        speed = 10;
        blend = c_yellow; // Used for color of light and color of explosion at tip of arm cannon.
        sound_play(BeamPower);
        alarm[0] = 20+random(5); // Time until the projectile starts fading out.
        with (instance_create(x,y,oDestroyAnim)) // Create a small explosion at tip of arm cannon.
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        break;
// --- Wave Beam ---
    case Weapons.wWaveBeam: // NOTE: Sound is played in scFireProjectile since there are multiple
                            //   instances of the projectile created when fired.
        if (!charged)
            { sprite = sprWave; Damage = 1; }
        else
            { sprite = sprWaveCharge; Damage = 5; }
        sprite_index = sprite;
        speed = 6;
        blend = c_purple;
        alarm[0] = 25+random(5);
        alarm[1] = 2; // For creating trails more slowly.
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        break;
// --- Plasma Beam ---
    case Weapons.wPlasmaBeam:
        if (!charged)
            { sprite = sprPlasma; Damage = 4; }
        else
            { sprite = sprPlasmaCharge; Damage = 15; }
        sprite_index = sprite;
        speed = 6;
        blend = c_orange;
        sound_play(snBeamPlasma);
        alarm[0] = 35+random(5);
        image_speed = 0.25;
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire2; image_speed = .5; }
        break;
// --- Spazer Beam ---
    case Weapons.wSpazerBeam: // NOTE: Sound is played in scFireProjectile since there are multiple
                              //   instances of the projectile created when fired.
        if (!charged)
            { sprite = sprSpazer; Damage = 1; }
        else
            { sprite = sprSpazerCharge; Damage = 4; }
        sprite_index = sprite;
        speed = 6;
        blend = c_lime;
        alarm[0] = 25;
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        break;
// --- Pulse Beam ---
    case Weapons.wPulseBeam:
        Damage = 1;
        sprite_index = sprPulse;
        speed = 11;
        blend = make_color_rgb(0,255,255);
        if (sound_isplaying(snBeamPulse)) sound_stop(snBeamPulse);
        sound_play(snBeamPulse);
        alarm[0] = 15+random(5);
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        break;
// --- Ice Beam ---
    case Weapons.wIceBeam:
        if (!charged)
            { sprite = sprIce; Damage = 2; }
        else
            { sprite = sprIceCharge; Damage = 8; }
        sprite_index = sprite;
        speed = 6;
        blend = make_color_rgb(94,174,255);
        sound_play(BeamIce);
        alarm[0] = 30+random(5);
        alarm[1] = 2;
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        image_speed = .25;
        break;
// --- Rupture Beam ---
    case Weapons.wRuptureBeam:
        if (particle)
        {
            Damage = 0.5;
            sprite_index = sprRuptureParticle;
            speed = random_range(1,3);
            direction = random(360);
            alarm[0] = 20;
            alarm[1] = 2;
        }
        else
        {
            if (!charged)
                { sprite = sprRupture; Damage = 1; }
            else
                { sprite = sprRuptureCharge; Damage = 7; }
            sprite_index = sprite;
            speed = 9;
            blend = c_orange;
            sound_play(snBeamRupture);
            alarm[0] = 25+random(5);
            alarm[1] = 2;
            with (instance_create(x,y,oDestroyAnim))
                { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
            image_speed = .25;
        }
        break;
// --- Phazon Beam ---
    case Weapons.wPhazonBeam:
        if (!charged)
            { sprite = sprPhazon; Damage = 4; speed = 8; }
        else
            { sprite = sprPhazonCharge; Damage = 12; speed = 11; }
        sprite_index = sprite;
        blend = c_blue;
        sound_play(snBeamPhazon);
        alarm[0] = 25+random(5);
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = other.blend; image_speed = .5; }
        image_speed = .25;
        break;
// =====================
// = SECONDARY WEAPONS =
// =====================
// --- Missile ---
    case Weapons.wMissileLauncher:
        hittype = 2;
        Damage = 6;
        sprite_index = sprMissile;
        speed = 6;
        blend = c_orange;
        sound_play(MissileFire);
        alarm[0] = 600;
        break;
// --- Super Missile ---
    case Weapons.wSuperMissile:
        hittype = 3;
        Damage = 25;
        sprite_index = sprSuperMissile;
        speed = 4;
        blend = make_color_rgb(196,121,196);
        sound_play(MissileFire);
        alarm[0] = 600;
        break;
// ==========
// = ADDONS =
// ==========
// NOTE: See Bomb and Power Bomb IDs in "scProjectileDeath" for remaining pertinent info.
// --- Ball Bomb ---
    case Weapons.wBallBomb:
        Charger = 0;
        DiesOnContact = false;
        sprite_index = sprBallBomb;
        if (instance_exists(oPlayer)) oPlayer.ExistingBombs += 1;
        mask_index = sprite_index;
        blend = make_color_rgb(94,174,255);
        lightalpha = 0.2;
        lightradius = 0.4;
        sound_play(snBombLay);
        image_speed = .1;
        createeffect = 0; // For extra visuals before exploding.
        break;
// --- Power Bomb ---
    case Weapons.wPowerBomb:
        Charger = 0;
        DiesOnContact = false;
        if (instance_exists(oPlayer)) oPlayer.ExistingPowerBombs += 1;
        sprite_index = sprPowerBomb;
        mask_index = sprite_index;
        DiesOnContact = false;
        blend = c_red;
        lightalpha = 0.2;
        lightradius = 0.4;
        sound_play(snBombLay);
        image_speed = .03;
        createeffect = 0;
        break;
// =================
// = ERROR CATCHER =
// =================
    default:
        show_error("The projectile ID ("+string(myid)+") is not defined in the engine ID list.",true);
        break;
}
scProjectileLight(lightalpha,c_white,blend,lightradius); // Create the light that follows the projectile.
inputspeed = speed; // Grab the projectile speed for pausing interaction.
