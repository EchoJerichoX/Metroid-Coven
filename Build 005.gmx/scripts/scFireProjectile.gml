// Runs within oPlayer.
// Get data about the projectile, and create it.
// argument0 = Aiming direction of the player when firing.
// argument1 = WeaponProjectile. Defined by enums in scDefineWeapon.
//   ^ Typically just copies current weapon enum directly to the projectile (no separate enum).
var xx = WeaponXPosition+lengthdir_x(CannonOffset,argument0); // Determine where we spawn the projectile from,
var yy = WeaponYPosition+lengthdir_y(CannonOffset,argument0); //   in relation to the arm cannon.
if (Charger >= 60) Heat += Heating*4; // Increase heat if using the Plasma Beam.
else Heat += Heating; // Increase heat by less if the shot is not from the Charge Beam.

if (HoldingWeaponId = Weapons.wWaveBeam) // Specific behavior for Wave Beam.
{
    sound_play(snBeamWave);
    for (var i = 0; i < 2; i += 1;) // Create 2 projectiles, one for each side.
    {
        with (instance_create(xx,yy,oProjectile))
        {
            Charger = other.Charger; // Inherit charge level from Charge Beam.
            direction = argument0; // Fires "straight".
            image_angle = direction;
            scDefineProjectilePlayer(argument1);
            t = 0;
            SwingPositive = i;
        }
    }
    with (instance_create(xx,yy,oDestroyAnim))
        { sprite_index = sprBeamFire1; image_blend = c_purple; image_speed = .5; }
}
else if (HoldingWeaponId = Weapons.wSpazerBeam) // Specific behavior for Spazer Beam.
{
    sound_play(BeamSpazer);
    for (var i = 0; i < 3; i += 1;)
    {
        with (instance_create(xx,yy,oProjectile))
        {
            Charger = other.Charger;
            direction = argument0;
            image_angle = direction;
            scDefineProjectilePlayer(argument1);
            side = i; // 0 = left, 1 = middle, 2 = right projectile.
        }
    }
    with (instance_create(xx,yy,oDestroyAnim))
        { sprite_index = sprBeamFire1; image_blend = c_lime; image_speed = .5; }
}
else if (HoldingWeaponId = Weapons.wPhazonBeam) // Specific behavior for Phazon Beam.
{
    sound_play(BeamPhazon);
    pop = instance_create(xx,yy,oParticle);
    pop.myid = argument1;
    if (Charger < 60)
    {
        with (instance_create(xx,yy,oProjectile))
        {
            Charger = other.Charger;
            direction = oPlayer.WeaponAim+random_range(oPlayer.WeaponAccuracy,oPlayer.WeaponAccuracy*-1);
            image_angle = direction;
            scDefineProjectilePlayer(Weapons.wPhazonBeam);
        }
        pop.c = 0;
    }
    else
    {
        for (var i = argument0-15; i < argument0+16; i+=15)
        {
            with (instance_create(xx,yy,oProjectile))
            {
                direction = i;
                image_angle = direction;
                Charger = other.Charger;
                scDefineProjectilePlayer(Weapons.wPhazonBeam);
            }
        }
        pop.c = 1;
    }
    with (instance_create(xx,yy,oDestroyAnim))
        { sprite_index = sprBeamFire1; image_blend = c_blue; image_speed = .5; }
}
else with (instance_create(xx,yy,oProjectile)) // Behavior for all other projectiles.
{
    Charger = other.Charger;
    direction = argument0+random_range(other.WeaponAccuracy*-1,other.WeaponAccuracy);
    image_angle = direction;
    if (other.HoldingWeaponId = Weapons.wRuptureBeam) particle = 0; // Make sure to create th eright
    scDefineProjectilePlayer(argument1);
}
