draw_self();
switch (myid)
{
    case Enemies.eZoomer:
        if (damaged > 0) draw_sprite_ext(sprZoomerHit,image_single,x,y,1,1,image_angle,c_white,damaged);
        if (eId.debugmode)
        {
            draw_set_color(c_blue);
            draw_text(x+7,y-10,path_speed);
            draw_text(x+7,y-23,inputspeed);
            draw_text(x+7,y-36,impaused);
            draw_text(x+7,y-49,held);
            draw_text(x+7,y-75,ispeed);
            /*
            if (nearestden != noone)
            {
                draw_text(x+7,y-23,nearestden.x);
                draw_text(x+7,y-36,nearestden.y);
            }
            */
        }
        break;
    case Enemies.eTurret:
        if (damaged > 0) draw_sprite_ext(sprTurretHit,image_index,x,y,1,1,image_angle,c_white,damaged);
        if (eId.debugmode)
        {
            draw_set_color(c_blue);
            draw_text(x+7,y-10,HP);
            /*
            draw_text(x+7,y-10,primarydir);
            draw_text(x+7,y-23,direction);
            draw_text(x+7,y-36,abs(angleDiffTurn));
            draw_text(x+7,y-49,target);
            draw_text(x+7,y-62,shotready);
            /*
            draw_text(x+7,y-10,primarydir);
            draw_text(x+7,y-23,destdir);
            draw_text(x+7,y-36,direction);
            draw_text(x+7,y-49,mindir);
            draw_text(x+7,y-62,maxdir);
            */
        }
        break;
}
