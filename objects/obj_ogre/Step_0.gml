image_speed = 0.35;

if (bump == 0)
{
    if (charging == 1 && place_meeting(x - 64, y + 1, obj_wall))
        hsp = -1.5;
    else if (place_meeting(x + 64, y + 1, obj_wall))
        hsp = 0;
}

if (falling == 1)
{
    vsp = 10;
    
    if (place_meeting(x, y + 1, obj_wall))
        instance_destroy();
}

if (bump == 1)
{
}

if (place_meeting(x - 1, y, obj_player))
{
    if (obj_player.mach2 >= 35 or obj_player.state == states.freefall or obj_player.state == states.punch or obj_player.state == states.barrelroll)
    {
        obj_player.state = states.tackle;
        obj_player.image_index = 0;
        hsp = 10;
        bump = 1;
        alarm[0] = 25;
    }
}

scr_collideandmove();