//          ~ ~ ~   Music Action Call Script   ~ ~ ~
//      scMusic(action,track,musicfaderate,muteduration);
//  Argument 0 = Action taken. 0, 1, and 2 are used. 0 is stop, 1 is play. 2 is
//      a temporary mute. If music is already playing when this is called, vars
//      used will automatically switch to the desired track called in...
//  Argument 1 = Track we want to use. This argument can be manipulated for
//      muting, etc. by just using the variable "eId.musicselected".
//  Argument 2 = Fade speed gradual or instant. 1 is instant.
//  Argument 3 = Mute duration, if used.

if (!instance_exists(eId)) exit;
with (eId)
{
    /*
    if (argument2 = 1) musicfaderate = argument2;
    else musicfaderate = musicdefaultfaderate;
    */
    if (argument2 = 0) musicfaderate = musicdefaultfaderate;
    else musicfaderate = argument2;
    switch (argument0)
    {
        case 0:
            musicvolumegoal = 0;
            break;
        case 1:
            musicdesired = argument1;
            // Keep from restarting.
            if (musicselected = musicdesired) exit;
            // If music is already playing, switch to the new music through fading.
            if (sound_isplaying(musicselected)) musicvolumegoal = 0;
            else musicvolumegoal = 1;
            break;
        case 2:
            musicvolumegoal = 0;
            muteduration = argument3;
            break;
    }
}
