// Draws minimap on HUD. Runs within eId (scDrawHUD).
// Determine which room sprite we are using, and which subimage based on room state.
switch (room) {
    case rmBarria1LandingSite:
        minimapspr = sprBarria1LandingSite;
        if (mapBarria1RedDoorOpened = 1) mimg = 2;
        else mimg = 1;
        break;
    case rmBarria2ZoomerTunnel:
        minimapspr = sprBarria2ZoomerTunnel;
        if (mapBarria2GrayDoorActive = 1) mimg = 2;
        else mimg = 1;
        break;
    case rmBarria3Atrium:
        minimapspr = sprBarria3Atrium;
        if (mapBarria3GreenDoorOpened = 1) mimg = 2;
        else mimg = 1;
        break;
    case rmBarria4RuinsAccess:
        minimapspr = sprBarria4RuinsAccess;
        if (mapBarria4RedDoorOpened = 1) mimg = 2;
        else mimg = 1;
        break;
    default: exit;
}
mmsx = oPlayer.x/mscale; // Top-left corner of minimap's
mmsy = oPlayer.y/mscale; //   drawing area.
mmsx = clamp(mmsx,mmw/2,sprite_get_width(minimapspr)-mmw/2);    // Stop map from drawing outside of 
mmsy = clamp(mmsy,mmh/2,sprite_get_height(minimapspr)-mmh/2);   //   where player can see.
if (transstep = -1) {
    draw_sprite_part_ext(minimapspr,mimg,mmsx-mmw/2,mmsy-mmh/2,
                         mmw,mmh,mmx-mmw,mmy,1,1,c_white,hudopacity*0.75);
}
