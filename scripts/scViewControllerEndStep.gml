// Check transition scripts for more manipulation of some variables in this object (oViewController).
// Find the target x and y that the view will follow.
if (instance_exists(oPlayer))
    { x = oPlayer.x; y = oPlayer.y; }
else
    { x = mouse_x; y = mouse_y; exit; }
if (shake > 0) shake -= shakerate; // Descale the view shake gradually.
// Limit the view location to the edges of the room.
// Clamp the view based on whether or not the view is shaking.
// This is easier than changing the value of shake.
if (shake != 0)
{
    x = clamp(x,view_wview/2+shakemax,room_width-view_wview/2-shakemax);
    y = clamp(y,view_hview/2+shakemax,room_height-view_hview/2-shakemax);
}
else
{
    x = clamp(x,view_wview/2,room_width-view_wview/2);
    y = clamp(y,view_hview/2,room_height-view_hview/2);
}
view_xview = (x-view_wview/2)+random_range(shake,-shake);
view_yview = (y-view_hview/2)+random_range(shake,-shake);
view_xview = clamp(view_xview,0,room_width-view_wview);
view_yview = clamp(view_yview,0,room_height-view_hview);
x = round(x);
y = round(y);


/* Preserved version of old script as of 2/10/2020.

// Check transition scripts for more manipulation of some variables in this object (oViewController).
// Find the target x and y that the view will follow.
if (instance_exists(oPlayer))
{
    x = oPlayer.x;wd
    y = oPlayer.y;
    /*
    var pd = point_distance(oPlayer.x,oPlayer.y,mouse_x,mouse_y);
    ox = lengthdir_x((pd/4)*-1,point_direction(oPlayer.x,oPlayer.y,mouse_x,mouse_y));
    oy = lengthdir_y((pd/4)*-1,point_direction(oPlayer.x,oPlayer.y,mouse_x,mouse_y));
    //xx = mean(oPlayer.x,mean(eId.x+ox,oPlayer.x))+choose(shake,-shake);
    //yy = mean(oPlayer.y,mean(eId.y+oy,oPlayer.y))+choose(shake,-shake);
    //xx = mean(oPlayer.x,mouse_x);
    //yy = mean(oPlayer.y,mouse_y);
    xx = mean(oPlayer.x,mouse_x);
    yy = mean(oPlayer.y,mouse_y);
    
}
//else exit;
else
    { x = mouse_x; y = mouse_y; exit; }
/*
if (point_distance(x,y,xx,yy) > truemaxspeed)
    { if (maxspeed < truemaxspeed) maxspeed += 0.25; }
else
    { maxspeed = 0; }
*/

// Move towards the target view location.
/*
switch (eId.transstep)
{
    case -1:
        if (instance_exists(oPlayer)) and (eId.paused = 0) and (eId.fadeStage = -1)
            { x = oPlayer.x; y = oPlayer.y; }
            //{ move_towards_point(xx,yy,point_distance(x,y,xx,yy)/10); }
        //else speed = 0;
        //speed = clamp(speed,0,maxspeed);
        break;
    case 0:
        exit;
        break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        x = oPlayer.x;
        y = oPlayer.y;
        break;
}

// Center the view on the controller.
if (shake > 0) shake -= shakerate; // Descale the view shake gradually.
// Limit the view location to the edges of the room.
x = clamp(x,view_wview/2+shakemax,room_width-view_wview/2-shakemax);
y = clamp(y,view_hview/2+shakemax,room_height-view_hview/2-shakemax);
view_xview = (x-view_wview/2)+random_range(shake,-shake);
view_yview = (y-view_hview/2)+random_range(shake,-shake);
view_xview = clamp(view_xview,0,room_width-view_wview);
view_yview = clamp(view_yview,0,room_height-view_hview);
