// Check the "region" to see if we need to anything special for it, like weather effects.
if (room = rmTransitionRoom) exit; // Keep region the same in transition rooms.
switch (room)
{
    // Tutorial: 1.
    case rmBarria1LandingSite:
        region = 1; break;
    // Show guide sprite if no region is set.
    default: region = 0; break;
}
// Set region name and weather type.
switch (region)
{
    case 1: // Barria Tundra.
        eId.regionname = "Barria";
        if (!instance_exists(oWeatherSnow)) instance_create(0,0,oWeatherSnow); // Snow weather system.
        break;
    case 0: exit; break; // Do nothing if the region wasn't set.
}
