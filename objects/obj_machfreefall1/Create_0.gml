depth = -5;

image_speed = 0;
image_index = obj_player.image_index;
image_alpha = 0.8;
alarm[0] = 20;
image_xscale = obj_player.xscale;
sprite_index = spr_player_freefallprep;
randomize();
image_blend = choose(make_color_rgb(255, 255, 255), make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0));
y = obj_player.y;
hspeed = 10;
alarm[1] = 2;