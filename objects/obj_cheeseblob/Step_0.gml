if (place_meeting(x, y + 1, obj_collisionparent) or place_meeting(x + 1, y, obj_collisionparent) or place_meeting(x - 1, y, obj_collisionparent))
{
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    instance_create(x, y + 20, obj_slimedebris);
    
    if (!audio_is_playing(sound_suplex1))
        scr_sound(sound_suplex1);
    
    instance_destroy();
}

scr_collideandmove();