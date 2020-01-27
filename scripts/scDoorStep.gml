switch (myid)
{
    case Doors.dBlue: sprite = sprDoorBlue; break;
    case Doors.dRed: sprite = sprDoorRed; break;
    case Doors.dGreen: sprite = sprDoorGreen; break;
    case Doors.dYellow: sprite = sprDoorYellow; break;
}
image_speed = 0;

flash_timer = max(flash_timer-.25,0);
if (damage = true)
    { flash_timer = 7; damage = false; }
