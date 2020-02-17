// Used for various supply creates, organic or otherwise.
image_angle = random(360);
switch (sprite_index)
{
    case sprCrateSmallBarria:
        image_index = round(random(4));
        size = 1;
        maxhp = round(random_range(3,5));
        lootclass = 15; // Small Container.
        break;
    case sprCrateMediumBarria:
        image_index = round(random(4));
        size = 2;
        maxhp = round(random_range(6,9));
        lootclass = 16; // Medium Container.
        break;
    case sprCrateLargeBarria:
        image_index = round(random(4));
        size = 3;
        maxhp = round(random_range(10,14));
        lootclass = 17; // Large Container.
        break;
}
image_speed = 0;
hp = maxhp;
hitfade = 0;
soundcanplay = 0;
stopdash = 0;
ImmuneToBomb = 0;
