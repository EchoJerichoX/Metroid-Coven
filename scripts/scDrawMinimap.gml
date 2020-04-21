// Draws minimap on HUD. Runs within eId (scDrawHUD).
switch (room) {
    case rmBarria1LandingSite:
        minimapspr = sprBarria1LandingSite;
        if (mapBarria1RedDoorOpened = 0) mimg = 2;
        else mimg = 1;
        break;
    default: exit;
}
mmsx = oPlayer.x/mscale; // Top-left corner of minimap's
mmsy = oPlayer.y/mscale; //   drawing area.
mmsx = clamp(mmsx,mmw/2,sprite_get_width(minimapspr)-mmw/2);    // Stop map from drawing outside of 
mmsy = clamp(mmsy,mmh/2,sprite_get_height(minimapspr)-mmh/2);   //   where player can see.
draw_sprite_part_ext(minimapspr,mimg,mmsx-mmw/2,mmsy-mmh/2,mmw,mmh,mmx-mmw,mmy,1,1,c_white,hudopacity*0.75);
