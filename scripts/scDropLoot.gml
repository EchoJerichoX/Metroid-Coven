// Don't run if player object does not exist.
if (instance_exists(oPlayer))
{
    if (random(3) <= 1) and (eId.HasMissileLauncher = true)
    {
        with (instance_create(x,y,oItem))
        {
            // Tentative, until proper loot classes are added.
            scDefineItem(choose(Items.aSMissileAmmo,Items.aSSuperMissileAmmo,Items.aPowerBombAmmo))
        }
    }

}
