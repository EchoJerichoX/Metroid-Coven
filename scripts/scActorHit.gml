// Runs in various collision events of oActor.
if (enemy = 1) // If the actor running this script is an enemy...
{
    if (other.playerweapon = 1)                 // 
    and (other.sprite_index != sprBallBomb)     // Damage conditions for Bombs and Power Bombs are handled
    and (other.sprite_index != sprPowerBomb)    //   in the explosion not the "projectile" itself
        { scDamageEnemy(); }
}
