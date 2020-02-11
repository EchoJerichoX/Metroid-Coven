switch (myid)
{
    case Enemies.eZoomer:
        with (lightSlave)
        {
            x = other.x;
            y = other.y;
            image_angle = other.image_angle;
        }
        break;
}
