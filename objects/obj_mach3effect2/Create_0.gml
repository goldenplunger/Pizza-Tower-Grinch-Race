depth = -5;

image_speed = 0;
image_index = obj_player.image_index - 1;
image_alpha = 0.8;
alarm[0] = 15;
image_xscale = obj_player.xscale;
sprite_index = obj_player.sprite_index;
randomize();
image_blend = choose(make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0));
x = obj_player.x;
vspeed = 5;
alarm[1] = 2;