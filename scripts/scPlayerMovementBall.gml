if (KeyUp) motion_add(90,0.75);
if (KeyLeft) motion_add(180,0.75);
if (KeyDown) motion_add(270,0.75);
if (KeyRight) motion_add(0,0.75);

if ((KeyUp+KeyLeft+KeyDown+KeyRight) = 0)
    { AnimationTimer = 0; }
else AnimationTimer += 1;

if (AnimationTimer = BallAnimationLimit)
{
    if (BallAnimationStart != BallAnimationEnd)
    {
        image_single += 1;
        if (image_single > BallAnimationEnd) image_single = BallAnimationStart;
    }
    AnimationTimer = 0;
}

if (speed > MaxBallSpeed) speed = MaxBallSpeed;
image_angle = direction;
