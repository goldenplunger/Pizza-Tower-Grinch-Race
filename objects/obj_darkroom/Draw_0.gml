draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);

with (obj_player)
    image_blend = make_color_hsv(255, 255, 0);