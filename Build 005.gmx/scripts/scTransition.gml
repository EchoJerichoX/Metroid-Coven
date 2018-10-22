// Different phases of a room transition.
switch (transstep)
{
    // --- Part 1 ---
    // Fade to black.
    case 0:
        if (transfade < 1) transfade += transfaderate;
        if (instance_exists(oViewController))
        {
            with (oViewController)
                { if (shakemax > 0) shakemax -= 0.5; }
        }
        if (transfade = 1) transstep = 1;
        break;
    // Buffer a bit before moving to the transition room, screen is fully black.
    case 1:
        if (transbuffer < transbuffermax) transbuffer += 1;
        if (transbuffer = transbuffermax) 
            { transstep = 2; transbuffer = 0; room_goto(TransitionRoom); }
        break;
    case 2:
    // --- Part 2 ---
    // Move the transition object (t-object) so it lines up in the correct position
    //   for the next room.
        switch (transdir)
        {
            case 0: // Player will face East when exiting the transition.
            case 180: // West.
                if (voy = 0) transstep = 3; // If the t-object is in a static location,
                                            //   we just move on, since there is no
                                            //   adjustment needed.
                else
                {
                    // If the distance to the offset is short, just snap it and move on.
                    if (point_distance(0,ty,0,voy) < transrate/4)
                        { ty = voy; transstep = 3; }
                    // Otherwise, adjust the t-object until we are close enough.
                    else
                    {
                        if (ty > voy) ty -= transrate/4;
                        else ty += transrate/4;
                    }
                }
                break;
            case 90: // North.
            case 270: // South.
                if (vox = 0) transstep = 3;
                else
                {
                    if (point_distance(tx,0,vox,0) < transrate/4)
                        { tx = vox; transstep = 3; }
                    else
                    {
                        if (tx > vox) tx -= transrate/4;
                        else tx += transrate/4;
                    }
                }
                break;
        }
        break;
    case 3:
    // Move the t-object across the screen.
        switch (transdir)
        {
            case 0: // Player will face East when exiting the transition.
                if (tx > 0) tx -= transrate;
                if (tx <= 0)
                    { tx = 0; transstep = 4; }
                break;
            case 90: // North.
                if (ty < 480) ty += transrate;
                if (ty >= 480)
                    { ty = 480; transstep = 4; }
                break;
            case 180: // West.
                if (tx < 640) tx += transrate;
                if (tx >= 640)
                    { tx = 640; transstep = 4; }
                break;
            case 270: // South.
                if (ty > 0) ty -= transrate;
                if (ty <= 0)
                    { ty = 0; transstep = 4; }
                break;
        }
        break;
    case 4:
    // --- Part 3 ---
    // Now we go to the next room, put everything in place, and clean up.
        room_goto(destinationroom);
        transstep = 5;
        break;
    case 5:
        scTransIn();
        if (transbuffer < transbuffermax) transbuffer += 1;
        if (transbuffer = transbuffermax) 
            { transstep = 6; transbuffer = 0; }
        break;
    case 6:
    // Fade back in and reset all of the variables.
        if (transfade > 0) transfade -= transfaderate;
        if (transfade = 0) 
        {
            transitioning = false;
            transstep = 7;
            tx = 0; ty = 0;
            tdx = 0; tdy = 0;
            tsx = 0; tsy = 0;
            vox = 0; voy = 0;
        }
        break;
    case 7:
        // Slowly correct the max shake so the view doesn't snap back too fast.
        if (instance_exists(oViewController))
        {
            with (oViewController)
            {
                if (shakemax < eId.trueshakemax) shakemax += 0.5;
                else other.transstep = -1;
            }
        }
        break;
}
