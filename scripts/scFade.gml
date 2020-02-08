/*
Argument 0 = fade direction. 0 = in, 1 = out.
Argument 1 = color to fade in from.
Argument 2 = starting alpha.
Argument 3 = fade-in rate.
*/
with (eId)
{
    fadecolor = argument0;
    fadealphagoal = argument1;
    fadealpharate = argument2;
    if (fadealphagoal = 0) fadealpha = 1;
    else fadealpha = 0;
}
