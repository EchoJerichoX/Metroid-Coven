// Runs in "Room Start" of eId as well as "Create" event of oLE.
// Using the below 2 switch statements, we determine which object this
//   script is being called from so we can do different things in each.

if (!instance_exists(oViewController)) instance_create(x,y,oViewController);

// Before we do anything, see if we need to do anything special!
switch (room)
{
    // General rooms.
    case rmTitleRoom:
        scFade(c_black,0,0.015); // Fade in from black.
        scMusic(1,musTitle,0,0);
        break;
    case rmIntro1:
        scMusic(1,musIntro,1,0);
        break;
    // Game rooms.
    // Barria.
    case rmBarria1LandingSite:
        scMusic(1,musBarriaSerene,0,0);
        break;
}
// Step 1: Determine weather type by region.
scEIDGetRegion();

/*
// Step 2: Build vector collisions and room-specific variables.
if (object_index = eId)
{
    tutorialroom = 0; // By default, only specified rooms in the below switch statement
                      //   are tutorial rooms for message purposes.
                      // See "scItemPickup" for the message calls.
    switch (room)
    {
    }
}
*/

// Step 2: Set ambient brightness of light engine.
// eId.LightAlphaMult determines brightness of all lights.
// The lower the number, the dimmer the lights.
switch (room)
{
    case rmBarria1LandingSite:
        eId.LightAlphaMult = 1; break;
    default: eId.LightAlphaMult = 1; break;
}

// Step 4: Set the debug mode grid foreground.
background_index[7] = bgrMapGrid;
background_foreground[7] = true;

// Step 5: Set the AI movement planning grid to fit the size of the room, if there are actors in the room.
if (object_index = oLE) exit; // If this script is run from the light engine, don't use this code!
if (instance_exists(oActor)) or (room = rmTestRoom)
{
    aigrid = mp_grid_create(0,0,room_width/aigridcellsize,
                                room_height/aigridcellsize,
                                aigridcellsize,aigridcellsize);
    scUpdateMPGrid();
}
