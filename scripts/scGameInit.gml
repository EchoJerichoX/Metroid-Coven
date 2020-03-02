////////////////////////////////////////////////
//                                            //
//  Create event of eId (master controller).  //
//                                            //
////////////////////////////////////////////////

// Initialize general eId variables.
scEIDMasterList(); // Init the enums for all IDs in the game.
// Create special sprite fonts.
sfont =   font_add_sprite_ext(sprFont,  "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890,.!?>^<*+-=()[]/:;' ",1,-1);
sfont2x = font_add_sprite_ext(sprFont2x,"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890,.!?>^<*+-=()[]/:;' ",1,0);
tutorialroom = 0;
scEIDMessagesInit(); // Init the various messages of the game.
scEIDAudioInit();
region = 0; // Determines what region player is in.
regionname = "Default"; // Name of region player is in.
fullscreen = 0; // Determines whether the game is in fullscreen or not.
scTitleInit(); // Initialize various title variables.
StartRoom = TutorialStart; // Determines where we go after the player leaves the title screen.
wait = 120; // Delay to start intro scene.
tutorialmessageshown = 0; // Has the tutorial "welcome" message been shown?
scHUDInit(); // Initialize various HUD variables.
trueshakemax = 8; // The absolute maximum shaking distance of the view.
scLootInit(); // Initialize loot system.
hiteffectfadestart = 1; // Starting alpha of "hit" effects on objects making contact with certain things.
hiteffectfadespeed = 0.2; // How quickly "hit" effects fade off of objects making contact with certain things.

// Initialize fade effect stuff.
// See scFade();
fadealpha = 0;      // Alpha of fade effect.
fadecolor = -1;     // Color of the fade effect.
fadealphagoal = 0;  // Target alpha of fade effect.
fadealpharate = 0;  // How fast the fade plays out.

// Initialize debug mode stuff.
debugmode = 0; // Is debug mode on or off?
debugenemy = Enemies.eZoomer; // Determines what NUM 4 spawns in debug mode.
allitemsgiven = 0; // Determines if all items have been given to the player via debug mode.
drawmpgrid = 0; // Determines if we draw the motion planning grid in debug mode.

// Initialize pause and message stuff.
paused = 0; // Is the game paused?
pausedelay = 0; // Time between being allowed to pause.
alpha1 = 0; // Used for drawing the darkening background.
alpha2 = 0; // ^
fadeStage = -1; // How far along we are in printing a message.
complete = true; // Is the message done fading in?
canenter = false; // Can we press a key to advance the message?
enterdelay = 0; // Ticks down until we can press a key to progress a message again.
text = "No text"; // The text we are printing (see the scEIDMessagesInit() script.
scan = 0; // Tells the message system if the current message is the result of using the Scan Visor.
gonextroom = 0; // When leaving a message, determine if we go to another room.
targetroom = -1; // Tells which room to go to when done with specific message types.

// Initialize light and hidden area variables.
hiddenfade1 = 0; // Fades lights in and out in hidden areas on layers -1 through -3.
hiddenfade2 = 0; // ^ -4 through -6.
hiddenfade3 = 0; // ^ -7 through -9.
hiddenfade4 = 0; // ^ -10 through -12.
brightness = 20; // Universal setting for the radius of all lights in the game.
                // Takes the base size of any light and multiplies by this number.
LightAlphaMult = 1; // All light alpha values multiplied by this value.
secrettilelayer = 2; // Which tile layer is vulnerable to hiding when blocks are destroyed under it.

// Initialize player variables.
visor = 0; // 0 = Combat, 1 = Scan.
xrayon = false; // X-Ray Visor toggle.

// Initialize motion planning data.
aigrid = -1; // At the start of each room, we reset the grid to fit the room size. See "Room Start" event of "eId" object.
aipath = -1; // CURRENTLY UNUSED!!! At the start of each room, we establish a universal path for objects to tap into.
aigridcellsize = 16; // Size of each motion planning cell.

// Initialize transition stuff.
transitioning = false;
thisroom = -1;
destinationroom = -1;
tx = 0; // Location of the transitioning object that the player collides with.
ty = 0; // ^
tdx = 0; // Distance between the player and the transitioning object (t-object).
tdy = 0; // ^
transfade = 0; // When > 0, uses this number as an alpha to fade out the screen.
transfaderate = 0.025; // The rate at which the screen fades out during a transition.
transdone = false; // Checks if the transition is finished.
transstep = -1; // Current stage of the transition
transbuffer = 0; // Delay counter for transitions before continuing.
transbuffermax = 10; // Length of delay for transitions before continuing to next step.
transdir = 0; // Direction we move the t-object once were in the transition room.
transrate = 10; // Rate at which t-objects move across the screen during a transition.
tsx = 0; // Location to place player after a transition is done.
tsy = 0; // ^
vox = 0; // Amount we need to adjust the t-object before moving it across the view.
voy = 0; // ^

// Initialize items.
// --- Beams ---
HasPowerBeam = true;
HasWaveBeam = false;
HasPlasmaBeam = false;
HasSpazerBeam = false;
HasPulseBeam = false;
HasIceBeam = false;
HasRuptureBeam = false;
HasPhazonBeam = false;
// --- Secondary Weapons ---
HasMissileLauncher = false;
HasSuperMissile = false;
HasDiffuser = false;
// --- Addons ---
HasArmCannon = true;
HasMorphBall = false;
HasBallBomb = false;
HasPowerBomb = false;
HasArcDash = false;
HasLightsear = false;
// --- Suits ---
HasPowerSuit = true;
HasVariaSuit = false;
HasGravitySuit = false;
HasCorruptionSuit = false;
// --- Visors ---
HasCombatVisor = true;
HasScanVisor = true;
HasXRayVisor = false;
scDefineExpansions(); // Initialize expansions to prevent re-acquisitions.

// Initialize miscellaneous stuff.
scDefineNBDoor(); // Initialize non-blue doors to prevent re-opening.
window_set_cursor(cr_none); // Hide the mouse cursor because we use our own.
sound_global_volume(1); // Master volume control.
InfoURL = "https://bit.ly/2Pfox2a"; // URL to Metroid Coven design document.
