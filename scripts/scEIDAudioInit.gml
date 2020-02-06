// Set volumes for all sounds in the game.
// May incorporate some out-sourced system for audio management later.

// ======================
// = MUSIC AND AMBIANCE =
// ======================
musicvolume = 1; // This is all we need right now.

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


