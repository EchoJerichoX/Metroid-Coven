// Runs within oItem.
// Check if we have acquired a tank or expansion so the player can't obtain it twice.
// See switch statement case numbers for argument0 meaning.
switch (argument0)
{
    // --- Energy Tanks ---
    case 1:
        if (room = Tutorial9) and (eId.HasTutorial9ET = true) instance_destroy();
        break;
    // --- Missile Expansions ---
    case 2:
        // - Tutorial -
        if (room = Tutorial5) and (eId.HasTutorial5ME = true) instance_destroy();
        if (room = Tutorial8) and (eId.HasTutorial8ME = true) instance_destroy();
        if (room = Tutorial11) and (eId.HasTutorial11ME = true) instance_destroy();
        // - Barria Tundra -
        if (room = BarriaLandingSite) and (eId.HasBarriaLandingSiteME = true) instance_destroy();
        if (room = BarriaCacheMissile) and (eId.HasBarriaCacheMissileME = true) instance_destroy();
        break;
    // --- Super Missile Expansions ---
    case 3:
        break;
    // --- Power Bomb Expansions ---
    case 4:
        break;
}
