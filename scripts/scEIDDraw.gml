if (room = TitleRoom)
{
    draw_set_alpha(1);
    draw_sprite(sprTitle,0,320,96);
    if (titlemouseover > 0)
    {
        draw_set_font(sfont);
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        var xos = 640-10;
        var yos = 480-10;
        if (oTitleStart.mouseover+oTitleAbout.mouseover+oTitleExit.mouseover+oTitleDebug.mouseover != 0)
        {
            switch (titlemouseover)
            {
                case 1:
                    draw_text_color(xos,yos,titletextstart,c_white,c_white,c_white,c_white,1); // oTitleStart.
                    break;
                case 2:
                    draw_text_color(xos,yos,titletextabout,c_white,c_white,c_white,c_white,1); // oTitleStart.
                    break;
                case 3:
                    draw_text_color(xos,yos,titletextexit,c_white,c_white,c_white,c_white,1); // oTitleStart.
                    break;
                case 4:
                    draw_text_color(xos,yos,titletextdebug,c_white,c_white,c_white,c_white,1); // oTitleStart.
                    break;
            }
        }
    }
}
// If we are in the process of fading in or out, draw the actual fade effect as well as the transition tunnel.
if (transfade > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(transfade);
    draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],0);
    var tspr;
    if (transdir = 0) or (transdir = 180) tspr = sprTransitionGuideLR;
    if (transdir = 90) or (transdir = 270) tspr = sprTransitionGuideUD;
    draw_sprite_ext(tspr,region,view_xview[0]+tx,view_yview[0]+ty,1,1,0,c_white,transfade);
}
// If we are paused, darken and show the word "paused".
if (eId.paused > 0) and (fadeStage = -1)
{
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
    draw_set_font(font1);
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_ext(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,"Paused",-15,560);
}
// Draw the mouse stuff.
if (eId.visor = 0) sprite_index = sprCombatVisor;
else sprite_index = sprScanVisor;
x = mouse_x; y = mouse_y;
draw_self();
// If we are currently trying to post a message, do the drawing for that.
if (fadeStage != -1)
{
    draw_set_color(c_black);
    draw_set_alpha(alpha1);
    draw_rectangle(view_xview[0],view_yview[0],view_xview[0]+view_wview[0],view_yview[0]+view_hview[0],false);
    if (!scan) then
    {
        draw_set_alpha(alpha1/4);
        draw_rectangle(view_xview[0],view_yview[0]+view_hview[0]/2+45,view_xview[0]+view_wview[0],view_yview[0]+view_hview[0]/2-45,false);
        draw_rectangle(view_xview[0],view_yview[0]+view_hview[0]/2+40,view_xview[0]+view_wview[0],view_yview[0]+view_hview[0]/2-40,false);
        draw_rectangle(view_xview[0],view_yview[0]+view_hview[0]/2+35,view_xview[0]+view_wview[0],view_yview[0]+view_hview[0]/2-35,false);
    }
    draw_set_font(font1);
    draw_set_color(c_white);
    draw_set_alpha(alpha2);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_ext(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,text,-15,630);
    draw_set_alpha(1);
}
scFadeHandler();
scDebugModeDraw();
