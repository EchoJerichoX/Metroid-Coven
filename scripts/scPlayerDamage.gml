// Damage the player.
// argument0 = minimum damage the player can take, before modifier(s).
// argument1 = maximum damage the player can take, before modifier(s).
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
        eId.etflash = 1; // Lost a tank.
        eId.etflashreset = eId.animdelay;
        if (FullTanks < 0) and (Energy <= 0) instance_destroy(); // Run "scPlayerDeath".
        if (FullTanks >= 0) Energy += 100;
    }
    if (Energy > 0)
    {
        // Player hurt sounds chooser.
        var shriek = random(100);
        var shriekchance = 25;      // Percentage chance of making a shrieking sound when taking damage.
        var smallshriek = 10;       // Damage threshold for small shriek sounds.
        var bigshriek = 35;         // Damage threshold for big shriek sounds.
        if (loss < smallshriek)
        {
            sound_play(choose(snSamusBonkSmall1,snSamusBonkSmall2,snSamusBonkSmall3,snSamusBonkSmall4));
            if (shriek < shriekchance) sound_play(choose(snSamusHurtMinor,snSamusHurtSmall1));
        }
        if (loss >= smallshriek) and (loss < bigshriek)
        {
            sound_play(choose(snSamusBonkMedium1,snSamusBonkMedium2,snSamusBonkMedium3,));
            if (shriek < shriekchance) sound_play(choose(snSamusHurtSmall2,snSamusHurtModerate));
        }
        if (loss >= bigshriek)
        {
            sound_play(choose(snSamusBonkBig1,snSamusBonkBig2));
            if (shriek < shriekchance) sound_play(snSamusHurtSevere);
        }
        /*
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
        */
    }
}
