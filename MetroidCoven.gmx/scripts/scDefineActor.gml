// Runs at the creation of every actor (not in the create event, but when created remotely.
myid = argument0;
// Pause handling.
impaused = 0;
held = 0;
inputspeed = 0;
ispeed = 0;
inputimspeed = 0;
switch(myid)
{
    case Enemies.eZoomer:
        enemy = 1; // Determine the actor is not friendly.
        ActorSprite = sprZoomer; // Base sprite we use for this actor.
        ActorSpriteHit = sprZoomerHit; // Hit sprite (220 brightness, 0 saturation of base sprite).
        MaxSpeed = 2.25;
        MaxHP = round(random_range(7,10))*0.5;
        HP = MaxHP;
        ImmuneToBomb = 0;
        ImmuneToPowerBomb = 0;
        CantTakeDamageFrom = noone;
        turnrate = 5; // How fast we turn towards "destdir."
        direction = round(random(360/turnrate))*turnrate;
        image_angle = direction;
        destdir = 0; // The target rotation for turning state.
        staterate = 50; // How fast states change.
        stateratemultiplier = 5; // Multiplies the statetimer.
                                 //   Change to change the variation in state changes.
        statechange = staterate+round(random(staterate*stateratemultiplier)); // After reaching 0, we choose a new state, if possible.
        damaged = 0; // Determines if we took non-lethal damage.
        soundcanplay = 0; // Keeps hit sounds from overlapping.
        nearestden = noone;
        retreatcheckdelay = 1;
        mypath = path_add(); // Wander path.
        mypath2 = path_add(); // Retreat path.
        pspeed = 0;
        state = 0; // 0 = Idle.
                   // 1 = Turning.
                   // 2 = Moving.
                   // 3 = Retreating to den (on path).
                   // 4 = Burrow into den.
        break;
    // ---
    case Enemies.eTurret:
        enemy = 1;
        ActorSprite = sprTurret;
        ActorSpriteHit = sprTurretHit;
        MaxHP = round(random_range(15,20))*0.5;
        HP = MaxHP;
        ImmuneToPowerBomb = 0;
        CantTakeDamageFrom = noone;
        destdir = 0;
        primarydir = -1; // Tells the turret where its general facing is (center of sight cone).
                         // Defined in room creation code.
        mindir = 0;
        maxdir = 0;
        sightconesize = 120; // Full size of sight cone, in degrees out of 360.
        range = 300; // How far the turret can see the player, in pixels.
        angleDiffTurn = 0;
        turnrate = 4;
        turn = 1; // Which direction to turn.
        turnchangerate = 60; // Time between changing direction for random sweeps.
        turnchange = turnchangerate;
        lastturn = 1; // Last direction it tried to turn. Switches to alternate random rotation behavior.
        attack = 0;
        shotready = 1;
        shotdelay = 60; // Delay between bursts.
        pulse = 0;
        pulsedelay = 10; // Delay between individual shots in each burst.
        pulseready = pulsedelay;
        damaged = 0;
        image_speed = 0;
        target = 0;
        break;
    
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
