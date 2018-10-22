if (fadeout) and (image_alpha <= 0) exit;

switch (myid)
{
// ===== Player Beams =====
// --- Power Beam ---
    case Weapons.wPowerBeam:
        sound_play(BeamImpact1);
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprBeamExplosion1;
            image_blend = c_yellow;
            image_speed = .25;
            if (other.Charger < 60) scProjectileLight(.1,c_white,c_yellow,.3);
            else
                { scProjectileLight(.4,c_white,c_yellow,.6); scDiffuserBurst(); }
        }
        break;
// --- Wave Beam ---
    case Weapons.wWaveBeam:
        sound_play(BeamImpact2);
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprBeamExplosion1;
            image_blend = c_purple;
            image_speed = .25;
            if (other.Charger < 60) scProjectileLight(.1,c_white,c_purple,.3);
            else
                { scProjectileLight(.4,c_white,c_purple,.6); scDiffuserBurst(); }
        }
        break;
// --- Plasma Beam ---
    case Weapons.wPlasmaBeam:
        sound_play(BeamImpact3);
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprPlasmaExplosion;
            image_speed = .5;
            image_alpha = 1;
            if (other.Charger < 60) scProjectileLight(.1,c_white,c_orange,.3);
            else
                { scProjectileLight(.4,c_white,c_orange,.6); scDiffuserBurst(); }
        }
        break;
// --- Spazer Beam ---    
    case Weapons.wSpazerBeam:
        sound_play(BeamImpact1);
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprBeamExplosion1;
            image_blend = c_lime;
            image_speed = .25;
            if (other.Charger < 60) scProjectileLight(.1,c_white,c_lime,.3);
            else
                { scProjectileLight(.4,c_white,c_lime,.6); scDiffuserBurst(); }
        }
        break;
// --- Pulse Beam ---
    case Weapons.wPulseBeam:
        sound_play(BeamImpact1);
        with (instance_create(x,y,oDestroyAnim))
        {
            sprite_index = sprBeamExplosion1;
            image_blend = make_color_rgb(0,255,255);
            image_speed = .25;
            if (other.Charger < 60) scProjectileLight(.1,c_white,make_color_rgb(0,255,255),.3);
            else scProjectileLight(.4,c_white,make_color_rgb(0,255,255),.6);
        }
        break;
// --- Ice Beam ---
    case Weapons.wIceBeam:
        sound_play(choose(IceBeamImpact1,IceBeamImpact2,IceBeamImpact3));
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprBeamExplosion1;
            image_blend = make_color_rgb(94,174,255);
            image_speed = .25;
            if (other.Charger < 60) scProjectileLight(.1,c_white,make_color_rgb(94,174,255),.3);
            else
                { scProjectileLight(.4,c_white,make_color_rgb(94,174,255),.6); scDiffuserBurst(); }
        }
        break;
// --- Rupture Beam ---
    case Weapons.wRuptureBeam:
        if (particle)
        {
            sound_play(BeamImpact1);
            with (instance_create(x,y,oDestroyAnim))
            {
                sprite_index = sprBeamExplosion2;
                image_blend = c_orange;
                image_speed = .25;
                image_xscale = .5;
                image_yscale = .5;
                scProjectileLight(.05,c_white,c_orange,.2);
            }
        }
        else
        {
            sound_play(BeamImpact4);
            with (instance_create(x,y,oDestroyAnim))
            {
                myid = other.myid;
                Charger = other.Charger;
                sprite_index = sprBeamExplosion2;
                image_blend = c_orange;
                image_speed = .25;
                var PartAmount;
                if (other.Charger < 60)
                    { scProjectileLight(.1,c_white,c_orange,.3); PartAmount = 6; }
                else
                    { scProjectileLight(.4,c_white,c_orange,.6); PartAmount = 18; scDiffuserBurst(); }
                repeat (PartAmount)
                {
                    with (instance_create(x,y,oProjectile))
                    {
                        Charger = other.Charger;
                        direction = random(360);
                        particle = 1; // Tell the object that it is the particle, not the main projectile.
                        scDefineProjectilePlayer(Weapons.wRuptureBeam);
                        alarm[1] = 2;
                    }
                }
            }
        }
        break;
// --- Phazon Beam ---
    case Weapons.wPhazonBeam:
        sound_play(BeamImpact2);
        with (instance_create(x,y,oDestroyAnim))
        {
            myid = other.myid;
            sprite_index = sprBeamExplosion3;
            image_blend = c_blue;
            image_speed = .25;
            if (other.Charger < 60)
            {
                image_xscale = 0.7;
                image_yscale = 0.7;
                scProjectileLight(.1,c_white,c_blue,.3);
            }
            else
                { scProjectileLight(.4,c_white,c_blue,.6); scDiffuserBurst(); }
        }
        break;
// ===== Player Secondary Weapons and Addons =====
// --- Missile ---
    case Weapons.wMissileLauncher:
        sound_play(MissileExplosion);
        repeat (20)
        {
            with (instance_create(x,y,oDestroyAnim))
            {
                sprite_index = sprMissileSmoke;
                direction = random(360);
                image_angle = random(360);
                speed = random_range(.5,1.25);
                image_speed = random_range(.3,.6);
            }
        }
        with (instance_create(x,y,oExplosion))
        {
            hittype = 2;
            sprite_index = sprMissileExplosion;
            image_speed = .25;
            Damage = 0.5;
            scProjectileLight(.2,c_white,c_orange,.6)
        }
        break;
// --- Super Missile ---
    case Weapons.wSuperMissile:
        sound_play(SuperMissileExplosion);
        with (instance_create(x,y,oDestroyAnim))
        {
            sprite_index = sprShockwave;
            image_xscale = 0.2;
            image_yscale = image_xscale;
            image_alpha = 0.5;
        }
        repeat (40)
        {
            with (instance_create(x,y,oDestroyAnim))
            {
                sprite_index = sprSuperMissileSmoke;
                direction = random(360);
                image_angle = random(360);
                speed = random_range(.5,1.25);
                image_speed = random_range(.3,.6);
            }
        }
        with (instance_create(x,y,oExplosion))
        {
            hittype = 3;
            sprite_index = sprSuperMissileExplosion;
            image_speed = .25;
            Damage = 1;
            scProjectileLight(.3,c_white,c_purple,.7)
        }
        scViewShake(8,0.5);
        break;
// --- Ball Bomb ---
    case Weapons.wBallBomb:
        sound_play(BombExplosion);
        with (instance_create(x,y,oExplosion))
        {
            myid = other.myid;
            hittype = 4; // Bomb.
            sprite_index = sprBallBombExplosion;
            playerweapon = 1;
            image_speed = .5;
            Damage = 6;
            scProjectileLight(.2,c_white,make_color_rgb(94,174,255),.4);
        }
        if (instance_exists(oPlayer)) oPlayer.ExistingBombs -= 1;
        break;
// ===== Enemy Beams =====
// --- Turret Bolt ---
    case Projectiles.pTurret:
        sound_play(BeamImpact1);
        with (instance_create(x,y,oDestroyAnim))
        {
            sprite_index = sprBeamExplosion1;
            image_blend = c_red;
            image_speed = .25;
            scProjectileLight(.4,c_white,c_red,.6);
        }
        break;
}
