// - GENERAL MASTER CONTROLLER KEYS - //
/*
    F4 - Toggle fullscreen (temporary!).
    F9 - Take a screenshot.
*/

// Toggle fullscreen (temporary!).
if (keyboard_check_pressed(vk_f4))
{
    fullscreen = !fullscreen;
    window_set_fullscreen(fullscreen);
}

// Take a screenshot.
if (keyboard_check_pressed(vk_f9))
    { screen_save("Screenshots/"+get_string("Enter a filename. Saves to game directory in the ''Screenshots'' folder.",0)+".png"); }

// - DEBUG MODE KEYS - //
/*
    NUM 0 - Toggle debug mode.
    NUM 1 - Spawn health at mouse.
    NUM 2 - Spawn ammo at mouse.
    NUM 3 - Overheat the Plasma Beam.
    NUM 4 - Spawn enemy at mouse.
            Set "debugenemy" variable in "GameInit" script
            to determine which enemy to spawn.
    NUM 5 - Spawn a 16x16 basic block at the mouse.
            Snaps to nearest 16x16 grid corner.
            WARNING: Will delete other 16x16 basic
            blocks underneath it when placed!
    NUM 6 - Create player object at mouse.
    NUM 7 - Toggle drawing of motion planning grid.
    NUM 8 - Update motion planning grid.
    NUM 9 - Toggle HUD.
    NUM / - Toggle slowdown.
    NUM * - Grant all powerups to player.
    NUM - - Reduce player health by 1.
    PAGE DOWN - Restart game.
    PAGE UP - Restart current room (risky).
*/

// Toggle debug mode.
if (keyboard_check_pressed(vk_numpad0))
debugmode = !debugmode;
if (debugmode)
{
    if (instance_exists(oVectorLine)) {
        with (oVectorLine) visible = true;
    }
    if (room != rmTitleRoom) {
        background_visible[6] = true;
        background_visible[7] = true;
    }
}
else
{
    if (instance_exists(oVectorLine))
        { with (oVectorLine) visible = false; }
    background_visible[6] = false;
    background_visible[7] = false;
}

if (!debugmode) exit; // Do not check for any more debug inputs if debugmode is disabled!

// Spawn health at mouse.
if (keyboard_check_pressed(vk_numpad1))
{
    with (instance_create(mouse_x,mouse_y,oItem))
    {
        scDefineItem(choose(Items.hHealthSmall,
                            Items.hHealthLarge,
                            Items.hHealthSuper));
    }
}

// Spawn ammo at mouse.
if (keyboard_check_pressed(vk_numpad2))
{
    with (instance_create(mouse_x,mouse_y,oItem))
    {
        scDefineItem(choose(Items.aSMissileAmmo,
                            Items.aLMissileAmmo,
                            Items.aSSuperMissileAmmo,
                            Items.aLSuperMissileAmmo,
                            Items.aPowerBombAmmo));
    }
}

// Overheat the Plasma Beam.
if (keyboard_check_pressed(vk_numpad3)) and (instance_exists(oPlayer))
    { if (oPlayer.CurrentPrimary = Weapons.wPlasmaBeam) oPlayer.Heat = 100; }
    
// Spawn enemy at mouse.
//   Set "debugenemy" variable in "scGameInit" script
//   to determine which enemy to spawn.
if (keyboard_check_pressed(vk_numpad4))
{
    with (instance_create(mouse_x,mouse_y,oActor))
    {
        scActorInit();
        scDefineActor(Enemies.eZoomer);
    }
}

// Spawn a 16x16 basic block at the mouse.
//   Snaps to nearest 16x16 grid corner.
//   WARNING: Will delete other 16x16 basic
//   blocks underneath it when placed!
if (keyboard_check_pressed(vk_numpad5))
{
    with (instance_create(mouse_x,mouse_y,oBlock16))
    {
        scDefineBlock(Blocks.bBasic);
        if (!place_snapped(16,16)) move_snap(16,16);
        mp_grid_add_cell(eId.aigrid,x/16,y/16);
        if (instance_exists(oBlock16))
        {
            var occ = instance_place(x,y,oBlock16);
            if (occ != noone)
                { with (occ) instance_destroy(); }
        }
    }
}

// Create player object at mouse.
if (keyboard_check_pressed(vk_numpad6)) instance_create(mouse_x,mouse_y,oPlayer);

// Toggle drawing of motion planning grid.
if (keyboard_check_pressed(vk_numpad7)) drawmpgrid = !drawmpgrid;

// Update motion planning grid.
if (keyboard_check_pressed(vk_numpad8)) scUpdateMPGrid();

// Toggle HUD.
if (keyboard_check_pressed(vk_numpad9)) drawhud = !drawhud;

// Toggle slow motion.
if (keyboard_check_pressed(vk_divide))
{
    if (room_speed = 60) room_speed = 15;
    else room_speed = 60;
}

// Grant all powerups to player.
if (keyboard_check_pressed(vk_multiply))
{
    if (!allitemsgiven) and (instance_exists(oPlayer))
    {
        allitemsgiven = 1;
        HasWaveBeam = true;
        HasPlasmaBeam = true;
        HasSpazerBeam = true;
        HasPulseBeam = true;
        HasIceBeam = true;
        HasRuptureBeam = true;
        HasPhazonBeam = true;
        HasMissileLauncher = true;
        HasSuperMissile = true;
        HasDiffuser = true;
        HasMorphBall = true;
        HasBallBomb = true;
        HasPowerBomb = true;
        HasArcDash = true;
        HasLightsear = true;
        // ---
        with (oPlayer)
        {
            scDefineSuit(Other.sCorruptionSuit);
            EnergyTanks = 10;
            FullTanks = EnergyTanks;
            Energy = 100;
        }
    }
}


// Reduce player health by 1.
if (keyboard_check(vk_subtract))
    { if (instance_exists(oPlayer)) with (oPlayer) Energy -= 1; }
//  { scPlayerDamage(1,1,1); }


// Restart game.
if (keyboard_check(vk_pagedown)) game_restart();

// Restart room. *Use with caution!*
if (keyboard_check(vk_pageup)) room_restart(); // Re-run room entrance transition code from here somehow?
