// Runs within the room creation code of every door in the game (if non-blue door).
// Check if we have already opened a special door before so the player doesn't have to open it again.
// See switch statement case numbers for argument0 meaning.
// Doors where it is possible to initially open from the other side have extra room/variable checks.
switch (argument0)
{
    // --- Red (Missile) ---
    case 1:
        // - Barria Tundra -
        switch (room) {
            case rmBarria1LandingSite: if (eId.mapBarria1RedDoorOpened = 1) scDefineDoor(Doors.dBlue); break;
            case rmBarria4RuinsAccess: if (eId.mapBarria4RedDoorOpened = 1) scDefineDoor(Doors.dBlue); break;
        }
        break;
    // --- Green (Super Missile) ---
    case 2:
        switch (room) {
            case rmBarria3Atrium: if (eId.mapBarria3GreenDoorOpened = 1) scDefineDoor(Doors.dBlue); break;
        }
        break;
    // --- Yellow (Power Bomb) ---
    case 3:
        break;
    // --- Gray (Deactivated) ---
    case 4:
        // - Barria -
        switch (room) {
            case rmBarria2ZoomerTunnel: if (mapBarria2GrayDoorActive = 1) scDefineDoor(Doors.dBlue); break;
        }
        break;
}
