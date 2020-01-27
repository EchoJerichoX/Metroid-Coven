// Runs within oPlayer.
// Various weapon checks before firing.
if (HoldingWeaponId = Weapons.wPulseBeam) // Specific behavior for Pulse Beam firing.
{
    if (Charger >= 60) alarm[1] = 1; // Spam-fire the Pulse Beam if charged.
    else
    {
        if (ShotTimer < 0) // If ShotTimer > 0, we don't allow firing.
        {
            scFireProjectile(WeaponAim,WeaponProjectile); // Fire the projectile.
            Charger = 0; // Reset the Charge Beam variable.
            if (pulseshot < 3) // See where we are in the burst.
                { ShotTimer = RateOfFire; pulseshot += 1; } // Fire until we are done bursting.
            if (pulseshot = 3) then // If the pulse is done...
                { ShotTimer = RateOfFire*6; pulseshot -= 3; // Set a lengthy delay between bursts.
            }
        }
    }
}
else // Behavior for all other weapons.
{
    if (ShotTimer < 0) // If ShotTimer > 0, we don't allow firing.
    {
        ShotTimer = RateOfFire; // Set the delay before we can fire again.
        if (scGetRequiresAmmo()) // Does the current weapon need ammo to operate?
        {
            if (scWeaponGetAmmo(HoldingWeaponId) > 0) // If so, do we have enough ammo?
            {
                scWeaponSetAmmo(HoldingWeaponId,scWeaponGetAmmo(HoldingWeaponId)-1); // Subtract ammo to fire.
                scFireProjectile(WeaponAim,WeaponProjectile); // Fire the projectile.
                Charger = 0; // Reset the Charge Beam variable.
            } 
        }
        else // If the current weapon does not need ammo...
        {
            scFireProjectile(WeaponAim,WeaponProjectile); // ... then fire the projectile.
            Charger = 0; // Reset the Charge Beam variable.
        }   
    }
}
