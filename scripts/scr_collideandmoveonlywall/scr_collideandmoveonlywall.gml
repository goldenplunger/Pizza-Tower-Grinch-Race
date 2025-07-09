function scr_collideandmoveonlywall()
{
	repeat (abs(vsp))
	{
	    if (!place_meeting(x, y + sign(vsp), obj_enemiesbumpable) && !(vsp >= 0 && (place_meeting(x, y + 1, obj_onewaywall) && !place_meeting(x, y, obj_onewaywall))))
	    {
	        y += sign(vsp);
	    }
	    else
	    {
	        vsp = 0;
	        break;
	    }
	}

	repeat (abs(hsp))
	{
	    if (place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && place_meeting(x + sign(hsp), y - 1, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y - 2, obj_enemiesbumpable))
	        y -= 2;
	    else if (place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y - 1, obj_enemiesbumpable))
	        y--;
    
	    if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y + 1, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y + 2, obj_enemiesbumpable) && place_meeting(x + sign(hsp), y + 3, obj_enemiesbumpable))
	        y += 2;
	    else if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable) && !place_meeting(x + sign(hsp), y + 1, obj_enemiesbumpable) && place_meeting(x + sign(hsp), y + 2, obj_enemiesbumpable))
	        y++;
    
	    if (!place_meeting(x + sign(hsp), y, obj_enemiesbumpable))
	    {
	        x += sign(hsp);
	    }
	    else
	    {
	        hsp = 0;
	        break;
	    }
	}

	if (vsp < 20)
	    vsp += grav;
}