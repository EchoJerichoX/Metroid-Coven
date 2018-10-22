if (!instance_exists(oCannon)) instance_create(x,y,oCannon);

// --- General ---
Energy = 100;
EnergyTanks = 0;
FullTanks = 0;
GainEnergy = 0;
Accel = 1;

//Starting ammo amounts.
scWeaponInitValues(Weapons.wMissileLauncher,10);
scWeaponInitValues(Weapons.wSuperMissile,3);
scWeaponInitValues(Weapons.wPowerBomb,2);
scWeaponInitValues(Weapons.wPhazonBeam,0);

//Other weapon variables.
Heat = 0; // See variable "Heating" in scDefineWeapon for the rate at which the Plasma Beam heats up.
CoolRate = 0.25; // Rate at which the Plasma Beam cools down.
Overheated = 0;
Charger = 0;
ChargeRate = 1.4;
ShotTimer = 0;

AnimationStart = 0; // Determines the start and stop frames of continuous animation.
                    // Varies by suit/state.
AnimationEnd = 0;   // ^
BallAnimationStart = 0; // Same as above, but for Morph Ball sprite.
BallAnimationEnd = 0;   // ^
BallAnimationLimit = 2; // Number that AnimationTimer must reach before advancing
                        // animation frames.
AnimationTimer = 0; // Determines the rate at which the player advances animation frames.
MorphBall = false; // Determines if the player is in Morph Ball mode.

// Temporary, currently not in use
Dodge = 0;
DodgeCooldown = 0;
// ^

TakeHitDirection = -1; // Determines which direction the player bounces when taking damage.
CanTakeHit = true; // Checks if the player is currently taking damage.
KnockbackDir = 0; // Where to move away from when hit by something.

friction = .2; // Change friction for different surfaces.
MaxSpeed = -1; // Determines top speed for player.
MaxBallSpeed = -1; // Same as above, but for Morph Ball mode.
SpeedInterval = 5; // Determines the rate of movement speed acceleration.
                   // The higher the number, the slower the rate of acceleration.
                   // Used, for example, on ice surfaces.
OnIce = false; // Are we on an ice tile?

startboostcharge = 0;
boostchargelevel = 0;
boostchargemax = 60;
boosteffectdelay = 0;
boosteffectdelaytimer = 5;
boostdelay = 0;
boostdelaymax = 10;
boosteffectrangemod = 10;
boostalpha = 0;
boostalphaset = 0.7;
boostfaderate = 0.05;
boostspeed = 9;
boosting = 0;
boostdir = 0;
destboostdir = 0;
boosttraildelay = 5;
prevdir = 0;
boostdirblocklimit = 61;

/*
boosting = false; // Used for the Arc Dash. Are we trying to boost?
boostup = 0;
boostready = 10;
boostgo = 0;
boostdone = 0;
boostdelay = 0;
*/

Suit = -1; // Suit variable.
scDefineSuit(Other.sPowerSuit); // Upon the player being created, set the current suit to the
                                // Power Suit.

stepx = x; // Used for placing footsteps.
stepy = y; // ^

mdirection = 0; // Current move direction.
mhspeed = 0; // Current horizontal move speed.
mvspeed = 0; // Current vertical move speed.
morphgo = true; // Tells whether the player is ready to enter or exit Morph Ball mode.
moving = false; // Tells if the player is moving.
moving_direction = 0; // Tells the player's destination moving direction.
moving_direction_previous = 0; // Tells the player's previous moving direction.
mspeed = 0; // Current move speed.

// --- Weapon variables and handling ---
CurrentPrimary = Weapons.wPowerBeam; // Current primary weapon (beam weapon).
NewPrimary = Weapons.wPowerBeam; // The weapon the player will be switching to when switching
                                 //   weapons.
CurrentUnmorphedSecondary = Weapons.wMissileLauncher; // The current secondary weapon.
CurrentMorphedSecondary = Weapons.wPowerBomb; // The current secondary weapon in Morph Ball mode.
                                              // Currently only the Power Bomb can be this var.
Cannon = 0; // Sets the current subimage for the arm cannon sprite.
CannonOffset = 13; // Sets the offset for projectile/effect creation in relation to the tip of
                   //   the arm cannon sprite.
PreviousWeapon = 0; // Previous selected weapon. Simply stores so we can switch back to it when
                    //   unmorphing.
HoldingWeaponId = CurrentPrimary; // The currently held weapon (primary or secondary, and the eId).
JustSwitched = 0; // Did we just switch weapons?

pulseshot = 0; // These variables control the Pulse Beam behavior.
               // This one determines how many shots have been fired normally (no charge beam).
pulsechargeshot = 0; // This determines how many shots have been fired if the charge beam was used.
pulsechargefiring = 0; // Is the Pulse Beam firing a charged volley?

ExistingBombs = 0; // Will be removed soon. Counts number of Bombs currently laid by the player.
ExistingPowerBombs = 0; // ^ Same, but for Power Bombs.

WeaponDirectionOffset = 270; // Part of the math involved in telling the game where the arm cannon
                             //   needs to be drawn.
WeaponDistanceOffset = 6; // ^
WeaponAim = 0; // ^
WeaponXPosition = 0; // Determines the location of the tip of the arm cannon for the current weapon.
WeaponYPosition = 0; // ^

ChargeObject = noone; // Allows for control of the beam charging effect.

scDefineWeapon(CurrentPrimary,1); // Set the current weapon.

// --- Lights ---
// Flashlight...
// This spawns the flashlight object and then sets the various variables within it to function.
torchSlave = instance_create(x,y,oLight);
torchSlave.master = id;
torchSlave.hideable = false;
torchSlave.LightSprite = sprLightTorch;
torchSlave.HasLight = .4;
torchSlave.AmbLightSprite = sprLightTorch;
torchSlave.HasAmbient = .2;
torchSlave.MyDestScale = 1;
torchSlave.image_yscale = 1.4;
torchSlave.AmIOn = false;
torchSlave.WasOn = false;

// Suit glow...
// Same as above for the flashlight, but is used for the player's ambient glow.
suitSlave = instance_create(x,y,oLight);
suitSlave.master = id;
suitSlave.hideable = false;
suitSlave.LightSprite = sprLightEffect;
suitSlave.HasLight = 1;
suitSlave.AmbLightSprite = sprLightEffect;
suitSlave.HasAmbient = .75;
suitSlave.MyDestScale = 1;
suitSlave.image_xscale = .5;
suitSlave.image_yscale = .5;

// --- Controls ---
KeyUp                = keyboard_check(ord("W"));
KeyLeft              = keyboard_check(ord("A"));
KeyDown              = keyboard_check(ord("S"));
KeyRight             = keyboard_check(ord("D"));

KeyPowerBeam         = keyboard_check_pressed(ord("1"));
KeyWaveBeam          = keyboard_check_pressed(ord("2"));
KeyPlasmaBeam        = keyboard_check_pressed(ord("3"));
KeySpazerBeam        = keyboard_check_pressed(ord("4"));
KeyPulseBeam         = keyboard_check_pressed(ord("5"));
KeyIceBeam           = keyboard_check_pressed(ord("6"));
KeyRuptureBeam       = keyboard_check_pressed(ord("7"));
KeyPhazonBeam        = keyboard_check_pressed(ord("8"));

KeySecondaryHeld     = keyboard_check(vk_shift);
KeySecondaryReleased = keyboard_check_released(vk_shift);
KeySecondarySwitch   = keyboard_check_pressed(vk_control);
KeyMorph             = keyboard_check_pressed(ord("Z"));
KeyVisor             = keyboard_check_pressed(ord("X"));

KeyBoost             = mouse_check_button(mb_middle);
KeyBoostPressed      = mouse_check_button_pressed(mb_middle);
KeyBoostReleased     = mouse_check_button_released(mb_middle);

KeyFireNormal        = mouse_check_button(mb_left);
KeyFireClickSpeed    = mouse_check_button_pressed(mb_left);
KeyFireReleased      = mouse_check_button_released(mb_left);

KeyChargeUp          = mouse_check_button(mb_right);
KeyChargePressed     = mouse_check_button_pressed(mb_right);
KeyChargeReleased    = mouse_check_button_released(mb_right);
KeyTorch             = keyboard_check_pressed(ord("F"));

// --- Under Review/Temporary ---
KeyDodge             = keyboard_check_pressed(vk_space);
KeyDodgeHold         = keyboard_check(vk_space);
