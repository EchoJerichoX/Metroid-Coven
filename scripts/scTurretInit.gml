// General initializers.
enemy = 1;
ActorSprite = sprTurret;
ActorSpriteHit = sprTurretHit;
image_speed = 0;
damaged = 0;

// Movement and AI.
destdir = 0;
primarydir = -1;        // Tells the turret where its general facing is (center of sight cone).
                        //   Defined in room creation code.
mindir = 0;
maxdir = 0;
sightconesize = 120;    // Full size of sight cone, in degrees out of 360.
truerange = 200;        // How far the turret can see the player, in pixels.
range = truerange;      // The range changes dynamically if attacked.
angleDiffTurn = 0;
turnrate = 4;
turn = 1;               // Which direction to turn.
turnchangerate = 60;    // Time between changing direction for random sweeps.
turnchange = turnchangerate;
lastturn = 1;           // Last direction it tried to turn. Switches to alternate random rotation behavior.
attack = 0;
shotready = 1;
shotdelay = 60;         // Delay between bursts.
pulse = 0;
pulsedelay = 10;        // Delay between individual shots in each burst.
pulseready = pulsedelay;
target = 0;

// Attributes.
MaxHP = round(random_range(15,20))*0.5;
HP = MaxHP;
ImmuneToPowerBomb = 0;
CantTakeDamageFrom = noone;

// Lighting.
lightSlave = instance_create(x,y,oLight);
lightSlave.master = id;
lightSlave.LightSprite = sprTurretLights;
lightSlave.HasLight = 1;
lightSlave.HasAmbient = 0;
