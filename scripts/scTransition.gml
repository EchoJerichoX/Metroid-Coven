// Different phases of a room transition.
switch (transstep) {
    // --- Part 1 ---
    // Fade to black.
    case 0:
        if (transfade < 1) transfade += transfaderate;
        with (oViewController) {
            if (shakemax > 0) shakemax -= 0.5;
        }
        if (transfade = 1) {
            room_goto(eId.destinationroom);
            transstep = 1;
        }
        break;
    case 1:
        scTransIn();
        with (oTransitionParent) {
            if (trans = other.trans) {
                oViewController.x = x;
                other.tdestx = x;
                oViewController.y = y;
                other.tdesty = y;
                other.transstep = 2;
                oTransitionCover.x = view_xview[0]+eId.tx;
                oTransitionCover.y = view_yview[0]+eId.ty;
        }   }
        break;
    case 2:
        if (transbuffer < transbuffermax) transbuffer += 1;
        if (transbuffer = transbuffermax) 
            { transstep = 3; transbuffer = 0; }
    case 3:
        with (oTransitionCover) {
            move_towards_point(other.tdestx,other.tdesty,point_distance(x,y,other.tdestx,other.tdesty)/8);
            if (point_distance(x,y,other.tdestx,other.tdesty) <= 1) {
                x = other.tdestx;
                y = other.tdesty;
                speed = 0;
                other.transstep = 4;
                //with (other) scTransIn();
            }
        }
        break;
    case 4:
        // Fade back in and reset all of the variables.
        if (transfade > 0) transfade -= transfaderate;
        if (transfade = 0) {
            transitioning = false;
            transstep = 5;
            tx = 0; ty = 0;
            tdx = 0; tdy = 0;
            tsx = 0; tsy = 0;
            vox = 0; voy = 0;
        }
        break;
    case 5:
        // Slowly correct the max shake so the view doesn't snap back too fast.
        with (oViewController) {
            if (shakemax < eId.trueshakemax) shakemax += 0.5;
            else other.transstep = -1;
        }
        with (oPlayer) hittrans = 0;
        break;
}
