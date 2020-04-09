// Draws minimap on HUD. Runs within eId (scDrawHUD).
switch (room) {
    case rmBarria1LandingSite: minimapspr = sprBarria1LandingSite; break;
    default: exit;
}
mmsx = oPlayer.x/4; // Top-left corner of minimap's
mmsy = oPlayer.y/4; //   drawing area.
mmsx = clamp(mmsx,50,sprite_get_width(minimapspr)-50);
mmsy = clamp(mmsy,38,sprite_get_height(minimapspr)-38);
draw_sprite_part(minimapspr,0,mmsx-50,mmsy-38,100,75,minimapx,minimapy);
