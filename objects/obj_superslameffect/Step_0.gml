x = obj_player.x;
y = obj_player.y;

if (obj_player.state != states.superslam or floor(obj_player.image_index) == 4)
    instance_destroy();