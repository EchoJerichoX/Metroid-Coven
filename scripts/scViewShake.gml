// Called from specific objects that want to shake the view,
//   not from within oViewController.
// ---
// argument0 = shake distance, in pixels.
// argument1 = shake reduction rate, how much argument0 decreases per step.
// ---
// Shaking is done by adding the "shake" variable to the view x and y.
// Maximum shake distance is set by "shakemax" variable in oViewController.
if (!instance_exists(oViewController)) exit; // Error-catcher.
with (oViewController)
{
    shake = argument0;
    shakerate = argument1;
}
