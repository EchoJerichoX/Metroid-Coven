/*
Argument 0 = Action taken.
    0 = Play.
    1 = Loop.
    2 = Stop.
Argument 1 = Music file to load to variable.
    The variable we set here is portable and can be changed
    or checked at will.
Argument 2 = Starting volume.
    If not using a fade, can just set to "1" for all music
    and ambiance themes. They are normalized in MP3Gain, so no
    need to try to balance this way.
Argument 3 = Desired ending volume.
    Only used when fading.
Argument 4 = Fade direction.
    0 = In.
    1 = Out.
Argument 5 = Rate of fade, depending on which kind we are doing.
    Not used if not fading. Can be set to anything if not used.
*/

// NOTE: See "scEIDStep" for music fade handling!!!

//if (object_index != eId)
if (instance_exists(eId))
{
    with (eId)
    {
        musicselected = argument1;
        switch (argument0)
        {
            case 0: sound_play(musicselected); break;
            case 1: sound_loop(musicselected); break;
            case 2:
                sound_stop(musicselected);
                exit;
                break;
        }
        musicvolstart = argument2;
        musicvolend = argument3
        musicfadedir = argument4;
        musicfaderate = argument5;
        if (argument5 != 0) musicvol += argument5;
    }
}
