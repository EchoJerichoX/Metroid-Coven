// Pause handling.
if (eId.transitioning) or (eId.paused > 0) impaused = 1;
else impaused = 0;
if (impaused)
{
    if (!held)
    {
        held = 1;
        inputspeed = path_speed;
        path_speed = 0;
        inputimspeed = ispeed;
        ispeed = 0;
        image_speed = ispeed;
    }
    exit;
}
if (!impaused) and (held)
{
    path_speed = inputspeed;
    ispeed = inputimspeed;
    image_speed = ispeed;
    held = 0;
}
//if (!impaused) and (!held) ispeed = 0.5;
// All other behavior.
switch (state)
{
    case 0: // Set a path while idling.
        speed = 0;
        image_speed = 0;
        var pathx = random(room_width);
        var pathy = random(room_height);
        if (!mp_grid_path(eId.aigrid,mypath,x,y,pathx,pathy,true)) exit;
        else
        {
            mp_grid_path(eId.aigrid,mypath,x,y,pathx,pathy,true)
            path_set_kind(mypath,1);
            path_set_precision(mypath,8);
            var px = path_get_x(mypath,0.001);
            var py = path_get_y(mypath,0.001);
            destdir = point_direction(x,y,px,py); // Set where to turn towards the start of the path.
            state = 1;
        }
        break;
    case 1: // Turn towards path and start it.
        image_speed = ispeed/2;
        direction -= clamp(angle_difference(direction,destdir),-turnrate,turnrate);
        if (abs(direction-destdir) < turnrate) direction = destdir;
        if (direction = destdir)
        {
            image_angle = direction;
            if (HP >= MaxHP/2) pspeed = 0.5;
            else pspeed = 1; // Move faster if the enemy is weakened, to show panic.
                             // Would normally not be needed unless there is no den to run to when taking damage.
            path_start(mypath,pspeed,path_action_stop,0);
            image_speed = ispeed;
            state = 2;
        }
        break;
    case 2: // Move along path.
        image_speed = ispeed;
        image_angle = point_direction(x,y,xprevious,yprevious);
        if (path_position = 1)
        {
            path_end();
            state = 3;
            statechange = staterate+round(random(staterate*stateratemultiplier));
        }
        break;
    case 3: // Reset and start over.
        image_speed = 0;
        if (statechange = 0) state = 0;
        break;
        // ---
    case 4: // Retreat to den.
        if (!ignorevector) ignorevector = 1;
        image_speed = ispeed*2;
        if (path_position = 1) state = 5; // Burrow when it gets to the den.
        break;
    case 5: // Disappear.
        image_speed = ispeed;
        direction += -5+random(15);
        if (image_alpha > 0) image_alpha -= 0.05;
        if (image_alpha = 0)
            { despawn = true; instance_destroy(); }
        break;
}

if (retreatcheckdelay > 0) retreatcheckdelay -= 1;
if (retreatcheckdelay = 0)
and (instance_exists(oZoomerDen))
and (state != 4) // Regularly update the nearest retreat destination.
{
    retreatcheckdelay = 30;
    var dnum = instance_number(oZoomerDen);
    for (var checked = 0; checked < dnum; checked += 1;)
    {
        var cz = instance_nth_nearest(x,y,oZoomerDen,checked);
        scUpdateMPGrid();
        if (mp_grid_path(eId.aigrid,mypath2,x,y,cz.x,cz.y,true)) 
        {
            retreatcheckdelay = 30;
            nearestden = cz;
        }
    }
}

if (statechange > 0) statechange -= 1;
if (damaged > 0) damaged -= 0.1;
if (soundcanplay > 0) soundcanplay -= 1;

if (!ignorevector)
{
    mhspeed = lengthdir_x(speed,direction);
    mvspeed = lengthdir_y(speed,direction);
    move_step_ext(x+mhspeed,y+mvspeed,sign(0)*min(1,abs(0)),oBlockParent);
    speed = 0;
}
image_angle = direction;
