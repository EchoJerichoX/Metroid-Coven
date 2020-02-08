if (room = TitleRoom)
or (room = IntroRoom)
or (room = DeathRoom)
or (!drawhud)
or (instance_exists(oDeathAnim)) exit;
// Do not draw HUD in certain cases.

var vx,vy,
    MissileLauncherAlpha,
    SuperMissileAlpha,
    PowerBombAlpha;
vx = view_xview[0];
vy = view_yview[0];
draw_set_alpha(1)

// ----------
// Draw general components.
// ----------
//Draw bars (bars are to be drawn first so the accents are drawn on top).
if (instance_exists(oPlayer))
{
    var mc,height1; //mc = "Measured Charge" = the player's charge beam level measured into the height of the bar sprite.
    mc = 0.92*oPlayer.Charger;
    if (oPlayer.Charger > 0) draw_sprite_part_ext(sprHUDChargeBar,0,0,92-mc,15,mc,vx+50,vy+211+92-mc,1,1,c_white,1);
    // ---
    var mh,height2; //mh = "Measured Heat" = the player's Plasma Beam heat level measured into the height of the bar sprite.
    mh = 1.33*oPlayer.Heat;
    if (eId.HasPlasmaBeam) and (oPlayer.Heat > 0) draw_sprite_part_ext(sprHUDHeatBar,0,0,133-mh,57,mh,vx+57,vy+322+133-mh,1,1,c_white,1);
    // ---
    /*var mc,height3; //mc = "Measured Charge" = the player's charge beam level measured into the height of the bar sprite.
    mc = 0.92*oPlayer.Charger;
    height3 = (mc*100)-mc;
    draw_sprite_part_ext(sprHUDChargeBar,0,0,92-mc,15,height3,vx+50,vy+211+92-mc,1,1,c_white,1);
    if (eId.HasPhazonBeam) draw_sprite(sprHUDPhazonBar,0,vx+575,vy+211);
    // ---
    var mc,height4; //mc = "Measured Charge" = the player's charge beam level measured into the height of the bar sprite.
    mc = 0.92*oPlayer.Charger;
    height4 = (mc*100)-mc;
    draw_sprite_part_ext(sprHUDChargeBar,0,0,92-mc,15,height4,vx+50,vy+211+92-mc,1,1,c_white,1);
    if (eId.HasLightsear) draw_sprite(sprHUDLightsearBar,0,vx+526,vy+322);*/
}
//Draw accents.
draw_sprite(sprHUDAccentTop,0,vx+154,vy+5);
draw_sprite(sprHUDAccentLeft,0,vx+8,vy+27);
draw_sprite(sprHUDAccentRight,0,vx+522,vy+27);
//Draw energy bar, text, and tanks.
if (instance_exists(oPlayer))
{
    //Draw tanks.
    var exbase,ey,i;
    exbase = vx+189;
    ey = vy+27;
    for (i = 0; i <= oPlayer.EnergyTanks; i += 1;)
    {
        if (i >= 1)
        {
            if (oPlayer.FullTanks >= i) draw_sprite_ext(sprHUDEnergyTank,0,exbase+(19*i-1),ey,1,1,0,c_white,1);
            else if (oPlayer.FullTanks < i) draw_sprite_ext(sprHUDEnergyTank,0,exbase+(19*i-1),ey,1,1,0,c_white,0.25);
        }
    }
    //Draw bar.
    var me; //me = "Measured Energy" = the player's health measured into the width of the bar sprite.
    me = 1.87*oPlayer.Energy;
    //Draw bar "background".
    if (oPlayer.Energy < 100) draw_sprite_ext(sprHUDEnergyBar,0,vx+246,vy+40,1,1,0,c_white,0.3);
    //Draw bar "foreground".
    draw_sprite_part_ext(sprHUDEnergyBar,0,0,0,me,11,vx+246,vy+40,1,1,c_white,1);
    //Draw text.
    c1 = 10;
    c2 = 10;
    c3 = 10;
    c1 = real(string_char_at(string(oPlayer.Energy),1));
    if (oPlayer.Energy >= 10) c2 = real(string_char_at(string(oPlayer.Energy),2));
    if (oPlayer.Energy = 100) c3 = 0;
    if (oPlayer.Energy < 100) c3 = 10;
    if (oPlayer.Energy < 10) c2 = 10;
    if (c1 < 10) draw_sprite(sprText,c1,vx+207,vy+40);
    if (c2 < 10) draw_sprite(sprText,c2,vx+220,vy+40);
    if (c3 < 10) draw_sprite(sprText,c3,vx+233,vy+40);
}

//----------
//Draw left-side components.
//----------
//Draw the charge bar text.
draw_sprite(sprHUDTextCharge,0,vx+32,vy+205);
//Draw beam indicator.
var beam;
beam = 0;
if (instance_exists(oPlayer))
{
    if (oPlayer.CurrentPrimary <= Weapons.wPhazonBeam) and (oPlayer.CurrentPrimary >= Weapons.wPowerBeam) beam = oPlayer.CurrentPrimary-Weapons.wPhazonBeam+8; // 8 = Number of beams.
    else beam = oPlayer.CurrentPrimary-1;
}
draw_sprite(sprHUDBeam,beam,vx+39,vy+45);
//Draw Ball Bomb counter.
if (instance_exists(oPlayer))
{
    if (eId.HasBallBomb)
    {
        switch (oPlayer.ExistingBombs)
        {
            case 0: draw_sprite(sprHUDAddonBombs,1,vx+98,vy+42); break;                 // Draw all boxes full.
            case 1: draw_sprite_part(sprHUDAddonBombs,1,0,17,20,39,vx+98,vy+58); break; // Draw two full boxes.
            case 2: draw_sprite_part(sprHUDAddonBombs,1,0,35,20,21,vx+98,vy+76); break; // Draw one full box.                
        }
        draw_sprite(sprHUDAddonBombs,0,vx+98,vy+42);
    }
//Missile Launcher indicator and ammo counter.
    if (eId.HasMissileLauncher)
    {
        draw_sprite(sprHUDSecondaryMissile,0,vx+38,vy+103);
        if (oPlayer.CurrentUnmorphedSecondary = Weapons.wMissileLauncher) MissileLauncherAlpha = 1;
        else MissileLauncherAlpha = 0.3;
        draw_sprite_ext(sprHUDSecondaryMissile,1,vx+38,vy+103,1,1,0,c_white,MissileLauncherAlpha);
        draw_sprite(sprHUDAmmoIcons,0,vx+520,vy+102);
        d1 = 10;
        d2 = 10;
        d3 = 10;
        if (instance_exists(oPlayer)) with (oPlayer) other.mammo = scWeaponGetAmmo(Weapons.wMissileLauncher);
        d1 = real(string_char_at(string(mammo),1));
        if (mammo >= 10) d2 = real(string_char_at(string(mammo),2));
        if (mammo = 100) d3 = 0;
        if (mammo < 100) d3 = 10;
        if (mammo < 10) d2 = 10;
        if (d1 < 10) draw_sprite(sprTextSkewed,d1,vx+563,vy+111);
        if (d2 < 10) draw_sprite(sprTextSkewed,d2,vx+577,vy+113);
        if (d3 < 10) draw_sprite(sprTextSkewed,d3,vx+591,vy+115);
    }
//Super Missile indicator and ammo counter.
    if (eId.HasSuperMissile)
    {
        draw_sprite(sprHUDSecondarySuperMissile,0,vx+38,vy+132);
        if (oPlayer.CurrentUnmorphedSecondary = Weapons.wSuperMissile) SuperMissileAlpha = 1;
        else SuperMissileAlpha = 0.3;
        draw_sprite_ext(sprHUDSecondarySuperMissile,1,vx+38,vy+132,1,1,0,c_white,SuperMissileAlpha);
        draw_sprite(sprHUDAmmoIcons,1,vx+520,vy+124);
        e1 = 10;
        e2 = 10;
        e3 = 10;
        if (instance_exists(oPlayer)) with (oPlayer) other.sammo = scWeaponGetAmmo(Weapons.wSuperMissile);
        e1 = real(string_char_at(string(sammo),1));
        if (sammo >= 10) e2 = real(string_char_at(string(sammo),2));
        if (sammo = 100) e3 = 0;
        if (sammo < 100) e3 = 10;
        if (sammo < 10) e2 = 10;
        if (e1 < 10) draw_sprite(sprTextSkewed,e1,vx+563,vy+133);
        if (e2 < 10) draw_sprite(sprTextSkewed,e2,vx+577,vy+135);
        if (e3 < 10) draw_sprite(sprTextSkewed,e3,vx+591,vy+137);
    }
//Power Bomb ammo counter.
    if (eId.HasPowerBomb)
    {
        draw_sprite(sprHUDAmmoIcons,2,vx+520,vy+148);
        f1 = 10;
        f2 = 10;
        f3 = 10;
        if (instance_exists(oPlayer)) with (oPlayer) other.pammo = scWeaponGetAmmo(Weapons.wPowerBomb);
        f1 = real(string_char_at(string(pammo),1));
        if (pammo >= 10) f2 = real(string_char_at(string(pammo),2));
        if (pammo = 100) f3 = 0;
        if (pammo < 100) f3 = 10;
        if (pammo < 10) f2 = 10;
        if (f1 < 10) draw_sprite(sprTextSkewed,f1,vx+563,vy+155);
        if (f2 < 10) draw_sprite(sprTextSkewed,f2,vx+577,vy+157);
        if (f3 < 10) draw_sprite(sprTextSkewed,f3,vx+591,vy+159);
    }
//Plasma Beam heat indicator and text.
    if (eId.HasPlasmaBeam) draw_sprite(sprHUDTextHeat,0,vx+43,vy+334);
//Phazon reserves bar and text.
    if (eId.HasPhazonBeam) draw_sprite(sprHUDTextPhazon,0,vx+595,vy+205);
//Lightsear cooldown timer and text.
    if (eId.HasLightsear) draw_sprite(sprHUDTextLightsear,0,vx+553,vy+346);
}

// ----------
// Draw right-side components.
// ----------
draw_sprite(sprHUDMap,0,vx+537,vy+44);
// See the left-side component block for the ammo counters.
