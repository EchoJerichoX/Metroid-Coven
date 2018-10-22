if !(instance_exists(oItem)) exit;
with (oItem)
{
    if (myid = Items.iMorphBall) or (myid = Items.iBallBomb) alarm[0] = StepSpeed;
}
