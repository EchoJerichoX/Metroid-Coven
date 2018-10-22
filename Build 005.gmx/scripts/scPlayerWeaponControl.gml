if (boosting+boostchargelevel > 0) exit;
if (!Overheated) and (!pulsechargeshot)
{
    if (KeyPowerBeam) NewPrimary = Weapons.wPowerBeam;
    if (KeyWaveBeam) && (eId.HasWaveBeam) NewPrimary = Weapons.wWaveBeam;
    if (KeyPlasmaBeam) && (eId.HasPlasmaBeam) NewPrimary = Weapons.wPlasmaBeam;
    if (KeySpazerBeam) && (eId.HasSpazerBeam) NewPrimary = Weapons.wSpazerBeam;
    if (KeyPulseBeam) && (eId.HasPulseBeam) NewPrimary = Weapons.wPulseBeam;
    if (KeyIceBeam) && (eId.HasIceBeam) NewPrimary = Weapons.wIceBeam;
    if (KeyRuptureBeam) && (eId.HasRuptureBeam) NewPrimary = Weapons.wRuptureBeam;
    if (KeyPhazonBeam) && (eId.HasPhazonBeam) NewPrimary = Weapons.wPhazonBeam;
}
if (KeySecondarySwitch) and (!MorphBall)
{
    if (CurrentUnmorphedSecondary = Weapons.wMissileLauncher) and (eId.HasSuperMissile) CurrentUnmorphedSecondary = Weapons.wSuperMissile;
    else CurrentUnmorphedSecondary = Weapons.wMissileLauncher;
}
if (Overheated) or (pulsechargeshot) exit;
if (!MorphBall)
{
    if (KeySecondaryHeld) and (eId.HasMissileLauncher)
    {
        if (!JustSwitched)
            { JustSwitched = 1; scDefineWeapon(CurrentUnmorphedSecondary,0); }
        else scDefineWeapon(CurrentUnmorphedSecondary,1);
    }
    else
    {
        if (NewPrimary != CurrentPrimary) scDefineWeapon(NewPrimary,0);
    }
}
if (!KeySecondaryHeld) && (eId.HasMissileLauncher) && (HoldingWeaponId != CurrentPrimary)
{
    JustSwitched = 0;
    scDefineWeapon(CurrentPrimary,0);
}
