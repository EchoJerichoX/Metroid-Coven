// Place "oTestItemSpawner" in any room to create all items.
var offset,i;
offset = 24;
for (i = 0; i <= 17; i += 1;)
{
    var xx;
    xx = x+offset*i;
    switch (i)
    {
        case 0: case 1: case 2: case 3: case 4: case 5: case 6: o = instance_create(xx,y,oItem); break;
        case 7: case 8: case 9: o = instance_create(xx-offset*7,y+offset,oItem); break;
        case 10: case 11: case 12: o = instance_create(xx-offset*10,y+offset*2,oItem); break;
        case 13: case 14: case 15: case 16: case 17: o = instance_create(xx-offset*13,y+offset*3,oItem); break;
    }
    switch (i)
    {
        // --- Spawn beams ---
        case 0: with (o) scDefineItem(Items.iWaveBeam); break;
        case 1: with (o) scDefineItem(Items.iPlasmaBeam); break;
        case 2: with (o) scDefineItem(Items.iSpazerBeam); break;
        case 3: with (o) scDefineItem(Items.iPulseBeam); break;
        case 4: with (o) scDefineItem(Items.iIceBeam); break;
        case 5: with (o) scDefineItem(Items.iRuptureBeam); break;
        case 6: with (o) scDefineItem(Items.iPhazonBeam); break;
        // --- Spawn secondary weapons ---
        case 7: with (o) scDefineItem(Items.iMissileLauncher); break;
        case 8: with (o) scDefineItem(Items.iSuperMissile); break;
        case 9: with (o) scDefineItem(Items.iDiffuser); break;
        // --- Spawn suits ---
        case 10: with (o) scDefineItem(Items.iVariaSuit); break;
        case 11: with (o) scDefineItem(Items.iGravitySuit); break;
        case 12: with (o) scDefineItem(Items.iCorruptionSuit); break;
        // --- Spawn addons ---
        case 13: with (o) scDefineItem(Items.iMorphBall); break;
        case 14: with (o) scDefineItem(Items.iBallBomb); break;
        case 15: with (o) scDefineItem(Items.iPowerBomb); break;
        case 16: with (o) scDefineItem(Items.iArcDash); break;
        case 17: with (o) scDefineItem(Items.iLightsear); break;
    }
}
