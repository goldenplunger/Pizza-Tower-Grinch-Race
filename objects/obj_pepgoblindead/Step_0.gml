if (vsp < 30)
    vsp += grav;

if (!(obj_player.state == states.grab or obj_player.state == states.Throw or obj_player.state == states.superslam or obj_player.state == states.slam or obj_player.state == states.punch or obj_player.state == states.backkick or obj_player.state == states.uppunch or obj_player.state == states.shoulder or obj_player.state == states.backbreaker) && grabbed == 1)
{
    instance_destroy();
    instance_create(x, y, obj_explosioneffect);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
}

if (grabbed == 1)
{
    sprite_index = spr_pepgoblinstun;
    
    if (obj_player.state == states.grab)
    {
        x = obj_player.x + (obj_player.image_xscale * 20);
        y = obj_player.y;
        
        if (x != obj_player.x)
            image_xscale = sign(obj_player.x - x);
    }
    
    if (obj_player.state == states.punch)
    {
        x = obj_player.x + (obj_player.image_xscale * 20);
        y = obj_player.y;
        
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            y = obj_player.y;
            hsp = obj_player.image_xscale * 20;
            vsp = -5;
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
        }
    }
    
    if (obj_player.state == states.uppunch)
    {
        x = obj_player.x;
        y = obj_player.y - 40;
        
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
            vsp = -20;
        }
    }
    
    if (obj_player.state == states.backkick)
    {
        x = obj_player.x - (obj_player.image_xscale * 20);
        y = obj_player.y;
        
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            obj_player.vsp = -5;
            hsp = -(obj_player.image_xscale * 20);
            vsp = -5;
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
        }
    }
    
    if (obj_player.state == states.shoulder)
    {
        x = obj_player.x;
        y = obj_player.y + 30;
        
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            obj_player.vsp = -5;
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
            vsp = -4;
            hsp = obj_player.image_xscale * 4;
        }
    }
    
    if (obj_player.state == states.backbreaker)
    {
        x = obj_player.x;
        y = obj_player.y - 40;
        
        if (floor(obj_player.image_index) == 1)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
            vsp = -4;
            hsp = obj_player.image_xscale * 4;
        }
    }
    
    if (obj_player.state == states.slam)
    {
        x = obj_player.x;
        y = obj_player.y + 30;
        
        if (floor(obj_player.image_index) == 4)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
            vsp = -4;
            hsp = obj_player.image_xscale * 4;
        }
    }
    
    if (obj_player.state == states.superslam)
    {
        x = obj_player.x;
        y = obj_player.y + 30;
        
        if (floor(obj_player.image_index) == 4)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
            vsp = -4;
            hsp = obj_player.image_xscale * 4;
        }
    }
    
    if (obj_player.state == states.Throw)
    {
        x = obj_player.x;
        y = obj_player.y - 40;
        
        if (floor(obj_player.image_index) == 3)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            y = obj_player.y;
            hsp = obj_player.image_xscale * 10;
            vsp = -5;
            instance_create(x, y, obj_bangeffect);
            grabbed = 0;
        }
    }
}

if (grabbed == 0)
{
    sprite_index = spr_pepgoblin_dead;
    
    if (place_meeting(x + floor(hsp), y, obj_null))
    {
        x = floor(x);
        
        while (!place_meeting(x + sign(hsp), y, obj_null))
            x += sign(hsp);
        
        hsp = 0;
    }
    
    x += hsp;
    
    if (place_meeting(x, y + floor(vsp), obj_null))
    {
        y = floor(y);
        
        while (!place_meeting(x, y + sign(vsp), obj_null))
            y += sign(vsp);
        
        vsp = 0;
    }
    
    y += floor(vsp);
}