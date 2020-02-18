if (position_meeting(mouse_x,mouse_y,self)) and (eId.fadeStage = -1) and (eId.titlemouseover = 0)
{
    switch (sprite_index)
    {
        case sprTitleStart: eId.titlemouseover = 1; break;
        case sprTitleAbout: eId.titlemouseover = 2; break;
        case sprTitleExit: eId.titlemouseover = 3; break;
    }
}
if (sound_isplaying(snMenuMouseover)) sound_stop(snMenuMouseover);
sound_play(snMenuMouseover);
