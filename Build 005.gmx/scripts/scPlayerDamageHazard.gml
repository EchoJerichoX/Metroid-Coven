// Calls damage to player against environmental hazards.
switch (other.sprite_index)
{
    case sprBarriaSpikes: scPlayerDamage(14,20,1); break;
    default: show_message("No sprite set for hazard.#No Damage to assign!#See collision event with oActor in oPlayer object."); exit; break; // Error-catcher.
}
