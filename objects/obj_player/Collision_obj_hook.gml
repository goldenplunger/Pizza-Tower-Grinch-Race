if ((state == states.jump or state == states.Sjump or state == states.mach2 or obj_player.state == states.mach3) && y > other.y && other.drop == 0)
{
    state = states.hang;
    image_xscale = 1;
    other.hooked = 1;
    
    if (mach2 >= 35)
        other.hspeed = 10;
    
    if (other.hspeed == 10)
        sprite_index = spr_player_hangslide;
    
    if (other.hspeed == 0)
        sprite_index = spr_player_hang;
}