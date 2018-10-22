var hit,dir,xx,yy;
hit = argument0;
xx = argument1.x;
yy = argument1.y;
switch (argument1.object_index)
{
    case oDoorGuideW: dir = 0; break;
    case oDoorGuideE: dir = 180; break;
    case oDoorGuideN: dir = 270; break;
    case oDoorGuideS: dir = 90; break;
}

// Hit:
// 1 = Beam.
// 2 = Missile.
// 3 = Super Missile.
// 4 = Bomb.
// 5 = Power Bomb.
// argument1 is contextual.

switch (argument1.myid)
{
    case Doors.dBlue:
        dc = instance_create(xx,yy,oDoorChanger);
        dc.image_angle = dir;
        dc.myid = argument1.myid;
        dc.oid = argument1.object_index;
        with (argument1) instance_destroy();
        break;
    case Doors.dRed:
        if (hit = 2)
        {
            if (object_index != oExplosion) with (argument1) en -= 1;
            else exit;
            if (argument1.en > 0)
                { sound_play(DoorHit); argument1.damage = true; }
        }
        if (hit = 3) and (object_index != oExplosion) with (argument1) en -= 3;
        if (argument1.en <= 0)
        {
            scOpenNBDoor(1);
            dc = instance_create(xx,yy,oDoorChanger);
            dc.image_angle = dir;
            dc.myid = Doors.dBlue;
            dc.oid = argument1.object_index;
            with (argument1) instance_destroy();
        }
        break;
    case Doors.dGreen:
        if (hit != 3) exit;
        scOpenNBDoor(2);
        dc = instance_create(xx,yy,oDoorChanger);
        dc.image_angle = dir;
        dc.myid = Doors.dBlue;
        dc.oid = argument1.object_index;
        with (argument1) instance_destroy();
        break;
    case Doors.dYellow:
        if (hit != 5) exit;
            scOpenNBDoor(3);
        dc = instance_create(xx,yy,oDoorChanger);
        dc.image_angle = dir;
        dc.myid = Doors.dBlue;
        dc.oid = argument1.object_index;
        with (argument1) instance_destroy();
        break;
}
