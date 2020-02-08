var prevdepth = depth;
depth = -2000;
if (object_index = eId)
{
    if (!debugmode) exit;       // Leave if we aren't in debug mode.
    // Set font options...
    draw_set_font(font1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(c_ltgray);
    dxo = view_xview[0];
    dyo = view_yview[0];
    if (drawmpgrid)
    {
        draw_set_alpha(0.2);
        mp_grid_draw(eId.aigrid);
        for (var i = 0; i < room_width; i += 16;)
            { draw_line(i,0,i,room_width); }
        for (var i = 0; i < room_height; i += 16;)
            { draw_line(i,0,i,room_height); }
        draw_set_alpha(1);
    }
    if (room = TransitionRoom)
    {
        draw_text(5,20,"tx:"); draw_text(40,20,tx);
        draw_text(5,40,"ty:"); draw_text(40,40,ty);
        draw_text(5,60,"vox:"); draw_text(40,60,vox);
        draw_text(5,80,"voy:"); draw_text(40,80,voy);
    }
    if (instance_exists(oPlayer))
    {
        draw_text(dxo+4,dyo+26,"Player X:");            draw_text(dxo+160,dyo+27,oPlayer.x);
        draw_text(dxo+4,dyo+39,"Player Y:");            draw_text(dxo+160,dyo+40,oPlayer.y);
    }
    // Draw contrasting background behind tracked debug vars.
    draw_set_color(c_black);
    draw_set_alpha(0.3);
    draw_rectangle(dxo,dyo,dxo+220,dyo+125,0);
    draw_set_color(c_white);
    draw_set_alpha(0.9);
    // Track message handler variables.
    draw_text(dxo+4,dyo+13,"fadeStage");        draw_text(dxo+160,dyo+13,fadeStage);
    draw_text(dxo+4,dyo+26,"alpha1");           draw_text(dxo+160,dyo+26,alpha1);
    draw_text(dxo+4,dyo+39,"alpha2");           draw_text(dxo+160,dyo+39,alpha2);
    draw_text(dxo+4,dyo+52,"wait");             draw_text(dxo+160,dyo+52,wait);
    draw_text(dxo+4,dyo+65,"gonextroom");       draw_text(dxo+160,dyo+65,gonextroom);
    draw_text(dxo+4,dyo+78,"text");             draw_text(dxo+160,dyo+78,text);
    // Track fade handler variables.
    /*
    draw_text(dxo+4,dyo+13,"fadealpha");        draw_text(dxo+190,dyo+13,fadealpha);
    draw_text(dxo+4,dyo+26,"fadecolor");        draw_text(dxo+190,dyo+26,fadecolor);
    draw_text(dxo+4,dyo+39,"fadealphagoal");    draw_text(dxo+190,dyo+39,fadealphagoal);
    draw_text(dxo+4,dyo+52,"fadealpharate");    draw_text(dxo+190,dyo+52,fadealpharate);
    */
    // Track music variables.
    /*
    draw_text(dxo+4,dyo+13,"musicselected");        draw_text(dxo+160,dyo+13,musicselected);
    draw_text(dxo+4,dyo+26,"musicdesired");         draw_text(dxo+160,dyo+26,musicdesired);
    draw_text(dxo+4,dyo+39,"musicvolumegoal");      draw_text(dxo+160,dyo+39,musicvolumegoal);
    draw_text(dxo+4,dyo+52,"musicvolume");          draw_text(dxo+160,dyo+52,musicvolume);
    draw_text(dxo+4,dyo+65,"muteduration");         draw_text(dxo+160,dyo+65,muteduration);
    draw_text(dxo+4,dyo+78,"musicdefaultfaderate"); draw_text(dxo+160,dyo+78,musicdefaultfaderate);
    draw_text(dxo+4,dyo+91,"musicfaderate");        draw_text(dxo+160,dyo+91,musicfaderate);
    */
    // Track death animation.
    /*
    if (instance_exists(oDeathAnim))
    {
        draw_text(dxo+4,dyo+13,"Death image_index");    draw_text(dxo+160,dyo+13,oDeathAnim.image_index);
        draw_text(dxo+4,dyo+26,"Death progressanim1");  draw_text(dxo+160,dyo+26,oDeathAnim.progressanim1);
        draw_text(dxo+4,dyo+39,"Death progressanim2");  draw_text(dxo+160,dyo+39,oDeathAnim.progressanim2);
        draw_text(dxo+4,dyo+52,"Death blackalpha");     draw_text(dxo+160,dyo+52,oDeathAnim.blackalpha);
        draw_text(dxo+4,dyo+65,"Current Room");         draw_text(dxo+160,dyo+65,room_get_name(room));
    }
    */
    /*
    if (instance_exists(oViewController))
    {
        draw_text(dxo+4,dyo+13,"view x:");            draw_text(dxo+160,dyo+14,oViewController.x);
        draw_text(dxo+4,dyo+26,"view y:");            draw_text(dxo+160,dyo+27,oViewController.y);
        draw_text(dxo+4,dyo+39,"view shake:");        draw_text(dxo+160,dyo+40,oViewController.shake);
        draw_text(dxo+4,dyo+52,"view shakerate:");    draw_text(dxo+160,dyo+53,oViewController.shakerate);
        draw_text(dxo+4,dyo+65,"view shakemax:");     draw_text(dxo+160,dyo+66,oViewController.shakemax);
        draw_text(dxo+4,dyo+78,"view maxspeed:");     draw_text(dxo+160,dyo+79,oViewController.maxspeed);
        draw_text(dxo+4,dyo+91,"view truemaxspeed:"); draw_text(dxo+160,dyo+92,oViewController.truemaxspeed);
        draw_text(dxo+4,dyo+104,"view xx:");          draw_text(dxo+160,dyo+105,oViewController.xx);
        draw_text(dxo+4,dyo+117,"view yy:");          draw_text(dxo+160,dyo+118,oViewController.yy);
    }
    */
    /*
    if (instance_exists(oPlayer))
    {
        draw_set_color(c_black);
        draw_set_alpha(0.3);
        draw_rectangle(dxo,dyo,dxo+220,dyo+194,0);
        draw_set_color(c_white);
        draw_set_alpha(0.9);
        draw_text(dxo+4,dyo+13,"startboostcharge:");  draw_text(dxo+160,dyo+14,oPlayer.startboostcharge);
        draw_text(dxo+4,dyo+26,"boostchargelevel:");  draw_text(dxo+160,dyo+27,oPlayer.boostchargelevel);
        draw_text(dxo+4,dyo+39,"boosteffectdelay:");  draw_text(dxo+160,dyo+40,oPlayer.boosteffectdelay);
        draw_text(dxo+4,dyo+52,"boostdelay:");        draw_text(dxo+160,dyo+53,oPlayer.boostdelay);
        draw_text(dxo+4,dyo+65,"boostalpha:");        draw_text(dxo+160,dyo+66,oPlayer.boostalpha);
        draw_text(dxo+4,dyo+78,"boostfaderate:");     draw_text(dxo+160,dyo+79,oPlayer.boostfaderate);
        draw_text(dxo+4,dyo+91,"boostchargemax:");    draw_text(dxo+160,dyo+92,oPlayer.boostchargemax);
        draw_text(dxo+4,dyo+104,"boosting:");         draw_text(dxo+160,dyo+105,oPlayer.boosting);
        draw_text(dxo+4,dyo+117,"boostspeed:");       draw_text(dxo+160,dyo+118,oPlayer.boostspeed);
        draw_text(dxo+4,dyo+130,"boostdir:");         draw_text(dxo+160,dyo+131,oPlayer.boostdir);
        draw_text(dxo+4,dyo+143,"image_angle:");      draw_text(dxo+160,dyo+144,oPlayer.image_angle);
        draw_text(dxo+4,dyo+156,"angle_diff");        draw_text(dxo+160,dyo+157,angle_difference(oPlayer.boostdir,point_direction(oPlayer.xprevious,oPlayer.yprevious,oPlayer.x,oPlayer.y)));
        draw_text(dxo+4,dyo+169,"distance to prev");  draw_text(dxo+160,dyo+170,point_distance(oPlayer.x,oPlayer.y,oPlayer.xprevious,oPlayer.yprevious));
        draw_text(dxo+4,dyo+182,"direction to prev"); draw_text(dxo+160,dyo+183,oPlayer.prevdir);
        draw_text(dxo+4,dyo+195,"destboostdir");      draw_text(dxo+160,dyo+196,oPlayer.destboostdir);
    }
    */
    //draw_text(dxo,dyo-2,string_insert(string_format(instance_number(oParticle),3,0), "Parts: ",8));
    //draw_text(dxo,dyo-50,string_insert(string_format(oViewController.x,3,0), "VC X: ",7));
    //draw_text(dxo,dyo-34,string_insert(string_format(oViewController.y,3,3), "VC Y: ",7));
    //draw_text(dxo,dyo-18,string_insert(string_format(oViewController.xx,3,0), "VC XX: ",8));
    //draw_text(dxo,dyo-2,string_insert(string_format(oViewController.yy,3,0), "VC YY ",8));
    //draw_text(dxo,dyo-98,string_insert(string_format(paused,3,3), "Paused: ",9));
    //draw_text(dxo,dyo-82,string_insert(string_format(fadeStage,3,0), "Fade Stage: ",13));
    //draw_text(dxo,dyo-66,string_insert(string_format(alpha1,3,2), "Alpha 1: ",10));
    //draw_text(dxo,dyo-50,string_insert(string_format(alpha2,3,2), "Alpha 2: ",10));
    //draw_text(dxo,dyo-34,string_insert(string_format(gonextroom,3,0), "Go Next Room: ",15));
}
depth = prevdepth;
