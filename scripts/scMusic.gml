//          ~ ~ ~   Music Action Call Script   ~ ~ ~
//  Argument 0 = Action taken. 1, 2, or 3 are used. 0 is stop, 1 is play. 2 is
//      a temporary mute. If music is already playing when this is called, vars
//      used will automatically switch to the desired track called in...
//  Argument 1 = Track we want to use. This argument can be manipulated for
//      muting, etc. by just using the variable "eId.musicselected".
//  Argument 2 = Fade speed gradual or instant. 1 is instant.
//  Argument 3 = Mute duration, if used.

if (!instance_exists(eId)) exit;
with (eId)
{
    if (argument2 = 1) musicfaderate = argument2;
    else musicfaderate = musicdefaultfaderate;
    muteduration = argument3;
    switch (argument0)
    {
        case 0: musicvolgoal = 0; break;
        case 1:
            desiredmusic = argument1;
            if (sound_isplaying(musicselected)) musicvolgoal = 0;
            else musicvolgoal = 1;
            break;
        case 2:
            musicvolgoal = 0;
            muteduration = 
            exit;
            break;
    }
    
    
    musicvolstart = argument2;
    musicvolend = argument3
    musicfadedir = argument4;
    musicfaderate = argument4;
    if (argument5 != 0)
    {
    if (musicvol = musicvolendmusicvol += argument4;
}

/*
Argument 0 = Action taken.
    0 = Play.
    1 = Loop.
    2 = Stop.
    3 = Switch.
Argument 1 = Music file to load to variable.
    The variable we set here is portable and can be changed
    or checked at will.
Argument 2 = Desired volume.
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
