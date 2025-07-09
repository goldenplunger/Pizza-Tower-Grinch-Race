function scr_player_grab()
{
	scr_getinput();
	grav = 0.5;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	if (movespeed > 0)
	    movespeed -= 1;

	move = key_left2 + key_right2;
	image_speed = 0.35;

	if (key_attack2 && suplexhavetomash == 0)
	{
	    scr_sound(sound_slapswipe1);
	    instance_create(x, y, obj_shotgunbullet);
	    hsp = 0;
	    movespeed = 0;
	    state = states.Throw;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (move == xscale)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = states.punch;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (move == -xscale)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = states.backkick;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (key_up)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = states.uppunch;
	    image_index = 1;
	    image_speed = 0.35;
	    scr_sound(sound_enemyslap);
	}

	if (key_down)
	{
	    scr_sound(sound_suplex1);
	    hsp = 0;
	    movespeed = 0;
	    state = states.shoulder;
	    image_index = 1;
	    image_speed = 0.35;
    
	    with (obj_baddie)
	    {
	        if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
	        {
	            vsp = -7;
	            hsp = 0;
	        }
	    }
    
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = 30 / room_speed;
	    }
	}

	landAnim = 0;
	scr_collideandmove();

	if (key_jump)
	{
	    scr_sound(sound_jump);
	    hsp = 0;
	    movespeed = 0;
	    sprite_index = spr_player_piledriver;
	    vsp = -14;
	    state = states.superslam;
	    image_index = 0;
	    image_speed = 0.35;
	}

	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_suplexmash1 or spr_player_suplexmash1 or spr_player_suplexmash2 or spr_player_suplexmash3 or spr_player_suplexmash4))
	    sprite_index = spr_player_grab;
}