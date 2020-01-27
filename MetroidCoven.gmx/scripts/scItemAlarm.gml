// This is the item object's delayed "Step" event.
// It runs through alarm 0.
switch (myid)
{
// --- Items that flash ---
    case Items.iWaveBeam:
    case Items.iPlasmaBeam:
    case Items.iSpazerBeam:
    case Items.iPulseBeam:
    case Items.iIceBeam:
    case Items.iRuptureBeam:
    case Items.iPhazonBeam:
    case Items.iMissileLauncher:
    case Items.iSuperMissile:
    case Items.iDiffuser:
    case Items.iVariaSuit:
    case Items.iGravitySuit:
    case Items.iCorruptionSuit:
    case Items.iPowerBomb:
    case Items.iArcDash:
    case Items.iLightsear:
    case Items.iEnergyTank:
    case Items.iMissileExpansion:
    case Items.iSuperMissileExpansion:
    case Items.iPowerBombExpansion:
        scItemFlash(0.5,0.1);
        alarm[0] = StepSpeed;
        exit;
        break;
    case Items.aSMissileAmmo:
    case Items.aLMissileAmmo:
    case Items.aSSuperMissileAmmo:
    case Items.aLSuperMissileAmmo:
    case Items.aPowerBombAmmo:
        scItemFlash(0.75,0.15);
        alarm[0] = StepSpeed;
        exit;
        break;
// --- Items with unique animations ---
    case Items.iMorphBall:
        if (eId.fadeStage > -1) or (eId.paused > 0) exit; // If a message is on-screen, stop doing anything.
        scItemPauseAnimation();
        break;
// --- Items with both animations ---    
    case Items.iBallBomb:
        if (eId.fadeStage > -1) or (eId.paused > 0) exit; // If a message is on-screen, stop doing anything.
        scItemFlash(0.5,0.1);
        scItemPauseAnimation();
        alarm[0] = StepSpeed;
        break;
}
alarm[0] = StepSpeed;
if (AnimationStart != AnimationEnd)
{
    image_single += 1;
    if (image_single > AnimationEnd) image_single = AnimationStart;
}
