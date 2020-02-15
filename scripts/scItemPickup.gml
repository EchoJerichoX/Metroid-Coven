switch (myid)
{
// --- Beams ---
    case Items.iWaveBeam: text = eId.GainWaveBeam; eId.HasWaveBeam = true; break;
    case Items.iPlasmaBeam: text = eId.GainPlasmaBeam; eId.HasPlasmaBeam = true; break;
    case Items.iSpazerBeam: text = eId.GainSpazerBeam; eId.HasSpazerBeam = true; break;
    case Items.iPulseBeam: text = eId.GainPulseBeam; eId.HasPulseBeam = true; break;
    case Items.iIceBeam: text = eId.GainIceBeam; eId.HasIceBeam = true; break;
    case Items.iRuptureBeam: text = eId.GainRuptureBeam; eId.HasRuptureBeam = true; break;
    case Items.iPhazonBeam: text = eId.GainPhazonBeam; eId.HasPhazonBeam = true; break;
// --- Secondary Weapons ---
    case Items.iMissileLauncher: text = eId.GainMissileLauncher; eId.HasMissileLauncher = true; break;
    case Items.iSuperMissile: text = eId.GainSuperMissile; eId.HasSuperMissile = true; break;
    case Items.iDiffuser: text = eId.GainDiffuser; eId.HasDiffuser = true; break;
// --- Addons ---
    case Items.iMorphBall: text = eId.GainMorphBall; eId.HasMorphBall = true; break;
    case Items.iBallBomb: text = eId.GainBallBomb; eId.HasBallBomb = true; break;
    case Items.iPowerBomb: text = eId.GainPowerBomb; eId.HasPowerBomb = true; break;
    case Items.iArcDash: text = eId.GainArcDash; eId.HasArcDash = true; break;
    case Items.iLightsear: text = eId.GainLightsear; eId.HasLightsear = true; break;
// --- Suits ---
    case Items.iVariaSuit: text = eId.GainVariaSuit; eId.HasVariaSuit = true; with (other) scDefineSuit(Other.sVariaSuit); break;
    case Items.iGravitySuit: text = eId.GainGravitySuit; eId.HasGravitySuit = true; with (other) scDefineSuit(Other.sGravitySuit); break;
    case Items.iCorruptionSuit: text = eId.GainCorruptionSuit; eId.HasPhazonSuit = true; with (other) scDefineSuit(Other.sCorruptionSuit); break;
// --- Visors ---
    // N/A.
// --- Expansions ---
    case Items.iEnergyTank:
        scAcquireExpansion(1);
        with (other) // oPlayer.
        {
            other.text = eId.GainEnergyTank; // oItem.
            EnergyTanks += 1;
            FullTanks = EnergyTanks;
            Energy = 100;
        }
        break;
    case Items.iMissileExpansion:
        scAcquireExpansion(2);
        with (other) // oPlayer.
        {
            other.text = eId.GainMissileExpansion; // oItem.
            scWeaponSetAmmoMax(Weapons.wMissileLauncher,scWeaponGetAmmoMax(Weapons.wMissileLauncher)+5);
            scWeaponSetAmmo(Weapons.wMissileLauncher,scWeaponGetAmmo(Weapons.wMissileLauncher)+5);
            scRegulateAmmo(Weapons.wMissileLauncher);
        }
        break;
    case Items.iSuperMissileExpansion:
        scAcquireExpansion(3);
        with (other) // oPlayer.
        {
            other.text = eId.GainSuperMissileExpansion; // oItem.
            scWeaponSetAmmoMax(Weapons.wSuperMissile,scWeaponGetAmmoMax(Weapons.wSuperMissile)+2);
            scWeaponSetAmmo(Weapons.wSuperMissile,scWeaponGetAmmo(Weapons.wSuperMissile)+2);
            scRegulateAmmo(Weapons.wSuperMissile);
        }
        break;
    case Items.iPowerBombExpansion:
        scAcquireExpansion(4);
        with (other) // oPlayer.
        {
            other.text = eId.GainPowerBombExpansion; // oItem.
            scWeaponSetAmmoMax(Weapons.wPowerBomb,scWeaponGetAmmoMax(Weapons.wPowerBomb)+1);
            scWeaponSetAmmo(Weapons.wPowerBomb,scWeaponGetAmmo(Weapons.wPowerBomb)+1);
            scRegulateAmmo(Weapons.wPowerBomb);
        }
        break;
// --- Ammo Pickups ---
    case Items.aSMissileAmmo: // Small Missile drop, +2.
        with (other)
        {
            scWeaponSetAmmo(Weapons.wMissileLauncher,scWeaponGetAmmo(Weapons.wMissileLauncher)+2);
            scRegulateAmmo(Weapons.wMissileLauncher);
        }
        break;
    case Items.aLMissileAmmo: // Large Missile drop, +5.
        with (other)
        {
            scWeaponSetAmmo(Weapons.wMissileLauncher,scWeaponGetAmmo(Weapons.wMissileLauncher)+5);
            scRegulateAmmo(Weapons.wMissileLauncher);
        }
        break;
    case Items.aSSuperMissileAmmo: // Small Super Missile drop, +1.
        with (other)
        {
            scWeaponSetAmmo(Weapons.wSuperMissile,scWeaponGetAmmo(Weapons.wSuperMissile)+1);
            scRegulateAmmo(Weapons.wSuperMissile);
        }
        break;
    case Items.aLSuperMissileAmmo: // Large Super Missile drop, +2.
        with (other)
        {
            scWeaponSetAmmo(Weapons.wSuperMissile,scWeaponGetAmmo(Weapons.wSuperMissile)+2);
            scRegulateAmmo(Weapons.wSuperMissile);
        }
        break;
    case Items.aPowerBombAmmo: // Power Bomb drop, +1.
        with (other)
        {
            scWeaponSetAmmo(Weapons.wPowerBomb,scWeaponGetAmmo(Weapons.wPowerBomb)+1);
            scRegulateAmmo(Weapons.wPowerBomb);
        }
        break;
// --- Health Pickups ---
    case Items.hHealthSmall:
        with (other) GainEnergy = 10;
        break;
    case Items.hHealthLarge:
        with (other) GainEnergy = 20;
        break;
    case Items.hHealthHuge:
        with (other) GainEnergy = 50;
        break;
    case Items.hHealthSuper:
        with (other) GainEnergy = 100;
        break;
}
if (text != "No string assigned!") with (eId)
{
    if (tutorialroom = 1) scan = 1;
    else scan = 0;
    scPause();
    fadeStage = 0;
    text = other.text;
    alarm[0] = 5;
}
instance_destroy();
