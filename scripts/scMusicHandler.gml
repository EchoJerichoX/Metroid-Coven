sound_volume(musicselected,musicvolume);

// Play.
if (musicvolumegoal = 1) and (musicvolume < musicvolumegoal)
{
    if (musicselected != musicdesired) musicselected = musicdesired;
    if (!sound_isplaying(musicselected)) sound_loop(musicselected);
    musicvolume += musicfaderate;
}
// Stop.
if (musicvolumegoal = 0) and (musicvolume > musicvolumegoal)
{
    musicvolume -= musicfaderate;
    if (musicvolume <= 0)
    {
        musicvolume = 0;
        sound_stop(musicselected);
        if (musicdesired != musicselected) { musicvolumegoal = 1; }
    }
}
