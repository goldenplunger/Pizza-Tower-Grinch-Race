function scr_player_freefall()
{
	scr_getinput();
	hsp = 0;
	landAnim = 1;
	sprite_index = spr_player_bodyslamfall;

	if (!instance_exists(obj_freefallhitbox))
	    instance_create(x, y, obj_freefallhitbox);

	if (place_meeting(x, y + 1, obj_collisionparent) && !(input_buffer_jump < 8))
	{
	    scr_sound(sound_maximumspeedland);
	    image_index = 0;
	    state = states.freefallland;
	    jumpAnim = 1;
	    jumpstop = 0;
    
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
    
	    combo = 0;
	    bounce = 0;
    
	    if (!place_meeting(x, y, obj_water2))
	        instance_create(x, y, obj_landcloud);
    
	    freefallstart = 0;
	}

	image_speed = 0.35;
	scr_collideandmove();
}