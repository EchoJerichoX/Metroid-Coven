switch (state)
{
    case 1: // Wandering.
        AnimationStart = 0;
        AnimationEnd = 7;
        if (AnimationStart != AnimationEnd) and (x != xprevious) and (y != yprevious) then
        {
            image_single += 1;
            if (image_single > AnimationEnd) image_single = AnimationStart;
        }
        if (alarm[1] = 0) and (point_distance(x,y,oPlayer.x,oPlayer.y) >= 30) then
        {
            destdir = round(random(360))*5;
            speed = MaxSpeed;
            alarm[1] = 200+round(random(300));
        }
        if (direction < destdir+5) direction += 5;
        if (direction > destdir-5) direction -= 5;
        if (instance_exists(oPlayer))
        {
            if (point_distance(x,y,oPlayer.x,oPlayer.y) < 30)
                { speed = 0; state = 2; }
        }
        break;
    case 2: // Expanding.
        AnimationStart = 8;
        AnimationEnd = 9;
        if (AnimationStart != AnimationEnd) image_single += 1;
        if (point_distance(x,y,oPlayer.x,oPlayer.y) > 60)
            { state = 3; alarm[2] = 50; }
        break;
    case 3: // Retracting check.
        image_single = 9;
        if (alarm[2] = 0) and (point_distance(x,y,oPlayer.x,oPlayer.y) > 60)
            { state = 4; alarm[3] = 2; image_single += 1; }
        else alarm[2] = 10;
        break;
    case 4:
        if (alarm[3] = 0) state = 1;
        break;
}
