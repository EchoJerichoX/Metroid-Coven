// Runs within oDoorParent when a door is hit by something that can open it.
// Mark a special door as opened so the player doesn't have to open it again.
// See switch statement case numbers for argument0 meaning.
switch (argument0) {
    // --- Red (Missile) ---
    case 1:
        // - Barria -
        switch (room) {
            case rmBarria1LandingSite: eId.mapBarria1RedDoorOpened = 1; break;
            case rmBarria4RuinsAccess: eId.mapBarria4RedDoorOpened = 1; break;
        }
        break;
    // --- Green (Super Missile) ---
    case 2:
        switch (room) {
            case rmBarria3Atrium: eId.mapBarria3GreenDoorOpened = 1; break;
        }
        break;
    // --- Yellow (Power Bomb) ---
    case 3:
        break;
    // --- Gray (Deactivated) ---
    case 4:
        // - Barria -
        switch (room) {
            case rmBarria2ZoomerTunnel: eId.mapBarria2GrayDoorActive = 1; break;
        }
        break;
}
