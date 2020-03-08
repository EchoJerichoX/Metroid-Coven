myid = argument0;
stopdash = 1;
switch (object_index)
{
    case oDoorGuideW: rot = 0; mask_index = sprDoorMaskW; break;
    case oDoorGuideE: rot = 180; mask_index = sprDoorMaskE; break;
    case oDoorGuideN: rot = 270; mask_index = sprDoorMaskN; break;
    case oDoorGuideS: rot = 90; mask_index = sprDoorMaskS; break;
}
switch (myid)
{
    case Doors.dBlue: sprite = sprDoorBlue; break;
    case Doors.dRed: scCheckNBDoor(1); en = 3; sprite = sprDoorRed; break;
    case Doors.dGreen: scCheckNBDoor(2); sprite = sprDoorGreen; break;
    case Doors.dYellow: scCheckNBDoor(3); sprite = sprDoorYellow; break;
    case Doors.dDeactivated: sprite = sprDoorDeactivated; break;
}
