// Damage the player.
// argument0 = minimum damage the player can take, before modifier(s).
// argument1 = maximum damage the player can tage, before modifier(s).
// argument2 = bypass modifier(s). For armor-piercing or environmental hazards.
//   0 = Do not bypass modifiers.
//   1 = Bypass modifier(s).
//   This argument currently unused, pending modifier code.
// Runs in the oPlayer object.

// Insert "switch" statement here for different suit damage modifiers. Below is placeholder.
loss = round(random_range(argument0,argument1)); // Determine the amount of damage to deduct from current health.
if (argument2 = 0)
{
    // Insert modifier code here.
}
KnockbackDir = point_direction(other.x,other.y,x,y);
alarm[3] = 3; // See scPlayerStepInput for knockback. It runs through this alarm.
if (CanTakeHit)
{
    CanTakeHit = false;
    alarm[0] = 10; // Make sure we cannot be hit.
    Energy -= loss;
    if (Energy <= 0)
    {
        FullTanks -= 1;
        if (FullTanks < 0) and (Energy <= 0) instance_destroy(); // Run "scPlayerDeath".
        if (FullTanks >= 0) Energy += 100;
    }
    if (Energy > 0)
    {
        if (!sound_isplaying(SamusHurt1) and
            !sound_isplaying(SamusHurt2) and
            !sound_isplaying(SamusHurt3) and
            !sound_isplaying(SamusHurt4) and
            !sound_isplaying(SamusHurt5))
        {
            switch (choose(0,1,2,3,4))
            {
                case 0: sound_play(SamusHurt1); break;
                case 1: sound_play(SamusHurt2); break;
                case 2: sound_play(SamusHurt3); break;
                case 3: sound_play(SamusHurt4); break;
                case 4: sound_play(SamusHurt5); break;
            }
        }
    }
}
