// Runs within GameInit.
drawhud = 1; // Draw HUD in gameplay rooms.
animdelay = 6; // How long to show HUD element flashes, transitions, and other animations.
// Font preset.
draw_set_font(sfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
// HUD opacity (TEMPORARY! This should eventually be stored with other options menu stuff.
hudopacity = 1;
    
// Top left.
entx = 4;   enty = 4;   // "Energy" text.
elbx = 56;  elby = 4;   // Left bracket.
erbx = 110; erby = 4;   // Right bracket
encx = 87;  ency = 6;   // Energy counter (center-aligned).
etx = 4;    ety = 14;   // Energy Tanks.
etflash = 0;            // Energy Tank sprite changer.
                        //   Set to "1" if we lose a tank.
                        //   Set to "2" if we gain a tank.
etflashreset = 0;       // Energy Tank sprite animation resetter.
btx = 120;  bty = 4;    // "Bombs" text.
bcx = 166;  bcy = 4;    // Bomb counter.
mbx = 4;    mby = 36;   // Missile boundary box.
mix = 14;   miy = 40;   // Missile icon. Outline shares this number.
mcx = 34;   mcy = 41;   // Missile counter.
mcflash = 0;            // Missile outline changer.
smbx = 4;   smby = 58;  // Super Missile boundary box.
smix = 14;  smiy = 62;  // Super Missile icon. Outline shares this number.
smcx = 34;  smcy = 63;  // Super Missile counter.
smflash = 0;            // Super Missile outline changer.
pbbx = 4;   pbby = 80;  // Power Bomb boundary box.
pbix = 12;  pbiy = 84;  // Power Bomb icon.
pbcx = 34;  pbcy = 85;  // Power Bomb counter.

// Top right.
maprx = 635;    mapry = 4;  // Map region name.
mapnx = 635;    mapny = 22; // Map room name.
mapx = 635;     mapy = 34;  // Map.
