// This script keeps track of all the unique IDs.
// Each enum has an implicit value, so assigning numbers is no longer necessary.
// The ones that do not have implicit values are circumventing a "duplicate case" bug.

enum Weapons
{
    // Note: Nearly all of these, with the exception of the Rupture Beam particles, also
    //   serve as the enum for the projectile created when the weapon is used.
    // - Player Beams -
    wPowerBeam = 10001,
    wWaveBeam = 10002,
    wPlasmaBeam = 10003,
    wSpazerBeam = 10004,
    wPulseBeam = 10005,
    wIceBeam = 10006,
    wRuptureBeam = 10007,
    wPhazonBeam = 10008,
    // - Player Secondary Weapons -
    wMissileLauncher = 10009,
    wSuperMissile = 10010,
    wDiffuser = 10011,
    // - Player Addons -
    wBallBomb = 10012,
    wPowerBomb = 10013,
    wArcDash = 10014
}
enum Projectiles
{
    pTurret = 20001
}
enum Enemies
{
    eZoomer = 30001,
    eGeemer = 30002,
    eTurret = 30003
}
enum Items
{
    iWaveBeam = 40001,
    iPlasmaBeam = 40002,
    iSpazerBeam = 40003,
    iPulseBeam = 40004,
    iIceBeam = 40005,
    iRuptureBeam = 40006,
    iPhazonBeam = 40007,
    iMissileLauncher = 40008,
    iSuperMissile = 40009,
    iDiffuser = 40010,
    iVariaSuit = 40011,
    iGravitySuit = 40012,
    iCorruptionSuit = 40013,
    iMorphBall = 40014,
    iBallBomb = 40015,
    iPowerBomb = 40016,
    iArcDash = 40017,
    iLightsear = 40018,
    iMissileExpansion = 40019,
    iSuperMissileExpansion = 40020,
    iPowerBombExpansion = 40021,
    iEnergyTank = 40022,
    iAccelTank = 40023,
    aSMissileAmmo = 40024,
    aLMissileAmmo = 40025,
    aSSuperMissileAmmo = 40026,
    aLSuperMissileAmmo = 40027,
    aPowerBombAmmo = 40028, 
    hHealthSmall = 40029,
    hHealthLarge = 40030,
    hHealthHuge = 40031,
    hHealthSuper = 40032
}
enum Doors
{
    dBlue = 50001,
    dRed = 50002,
    dGreen = 50003,
    dYellow = 50004
}
enum Blocks
{
    bSolid = 60001,
    bBasic = 60002,
    bReform = 60003,
    bBomb = 60004,
    bPowerBomb = 60005,
    bMissile = 60006,
    bSuperMissile = 60007,
    bArcDash = 60008
}
enum Other
{
    // - Player suits -
    sPowerSuit = 70001,
    sVariaSuit = 70002,
    sGravitySuit = 70003,
    sCorruptionSuit = 70004
}
