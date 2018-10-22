if (boosting+boostchargelevel > 0) exit;
if (MorphBall = false)
{
    if (KeyPowerBeam)
    or (KeyWaveBeam)
    or (KeyPlasmaBeam)
    or (KeySpazerBeam)
    or (KeyPulseBeam)
    or (KeyIceBeam)
    or (KeyRuptureBeam)
    or (KeyPhazonBeam)
    or (KeySecondaryHeld)
    or (KeySecondaryReleased)
    or (KeySecondarySwitch) scPlayerWeaponControl();
    scWeaponStep();
}
else
{
    // --- Drop Ball Bomb ---
    if (KeyFireClickSpeed) and (ExistingBombs < 3) and (eId.HasBallBomb)
    {
        with (instance_create(x,y,oProjectile))
        {
            Charger = 0;
            scDefineProjectilePlayer(Weapons.wBallBomb);
        }
    }
    // --- Drop Morph Ball secondary weapon ---
    if (KeyChargePressed) 
    {
        if (eId.HasPowerBomb) 
        {
            if (CurrentMorphedSecondary = Weapons.wPowerBomb) and (ExistingPowerBombs > 0) exit;
            if (scWeaponGetAmmo(CurrentMorphedSecondary) > 0)
            {
                scWeaponSetAmmo(CurrentMorphedSecondary,scWeaponGetAmmo(CurrentMorphedSecondary)-1);
                with (instance_create(x,y,oProjectile))
                {
                    Charger = 0;
                    scDefineProjectilePlayer(other.CurrentMorphedSecondary);
                }
            } 
        }
    }
}
