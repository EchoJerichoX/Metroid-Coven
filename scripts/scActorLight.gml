// This script is run within oLE (the lighting engine controller).
// * CURRENTLY UNUSED *
switch (myid)
{
    case Enemies.eZoomer:
        draw_sprite_ext(sprZoomerLights,image_index,x,y,1,1,image_angle,image_blend,1);
        break;
    case Enemies.eGeemer:
        break;
    case Enemies.eTurret:
        break;
}
