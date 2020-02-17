// Used for various supply creates, organic or otherwise.
switch (sprite_index)
{
    case sprCrateSmallBarria:
        lightspr = sprCrateSmallBarriaLights;
        hitspr = sprCrateSmallBarriaHit;
        size = 1;
        maxhp = round(random_range(3,5));
        lootclass = 15; // Small Container.
        break;
    case sprCrateMediumBarria:
        lightspr = sprCrateMediumBarriaLights;
        hitspr = sprCrateMediumBarriaHit;
        size = 2;
        maxhp = round(random_range(6,9));
        lootclass = 16; // Medium Container.
        break;
    case sprCrateLargeBarria:
        lightspr = sprCrateLargeBarriaLights;
        hitspr = sprCrateLargeBarriaHit;
        size = 3;
        maxhp = round(random_range(10,14));
        lootclass = 17; // Large Container.
        break;
}
image_index = round(random(4));
image_angle = random(360);
image_speed = 0;
hp = maxhp;
hitfade = 0;
soundcanplay = 0;
stopdash = 0;
ImmuneToBomb = 0;
lightSlave = instance_create(x,y,oLight);
lightSlave.master = id;
lightSlave.LightSprite = lightspr;
lightSlave.image_speed = 0;
lightSlave.image_angle = image_angle;
lightSlave.HasLight = 1;
lightSlave.HasAmbient = 0;
