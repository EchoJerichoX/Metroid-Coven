switch (myid)
{
    case Enemies.eZoomer:
        if (!ignorevector) exit;
        move_bounce_all(1);
        if (state = 3) and (path_position != 1) exit;
        break;
}
//vector_collision_line(other,id,0);
