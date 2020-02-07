sound_volume(musicselected,musicvolume);
if (musicvolume = musicvolumegoal) exit;
else
{
    // Play.
    if (musicvolumegoal = 1) and (musicvolume < musicvolumegoal)
    {
        if (musicselected != musicdesired) musicselected = musicdesired;
        sound_loop(musicselected);
        musicvolume += musicfaderate;
    }
    // Stop.
    if (musicvolumegoal = 0) and (musicvolume > musicvolumegoal)
    {
        musicvolume -= musicfaderate;
        if (musicvolume = musicvolumegoal)
        {
            sound_stop(musicselected);
            if (musicdesired != musicselected) { musicvolumegoal = 1; }
        }
    }
}

