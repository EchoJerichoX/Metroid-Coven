// Don't run if player object does not exist.
eId.classkills[lootclass] += 1; // WARNING: Kill count goes up any time this script is run.
                                // Should narrow this down later to only increase if the PLAYER gets the kill.
if (eId.classkills[lootclass] >= 9) eId.classkills[lootclass] = 1; // Reset to 0 so we don't go out of bounds
                                                                   //   within the array.
if (!instance_exists(oPlayer)) or (lootclass = 0) exit;
if (lootclass > 0) and (lootclass < eId.classcount-6) // Check that we are a loot class that uses prize
                                                       //   packs. We use "6" because the last 6 classes
                                                       //   are reserved for classes that can drop a lot
                                                       //   of pickups at once.
{
    var mydroprate = eId.droprate[lootclass]; // Can plug in some custom drop rates here later.
    if (round(random(100)) > mydroprate) exit; // Roll for chance at loot.
    var itemtodrop = eId.drop[lootclass,eId.classkills[lootclass]-1]; // Set item we are going to try to drop.
    switch (itemtodrop) // Do our ammo checks before dropping things.
    {
        case Items.aPowerBombAmmo:
            with (oPlayer)
            {
                if (!eId.HasPowerBomb)
                or (scWeaponGetAmmo(Weapons.wPowerBomb) = scWeaponGetAmmoMax(Weapons.wPowerBomb))
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
                if (!eId.HasSuperMissile)
                or (scWeaponGetAmmo(Weapons.wSuperMissile) = scWeaponGetAmmoMax(Weapons.wSuperMissile))
                {
                    //with (other) scDropBackupLoot(other.itemtodrop);
                    exit;
                }
            }
            break;
        case Items.aSMissileAmmo:
        case Items.aLMissileAmmo:
            with (oPlayer)
            {
                if (!eId.HasMissileLauncher)
                or (scWeaponGetAmmo(Weapons.wMissileLauncher) = scWeaponGetAmmoMax(Weapons.wMissileLauncher))
                {
                    //with (other) scDropBackupLoot(other.itemtodrop);
                    exit;
                }
            }
            break;
        case Items.hHealthSmall:
        case Items.hHealthLarge:
        case Items.hHealthHuge:
        case Items.hHealthSuper:
            if (oPlayer.Energy = 100) and (oPlayer.FullTanks = oPlayer.EnergyTanks) exit;
            break;
    }
    with (instance_create(x,y,oItem)) scDefineItem(itemtodrop);
}
