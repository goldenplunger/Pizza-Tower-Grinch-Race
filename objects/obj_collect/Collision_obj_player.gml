if (cantcollect == 0)
{
    if (global.collectsound == 10)
        scr_sound(sound_points);
    
    global.collectsound = 0;
    global.collect += 10;
    global.pizzameter += 1;
    instance_create(x, y, obj_10);
    instance_destroy();
}