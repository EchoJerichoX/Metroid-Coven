if (ImmuneToPowerBomb > 0) ImmuneToPowerBomb -= 1;

switch(myid)
{
    case Enemies.eZoomer: scZoomerStep(); break;
    case Enemies.eGeemer: scGeemerStep(); break;
    case Enemies.eTurret: scTurretStep(); break;
    default: instance_destroy(); break;
}
