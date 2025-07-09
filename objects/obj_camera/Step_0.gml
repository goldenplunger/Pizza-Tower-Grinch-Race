var _cam, _cam_x, _cam_y, _cam_w, _cam_h;

if (global.panic == 1)
    timestop = 0;
else
    timestop = 1;

//parallax
//this is good enough without a detour, not accurate but somewhat close
_cam = view_get_camera(0); _cam_x = camera_get_view_x(_cam); _cam_y = camera_get_view_y(_cam);
_cam_w = camera_get_view_width(_cam) / 2; _cam_h = camera_get_view_height(_cam) / 2;

if (room == AT_room17 or room == AT_room8 or room == AT_room15 or room == AT_room6)
{
	var _layer_array = layer_get_all();
	for (var _i = 0; _i < array_length(_layer_array); _i++)
	{
		//get the names from array
	    var _layer = _layer_array[_i];
	    var _layer_name = layer_get_name(_layer);
		switch(_layer_name)
		{	
			//0
			case "Backgrounds_1":
			    layer_x(_layer, lerp(0, room_width - sprite_get_width(layer_background_get_index(_layer)), _cam_x / (room_width - _cam_w)) / 6);
			    layer_y(_layer, lerp(0, room_height - sprite_get_height(layer_background_get_index(_layer)), _cam_y / (room_height - _cam_h)) / 6);
				break;
			//1
			case "Backgrounds_2":
			    layer_x(_layer, lerp(0, room_width - sprite_get_width(layer_background_get_index(_layer)), _cam_x / (room_width - _cam_w)) / 8);
			    layer_y(_layer, lerp(0, room_height - sprite_get_height(layer_background_get_index(_layer)), _cam_y / (room_height - _cam_h)) / 8);
			    layer_background_xscale(layer_background_get_id(_layer), 0.5);
			    layer_background_yscale(layer_background_get_id(_layer), 0.5);
				break;
			//2
			case "Backgrounds_3":
			    layer_x(_layer, lerp(0, room_width - sprite_get_width(layer_background_get_index(_layer)), _cam_x / (room_width - _cam_w)) / 10);
			    layer_y(_layer, lerp(0, room_height - sprite_get_height(layer_background_get_index(_layer)), _cam_y / (room_height - _cam_h)) / 10);
			    layer_background_xscale(layer_background_get_id(_layer), 0.8);
			    layer_background_yscale(layer_background_get_id(_layer), 0.8);
				break;
			//4
			case "Backgrounds_4":
			    layer_x(_layer, lerp(0, room_width - sprite_get_width(layer_background_get_index(_layer)), _cam_x / (room_width - _cam_w)) / 16);
			    layer_y(_layer, lerp(0, room_height - sprite_get_height(layer_background_get_index(_layer)), _cam_y / (room_height - _cam_h)) / 16);
			    layer_background_xscale(layer_background_get_id(_layer), 0.7);
			    layer_background_yscale(layer_background_get_id(_layer), 0.7);
			    layer_y(_layer, 300);
				break;
		}
	}
}

if (room == normalT_bonus1)
{
	var _lay_id = layer_get_id("Backgrounds_2");
    layer_x(_lay_id, lerp(0, room_width - sprite_get_width(layer_background_get_index(_lay_id)), _cam_x / (room_width - _cam_w)) / 6);
    layer_y(_lay_id, lerp(0, room_height - sprite_get_height(layer_background_get_index(_lay_id)), _cam_y / (room_height - _cam_h)) / 6);
}

if (room == timesuproom)
    timestop = 1;

if (global.seconds == 0 && global.minutes == 0 && room != timesuproom && !instance_exists(obj_endlevelfade))
{
    obj_player.state = states.timesup;
    room = timesuproom;
    obj_player.image_index = 0;
}

if (global.seconds < 0)
{
    global.seconds = 59;
    global.minutes -= 1;
}

if (global.seconds > 59)
{
    global.minutes += 1;
    global.seconds -= 59;
}

if (global.panic == 1 && global.minutes < 1 && basement == 0)
{
    shake_mag = 2;
    shake_mag_acc = 3 / room_speed;
}
else if (global.panic == 1 && basement == 0)
{
    shake_mag = 2;
    shake_mag_acc = 3 / room_speed;
}

if (shake_mag > 0)
{
    shake_mag -= shake_mag_acc;
    
    if (shake_mag < 0)
        shake_mag = 0;
}