// Runs in the create event of the transition parent object.
// This determines where individual transition spots in rooms
//   actually go. Just find the position of the object(s) and
//   assign a trans number to it.
// NOTE: MAKE SURE you match the trans number with the door
//   that is on the other side.
switch (room)
{
    case rmBarria1LandingSite:
        if (object_index = oTransitionTubeLR) trans = 3;
        else {
            if (y < room_height/2) trans = 4;
            else {
                if (x > room_width/2) trans = 2;
                else trans = 1;
            }
        }
        break;
    case rmBarria2ZoomerTunnel:
        if (object_index = oTransitionTubeLR) trans = 3;
        else {
            if (y < room_height/2) trans = 4;
            else {
                if (x > room_width/2) trans = 2;
                else trans = 1;
            }
        }
        break;
}
