// If the projectile is a player-owned one, or
//   otherwise exempt projectile type, don't
//   run this script to damage the player.
switch (myid)
{
    case Weapons.wPowerBeam:
    case Weapons.wWaveBeam:
    case Projectiles.pWaveBeam:
    case Weapons.wPlasmaBeam:
    case Weapons.wSpazerBeam:
    case Projectiles.pSpazerBeam:
    case Weapons.wPulseBeam:
    case Weapons.wIceBeam:
    case Weapons.wRuptureBeam:
    case Projectiles.pRuptureBeam:
    case Weapons.wPhazonBeam:
    case Projectiles.pPhazonBeam:
    case Weapons.wMissileLauncher:
    case Weapons.wSuperMissile:
    case Weapons.wBallBomb:
    case Weapons.wPowerBomb:
        exit;
        break;
}
other.HitPoints -= Damage;
other.TakeHitDirection = direction;
if (DiesOnContact = true) instance_destroy();
