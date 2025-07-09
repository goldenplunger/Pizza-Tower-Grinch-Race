instance_create(x + 16, y, obj_debris);
instance_create(x + 16, y, obj_debris);
instance_create(x + 16, y, obj_debris);
instance_create(x + 16, y, obj_debris);
tile_layer_delete_at(1, x, y);

if (global.breaksound == 10)
    scr_sound(sound_destroyblock1, sound_destroyblock2);

global.breaksound = 0;