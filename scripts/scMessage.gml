/*
Argument 0 = Message to print.
    Messages stored in scEIDMessagesInit.
Argument 1 = Pause the game during the message?
    0 = No, message will print organically a different way while gameplay can still happen and things
        are still animating.
    1 = Yes, freeze animations and control while the message displays.
    2 = ***TEMPORARY*** Pause button in place of subscreen display. Stops everything instantly with no
        smooth transition.
Argument 2 = Is this a message shown via Scan Visor?
    Only use if argument 0 = 1. All it does currently is change how the screen looks when the message
        is shown.
*/
switch (argument1)
{
    case 0:
        break;
    case 1:
        with (eId)
        {
            if (fadeStage = -1)     // -1 means there is no message being shown at all.
            {
                scPause();          // Pause the game for this message type.
                fadeStage = 0;      // Begin the message display process. Setting fadeStage to 0 puts
                                    //   you at the "fade in" step.
                text = argument0;   // Set text to be shown. Messages stored in scEITMessagesInit.
                enterdelay = 5;     // The delay in frames before the player can hit <Enter> to
                                    //   (usually forcibly) progress the message to the next step.
                scan = argument2;   // Display message differently if it is sent by the Scan Visor.
            }
        }
        break;
    case 2:
        scPause();
        break;
}
