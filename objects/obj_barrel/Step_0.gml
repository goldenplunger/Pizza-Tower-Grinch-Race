if (vsp < 12)
    vsp += grav;

if (place_meeting(x, y + 1, obj_wall))
{
    hsp = 0;
    bounce = 0;
}

if (place_meeting(x - 5, y, obj_player) && obj_player.image_xscale == 1 && (obj_player.state == states.mach1 or obj_player.state == states.mach2 or obj_player.state == states.mach3) && bounce == 0)
{
    vsp = -5;
    hsp = 5;
    bounce = 1;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    obj_player.mach2 = 0;
    audio_sound_gain(sfx_bump, 0.7, 0);
    
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false);
}

if (place_meeting(x + 5, y, obj_player) && obj_player.image_xscale == -1 && (obj_player.state == states.mach1 or obj_player.state == states.mach2) && bounce == 0)
{
    vsp = -5;
    hsp = -5;
    bounce = 1;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    obj_player.mach2 = 0;
    audio_sound_gain(sfx_bump, 0.7, 0);
    
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false);
}

scr_collideandmoveonlywall();