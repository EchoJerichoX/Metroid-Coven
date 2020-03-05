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
        xsize = .07; ysize = .1; size = .5; angle = 0;
        break;
    case oSmallLightNS:
        xsize = .1; ysize = .07; size = .5; angle = 0;
        break;
    // --------
    case oSmallWallLightE:
    case oSmallWallLightW:
        xsize = .1; ysize = .07; size = .65; angle = 0;
        break;
    case oSmallWallLightN:
    case oSmallWallLightS:
        xsize = .07; ysize = .1; size = .65; angle = 0;
        break;
    // --------
    case oWallLightE:
    case oWallLightW:
        xsize = .1; ysize = .14; size = .8; angle = 0;
        break;
    case oWallLightN:
    case oWallLightS:
        xsize = .14; ysize = .1; size = .8; angle = 0;
        break;
    // --------
    case oDomeLight:
        size = .1; angle = random(360);
        break;
    // --------
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
