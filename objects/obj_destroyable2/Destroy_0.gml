if (global.breaksound == 9)
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));

global.breaksound = 0;
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x + 16, y, obj_pizzadebris);
instance_create(x, y, obj_collect);
tile_layer_delete_at(1, x, y);