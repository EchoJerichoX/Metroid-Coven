if (alphawait > 0) alphawait -= 1;
if (alphawait = 0) and (image_alpha < 1) image_alpha += 0.02;

if (image_alpha < 0.5)
    { image_index = 0; draw_self(); exit; }

if (position_meeting(mouse_x,mouse_y,self)) and (eId.fadeStage = -1) mouseover = 1;
else mouseover = 0;

switch (mouseover)
{
    case 0: image_index = 0; break;
    case 1:
        if (image_index = 0) image_index = 1;
        if (image_index = 1) imagestep += 1;
        if (imagestep = 40)
            { image_index = 2; imagedelay += 1; imagestep = 0; }
        if (image_index = 2) imagedelay += 1;
        if (imagedelay = 6)
            { image_index = 1; imagedelay = 0; }
            
        if (mouse_check_button_pressed(mb_left)) and (eId.fadeStage = -1)
        {
            //sound_play(TitleSelect);
            switch (object_index)
            {
                case oDeathRestart:
                    scMessage(eId.Restart,1,0);
                    break;
                case oDeathQuitToTitle:
                    scMessage(eId.QuitToTitle,1,0);
                    break;
            }
        }
    break;
}
draw_self();
