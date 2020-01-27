if (eId.fadeStage > -1) or (eId.paused > 0) exit; // If a message is on-screen, stop doing anything.

AnimationPauseTimer -= 1;
if (AnimationPauseTimer > 0) image_single = AnimationStart-1;
if (AnimationPauseTimer < -(AnimationEnd-AnimationStart-1)) AnimationPauseTimer = AnimationPauseAmount;
