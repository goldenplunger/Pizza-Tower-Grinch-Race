with (obj_player)
{
    switch (state)
    {
		case states.normal: scr_player_normal(); break;
		case states.slap: scr_player_slap(); break;
		case states.cheesepep: scr_player_cheesepep(); break;
		case states.cheesepepstick: scr_player_cheesepepstick(); break;
		case states.boxxedpep: scr_player_boxxedpep(); break;
		case states.pistolaim: scr_player_pistolaim(); break;
		case states.climbwall: scr_player_climbwall(); break;
		case states.knightpepslopes: scr_player_knightpepslopes(); break;
		case states.portal: scr_player_portal(); break;
		case states.secondjump: scr_player_secondjump(); break;
		case states.chainsawbump: scr_player_chainsawbump(); break;
		case states.handstandjump: scr_player_handstandjump(); break;
		case states.gottreasure: scr_player_gottreasure(); break;
		case states.knightpep: scr_player_knightpep(); break;
		case states.knightpepattack: scr_player_knightpepattack(); break;
		case states.meteorpep: scr_player_meteorpep(); break;
		case states.bombpep: scr_player_bombpep(); break;
		case states.grabbing: scr_player_grabbing(); break;
		case states.chainsawpogo: scr_player_chainsawpogo(); break;
		case states.shotgunjump: scr_player_shotgunjump(); break;
		case states.stunned: scr_player_stunned(); break;
		case states.highjump: scr_player_highjump(); break;
		case states.chainsaw: scr_player_chainsaw(); break;
		case states.facestomp: scr_player_facestomp(); break;
		case states.mach4: scr_player_mach4(); break;
		case states.timesup: scr_player_timesup(); break;
		case states.machroll: scr_player_machroll(); break;
		case states.pistol: scr_player_pistol(); break;
		case states.shotgun: scr_player_shotgun(); break;
		case states.machfreefall: scr_player_machfreefall(); break;
		case states.Throw: scr_player_throw(); break;
		case states.superslam: scr_player_superslam(); break;
		case states.slam: scr_player_slam(); break;
		case states.skateboard: scr_player_skateboard(); break;
		case states.grind: scr_player_grind(); break;
		case states.grab: scr_player_grab(); break;
		case states.punch: scr_player_punch(); break;
		case states.backkick: scr_player_backkick(); break;
		case states.uppunch: scr_player_uppunch(); break;
		case states.shoulder: scr_player_shoulder(); break;
		case states.backbreaker: scr_player_backbreaker(); break;
		case states.bossdefeat: scr_player_bossdefeat(); break;
		case states.bossintro: scr_player_bossintro(); break;
		case states.smirk: scr_player_smirk(); break;
		case states.pizzathrow: scr_player_pizzathrow(); break;
		case states.gameover: scr_player_gameover(); break;
		case states.Sjumpland: scr_player_Sjumpland(); break;
		case states.freefallprep: scr_player_freefallprep(); break;
		case states.runonball: scr_player_runonball(); break;
		case states.boulder: scr_player_boulder(); break;
		case states.keyget: scr_player_keyget(); break;
		case states.tackle: scr_player_tackle(); break;
		case states.slipnslide: scr_player_slipnslide(); break;
		case states.ladder: scr_player_ladder(); break;
		case states.jump: scr_player_jump(); break;
		case states.victory: scr_player_victory(); break;
		case states.comingoutdoor: scr_player_comingoutdoor(); break;
		case states.Sjump: scr_player_Sjump(); break;
		case states.Sjumpprep: scr_player_Sjumpprep(); break;
		case states.crouch: scr_player_crouch(); break;
		case states.crouchjump: scr_player_crouchjump(); break;
		case states.crouchslide: scr_player_crouchslide(); break;
		case states.mach1: scr_player_mach1(); break;
		case states.mach2: scr_player_mach2(); break;
		case states.mach3: scr_player_mach3(); break;
		case states.machslide: scr_player_machslide(); break;
		case states.bump: scr_player_bump(); break;
		case states.hurt: scr_player_hurt(); break;
		case states.freefall: scr_player_freefall(); break;
		case states.freefallland: scr_player_freefallland(); break;
		case states.hang: scr_player_hang(); break;
		case states.door: scr_player_door(); break;
		case states.barrelnormal: scr_player_barrelnormal(); break;
		case states.barrelfall: scr_player_barrelfall(); break;
		case states.barrelmach1: scr_player_barrelmach1(); break;
		case states.barrelmach2: scr_player_barrelmach2(); break;
		case states.barrelfloat: scr_player_barrelfloat(); break;
		case states.barrelcrouch: scr_player_barrelcrouch(); break;
		case states.barrelslipnslide: scr_player_barrelslipnslide(); break;
		case states.barrelroll: scr_player_barrelroll(); break;
		case states.current: scr_player_current(); break;
    }
    
    if (state == states.mach1 && place_meeting(x, y + 1, obj_collisionparent))
    {
        if (!audio_is_playing(sound_dash1))
            scr_sound(sound_dash1);
    }
    else
    {
        audio_stop_sound(sound_dash1);
    }
    
    if (state == states.mach2)
    {
        if (!audio_is_playing(sound_dash2))
            scr_sound(sound_dash2);
    }
    else
    {
        audio_stop_sound(sound_dash2);
    }
    
    if (state == states.mach3)
    {
        if (!audio_is_playing(sound_maxspeed))
            scr_sound(sound_maxspeed);
    }
    else
    {
        audio_stop_sound(sound_maxspeed);
    }
    
    if (state == states.machroll)
    {
        if (!audio_is_playing(sound_machroll))
            scr_sound(sound_machroll);
    }
    else
    {
        audio_stop_sound(sound_machroll);
    }
    
    if (state == states.Sjumpprep)
    {
    }
    else
    {
        audio_stop_sound(sound_superjumpcharge2);
    }
    
    if (suplexmove == 1 && place_meeting(x, y + 1, obj_collisionparent))
        suplexmove = 0;
    
    if (state != states.normal && state != states.jump && state != states.crouch && state != states.grab && state != states.Throw)
        shotgunAnim = 0;
    
    if (obj_player.state != states.handstandjump)
        grav = 0.5;
    
    if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
        instance_create(x + random_range(-5, 5), y + 46, obj_vomit);
    
    if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
    {
        with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
            sprite_index = spr_vomit2;
    }
    
    if (global.combotime > 0)
        global.combotime -= 0.5;
    
    if (global.combotime == 0 && global.combo != 0)
        global.combo = 0;
    
    if (input_buffer_jump < 8)
        input_buffer_jump++;
    
    if (input_buffer_secondjump < 8)
        input_buffer_secondjump++;
    
    if (input_buffer_highjump < 8)
        input_buffer_highjump++;
    
    if (slapbuffer < 8)
        slapbuffer++;
    
    if (key_particles == 1)
        instance_create(random_range(x + 25, x - 25), random_range(y + 35, y - 25), obj_keyeffect);
    
    if (!place_meeting(x + sign(hsp), y, obj_collisionparent) && !place_meeting(x + sign(hsp), y + 1, obj_collisionparent) && place_meeting(x + sign(hsp), y + 2, obj_collisionparent))
        goingdownslope = 1;
    else
        goingdownslope = 0;
    
    if (place_meeting(x + sign(hsp), y, obj_collisionparent) && !place_meeting(x + sign(hsp), y - 1, obj_collisionparent))
        goingupslope = 1;
    else
        goingupslope = 0;
    
    if (inv_frames == 0 && hurted == 0)
        image_alpha = 1;
    
    if (state == states.mach2 or state == states.skateboard or state == states.knightpep or state == states.boxxedpep or state == states.cheesepep or state == states.knightpepslopes or state == states.knightpepattack or state == states.bombpep or state == states.facestomp or state == states.machfreefall or state == states.facestomp or state == states.machroll or state == states.mach3 or state == states.superslam or state == states.freefall or state == states.Sjump)
        attacking = 1;
    else
        attacking = 0;
    
    if (state == states.Throw or state == states.punch or state == states.backkick or state == states.shoulder or state == states.uppunch)
        grabbing = 1;
    else
        grabbing = 0;
    
    if (state == states.mach3 or state == states.skateboard or state == states.mach4 or state == states.freefall or state == states.superslam or state == states.Sjump or state == states.machroll or state == states.machfreefall)
        instakillmove = 1;
    else
        instakillmove = 0;
    
    if (flash == 1 && alarm[0] <= 0)
        alarm[0] = 0.15 * room_speed;
    
    if (state != states.mach3 && state != states.machslide)
        autodash = 0;
    
    if ((state != states.jump && state != states.crouchjump && state != states.slap) or vsp < 0)
        fallinganimation = 0;
    
    if (state != states.freefallland && state != states.normal && state != states.machslide)
        facehurt = 0;
    
    if (state != states.normal && state != states.machslide)
        machslideAnim = 0;
    
    if (state != states.normal)
    {
        idle = 0;
        dashdust = 0;
    }
    
    if (state != states.mach1 && state != states.jump && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
        momemtum = 0;
    
    if (state != states.chainsaw)
        chainsaw = 50;
    
    if (movespeed < 8)
        dashdust = 0;
    
    if (state != states.Sjump && state != states.Sjumpprep)
        a = 0;
    
    if (state != states.grab && state != states.Throw && state != states.shoulder && state != states.punch && state != states.backkick && state != states.uppunch && state != states.slam)
        throwforce = 0;
    
    if (state != states.facestomp)
        facestompAnim = 0;
    
    if (state != states.pistol && state != states.shotgun && state != states.shotgunjump)
        shoot = 1;
    
    if (state != states.slam)
        slamming = 0;
    
    if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
        superslam = 0;
    
    if (state != states.mach2)
        machpunchAnim = 0;
    
    if (state != states.mach2)
        machfreefall = 0;
    
    if (state != states.jump)
        ladderbuffer = 0;
    
    if (state != states.jump)
        stompAnim = 0;
    
    if ((state == states.mach3 or state == states.mach2 or state == states.machroll or state == states.handstandjump or (state == states.machslide && mach2 >= 100)) && !instance_exists(obj_mach3effect))
    {
        toomuchalarm1 = 6;
        instance_create(x, y, obj_mach3effect);
    }
    
    if (toomuchalarm1 > 0)
    {
        toomuchalarm1 -= 1;
        
        if (toomuchalarm1 <= 0 && (state == states.mach3 or state == states.mach2 or (state == states.machslide && mach2 >= 100) or state == states.machroll or state == states.handstandjump or (state == states.chainsaw && mach2 >= 100)))
        {
            instance_create(x, y, obj_mach3effect);
            toomuchalarm1 = 6;
        }
    }
    
    if (state != states.freefall && state != states.superslam)
        obj_camera.zoom = 0;
    
    if (state != states.bump && state != states.crouch && state != states.boxxedpep && (state != states.pistol && sprite_index != spr_player_crouchshoot) && state != states.Sjumpprep && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchslide && state != states.crouchjump)
        mask_index = spr_player_mask;
    else
        mask_index = spr_crouchmask;
    
    if (state == states.gottreasure or sprite_index == spr_knightpep_start or sprite_index == spr_knightpep_thunder or state == states.keyget or state == states.door or state == states.victory or state == states.comingoutdoor)
        cutscene = 1;
    else
        cutscene = 0;
    
    if (state != states.hurt)
        hurtsound = 0;
    
    if ((place_meeting(x, y, obj_door) or (place_meeting(x, y, obj_keydoor) && global.keyget == 1) or (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && place_meeting(x, y + 1, obj_collisionparent) && state == states.normal)
        instance_create(x, y, obj_uparrow);
    
    if (global.hp <= 0 && room != timesuproom)
    {
        state = states.timesup;
        room = timesuproom;
    }
    
    if (state == states.mach2 && !instance_exists(obj_speedlines))
        instance_create(x, y, obj_speedlines);
}