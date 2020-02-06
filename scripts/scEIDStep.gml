if (pausedelay > 0) pausedelay -= 1; // Give a moment before we take control again.
if (paused > 0) and (paused < .2) paused += 0.025; // Fade in pause? Research.
scEIDInput();
//if (room = TitleRoom) scTitleHandler();
// Music fade handling...
if (prevmusicvol != musicvol) sound_volume(musicselected,musicvol); // Has the volume been changed
                                                                    //   Towards its desired value?
else exit;  // If done, no need to enter the fade code.
prevmusicvol = musicvol;
switch (musicfadedir)
{
    case 0:
        if (musicvol < musicvolend) musicvol += musicfaderate;
        break;
    case 1:
        if (musicvol > musicvolend) musicvol -= musicfaderate;
        break;
}
