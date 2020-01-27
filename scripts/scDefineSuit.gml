// argument0 = Suit to define.
// AnimationStart/End = First and last frames in sprPlayer for the suit.
// DamageReduction = The amount the base damage is multiplied by...
//   ...So if the base damage is 10, and DamageReduction is 0.8, the damage the player takes is 8.

if (Suit > argument0) exit;
Suit = argument0;
switch (argument0)
{
    case Other.sPowerSuit:
        AnimationStart = 0;
        AnimationEnd = 15;
        BallAnimationStart = 0;
        BallAnimationEnd = 6;
        BallAnimationLimit = 2;
        MaxSpeed = 1.5;
        MaxBallSpeed = 2;
        DamageReduction = 1;
        break;
    case Other.sVariaSuit:
        AnimationStart = 16;
        AnimationEnd = 31;
        BallAnimationStart = 7;
        BallAnimationEnd = 13;
        BallAnimationLimit = 2;
        MaxSpeed = 1.5;
        MaxBallSpeed = 2;
        DamageReduction = 0.9;
        break;
    case Other.sGravitySuit:
        AnimationStart = 32;
        AnimationEnd = 47;
        BallAnimationStart = 14;
        BallAnimationEnd = 20;
        BallAnimationLimit = 2;
        MaxSpeed = 1.75;
        MaxBallSpeed = 2.25;
        DamageReduction = 0.8;
        //visorSlave.image_blend = make_color_rgb(94,174,255);
        //visorSlave.AmbientBlend = make_color_rgb(94,174,255);
        break;
    case Other.sCorruptionSuit:
        AnimationStart = 48;
        AnimationEnd = 63;
        BallAnimationStart = 21;
        BallAnimationEnd = 36;
        BallAnimationLimit = 1;
        MaxSpeed = 1.75;
        MaxBallSpeed = 2.25;
        DamageReduction = 0.7;
        break;
}
image_index = AnimationStart;
