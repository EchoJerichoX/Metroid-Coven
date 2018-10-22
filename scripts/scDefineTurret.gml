// Takes the place of scDefineActor in room object creation code.
// Determines the starting facing direction of the turret, and points
//   it that way. After that, it still just runs scDefineActor like
//   normal, but within this script.
// Refer to its block in scDefineActor for the remaining creation code.
// argument0 = primarydir. The main facing direction of the turret, and
//   the center of the sight cone.

scDefineActor(Enemies.eTurret);
primarydir = argument0;
direction = primarydir;
