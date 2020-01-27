// All messages of all kinds are stored here.
// This includes scan messages, item pickups, and more.
// This is called when the game starts, but can be called again to
//   update the messages with the tutorial room variants.

// --- Pickup messages ---
// Note: Weapons will use this message once mouse-switching is added:
//    "Beam acquired!#Press -#- or use mouse-scrolling to activate."
if (tutorialroom = 0)
{
    // Beams...
    GainWaveBeam = "Wave Beam acquired!#Press -2- to activate.";
    GainPlasmaBeam = "Plasma Beam acquired!#Press -3- to activate.";
    GainSpazerBeam = "Spazer Beam acquired!#Press -4- to activate.";
    GainPulseBeam = "Pulse Beam acquired!#Press -5- to activate.";
    GainIceBeam = "Ice Beam acquired!#Press -6- to activate.";
    GainRuptureBeam = "Rupture Beam acquired!#Press -7- to activate.";
    GainPhazonBeam = "Phazon Beam acquired!#Press -8- to activate.";
    // Secondary weapons...
    GainMissileLauncher = "Missile Launcher acquired!#Hold -Shift- to toggle, and Left-click to fire.";
    GainSuperMissile = "Super Missile acquired!#Press -CTRL- to select, and -Shift- to toggle.#Press -CTRL- to select Missile again.";
    GainDiffuser = "Diffuser acquired!#Charged beam shots now cause splash damage.";
    // Addons...
    GainMorphBall = "Morph Ball acquired!#Press -Z- to morph and unmorph.";
    GainBallBomb = "Ball Bomb acquired!#Left-click in Morph Ball mode to use.";
    GainPowerBomb = "Power Bomb acquired!#Right-click in Morph Ball mode to use.";
    GainArcDash = "Arc Dash acquired!!#Hold -Middle Click- to charge a dash, and release to activate.";
    GainLightsear = "Lightsear acquired!#Press -Q- or Middle-click to activate.";
    // Suits...
    GainVariaSuit = "Varia Suit acquired!#Extreme temperature zones are now accessible.";
    GainGravitySuit = "Gravity Suit acquired!#Mobility boosted and liquids no longer hinder movement.";
    GainCorruptionSuit = "Corruption Suit acquired!#Suit infused with pure phazon. Blue phazon now traversible.";
    // Visors...
    // Nothing here yet.
}
else
{
    // Beams...
    GainWaveBeam = "Wave Beam acquired!#Press -2- to activate.#
                    The Wave Beam deals extra damage to mechanical and electrical enemies, and can activate power sources.";
    GainPlasmaBeam = "Plasma Beam acquired!#Press -3- to activate.#
                      The Plasma Beam deals extra damage to cold enemies, and can melt some obstructions.";
    GainSpazerBeam = "Spazer Beam acquired!#Press -4- to activate.#
                      The Spazer Beam fires three projectiles in a spread, instead of one.";
    GainPulseBeam = "Pulse Beam acquired!#Press -5- to activate.#
                     The Pulse Beam fires fast projectiles in a three-shot burst.";
    GainIceBeam = "Ice Beam acquired!#Press -6- to activate.#
                   The Ice Beam deals extra damage to hot enemies, and can freeze some enemies and obstructions.#Follow up with a missile to shatter frozen enemies.";
    GainRuptureBeam = "Rupture Beam acquired!#Press -7- to activate.#
                       The Rupture Beam releases several small tracers on impact that seek out enemies and explode.#It also fires like a semi-automatic weapon.";
    GainPhazonBeam = "Phazon Beam acquired!#Press -8- to activate.
                      The Phazon Beam is an incredibly powerful weapon, dealing extra damage to phazon-based enemies.#It requires blue phazon to use.";
    // Secondary weapons...
    GainMissileLauncher = "Missile Launcher acquired!#Hold -Shift- to toggle, and Left-click to fire.##Missiles deal medium-high damage, but require ammunition to use, which is dropped by most enemies.#Missiles can also destroy certain obstructions.";
    GainSuperMissile = "Super Missile acquired!#Press -CTRL- to select, and -Shift- to toggle.#Press -CTRL- to select Missile again.##Super Missiles deal extremely high damage, but require ammunition to use, which is dropped by only a few enemies.#Super Missiles can destroy many obstructions, and deal minor splash damage.";
    GainDiffuser = "Diffuser acquired!#Charged beam shots now cause splash damage.";
    // Addons...
    GainMorphBall = "Morph Ball acquired!#Press -Z- to morph and unmorph.##The Morph Ball allows you to access small spaces, and move more quickly.";
    GainBallBomb = "Ball Bomb acquired!#Left-click in Morph Ball mode to use.##The Ball Bomb can destroy certain obstructions, and deals splash damage.#They detonate after just a few seconds, but you can only have three live bombs at any given time.";
    GainPowerBomb = "Power Bomb acquired!#Right-click in Morph Ball mode to use.##Power Bombs deal immense damage in a very large area, but require the rarest ammunition.#Power Bombs can also destroy many obstructions.";
    GainArcDash = "Arc Dash acquired!!#Hold -Middle Click- to charge a dash, and release to activate.##The Arc Dash allows you to move extremely quickly across a large space by moving continuously in one direction determined by the mouse.#Momentum is halted by colliding with a solid object or powerful enemy. It also can destroy certain obstructions.";
    GainLightsear = "Lightsear acquired!#Press -Q- or Middle-click to activate.##The Lightsear can reflect enemy projectiles back at them and deal damage.#Note that it mostly works on energy-based projectiles, not all of them.";
    // Suits...
    GainVariaSuit = "Varia Suit acquired!#Extreme temperature zones are now accessible.##The Varia Suit allows you traverse extreme hot and cold environments.#The Varia Suit also reduces incoming damage slightly.";
    GainGravitySuit = "Gravity Suit acquired!#Mobility boosted and liquids no longer hinder movement.##The Gravity Suit allows you to traverse liquid environments and provides a minor movement speed increase.#The Gravity Suit also reduces incoming damage by slightly more than the Varia Suit.";
    GainCorruptionSuit = "Corruption Suit acquired!#Suit infused with pure phazon. Blue phazon now traversible.##The Corruption Suit allows you to traverse blue pha";
    // Visors...
    // Nothing here yet.
}
// Expansions...
GainMissileExpansion = "Missile Expansion acquired!#+5 Missile capacity.";
GainSuperMissileExpansion = "Super Missile Expansion acquired!#+2 Super Missile capacity.";
GainPowerBombExpansion = "Power Bomb Expansion acquired!#+1 Power Bomb capacity.";
GainEnergyTank = "Energy Tank acquired!#+100 energy capacity.";
GainAccelTank = "Accel Tank acquired!#Suit recovery rates amplified.";

// --- Game scans ---
// Nothing here yet.

// --- Miscellaneous messages ---
Start = "Ready to begin?#Y = Yes     N = No";
Exit = "Exit the game?#Y = Yes     N = No";
TutorialWelcomeMessage = "Welcome to the tutorial. Here you will learn the basic gameplay mechanics and controls.##Move Samus with the -W-, -A-, -S-, and -D- keys.#Aim Samus' arm cannon with the mouse and -Left Click- to fire.#Hold and release -Right Click- to use your Charge Beam.#Press -F- to toggle your flashlight.##Explore the tutorial area as you please, the path is mostly linear, with low-detail environments and easy enemies to learn with.#DEMO NOTE: Please send all feedback and bugs to echojerichox@gmail.com.#Enjoy!";
                          // Remove the last 2 lines of this message for non-demo release(s).
