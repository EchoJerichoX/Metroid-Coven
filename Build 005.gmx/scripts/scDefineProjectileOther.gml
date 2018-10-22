// Initialization script for all projectiles.
myid = argument0; // Set engine ID in accordance with current player weapon.
mask_index = sprProjectileMaskDoorChecker; // If the player is butted up against
                                           //   a door, open it.
impaused = 0;
for (var i = 0; i < 6; i++) c_alarm[i] = -1; // Build array to store alarm counts when pausing.
alarmsheld = 0; // Tells the object if its alarm states are currently held.
alarm[4] = 2; // Revert to the proper mask_index after it has moved few frames.
switch (myid)
{
// =====================
// = ENEMY PROJECTILES =
// =====================
// --- Turret Bolt ---
    case Projectiles.pTurret:
        playerweapon = 0;
        hittype = 1; // Beam.
        Damage = 12;
        speed = 10;
        sprite_index = sprTurretBolt;
        DiesOnContact = true;
        pop = instance_create(x,y,oParticle);
        pop.myid = Projectiles.pTurret;
        pop.c = 0;
        sound_play(BeamPower);
        scProjectileLight(.1,c_white,c_red,.6)
        alarm[0] = 25+random(5);
        with (instance_create(x,y,oDestroyAnim))
            { sprite_index = sprBeamFire1; image_blend = c_red; image_speed = .5; }
        break;

// =========================
// ===== Error-catcher =====
// =========================
    default: show_error("The projectile ID ("+string(myid)+") is not defined in the engine ID list.",true); break;
}

inputspeed = speed; // Grab the projectile speed for pausing interaction.

































































































































































































































































































