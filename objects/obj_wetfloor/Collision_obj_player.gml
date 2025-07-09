with (obj_player)
{
    if (state == states.mach1 or state == states.mach2 or state == states.machslide or state == states.slipnslide)
    {
        state = states.slipnslide;
        
        if (movespeed < 8)
            movespeed = 8;
    }
    
    if (state == states.barrelmach1 or state == states.barrelmach2)
    {
        image_index = 0;
        state = states.barrelslipnslide;
        
        if (movespeed < 8)
            movespeed = 8;
    }
}