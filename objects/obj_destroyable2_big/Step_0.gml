if ((place_meeting(x + 1, y, obj_player) or place_meeting(x - 1, y, obj_player) or place_meeting(x, y + 1, obj_player) or place_meeting(x, y - 1, obj_player)) && obj_player.state == states.handstandjump)
    instance_destroy();

if ((place_meeting(x + 1, y, obj_player) && obj_player.xscale == -1) or (place_meeting(x - 1, y, obj_player) && obj_player.xscale == 1))
{
    if (obj_player.state == states.mach1)
    {
        instance_destroy();
        obj_player.hsp = -obj_player.xscale * 4;
        obj_player.vsp = -4;
        obj_player.machpunchAnim = 1;
        obj_player.image_index = 0;
        obj_player.state = states.tackle;
    }
}

if (place_meeting(x, y - 1, obj_player) && obj_player.state == states.freefall)
{
    instance_destroy();
    tile_layer_delete_at(1, x, y);
    audio_sound_gain(sfx_break, 0.7, 0);
    
    if (!audio_is_playing(sfx_break))
        audio_play_sound(sfx_break, 1, false);
}

if (place_meeting(x, y - 1, obj_player) && obj_player.vsp > 0 && obj_player.state == states.facestomp)
{
    instance_destroy();
    obj_player.image_index = 0;
    obj_player.vsp = -7;
    obj_player.facestompAnim = 1;
}

if ((place_meeting(x + 1, y, obj_player) or place_meeting(x - 1, y, obj_player)) && (obj_player.state == states.mach2 or obj_player.state == states.mach3 or obj_player.state == states.machroll))
{
    if (obj_player.state == states.mach2)
    {
        if (obj_player.machpunchAnim == 0)
        {
            obj_player.machpunchAnim = 1;
            obj_player.image_index = 0;
        }
    }
    
    instance_destroy();
}

if (place_meeting(x, y - 1, obj_player) && obj_player.vsp > 0 && (obj_player.state == states.freefall or obj_player.state == states.superslam or obj_player.state == states.knightpep))
    instance_destroy();

if ((place_meeting(x, y + 1, obj_player) or ((place_meeting(x - 1, y, obj_player) && obj_player.xscale == 1) or (place_meeting(x + 1, y, obj_player) && obj_player.xscale == -1))) && obj_player.state == states.Sjump)
    instance_destroy();