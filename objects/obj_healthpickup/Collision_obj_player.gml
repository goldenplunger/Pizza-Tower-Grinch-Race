if (drop == 0)
{
    if (global.hp < 6)
        global.hp += 1;
    
    global.pizzameter += 1;
    
    if (global.collectsound > 4)
    {
        scr_sound(sfx_collect);
        global.collectsound = 0;
    }
    
    instance_destroy();
}