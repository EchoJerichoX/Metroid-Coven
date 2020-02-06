/*
Argument 0 = fade direction. 0 = in, 1 = out.
Argument 1 = color to fade in from.
Argument 2 = starting alpha.
Argument 3 = fade-in rate.
*/
if (instance_exists(eId))
{
    with (eId)
    {
        fadedir = argument0;
        fadecolor = argument1;
        fadealpha = argument2;
        fadealpharate = argument3;
    }
}
