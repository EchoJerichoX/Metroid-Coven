// Visual blinking effect for obtainable items.
// argument0 = maximum brightness.
// argument1 = flashing rate.

// scItemFlash(maxbrightness,flashspeed);

if (eId.fadeStage > -1) or (eId.paused > 0) exit; // If a message is on-screen, stop doing anything.

if (FlashTimer = 0) FlashDir = 1; // Increase flash image_alpha once the flash is fully faded out.
if (FlashTimer = argument0) FlashDir = 0; // Decrease flash image_alpha once the flash is as bright as possible.

if (FlashDir = 1) FlashTimer += argument1;
else FlashTimer -= argument1;
