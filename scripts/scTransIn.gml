if (instance_exists(oTransitionParent))
{
    with (oTransitionParent)
    {
        if (trans = eId.trans)
            { eId.tsx = x; eId.tsy = y; } // Get the position of the target transition object.
    }
}
switch (transdir)
{
    case 0: tsx += 72; break;
    case 90: tsy -= 72; break;
    case 180: tsx -= 72; break;
    case 270: tsy += 72; break;
}
oPlayer.x = tsx; oPlayer.y = tsy; oPlayer.image_angle = transdir; oPlayer.WeaponAim = transdir; // Place the player.
with (oPlayer)
{    
    persistent = false;
    with (torchSlave) persistent = false;
    with (suitSlave) persistent = false;
    with (oCannon) persistent = false;
}
with (oViewController) x = oPlayer.x; y = oPlayer.y;
