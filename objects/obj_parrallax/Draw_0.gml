var _cam, _cam_x, _cam_y, _cam_w, _cam_h;
//parallax
//just like the parallax in the camera, this is good enough without a detour, not accurate but somewhat close
_cam = view_get_camera(0); _cam_x = camera_get_view_x(_cam); _cam_y = camera_get_view_y(_cam); 
_cam_w = camera_get_view_width(_cam) / 2; _cam_h = camera_get_view_height(_cam) / 2;
shader_set(shdr_wind);
shader_set_uniform_f(uTime, current_time / 1000);
draw_background_tiled(santa, lerp(0, room_width - _cam_w, _cam_x / (room_width - _cam_w)) / 6, lerp(0, room_height - _cam_h, _cam_y / (room_height - _cam_h)) / 6);
shader_reset();