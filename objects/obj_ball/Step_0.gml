if (place_meeting(x + 1, y, obj_wall) or place_meeting(x - 1, y, obj_wall))
    hsp = 0;

if (place_meeting(x - 5, y, obj_player) && obj_player.image_xscale == 1 && (obj_player.state == states.mach1 or obj_player.state == states.mach2) && rolling == 0)
{
    rolling = 1;
    hsp = 7;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    obj_player.mach2 = 0;
    audio_sound_gain(sfx_bump, 0.7, 0);
    
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false);
}

if (place_meeting(x + 5, y, obj_player) && obj_player.image_xscale == -1 && (obj_player.state == states.mach1 or obj_player.state == states.mach2) && rolling == 0)
{
    rolling = 1;
    hsp = -7;
    obj_player.state = states.tackle;
    obj_player.image_index = 0;
    obj_player.mach2 = 0;
    audio_sound_gain(sfx_bump, 0.7, 0);
    
    if (!audio_is_playing(sfx_bump))
        audio_play_sound(sfx_bump, 1, false);
}

scr_collideandmoveonlywall();

with (obj_player)
{
    if (place_meeting(x, y + 1, obj_ball))
    {
        if (state == states.freefall)
        {
            state = states.Sjump;
            vsp = -15;
        }
        else
        {
            vsp = -8;
        }
        
        jumpAnim = 0;
    }
}