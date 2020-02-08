// Set volumes for all sounds in the game.
// May incorporate some out-sourced system for audio management later.

// ======================
// = MUSIC AND AMBIANCE =
// ======================

// Initialize music handler stuff.
// See scMusicAction and scMusicHandler.
musicselected = 0;              // Currently loaded music track.
musicdesired = musTitle;        // Music track we want to use.
musicvolumegoal = 1;            // Volume we are trying to reach or fade to.
musicvolume = 0;                // Current music volume.
muteduration = 0;               // Length of temporary mute.
musicdefaultfaderate = 0.04;    // Standard rate of all music fading, up or down.
musicfaderate = musicdefaultfaderate;

/*
musicvolend = 0             // Ending volume if fading.
musicfadedir = 0;           // Which way are we fading?
musicfaderate = 0;          // How fast are we fading?
musicvol = 0;               // Volume of current music.
prevmusicvol = 0;           // Volume of current music on previous step.
*/

// =================
// = PLAYER SOUNDS =
// =================
// - Weapons -
sound_volume(sndBeamWave,1);
// - Addons -
sound_volume(snArcDashStart,1);
sound_volume(snArcDashCharge,1);
sound_volume(snArcDashReadyIdle,0); // Starts muted, audio levels change as the ability charges.
sound_volume(snArcDashGo,1);


