// Check the "region" to see if we need to anything special for it, like weather effects.
if (room = TransitionRoom) exit; // Keep region the same in transition rooms.
switch (room)
{
    // Tutorial: 1.
    case TutorialStart:
    case Tutorial2:
    case Tutorial3:
    case Tutorial4:
    case Tutorial5:
    case Tutorial6:
    case Tutorial7:
    case Tutorial8:
    case Tutorial9:
    case Tutorial10:
    case Tutorial11:
    case Tutorial12:
    case Tutorial13:
    case Tutorial14:
    case Tutorial15:
    // Barria Tundra: 1.
    case BarriaLandingSite:
    case BarriaIntWest:
    case BarriaCacheMorphBall:
    case BarriaCacheMissile:
        region = 1; break;
    // Show guide sprite if no region is set.
    default: region = 0; break;
}
// Set region name and weather type.
switch (region)
{
    case 1: // Barria Tundra.
        eId.regionname = "Barria Tundra";
        if (!instance_exists(oWeatherSnow)) instance_create(0,0,oWeatherSnow); // Snow weather system.
        break;
    case 0: exit; break; // Do nothing if the region wasn't set.
}
