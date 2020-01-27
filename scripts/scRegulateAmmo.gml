// This script prevents you from carrying more ammo than your capacity.
// argument0 should be a weapon ID or -1 for the current weapon.
if (scWeaponGetAmmo(argument0) > scWeaponGetAmmoMax(argument0))
    { scWeaponSetAmmo(argument0,scWeaponGetAmmoMax(argument0)); }
