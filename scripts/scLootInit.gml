// See the bottom of this script for a guide on how this loot system works.
// Initializes all of the game's loot systems and their drops.
// See scLootClass. That is where actors have their loot classes set.

// Array: drop[class,item].
//drop = array_create(112);
// ^ Needed?

classcount = 18;
for (class = 0; class < classcount-1; class++;)
{
    classkills[class] = 0;
    switch (class)
    {
        case 0: // Class 0, "Empty".
            classname[class] = "Empty";
            droprate[class] = 0;
            for (var i = 0; i < 8; i++;)
                { drop[class,i] = "Nothing"; }
            break;
            
        case 1: // Class 1, "Standard".
            classname[class] = "Standard";
            droprate[class] = 50;
            drop[class,0] = Items.hHealthSmall;
            drop[class,1] = Items.hHealthSmall;
            drop[class,2] = Items.hHealthSmall;
            drop[class,3] = Items.aSMissileAmmo;
            drop[class,4] = Items.hHealthSmall;
            drop[class,5] = Items.aSMissileAmmo;
            drop[class,6] = Items.hHealthLarge;
            drop[class,7] = Items.aLMissileAmmo;
            break;
            
        case 2: // Class 2, "Standard Plus".
            classname[class] = "Standard Plus";
            droprate[class] = 100;
            drop[class,0] = Items.hHealthSmall;
            drop[class,1] = Items.hHealthSmall;
            drop[class,2] = Items.aSMissileAmmo;
            drop[class,3] = Items.hHealthLarge;
            drop[class,4] = Items.aLMissileAmmo;
            drop[class,5] = Items.hHealthLarge;
            drop[class,6] = Items.aLMissileAmmo;
            drop[class,7] = Items.aSSuperMissileAmmo;
            break;
            
        case 3: // Class 3, "Health".
            classname[class] = "Health";
            droprate[class] = 75;
            drop[class,0] = Items.hHealthSmall;
            drop[class,1] = Items.hHealthSmall;
            drop[class,2] = Items.hHealthSmall;
            drop[class,3] = Items.hHealthLarge;
            drop[class,4] = Items.hHealthSmall;
            drop[class,5] = Items.hHealthLarge;
            drop[class,6] = Items.hHealthLarge;
            drop[class,7] = Items.hHealthHuge;
            break;
            
        case 4: // Class 4, "Ammo".
            classname[class] = "Ammo";
            droprate[class] = 75;
            drop[class,0] = Items.aSMissileAmmo;
            drop[class,1] = Items.aSMissileAmmo;
            drop[class,2] = Items.aSSuperMissileAmmo;
            drop[class,3] = Items.aLMissileAmmo;
            drop[class,4] = Items.aSMissileAmmo;
            drop[class,5] = Items.aLMissileAmmo;
            drop[class,6] = Items.aLSuperMissileAmmo;
            drop[class,7] = Items.aPowerBombAmmo;
            break;
            
        // Class 5, "Missiles".
        case 5:
            classname[class] = "Missiles";
            droprate[class] = 50;
            drop[class,0] = Items.aSMissileAmmo;
            drop[class,1] = Items.aLMissileAmmo;
            drop[class,2] = Items.aSMissileAmmo;
            drop[class,3] = Items.aSMissileAmmo;
            drop[class,4] = Items.aLMissileAmmo;
            drop[class,5] = Items.aSMissileAmmo;
            drop[class,6] = Items.aLMissileAmmo;
            drop[class,7] = Items.aLMissileAmmo;
            break;
            
        // Class 6, "Guaranteed Missiles".
        case 6:
            classname[class] = "Guaranteed Missiles";
            droprate[class] = 100;
            drop[class,0] = Items.aSMissileAmmo;
            drop[class,1] = Items.aLMissileAmmo;
            drop[class,2] = Items.aSMissileAmmo;
            drop[class,3] = Items.aLMissileAmmo;
            drop[class,4] = Items.aSMissileAmmo;
            drop[class,5] = Items.aLMissileAmmo;
            drop[class,6] = Items.aSMissileAmmo;
            drop[class,7] = Items.aLMissileAmmo;
            break;
            
        // Class 7, "Super Missiles".
        case 7:
            classname[class] = "Super Missiles";
            droprate[class] = 25;
            drop[class,0] = Items.aSSuperMissileAmmo;
            drop[class,1] = Items.aSSuperMissileAmmo;
            drop[class,2] = Items.aSSuperMissileAmmo;
            drop[class,3] = Items.aLSuperMissileAmmo;
            drop[class,4] = Items.aSSuperMissileAmmo;
            drop[class,5] = Items.aSSuperMissileAmmo;
            drop[class,6] = Items.aLSuperMissileAmmo;
            drop[class,7] = Items.aLSuperMissileAmmo;
            break;
            
        // Class 8, "Guaranteed Super Missiles".
        case 8:
            classname[class] = "Guaranteed Super Missiles";
            droprate[class] = 100;
            drop[class,0] = Items.aSSuperMissileAmmo;
            drop[class,1] = Items.aLSuperMissileAmmo;
            drop[class,2] = Items.aSSuperMissileAmmo;
            drop[class,3] = Items.aLSuperMissileAmmo;
            drop[class,4] = Items.aSSuperMissileAmmo;
            drop[class,5] = Items.aLSuperMissileAmmo;
            drop[class,6] = Items.aSSuperMissileAmmo;
            drop[class,7] = Items.aLSuperMissileAmmo;
            break;
            
        // Class 9, "Power Bombs".
        case 9:
            classname[class] = "Power Bombs";
            droprate[class] = 10;
            for (var j = 0; j < 8; j++;)
                { drop[class,j] = Items.aPowerBombAmmo; }
            break;
            
        // Class 10, "Guaranteed Power Bombs".
        case 10:
            classname[class] = "Guaranteed Power Bombs";
            droprate[class] = 100;
            for (var k = 0; k < 8; k++;)
                { drop[class,j] = Items.aPowerBombAmmo; }
            break;
            
        // Class 11, "Phazon".
        case 11:
            classname[class] = "Phazon";
            droprate[class] = 100;
            // TBD.
            break;
            
        // Class 12, "Powerful Enemy".
        case 12:
            classname[class] = "Powerful Enemy";
            droprate[class] = 100;
            // Drops determined in the "scDropLoot" script.
            break;
            
        // Class 13, "Mini-boss".
        case 13:
            classname[class] = "Mini-boss";
            droprate[class] = 100;
            // Drops determined in the "scDropLoot" script.
            break;
            
        // Class 14, "Boss".
        case 14:
            classname[class] = "Standard";
            droprate[class] = 100;
            // Drops determined in the "scDropLoot" script.
            break;
    }
}

// This system works much like Link to the Past's prize packs. Enemies
//   and certain destructibles will share prize packs based on how we
//   classify them in this script. For example, you can group all supply
//   crates into one "class", so they all have a similar drop pool. You
//   can still adjust things like quantity of drops within each object's
//   various destruction events.
// How loot drops in this system is that, assuming the prize pack is not
//   "empty" (never drops loot), we drop item #1 on the first kill, item
//   #2 on the second kill, etc. With each kill, the group's kill counter
//   increases by one, which determines what drops with each kill. If the
//   player takes damage, the counter goes down a bit, or starts over
//   depending on the loot class.
// Furthermore, you can control what types of actions against these loot-
//   dropping entities determine what loot drops. For example, you can
//   have enemies never drop loot if they are killed by the Arc Dash, or
//   always drop ammo when they are killed by Ball Bombs.
// ---
// Loot drops...
// - Missiles (2).
// - Missiles (5).
// - Super Missile (1).
// - Super Missiles (2).
// - Power Bomb (1).
// - Energy (10).
// - Energy (20).
// - Energy (50).
// - Energy (100).
// ---
// Loot classes (argument 0)...
//   0 = Empty. Does not drop loot at all.
//   1 = Standard. Drops seemingly random items. Alternate between health
//       and ammo, in small denominations until reaching the end of the
//       prize pack, dropping the biggest denominations before resetting
//       the pack.
//   2 = Health-focused. Drops only health items.
//   3 = Ammo-focused. Drops only ammo items.
//   4 = Missiles only.
//   5 = Super Missiles only.
//   6 = Power Bombs only.
//   7 = Phazon and standard class items.
