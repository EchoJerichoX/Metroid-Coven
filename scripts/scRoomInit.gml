// Runs in "Room Start" of eId as well as "Create" event of oLE.
// Using the below 2 switch statements, we determine which object this
//   script is being called from so we can do different things in each.

if (!instance_exists(oViewController)) instance_create(x,y,oViewController);

// Before we do anything, see if we need to do anything special!
switch (room)
{
    case TitleRoom:
        scFade(0,c_black,1,0.05); // Fade in from black.
        scMusicAction(1,musTitle,eId.musicdefaultfaderate,eId.muteduration);
        break;
}
// Step 1: Determine weather type by region.
scEIDGetRegion();

// Step 2: Build vector collisions and room-specific variables.
if (object_index = eId)
{
    tutorialroom = 0; // By default, only specified rooms in the below switch statement
                      //   are tutorial rooms for message purposes.
                      // See "scItemPickup" for the message calls.
    switch (room)
    {
        // NOTE that some rooms initialize their vector paths from the room creation code.
        // - Tutorial -
        case TutorialStart:
            alarm[1] = 10;
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
            tutorialroom = 1;
            scEIDMessagesInit(); // Tell the item pickup strings to update to the tutorial versions.
            break;
        // - Barria Tundra -
        case BarriaLandingSite:
            vector_world_add(oVectorLine);
            vector_path_add(oVectorLine,BarriaLandingSitePath1,0,0,0);
            tutorialroom = 0;
            break;
        case BarriaIntWest:
            vector_world_add(oVectorLine);
            vector_path_add(oVectorLine,BarriaIntWestPath1,0,0,0);
            tutorialroom = 0;
            break;
        case BarriaCacheMissile:
            vector_world_add(oVectorLine);
            vector_path_add(oVectorLine,BarriaCacheMissilePath1,0,0,0);
            vector_path_add(oVectorLine,BarriaCacheMissilePath2,0,0,0);
            tutorialroom = 0;
            break;
        case BarriaCacheMorphBall:
            vector_world_add(oVectorLine);
            vector_path_add(oVectorLine,BarriaCacheMorphBallPath1,0,0,0);
            vector_path_add(oVectorLine,BarriaCacheMorphBallPath2,0,0,0);
            tutorialroom = 0;
            break;
    }
}

// Step 3: Set ambient brightness of light engine.
// LightAlphaMult of 1 for outdoor areas, 0.75 for indoor areas.
// The lower the number, the brighter the room (this represents the alpha of the dark layer).
else
{
    switch (room)
    {
        default: eId.LightAlphaMult = 1; break;
        case BarriaLandingSite:
        case BarriaIntWest:
        case BarriaCacheMissile:
            eId.LightAlphaMult = 1; break;
        case BarriaCacheMorphBall:
            eId.LightAlphaMult = 0.75; break;
    }
}

// Step 4: Set the debug mode grid foreground.
background_index[7] = bgrMapGrid;
background_foreground[7] = true;

// Step 5: Set the AI movement planning grid to fit the size of the room, if there are actors in the room.
if (object_index = oLE) exit; // If this script is run from the light engine, don't use this code!
if (instance_exists(oActor)) or (room = GeneralTestRoom)
{
    aigrid = mp_grid_create(0,0,room_width/aigridcellsize,
                                room_height/aigridcellsize,
                                aigridcellsize,aigridcellsize);
    scUpdateMPGrid();
}
