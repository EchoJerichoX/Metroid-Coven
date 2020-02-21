// This script runs within eId's Draw GUI event.

// Do not draw HUD in certain cases.
if (room = TitleRoom)
or (room = IntroRoom)
or (room = DeathRoom)
or (!drawhud)
or (instance_exists(oDeathAnim))
or (!instance_exists(oPlayer)) exit;

// =========//
//   INIT   //
// =========//
// General.
// Universal animation delay when transitioning from subimage to subimage.
var animdelay = 6;
// Font preset.
draw_set_font(sfont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
// HUD opacity (TEMPORARY! This should eventually be stored with other options menu stuff.
var hudopacity = 1;
    
// Top left.
var entx = 4;   var enty = 4;   // Energy text.
var encx = 97;  var ency = 4;   // Energy counter (top right-aligned).
var etx = 4;    var ety = 14;   // Energy tanks.

var btx = 100;  var bty = 4;    // Bombs text.
var bcx = 146;  var bcy = 4;    // Bomb counter.

var mbx = 4;    var mby = 34;   // Missile boundary box.
var mix = 14;   var miy = 38;   // Missile icon. Outline shares this number.
var mcx = 34;   var mcy = 39;   // Missile counter.

var smbx = 4;   var smby = 55;  // Super Missile boundary box.
var smix = 14;  var smiy = 58;  // Super Missile icon. Outline shares this number.
var smcx = 34;  var smcy = 59;  // Super Missile counter.

var pbbx = 4;   var pbby = 75;  // Power Bomb boundary box.
var pbix = 12;  var pbiy = 78;  // Power Bomb icon.
var pbcx = 34;  var pbcy = 79;  // Power Bomb counter.

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
draw_text_color(entx,enty,oPlayer.Energy,c_white,c_white,c_white,c_white,hudopacity);
//   Return the font to default.
draw_set_font(sfont);
draw_set_halign(fa_left);
// Energy tanks...
if (oPlayer.EnergyTanks > 0) // If the player has any Energy Tanks at all...
{
    for (var i = 0; i <= oPlayer.EnergyTanks; i += 0;) // Draw each tank one at a time in a for statement.
    {
        if (oPlayer.FullTanks >= i) tf[i] = 2;  // Target frame we want to reach for this Energy Tank before moving on.
        else { tf[i] = 0; f[i] = 0; }           // 2 (illuminated) if full, 0 (dark) if not.
        // Transition from subimage to subimage on a delay.
        if (tf[i] = 2)
        {
            for (f[i] = 0; f[i] < animdelay; f[i] += 1;)
            {
                // ??
            }
        }
        draw_sprite_ext(sprHUDEnergyTank,f[i],etx+(10*i-1),ety,1,1,0,c_white,1); // Draw each tank, offsetting based on how many obtained.
        if f[i] = tf[i] i+= 1; // Move on if we are done.    
    }
}
