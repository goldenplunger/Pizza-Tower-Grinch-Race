display_set_gui_size(960, 540);
pal_swap_set(spr_peppalette, global.paletteselect, 0);

if (obj_player.state != states.gameover)
{
    if (!audio_is_playing(va_happy1) && !audio_is_playing(va_happy2) && !audio_is_playing(va_happy3))
    {
        if (!(obj_player.state == states.mach1 or obj_player.state == states.gottreasure or obj_player.state == states.bossintro or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_bossintro) or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_idle) or obj_player.state == states.bombpep or obj_player.state == states.machroll or obj_player.state == states.timesup or obj_player.state == states.chainsaw or obj_player.state == states.shotgun or obj_player.state == states.slam or obj_player.state == states.Sjumpland or obj_player.state == states.grab or obj_player.state == states.punch or obj_player.state == states.backbreaker or obj_player.state == states.backkick or obj_player.state == states.uppunch or obj_player.state == states.shoulder or obj_player.state == states.tackle or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_levelcomplete) or (obj_player.state == states.freefallland && shake_mag > 0) or obj_player.state == states.freefallprep or obj_player.state == states.freefall or obj_player.state == states.Sjump or obj_player.state == states.Sjumpprep or obj_player.state == states.mach2 or obj_player.state == states.mach3 or obj_player.state == states.smirk or obj_player.state == states.hurt or obj_player.state == states.keyget or obj_player.state == states.victory or obj_player.state == states.punch))
            draw_sprite_ext(spr_pepinoHUD, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.Sjumpland or (obj_player.state == states.freefallland && shake_mag > 0))
            draw_sprite_ext(spr_pepinoHUDstun, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.victory or obj_player.state == states.keyget or obj_player.state == states.smirk or obj_player.state == states.gottreasure or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_levelcomplete))
            draw_sprite_ext(spr_pepinoHUDhappy, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach1 or obj_player.state == states.shotgun or obj_player.state == states.chainsaw or obj_player.state == states.freefallprep or obj_player.state == states.freefall or obj_player.state == states.tackle or obj_player.state == states.Sjump or obj_player.state == states.slam or obj_player.state == states.Sjumpprep or obj_player.state == states.grab or obj_player.state == states.punch or obj_player.state == states.backbreaker or obj_player.state == states.backkick or obj_player.state == states.uppunch or obj_player.state == states.shoulder)
            draw_sprite_ext(spr_pepinoHUDmach1, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach2)
            draw_sprite_ext(spr_pepinoHUDmach2, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.mach3 or obj_player.state == states.machroll)
            draw_sprite_ext(spr_pepinoHUDmach3, -1, 120, 80, 1, 1, 1, c_white, alpha);
        else if (obj_player.state == states.hurt or obj_player.state == states.timesup or obj_player.state == states.bombpep or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_bossintro) or (obj_player.state == states.bossintro && obj_player.sprite_index == spr_player_idle))
            draw_sprite_ext(spr_pepinoHUDhurt, -1, 120, 80, 1, 1, 1, c_white, alpha);
    }
    else
    {
        draw_sprite_ext(spr_pepinoHUDhappy, -1, 120, 80, 1, 1, 1, c_white, alpha);
    }
    
    shader_reset();
    
    if (obj_player.mach2 < 7)
        draw_sprite_ext(spr_speedbar, 0, 120, 120, 1, 1, 1, c_white, alpha);
    else if (obj_player.mach2 >= 7 && obj_player.mach2 < 35)
        draw_sprite_ext(spr_speedbar, 1, 120, 120, 1, 1, 1, c_white, alpha);
    else if (obj_player.mach2 >= 35 && obj_player.mach2 < 50)
        draw_sprite_ext(spr_speedbar, 2, 120, 120, 1, 1, 1, c_white, alpha);
    else if (obj_player.mach2 >= 50 && obj_player.mach2 < 75)
        draw_sprite_ext(spr_speedbar, 3, 120, 120, 1, 1, 1, c_white, alpha);
    else if (obj_player.mach2 >= 75 && obj_player.mach2 < 100)
        draw_sprite_ext(spr_speedbar, 4, 120, 120, 1, 1, 1, c_white, alpha);
    else if (obj_player.mach2 >= 100)
        draw_sprite_ext(spr_speedbarmax, -1, 120, 120, 1, 1, 1, c_white, alpha);
    
    if (obj_player.y < 200 && obj_player.x < 200)
        alpha = 0.5;
    else
        alpha = 1;
    
    font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
    draw_set_font(font);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    
    if (timestop == 0)
    {
        if (global.seconds < 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            draw_text(random_range(1, -1) + 480, random_range(1, -1) + 65, string(global.minutes) + ":0" + string(global.seconds));
        }
        else if (global.seconds >= 10)
        {
            if (global.minutes < 1)
                draw_set_color(c_red);
            else
                draw_set_color(c_white);
            
            draw_text(random_range(1, -1) + 480, random_range(1, -1) + 65, string(global.minutes) + ":" + string(global.seconds));
        }
    }
    
    if (global.key_inv == 1)
        draw_sprite_ext(spr_key, -1, 50, 30, 1, 1, 1, c_white, alpha);
    
    draw_sprite_ext(spr_inv, -1, 50, 30, 1, 1, 1, c_white, alpha);
    if (global.ammo > 0)
    {
        draw_text(800, 450, global.ammo);
        draw_sprite(spr_ammo, -1, 840, 480);
    }
}

draw_set_blend_mode(bm_normal);