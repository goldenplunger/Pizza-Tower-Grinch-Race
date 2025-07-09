function scr_player_jump()
{
	scr_getinput();
	move = key_left + key_right;

	if (momemtum == 0)
	    hsp = move * movespeed;
	else
	    hsp = xscale * movespeed;

	if (move != xscale && momemtum == 1 && movespeed != 0)
	    movespeed -= 0.05;

	if (movespeed == 0)
	    momemtum = 0;

	if ((move == 0 && momemtum == 0) or place_meeting(x + hsp, y, obj_collisionparent))
	{
	    movespeed = 0;
	    mach2 = 0;
	}

	if (move != 0 && movespeed < 6)
	    movespeed += 0.25;

	if (movespeed > 6)
	    movespeed -= 0.05;

	if (((place_meeting(x + 1, y, obj_collisionparent) && move == 1) or (place_meeting(x - 1, y, obj_collisionparent) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slopes))
	    movespeed = 0;

	if (dir != xscale)
	{
	    mach2 = 0;
	    dir = xscale;
	    movespeed = 0;
	}

	if (move == -xscale)
	{
	    mach2 = 0;
	    movespeed = 0;
	    momemtum = 0;
	}

	landAnim = 1;

	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
	    vsp /= 5;
	    jumpstop = 1;
	}

	if (ladderbuffer > 0)
	    ladderbuffer--;

	if (place_meeting(x, y - 1, obj_collisionparent) && jumpstop == 0 && jumpAnim == 1)
	{
	    vsp = grav;
	    jumpstop = 1;
	}

	if ((place_meeting(x, y + 1, obj_collisionparent) && input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0) && !(sprite_index == spr_player_facestomp or sprite_index == spr_player_freefall))
	{
	    scr_sound(sound_jump);
    
	    if (move == 0)
	        sprite_index = spr_player_jump;
    
	    if (move != 0)
	        sprite_index = spr_player_jump2;
    
	    if (shotgunAnim == 1)
	        sprite_index = spr_shotgun_jump;
    
	    instance_create(x, y, obj_highjumpcloud2);
	    stompAnim = 0;
	    vsp = -11;
	    state = states.jump;
	    jumpAnim = 1;
	    jumpstop = 0;
	    image_index = 0;
    
	    if (!place_meeting(x, y, obj_water2))
	        instance_create(x, y, obj_landcloud);
    
	    freefallstart = 0;
	}

	if (key_attack && place_meeting(x, y + 1, obj_collisionparent) && fallinganimation < 40)
	{
	    sprite_index = spr_player_mach1;
	    jumpAnim = 1;
	    state = states.mach1;
	    image_index = 0;
	}

	if ((place_meeting(x, y + 1, obj_collisionparent) && vsp > 0) && !key_attack)
	{
	    if (key_attack)
	        landAnim = 0;
    
	    input_buffer_secondjump = 0;
	    state = states.normal;
	    jumpAnim = 1;
	    jumpstop = 0;
	    image_index = 0;
    
	    if (!place_meeting(x, y, obj_water2))
	        instance_create(x, y, obj_landcloud);
    
	    freefallstart = 0;
	}

	if (place_meeting(x, y + 1, obj_collisionparent) && (sprite_index == spr_player_facestomp or sprite_index == spr_player_freefall))
	{
	    scr_sound(sound_maximumspeedland);
    
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
    
	    image_index = 0;
	    state = states.freefallland;
	}

	if (key_jump)
	    input_buffer_jump = 0;

	fallinganimation++;

	if (fallinganimation >= 40 && fallinganimation < 80)
	    sprite_index = spr_player_facestomp;

	if (fallinganimation >= 80)
	    sprite_index = spr_player_freefall;

	if (stompAnim == 0)
	{
	    if (jumpAnim == 1)
	    {
	        if (floor(image_index) == (image_number - 1))
	            jumpAnim = 0;
	    }
    
	    if (jumpAnim == 0)
	    {
	        if (sprite_index == spr_player_airdash1)
	            sprite_index = spr_player_airdash2;
        
	        if (sprite_index == spr_shotgun_jump)
	            sprite_index = spr_shotgun_fall;
        
	        if (sprite_index == spr_player_jump)
	            sprite_index = spr_player_fall;
        
	        if (sprite_index == spr_player_Sjumpstart)
	            sprite_index = spr_player_Sjump;
        
	        if (sprite_index == spr_player_jump2)
	            sprite_index = spr_player_fall2;
        
	        if (sprite_index == spr_player_shotgunjump1)
	            sprite_index = spr_player_shotgunjump2;
        
	        if (sprite_index == spr_shotgun_shootair)
	            image_index = 7;
	    }
	}

	if (stompAnim == 1)
	{
	    if (sprite_index == spr_player_stompprep && floor(image_index) == 4)
	        sprite_index = spr_player_stomp;
	}

	if (key_attack && sprite_index != spr_player_airdash2 && sprite_index != spr_player_airdash1 && fallinganimation < 40)
	{
	    stompAnim = 0;
	    sprite_index = spr_player_airdash1;
	    image_index = 0;
	}

	if (key_slap2 && shotgunAnim == 1 && global.ammo > 0)
	{
	    global.ammo -= 1;
	    instance_create(x, y + 80, obj_shotgunbulletdown);
	    vsp -= 11;
	    sprite_index = spr_player_shotgunjump1;
	    state = states.shotgun;
	    image_index = 0;
	}

	if (move != 0)
	    xscale = move;

	image_speed = 0.35;
	scr_collideandmove();
}