if (obj_player.state != states.hurt && global.sausagefollow == 0)
{
    if (global.toppintotal < 5)
        obj_tv._message = "YOU NEED " + string(5 - global.toppintotal) + " MORE TOPPINS!";
    
    if (global.toppintotal == 5)
        obj_tv._message = "YOU HAVE ALL TOPPINS!";
    
    obj_tv.showtext = 1;
    obj_tv.alarm[0] = 150;
    global.toppintotal += 1;
    scr_sound(sound_toppingot);
    global.sausagefollow = 1;
    panic = 0;
}