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
        size = .03; image_angle = random_range(-3,3); angle = random(360);
        break;
    // --------
    case oSmallLightEW:
        xsize = .3; size = .1; angle = 0;
        break;
    case oSmallLightNS:
        ysize = .3; size = .1; angle = 0;
        break;
    // --------
    case oSmallWallLightE:
    case oSmallWallLightW:
        xsize = .7; size = .1; angle = 0;
        break;
    case oSmallWallLightN:
    case oSmallWallLightS:
        ysize = .7; size = .1; angle = 0;
        break;
    // --------
    case oWallLightE:
    case oWallLightW:
        xsize = .7; size = .2; angle = 0;
        break;
    case oWallLightN:
    case oWallLightS:
        ysize = .7; size = .2; angle = 0;
        break;
    // --------
    case oDomeLight:
        size = .05; angle = random(360);
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
