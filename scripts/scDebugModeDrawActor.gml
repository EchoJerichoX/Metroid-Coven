if (!instance_exists(oActor))
or (!eId.debugmode) exit;

draw_set_color(c_aqua);

with (oActor)
{
    switch (myid)
    {
        case Enemies.eZoomer:
            // Pathing and movement.
            /*
            draw_text(x-7,y-10,path_speed);
            draw_text(x-7,y-23,inputspeed);
            draw_text(x-7,y-36,impaused);
            if (nearestden != noone) // If the Zoomer has a den to retreat to...
            {
                draw_text(x+7,y-49,nearestden.x);
                draw_text(x+7,y-75,nearestden.y);
            }
            */
            
            // Loot.
            draw_text(x-7,y-49,eId.classname[lootclass]);
            draw_text(x-7,y-36,lootclass);
            draw_text(x-7,y-23,eId.droprate[lootclass]);
            draw_text(x-7,y-10,eId.classkills[lootclass]);
            
            // Misc.
            /*
            draw_text(x-7,y-49,held);
            draw_text(x-7,y-75,ispeed);
            */
            break;
        case Enemies.eTurret:
            break;
    }
}
