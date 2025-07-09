function scr_enemy_hit()
{
	if (place_meeting(x, y - 1, obj_enemiesbumpable) && (sprite_index == flyingspr or sprite_index == hitspr))
	{
	    image_index = 0;
	    state = 85;
	}

	if (straightthrow == 1)
	    vsp = 0;

	if (vsp < 0 && floor(image_index) != 2 && sprite_index != flyingspr)
	    sprite_index = hitspr;
	else if (vsp < 0)
	    sprite_index = flyingspr;
	else if (sprite_index == flyingspr)
	    sprite_index = stunfalltransspr;
	else if (floor(image_index) == 4 && sprite_index == stunfalltransspr)
	    sprite_index = stunfallspr;

	if (place_meeting(x, y + 1, obj_enemiesbumpable) && floor(vsp) > 0)
	{
	    instance_create(x, y, obj_landcloud);
	    state = states.stun;
	    image_index = 0;
	}

	image_speed = 0.35;

	if (((place_meeting(x + 1, y, obj_enemiesbumpable) && image_xscale == -1) or (place_meeting(x - 1, y, obj_enemiesbumpable) && image_xscale == 1)) && vsp > -5 && !place_meeting(x + sign(hsp), y, obj_slopes))
	{
	    image_index = 0;
	    sprite_index = hitwallspr;
	    state = 86;
	}

	scr_collideandmovesidethrow();
}