font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_color(c_yellow);

if (room == rank_room)
{
    if (global.hurtcounter < 3 && hurtpoints == 0 && _message == "")
    {
        hurtpoints = 1;
        _message = "DIDNT GET HURT TOO MUCH!!";
        showtext = 1;
        alarm[0] = 80;
    }
    else if (global.bonusminutes < 10 && timepoints == 0 && _message == "")
    {
        timepoints = 1;
        _message = "ALL UNDER 10 MINUTES!!";
        showtext = 1;
        alarm[0] = 80;
    }
    else if (global.minutes > 1 && escapetimepoints == 0 && _message == "")
    {
        escapetimepoints = 1;
        _message = "ESCAPED WITH 2 MINUTES LEFT!!";
        showtext = 1;
        alarm[0] = 80;
    }
    else if (global.treasure == 1 && treasurepoints == 0 && _message == "")
    {
        treasurepoints = 1;
        _message = "GOT THE SECRET TREASURE!!";
        showtext = 1;
        alarm[0] = 80;
    }
}

draw_text_transformed(xi, yi, _message, 0.8, 0.8, 0);

if (global.bonusseconds < 10)
{
    draw_set_color(c_white);
    draw_text_transformed(832, 512, string(global.bonusminutes) + ":0" + string(global.bonusseconds), 0.4, 0.4, 0);
}
else if (global.bonusseconds >= 10)
{
    draw_set_color(c_white);
    draw_text_transformed(832, 512, string(global.bonusminutes) + ":" + string(global.bonusseconds), 0.4, 0.4, 0);
}