function scr_player_slipnslide()
{
	scr_getinput();
	mach2 = 0;
	jumpAnim = 1;
	dashAnim = 1;
	landAnim = 0;
	moveAnim = 1;
	stopAnim = 1;
	crouchslideAnim = 1;
	crouchAnim = 0;
	machhitAnim = 0;
	hsp = xscale * movespeed;

	if (!place_meeting(x, y + 1, obj_slopes))
	{
	    if (movespeed >= 0)
	        movespeed -= 0.2;
	}
	else
	{
	    movespeed += 0.2;
	}

	machhitAnim = 0;
	crouchslideAnim = 1;

	if (movespeed == 0 && !place_meeting(x, y + 1, obj_slopes))
	{
	    state = states.normal;
	    movespeed = 0;
	    mach2 = 0;
	    image_index = 0;
	}

	if (place_meeting(x + 1, y, obj_bumpable) && xscale == 1)
	{
	    state = states.bump;
	    hsp = -2;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x + 10, y + 10, obj_bumpeffect);
	}

	if (place_meeting(x - 1, y, obj_bumpable) && xscale == -1)
	{
	    state = states.bump;
	    hsp = 2;
	    vsp = -3;
	    mach2 = 0;
	    image_index = 0;
	    instance_create(x - 10, y + 10, obj_bumpeffect);
	}

	sprite_index = spr_player_slipnslide;
	image_speed = 0.35;

	if (!instance_exists(obj_slidecloud) && place_meeting(x, y + 1, obj_collisionparent) && movespeed > 1.5)
	    instance_create(x, y, obj_slidecloud);

	scr_collideandmove();
}