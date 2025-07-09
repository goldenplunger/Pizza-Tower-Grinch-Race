with (obj_player)
{
    if (key_up && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
    {
        mach2 = 0;
        player_y = other.target_y;
        player_x = other.target_x;
        targetRoom = other.targetRoom;
        other.visited = 1;
        image_index = 0;
        state = states.door;
        instance_create(x, y, obj_fadeout);
    }
}