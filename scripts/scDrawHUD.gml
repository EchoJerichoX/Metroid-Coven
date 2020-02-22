// This script runs within eId's Draw GUI event.

// Do not draw HUD in certain cases.
if (room = TitleRoom)
or (room = IntroRoom)
or (room = DeathRoom)
or (!drawhud)
or (instance_exists(oDeathAnim))
or (!instance_exists(oPlayer)) exit;

draw_set_font(sfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// =============//
//   TOP LEFT   //
// =============//
// "Energy" text.
draw_text_color(entx,enty,"Energy",c_white,c_white,c_white,c_white,hudopacity);

// Energy counter...
//   Set the font.
draw_set_font(sfont2x);
draw_set_halign(fa_right);
//   Draw the text.
draw_text_color(encx,ency,oPlayer.Energy,c_white,c_white,c_white,c_white,hudopacity);
//   Return the font to default.
draw_set_font(sfont);
draw_set_halign(fa_left);

// Energy tanks...
if (oPlayer.EnergyTanks > 0) // If the player has any Energy Tanks at all...
{
    // Determine frame we should draw for each tank...
    
    // Draw tanks.
    for (i = 0; i < oPlayer.EnergyTanks; i++)
    {
        if (i > 4)  // First row positioning (0-4)
            { etx = -46; ety = 24; }
        else        // Second row positioning (5-9).
            { etx = 4; ety = 14; }
        // Choose which subimage to draw.
        var subimg = 2;
        if (i < oPlayer.FullTanks)
            subimg = 0;
        if (etflash = 1) and (i = oPlayer.FullTanks) subimg = 1;
        if (etflash = 2) and (i = oPlayer.FullTanks-1) subimg = 1;
        // Draw the tank.
        draw_sprite_ext(sprHUDEnergyTank,subimg,etx+(10*i),ety,1,1,0,c_white,hudopacity);
    }
    if (etflashreset > 0) etflashreset -= 1;
    if (etflashreset = 0) etflash = 0;
}

// Ball Bomb text and counter.
if (HasBallBomb)
{
    draw_text_color(btx,bty,"Bombs",c_white,c_white,c_white,c_white,hudopacity);
    draw_sprite_ext(sprHUDBombs,oPlayer.ExistingBombs,bcx,bcy,1,1,0,c_white,hudopacity);
}

// Missile Launcher indicator and ammo counter.
if (HasMissileLauncher)
{
    // Draw border.
    draw_sprite_ext(sprHUDSecondaryWeaponBorder,0,mbx,mby,1,1,0,c_white,hudopacity);
    // Draw icon.
    draw_sprite_ext(sprHUDMissile,0,mix,miy,1,1,0,c_white,hudopacity);
    // Draw outline.
    draw_sprite_ext(sprHUDMissileOutline,0,mix,miy,1,1,0,c_white,hudopacity);
    // Draw counter.
    with (oPlayer) other.mammo = scWeaponGetAmmo(Weapons.wMissileLauncher);
    draw_text_color(mcx,mcy,mammo,c_white,c_white,c_white,c_white,hudopacity);
}

// Super Missile indicator and ammo counter.
if (HasSuperMissile)
{
    // Draw border.
    draw_sprite_ext(sprHUDSecondaryWeaponBorder,0,smbx,smby,1,1,0,c_white,hudopacity);
    // Draw icon.
    draw_sprite_ext(sprHUDSuperMissile,0,smix,smiy,1,1,0,c_white,hudopacity);
    // Draw outline.
    draw_sprite_ext(sprHUDSuperMissileOutline,0,smix,smiy,1,1,0,c_white,hudopacity);
    // Draw counter.
    with (oPlayer) other.smammo = scWeaponGetAmmo(Weapons.wSuperMissile);
    draw_text_color(smcx,smcy,smammo,c_white,c_white,c_white,c_white,hudopacity);
}
if (HasPowerBomb)
{
    // Draw border.
    draw_sprite_ext(sprHUDSecondaryWeaponBorder,0,mbx,mby,1,1,0,c_white,hudopacity);
    // Draw icon.
    draw_sprite_ext(sprHUDMissile,0,mix,miy,1,1,0,c_white,hudopacity);
    // Draw outline.
    draw_sprite_ext(sprHUDMissileOutline,0,mix,miy,1,1,0,c_white,hudopacity);
    // Draw counter.
    with (oPlayer) other.mammo = scWeaponGetAmmo(Weapons.wMissileLauncher);
    draw_text_color(mcx,mcy,mammo,c_white,c_white,c_white,c_white,hudopacity);
}
