// This script runs within eId's Draw event.

// Do not draw HUD in certain cases.
if (room = TitleRoom)
or (room = IntroRoom)
or (room = DeathRoom)
or (!drawhud)
or (instance_exists(oDeathAnim)) exit;

// Draw v2.0 HUD.
scDrawHUD2();

// Draw v1.0 HUD.
//scDrawHUD1();
