draw_self();
switch (myid)
{
    case Enemies.eZoomer:
        if (damaged > 0) draw_sprite_ext(sprZoomerHit,image_single,x,y,1,1,image_angle,c_white,damaged);
        if (eId.debugmode)
        {
            
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
            */
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
