if (WeaponDefined = true) ShotTimer -= 1;

if (object_index = oPlayer) and (eId.visor = 0)
{
    switch (HoldingWeaponId)
    {
    // --- Weapons that fire rapidly when the mouse button is held down ---
    // --- Use "scWeaponFire(1);" ---
        case Weapons.wPowerBeam:
        case Weapons.wWaveBeam:
        case Weapons.wPlasmaBeam:
        case Weapons.wSpazerBeam:
        case Weapons.wPulseBeam:
        case Weapons.wIceBeam:
        case Weapons.wPhazonBeam:
            if (KeyFireNormal && !KeyChargeUp && !KeyChargeReleased && !Overheated) scWeaponFire();
            break;
    // --- Weapons that fire as fast as the player can click the mouse ---
    // --- Use "scWeaponFire(2);" ---        
        case Weapons.wRuptureBeam:
        case Weapons.wMissileLauncher:
        case Weapons.wSuperMissile:
        case Weapons.wBallBomb:
            if (KeyFireClickSpeed && !KeyChargeUp && !KeyChargeReleased && !Overheated) scWeaponFire();
            break;
    }
    // --- Reset the Pulse Beam if the fire key is released ---
    if (HoldingWeaponId = Weapons.wPulseBeam) then
        { if (KeyFireReleased) pulseshot = 0; }
    // --- Charge up the Charge Beam ---
    if (KeyChargeUp)
        { if (Charger < ChargerMax) and (!pulsechargefiring) and (!Overheated) Charger += ChargeRate; }
        
    if (KeyChargeUp) and (ChargerMax > 0) and (!pulsechargefiring) and (!Overheated)
    {
        if !instance_exists(ChargeObject)
        {
            ChargeObject = instance_create(WeaponXPosition,WeaponYPosition,oCharging);
            ChargeObject.master = id;
            ChargeObject.image_angle = WeaponAim;
        }
    }
    // --- Fire Charge Beam ---
    if (KeyChargeReleased) scWeaponFire();
    if (!KeyChargeUp) Charger = 0;
    // --- Handle Plasma Beam heat ---
    if (Heat >= 100)
    {
        Heat = 99.75;
        ShotTimer = 200;
        Overheated = 200;
    }
    if (Heat > 0) Heat -= CoolRate;
    if (Heat <= 0) Heat = 0;
    if (Overheated > 0) Overheated -= CoolRate*4;
    if (Overheated <= 0) Overheated = 0;
}

if (object_index != oPlayer)
{
    // Insert AI code here.
}
