// --- General ---
Energy = 100;
EnergyTanks = 0;
FullTanks = 0;
GainEnergy = 0;
Accel = 1;

//Starting ammo amounts.
scWeaponInitValues(Weapons.wMissileLauncher,10);
scWeaponInitValues(Weapons.wSuperMissile,3);
scWeaponInitValues(Weapons.wPowerBomb,2);
scWeaponInitValues(Weapons.wPhazonBeam,0);

//Other weapon variables.
Heat = 0; // See variable "Heating" in scDefineWeapon for the rate at which the Plasma Beam heats up.
CoolRate = 0.25; // Rate at which the Plasma Beam cools down.
Overheated = 0;
Charger = 0;
ChargeRate = 1.4;
ShotTimer = 0;
