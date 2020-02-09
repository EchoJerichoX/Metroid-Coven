// argument0 = Type of object the block was hit by.
// 1 = oProjectile.
// 2 = oExplosion.
// 3 = oPowerBombExplosion.

// Exception list (blocks should only be
//   breakable by the player for now)...
/*
switch (argument0)
{
    case 1:
        // Insert "if other.myid = Weapons.wEnemyBeam" or something here, with "exit;".
        break;
    case 2:
        // Insert "if other.myid = Weapons.wEnemySplash" or something here, with "exit;".
        break;
}
*/
if (other.sprite_index = sprBallBomb) exit;
switch (object_index)
{
    case oBlock16:
    case oBlock8:
        switch (myid)
        {
            case Blocks.bBasic:
            case Blocks.bReform:
                instance_destroy();
                break;
            case Blocks.bBomb:
                if (argument0 = 2)
                    { if (other.sprite_index = sprBallBombExplosion) instance_destroy(); }
                if (argument0 = 3) instance_destroy();
                break;
            case Blocks.bPowerBomb:
                if (argument0 = 3) instance_destroy();
                break;
            case Blocks.bMissile:
                if (argument0 = 1)
                    { if (other.myid = Weapons.wMissileLauncher) or (other.myid = Weapons.wSuperMissile) instance_destroy(); }
                if (argument0 = 2)
                    { if (other.sprite_index = sprMissileExplosion) or (other.sprite_index = sprSuperMissileExplosion) instance_destroy(); }
                break;
            case Blocks.bSuperMissile:
                if (argument0 = 1)
                    { if (other.myid = Weapons.wSuperMissile) instance_destroy(); }
                if (argument0 = 2)
                    { if (other.sprite_index = sprSuperMissileExplosion) instance_destroy(); }
                break;
            case Blocks.bArcDash:
                if (argument0 = 4) 
                {
                    if (other.object_index = oPlayer) 
                        { if (other.boosting) instance_destroy(); }
                    if (other.sprite_index = sprArcDashTrail) instance_destroy();
                }
                break;
        }
        break;
    case oIceLR:
    case oIceUD:
        if (other.myid = Weapons.wMissileLauncher) or (other.myid = Weapons.wSuperMissile) instance_destroy();
        break;
}
