myid = argument0;
depth = 10;
stopdash = 1;

if (myid = Blocks.bSolid)      // Used just for a single, small blocking
    { image_alpha = 0; exit; } //   object that never gets destroyed.
    
var st = tile_layer_find(eId.secrettilelayer,x+sprite_width/2,y+sprite_height/2); 
if (st)
{
    if (tile_get_visible(st)) image_alpha = 0;
}
else image_alpha = 1;
switch (object_index)
{
    case oBlock16:
        switch (myid)
        {
            case Blocks.bBasic: sprite_index = sprBasicBlock16; break;
            case Blocks.bReform:
                sprite_index = sprReformBlock16;
                break;
            case Blocks.bBomb: sprite_index = sprBombBlock16; break;
            case Blocks.bPowerBomb: sprite_index = sprPowerBombBlock16; break;
            case Blocks.bMissile: sprite_index = sprMissileBlock16; break;
            case Blocks.bSuperMissile: sprite_index = sprSuperMissileBlock16; break;
            case Blocks.bArcDash: stopdash = 0; sprite_index = sprArcDashBlock16; break;
        }
        break;
    case oBlock8:
        switch (myid)
        {
            case Blocks.bBasic: sprite_index = sprBasicBlock8; break;
            case Blocks.bReform:
                sprite_index = sprReformBlock8;
                break;
            case Blocks.bBomb: sprite_index = sprBombBlock8; break;
            case Blocks.bPowerBomb: sprite_index = sprPowerBombBlock8; break;
            case Blocks.bMissile: sprite_index = sprMissileBlock8; break;
            case Blocks.bSuperMissile: sprite_index = sprSuperMissileBlock8; break;
            case Blocks.bArcDash: stopdash = 0; sprite_index = sprArcDashBlock8; break;
        }
        break;
}
