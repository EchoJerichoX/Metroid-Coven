// Runs within oDestructibleBlockParent. 
// argument0 = Type of object the block was hit by.
// 1 = oProjectile.
// 2 = oExplosion.
// 3 = oPowerBombExplosion.
// 4 = oEffect and oPlayer.

// Exception list (blocks should only be
//   breakable by the player for now).
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

if (other.sprite_index = sprBallBomb) 
or (other.sprite_index = sprBallBombCharge) exit;

var st = tile_layer_find(eId.secrettilelayer,x+sprite_width/2,y+sprite_height/2);
                        
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
                if (argument0 = 2)
                {
                    if (other.sprite_index = sprBallBombExplosion)
                    { 
                        if (st) tile_set_visible(st,0);
                        image_alpha = 1;
                    }
                }
                if (argument0 = 3) instance_destroy();
                break;
            case Blocks.bMissile:
                if (argument0 = 1)
                    { if (other.myid = Weapons.wMissileLauncher) or (other.myid = Weapons.wSuperMissile) instance_destroy(); }
                if (argument0 = 2)
                {
                    if (other.sprite_index = sprMissileExplosion)
                    or (other.sprite_index = sprSuperMissileExplosion) instance_destroy();
                    if (other.sprite_index = sprBallBombExplosion)
                    { 
                        if (st) tile_set_visible(st,0);
                        image_alpha = 1;
                    }
                }
                break;
            case Blocks.bSuperMissile:
                if (argument0 = 1)
                    { if (other.myid = Weapons.wSuperMissile) instance_destroy(); }
                if (argument0 = 2)
                {
                    if (other.sprite_index = sprSuperMissileExplosion) instance_destroy();
                    if (other.sprite_index = sprBallBombExplosion)
                    { 
                        if (st) tile_set_visible(st,0);
                        image_alpha = 1;
                    }
                }
                break;
            case Blocks.bArcDash:
                if (argument0 = 2)
                {
                    if (other.sprite_index = sprBallBombExplosion)
                    { 
                        if (st) tile_set_visible(st,0);
                        image_alpha = 1;
                    }
                }
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
