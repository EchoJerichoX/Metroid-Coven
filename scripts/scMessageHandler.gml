canenter = 1;
if (enterdelay > 0)
    { canenter = 0; enterdelay -= 1; }

// Only use the in-game pause if a message is not
//   currently in use/being displayed.
if (keyboard_check_pressed(vk_enter))
or (keyboard_check_pressed(vk_return))
{
    if (fadeStage = -1)
    and (room != rmTitleRoom || rmIntro1 || rmIntro2)
        { scPause(); exit; }
}
if (keyboard_check_pressed(vk_escape))
{
    if (fadeStage = -1)
        { scMessage(eId.Exit,1,0); exit; }
}
switch (fadeStage) 
{
    case 0: // Fade background in.
        if (alpha1 < 0.6) alpha1 += 0.02;
        if (alpha1 = 0.6) fadeStage = 1;
        break;
    case 1: // Show message and fade text in.
        if (alpha2 < 1) alpha2 += 0.05;
        if (alpha2 = 1) complete = true;
        break;
    case 2: // Fade text out.
        if (alpha2 > 0) alpha2 -= 0.05;
        if (alpha2 <= 0) fadeStage = 3;
        break;
    case 3: // Fade background out.
        if (gonextroom = 1) 
        {
            /*
            if (titlevol > 0) titlevol -= 0.05;
            sound_volume(musTitle,titlevol);
            */
            if (alpha1 < 1) alpha1 += 0.02;
            if (alpha1 = 1) 
            {
                if (wait > 0) and (targetroom = rmIntro1) wait -= 1;
                else
                {
                    if (eId.paused = .2) scPause();
                    eId.pausedelay = 10;
                    fadeStage = -1;
                    scItemPauseAnimationFix();
                    text = 0;
                    alpha1 = 0;
                    alpha2 = 0;
                    gonextroom = 0; 
                    room_goto(targetroom);
                    wait = 120;
                }
            }
            exit;
        }
        if (alpha1 > 0) alpha1 -= 0.02;
        if (alpha1 <= 0)
        {
            if (eId.paused = .2) scPause();
            eId.pausedelay = 10;
            fadeStage = -1;
            scItemPauseAnimationFix();
            text = 0;
            alpha1 = 0;
            alpha2 = 0;
        }
        break;
}
if (fadeStage > -1)
{
    if (!complete)
    {
        alpha1 = 0.6;
        fadeStage = 1;
        canenter = false;
        enterdelay = 5;
        exit;
    }
    // Special cases of action depending on text.
    switch (text)
    {
        case Exit:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(ord("Y")))
                { game_end(); }
            if (keyboard_check_pressed(vk_escape))
            or (keyboard_check_pressed(ord("N")))
            {
                fadeStage = 2;
                canenter = false;
                exit;
            }
            break;
        case Start:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(ord("Y")))
            {
                fadeStage = 2;
                canenter = false;
                gonextroom = 1;
                targetroom = rmIntro1;
                scMusic(0,eId.musicselected,0,0);
            }
            if (keyboard_check_pressed(vk_escape))
            or (keyboard_check_pressed(ord("N")))
            {
                fadeStage = 2;
                canenter = false;
            }
            break;
        case Debug:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(ord("Y")))
            {
                fadeStage = 2;
                canenter = false;
                gonextroom = 1;
                targetroom = rmTestRoom;
                scMusic(0,eId.musicselected,0,0);
            }
            if (keyboard_check_pressed(vk_escape))
            or (keyboard_check_pressed(ord("N")))
            {
                fadeStage = 2;
                canenter = false;
            }
            break;
        case Restart:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(ord("Y")))
            {
                fadeStage = 2;
                canenter = false;
                gonextroom = 1;
                targetroom = TutorialStart; // Insert save room loading code here.
                scMusic(0,eId.musicselected,0,0);
            }
            if (keyboard_check_pressed(vk_escape))
            or (keyboard_check_pressed(ord("N")))
            {
                fadeStage = 2;
                canenter = false;
            }
            break;
        case QuitToTitle:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(ord("Y")))
            {
                fadeStage = 2;
                canenter = false;
                gonextroom = 1;
                targetroom = rmTitleRoom;
                scMusic(0,eId.musicselected,0,0);
            }
            if (keyboard_check_pressed(vk_escape))
            or (keyboard_check_pressed(ord("N")))
            {
                fadeStage = 2;
                canenter = false;
            }
            break;
        default:
            if (mouse_check_button_pressed(mb_left))
            or (keyboard_check_pressed(vk_space))
            or (keyboard_check_pressed(vk_enter))
            or (keyboard_check_pressed(vk_return))
            or (keyboard_check_pressed(vk_escape))
            {
                fadeStage = 2;
                canenter = false;
            }
    }
}
