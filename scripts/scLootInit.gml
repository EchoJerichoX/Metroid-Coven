// See the bottom of this script for a guide on how this loot system works.
// Initializes all of the game's loot systems and their drops.
// See scLootClass. That is where actors have their loot classes set.

// Standard loot table...
drop[0]

// This system works much like Link to the Past's prize packs. Enemies
//   and certain destructibles will share prize packs based on how we
//   classify them in this script. For example, you can group all supply
//   crates into one "class", so they all have a similar drop pool. You
//   can still adjust things like quantity of drops within each object's
//   various destruction events.
// How loot drops in this system is that, assuming the prize pack is not
//   "empty" (never drops loot), we drop item #1 on the first kill, item
//   #2 on the second kill, etc. With each kill, the group's kill counter
//   increases by one, which determines what drops with each kill. If the
//   player takes damage, the counter goes down a bit, or starts over
//   depending on the loot class.
// Furthermore, you can control what types of actions against these loot-
//   dropping entities determine what loot drops. For example, you can
//   have enemies never drop loot if they are killed by the Arc Dash, or
//   always drop ammo when they are killed by Ball Bombs.
// ---
// Loot drops...
// - Missiles (2).
// - Missiles (5).
// - Super Missile (1).
// - Super Missiles (2).
// - Power Bomb (1).
// - Energy (10).
// - Energy (20).
// - Energy (50).
// - Energy (100).
// ---
// Loot classes (argument 0)...
//   0 = Empty. Does not drop loot at all.
//   1 = Standard. Drops seemingly random items. Alternate between health
//       and ammo, in small denominations until reaching the end of the
//       prize pack, dropping the biggest denominations before resetting
//       the pack.
//   2 = Health-focused. Drops only health items.
//   3 = Ammo-focused. Drops only ammo items.
//   4 = Missiles only.
//   5 = Super Missiles only.
//   6 = Power Bombs only.
//   7 = Phazon and standard class items.
