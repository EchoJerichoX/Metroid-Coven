// Runs within oDoorParent when a door is hit by something that can open it.
// Mark a special door as opened so the player doesn't have to open it again.
// See switch statement case numbers for argument0 meaning.
switch (argument0)
{
    // --- Red (Missile) ---
    case 1:
        // - Tutorial -
        if (room = Tutorial3) or (room = Tutorial5) eId.OpenedTutorial35Red = true;
        if (room = Tutorial9) eId.OpenedTutorial9Red = true;
        // - Barria Tundra -
        if (room = BarriaIntWest) eId.OpenedBarriaIntWestRed = true;
        if (room = BarriaCacheMissile) eId.OpenedBarriaCacheMissileRedE = true;
        if (room = BarriaCacheMissile) eId.OpenedBarriaCacheMissileRedW = true;
        break;
    // --- Green (Super Missile) ---
    case 2:
        // - Tutorial -
        if (room = Tutorial3)
        {
            if (object_index = oDoorGuideS) eId.OpenedTutorial313Green = true;
            else eId.OpenedTutorial315Green = true;
        }
        if (room = Tutorial11) eId.OpenedTutorial11Green = true;
        if (room = Tutorial13)
        {
            if (y < room_height/2) eId.OpenedTutorial313Green = true;
            else eId.OpenedTutorial1113Green = true;
        }
        break;
    // --- Yellow (Power Bomb) ---
    case 3:
        break;
}
