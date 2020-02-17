// This script runs within scActorHit, at the end.
// Start by placing damage on the affected actor.
HP -= other.Damage; // Reduce health. Determined by the damaging object.
if (HP <= 0)
    { instance_destroy(); exit; }

switch (myid)
{
    case Enemies.eZoomer:
        if (other.myid = Weapons.wBallBomb)
        or (other.myid = Weapons.wPowerBomb)
        or (other.myid = Weapons.wArcDash)
        {
            instance_destroy();
            exit;
            //if (ImmuneToBomb) exit;
            //else ImmuneToBomb = 6;
        }
        if (HP < MaxHP/2) staterate = 20; // Speed up the state changes to exhibit panic.
        if (soundcanplay = 0)
            { sound_play(snZoomerHit) soundcanplay += 5+round(random(15)); }
        if (nearestden != noone)
        {
            mp_grid_path(eId.aigrid,mypath2,x,y,nearestden.x,nearestden.y,true);
            path_set_kind(mypath2,1);
            path_set_precision(mypath2,8);
            path_start(mypath2,1,path_action_stop,0);
            state = 4;
        }
        damaged = eId.hiteffectfadestart;
        break;
    // - - -
    case Enemies.eTurret:
        if (other.myid = Weapons.wBallBomb)
        or (other.myid = Weapons.wPowerBomb)
        or (other.myid = Weapons.wMissileLauncher)
        or (other.myid = Weapons.wSuperMissile)
        {
            instance_destroy();
            //if (ImmuneToBomb) exit;
            //else ImmuneToBomb = 6;
        }
        damaged = eId.hiteffectfadestart; break;
}
