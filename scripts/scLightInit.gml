// Get Light center (origin) positions, brightness, and size.
image_blend = c_white;
ox = x;
oy = y;
size = 1;
xsize = 1;
ysize = 1;

switch (object_index)
{
    case oStickLightE:
    case oStickLightN:
    case oStickLightS:
    case oStickLightW:
        size = .05; image_angle = random_range(-3,3); angle = random(360);
        break;
    // --------
    case oSmallLightEW:
        xsize = .7; ysize = 1; size = .1; angle = 0;
        break;
    case oSmallLightNS:
        xsize = 1; ysize = .7; size = .1; angle = 0;
        break;
    // --------
    case oSmallWallLightE:
        ox = x-3; xsize = .45; ysize = .7; size = .15; angle = 0;
        break;
    case oSmallWallLightW:
        ox = x+3; xsize = .45; ysize = .7; size = .15; angle = 0;
        break;
    case oSmallWallLightN:
        oy = y-3; xsize = .7; ysize = .45; size = .15; angle = 0;
        break;
    case oSmallWallLightS:
        oy = y+3; xsize = .7; ysize = .45; size = .15; angle = 0;
        break;
    // --------
    case oWallLightE:
        xsize = .7; ysize = 1; ox = x-4; size = .6; angle = 0;
        break;
    case oWallLightW:
        xsize = .7; ysize = 1; ox = x+4; size = .6; angle = 0;
        break;
    case oWallLightN:
        xsize = 1; ysize = .7; oy = y-4; size = .6; angle = 0;
        break;
    case oWallLightS:
        xsize = 1; ysize = .7; oy = y+4; size = .6; angle = 0;
        break;
    // --------
    case oDomeLight:
        size = .15; angle = random(360);
        break;
}
light1 = instance_create(ox,oy,oLight);
light1.image_xscale = size*xsize*eId.brightness;
light1.image_yscale = size*ysize*eId.brightness;
light1.image_blend = image_blend;
light1.image_angle = angle;
/*
light2 = instance_create(ox,oy,oLight);
light2.sprite_index = sprLightEffectBright;
light2.HasAmbient = 0;
light2.image_xscale = mastersize*size*xsize*.2*eId.brightness;
light2.image_yscale = mastersize*size*ysize*.2*eId.brightness;
light2.image_blend = image_blend;
light2.image_angle = angle;
