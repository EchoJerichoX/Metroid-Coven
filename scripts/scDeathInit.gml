// Save player variables.
// This is where we will remember what rooms the save spots are in,
//   what items the player has, etc.
curroom = room; // Save room we are in.
                // Not really used in Tutorial.
atmosalpha = 0.5;
atmosup = 1;
room_goto(rmDeathRoom);
scFade(c_black,0,0.01);
scMusic(1,musGameOver,eId.musicdefaultfaderate/2,0);
