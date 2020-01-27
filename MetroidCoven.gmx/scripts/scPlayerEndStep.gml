if (alarm[0] > 0) CanTakeHit = false;
else CanTakeHit = true;

if (WeaponDistanceOffset != 0)
{
    var irecoil;
    irecoil = 0;
    WeaponXPosition = x+lengthdir_x(WeaponDistanceOffset+irecoil,WeaponDirectionOffset+image_angle);
    WeaponYPosition = y+lengthdir_y(WeaponDistanceOffset+irecoil,WeaponDirectionOffset+image_angle);
}
else 
    { WeaponXPosition = x; WeaponYPosition = y; }
    
if (eId.transitioning) or (eId.paused > 0) exit; // Leave current hidden area alpha levels alone
                                                 //   if we are transitioning or paused.

if (tile_layer_find(-1,x,y))
{
    if (eId.hiddenfade1 > 0)
        { eId.hiddenfade1 -= 0.05; scFadeHiddenArea(-1,eId.hiddenfade1); }
}
else if (eId.hiddenfade1 < 1)
    { eId.hiddenfade1 += 0.1; scFadeHiddenArea(-1,eId.hiddenfade1); }
// ===
if (tile_layer_find(-4,x,y))
{
    if (eId.hiddenfade2 > 0)
        { eId.hiddenfade2 -= 0.05; scFadeHiddenArea(-4,eId.hiddenfade2); }
}
else if (eId.hiddenfade2 < 1)
    { eId.hiddenfade2 += 0.1; scFadeHiddenArea(-4,eId.hiddenfade2); }
// ===
if (tile_layer_find(-7,x,y))
{
    if (eId.hiddenfade3 > 0)
        { eId.hiddenfade3 -= 0.05; scFadeHiddenArea(-7,eId.hiddenfade3); }
}
else if (eId.hiddenfade3 < 1)
    { eId.hiddenfade3 += 0.1; scFadeHiddenArea(-7,eId.hiddenfade3); }
// ===
if (tile_layer_find(-10,x,y))
{
    if (eId.hiddenfade4 > 0)
        { eId.hiddenfade4 -= 0.05; scFadeHiddenArea(-10,eId.hiddenfade4); }
}
else if (eId.hiddenfade4 < 1)
    { eId.hiddenfade4 += 0.1; scFadeHiddenArea(-10,eId.hiddenfade4); }
