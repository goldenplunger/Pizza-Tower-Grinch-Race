/// @description the actual camera
var target, _cam, _cam_w, _cam_h;
_cam = view_get_camera(0);
_cam_w = camera_get_view_width(_cam); _cam_h = camera_get_view_height(_cam);

if (instance_exists(obj_player) && obj_player.state != states.timesup && obj_player.state != states.gameover)
{
    target = obj_player;
    camera_set_view_pos(_cam, target.x - (_cam_w / 2), target.y - (_cam_h / 2));
	camera_set_view_pos(_cam, clamp(camera_get_view_x(_cam), 0, room_width - _cam_w), clamp(camera_get_view_y(_cam), 0, room_height - _cam_h));
    
    if (shake_mag != 0)
    {
        camera_set_view_pos(_cam, target.x - (_cam_w / 2), (target.y - (_cam_h / 2)) + irandom_range(-shake_mag, shake_mag));
		camera_set_view_pos(_cam, clamp(camera_get_view_x(_cam), 0, room_width - _cam_w), clamp(camera_get_view_y(_cam), 0 + irandom_range(-shake_mag, shake_mag), (room_height - _cam_h) + irandom_range(-shake_mag, shake_mag)));
    }
}