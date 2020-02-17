// Script runs in case we do not meet conditions to drop a specific loot type.
// Here, we try to drop the next ammo type down's
// Argument 0 = The loot type we failed to drop.
// In each case
switch (argument0)
{
    case Items.aPowerBombAmmo:
        with (oPlayer)
        {
            if (!eId.HasSuperMissile)
            or (scWeaponGetAmmo(Weapons.wSuperMissile) = scWeaponGetAmmoMax(Weapons.wSuperMissile))
            {
                //with (other) scDropBackupLoot(other.itemtodrop);
                exit;
            }
        }
        break;
    case Items.aSSuperMissileAmmo:
    case Items.aLSuperMissileAmmo:
        with (oPlayer)
        {
            if (!eId.HasMissileLauncher)
            or (scWeaponGetAmmo(Weapons.wMissileLauncher) = scWeaponGetAmmoMax(Weapons.wMissileLauncher)) exit;
        }
        break;
}
