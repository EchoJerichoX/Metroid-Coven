// Runs within scDefineActor.
// General initializers.
enemy = 1;                      // Determine the actor is not friendly.
ActorSprite = sprZoomer;        // Base sprite we use for this actor.
ActorSpriteHit = sprZoomerHit;  // Hit sprite (220 brightness, 0 saturation of base sprite).
CantTakeDamageFrom = noone;
destdir = 0;                    // The target rotation for turning state.
staterate = 50;                 // How fast states change.
stateratemultiplier = 5;        // Multiplies the statetimer.
                                //   Change this var to control the rate of state changes.
statechange = staterate+round(random(staterate*stateratemultiplier)); // After reaching 0, we choose a new state, if possible.
damaged = 0;            // Determines if we took non-lethal damage.
soundcanplay = 0;       // Keeps hit sounds from overlapping.
lootclass = 1; // Standard.
// Movement and AI.
MaxSpeed = 2.25;
turnrate = 5;               // How fast we turn towards "destdir."
direction = round(random(360/turnrate))*turnrate;
image_angle = direction;
nearestden = noone;
retreatcheckdelay = 1;
mypath = path_add();    // Wander path.
mypath2 = path_add();   // Retreat path.
pspeed = 0;
state = 0;  // 0 = Idle.
            // 1 = Turning.
            // 2 = Moving.
            // 3 = Retreating to den (on path).
            // 4 = Burrow into den.
// Attributes.
MaxHP = round(random_range(7,10))*0.5;
HP = MaxHP;
ImmuneToBomb = 0;
ImmuneToPowerBomb = 0;
// Lighting.
lightSlave = instance_create(x,y,oLight);
lightSlave.master = id;
lightSlave.LightSprite = sprZoomerLights;
lightSlave.HasLight = 1;
lightSlave.HasAmbient = 0;
