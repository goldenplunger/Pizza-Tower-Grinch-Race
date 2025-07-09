function scr_player_mach1()
{
	scr_getinput();
	dir = xscale;
	move = key_left + key_right;
	landAnim = 0;

	if (place_meeting(x + 1, y, obj_collisionparent) && xscale == 1 && !place_meeting(x + 1, y, obj_slopes))
	{
	    mach2 = 0;
	    state = states.normal;
	    movespeed = 0;
	}

	if (place_meeting(x - 1, y, obj_collisionparent) && xscale == -1 && !place_meeting(x - 1, y, obj_slopes))
	{
	    mach2 = 0;
	    state = states.normal;
	    movespeed = 0;
	}

	if (movespeed <= 8)
	    movespeed += 0.25;

	machhitAnim = 0;
	crouchslideAnim = 1;

	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
	    hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
	    hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
	    hsp = (xscale * movespeed) + 5;

	if (place_meeting(x, y + 1, obj_collisionparent) && xscale == 1 && move == -1)
	{
	    momemtum = 0;
	    mach2 = 0;
	    movespeed = 0;
	    image_index = 0;
	    xscale = -1;
	}

	if (place_meeting(x, y + 1, obj_collisionparent) && xscale == -1 && move == 1)
	{
	    momemtum = 0;
	    mach2 = 0;
	    movespeed = 0;
	    image_index = 0;
	    xscale = 1;
	}

	if (place_meeting(x, y + 1, obj_collisionparent))
	{
	    if (mach2 < 35)
	        mach2++;
    
	    if (mach2 >= 35)
	    {
	        state = states.mach2;
	        instance_create(x, y, obj_jumpdust);
	    }
	}

	sprite_index = spr_player_mach1;

	if (!place_meeting(x, y + 1, obj_collisionparent))
	{
	    sprite_index = spr_player_airdash1;
	    momemtum = 1;
	    state = states.jump;
	    jumpAnim = 0;
	    image_index = 0;
	}

	if (!key_attack && place_meeting(x, y + 1, obj_collisionparent))
	{
	    state = states.normal;
	    image_index = 0;
	    mach2 = 0;
	}

	if (key_down)
	{
	    sprite_index = spr_player_crouchslip;
	    state = states.crouchslide;
	    mach2 = 0;
	}

	image_speed = 0.45;

	if (key_jump && place_meeting(x, y + 1, obj_collisionparent) && key_attack)
	{
	    scr_sound(sound_jump);
	    sprite_index = spr_player_airdash1;
	    dir = xscale;
	    momemtum = 1;
	    vsp = -11;
	    movespeed += 2;
	    state = states.jump;
	    jumpAnim = 1;
	    image_index = 0;
	}

	if (!instance_exists(obj_dashcloud) && !place_meeting(x, y, obj_water2) && place_meeting(x, y + 1, obj_collisionparent))
	    instance_create(x, y, obj_dashcloud);

	scr_collideandmove();
}