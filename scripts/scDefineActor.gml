// Runs at the creation of every actor (not in the create event, but when created remotely.
myid = argument0;
// Pause handling.
impaused = 0;
held = 0;
inputspeed = 0;
baseispeed = 0.4;
ispeed = baseispeed;
inputimspeed = 0;
switch(myid)
{
    case Enemies.eZoomer: scZoomerInit(); break;
    case Enemies.eTurret: scTurretInit(); break;
    // //
    // Not done!
    // //
    case Enemies.eGeemer:
        enemy = 1;
        ActorSprite = sprGeemer;
        MaxSpeed = 1.5;
        destdir = random(360);
        depth = 7;
        state = 1; // Wandering.
        AnimationStart = 0;
        AnimationEnd = 7;
        break;
        
    default:
        enemy = 0;
        break;
}
sprite_index = ActorSprite;
