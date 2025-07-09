with (obj_player)
{
    if (place_meeting(x, y + 1, obj_collisionparent))
    {
        global.treasure = 1;
        hsp = 0;
        vsp = 0;
        
        if (other.sprite_index == other.spridle)
        {
            scr_sound(sound_treasuregot);
            other.alarm[0] = 300;
        }
        
        if (other.sprite_index == other.spridle)
            state = states.gottreasure;
        
        other.sprite_index = other.sprgot;
        other.x = obj_player.x;
        other.y = obj_player.y - 35;
        obj_tv.showtext = 1;
        obj_tv._message = "YOU GOT THE TOWER SECRET TREASURE!!!";
        obj_tv.alarm[0] = 150;
        global.panic = 0;
        obj_music.jingle = 1;
        ini_open("saveData.ini");
        
        if (other.spr == 1)
            ini_write_real("Treasure", "t1", 1);
        
        if (other.spr == 2)
            ini_write_real("Treasure", "t2", 1);
        
        ini_close();
    }
}