function scr_player_meteorpep()
{
	mach2 = 0;
	landAnim = 1;
	scr_getinput();
	vsp = 0;

	if (sprite_index == spr_meteorpep_impact && floor(image_index) == (image_number - 1))
	    sprite_index = spr_meteorpep_flying;

	if (sprite_index == spr_meteorpep_flying)
	{
	    if (movespeed <= 20)
	        movespeed += 1;
    
	    hsp = floor(-xscale * movespeed);
	}
	else
	{
	    hsp = 0;
	}

	if (place_meeting(x - 1, y, obj_collisionparent) && xscale == 1 && hsp != 0)
	{
	    movespeed = 0;
    
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
	    sprite_index = spr_meteorpep_land;
	}

	if (place_meeting(x + 1, y, obj_collisionparent) && xscale == -1 && hsp != 0)
	{
	    movespeed = 0;
    
	    if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
	    {
	        vsp = -7;
	        hsp = 0;
	    }
    
	    with (obj_camera)
	    {
	        shake_mag = 10;
	        shake_mag_acc = 30 / room_speed;
	    }
    
	    image_index = 0;
	    sprite_index = spr_meteorpep_land;
	}

	if (sprite_index == spr_meteorpep_land && floor(image_index) == (image_number - 1))
	    state = states.normal;

	image_speed = 0.35;
	scr_collideandmove();
}