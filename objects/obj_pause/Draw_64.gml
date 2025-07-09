if (pause == 1)
{
    font = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", 1, 0);
    draw_set_font(font);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(200, 150, "TOPPINS");
    draw_text(700, 150, "PIZZA COINS");
    draw_sprite(spr_pizzacoin, -1, 630, 220);
    draw_text(730, 220, "X " + string(global.pizzacoin));
    
    if (shroomdone == 1)
        draw_sprite(spr_donesign, -1, 100, 220);
    
    if (global.shroomfollow == 0)
        draw_sprite(spr_pizzakinshroom_pause, -1, 100, 220);
    else
        draw_sprite(spr_pizzakinshroom, -1, 100, 220);
    
    if (cheesedone == 1)
        draw_sprite(spr_donesign, -1, 150, 220);
    
    if (global.cheesefollow == 0)
        draw_sprite(spr_pizzakincheese_pause, -1, 150, 220);
    else
        draw_sprite(spr_pizzakincheese, -1, 150, 220);
    
    if (tomatodone == 1)
        draw_sprite(spr_donesign, -1, 200, 220);
    
    if (global.tomatofollow == 0)
        draw_sprite(spr_pizzakintomato_pause, -1, 200, 220);
    else
        draw_sprite(spr_pizzakintomato, -1, 200, 220);
    
    if (sausagedone == 1)
        draw_sprite(spr_donesign, -1, 250, 220);
    
    if (global.sausagefollow == 0)
        draw_sprite(spr_pizzakinsausage_pause, -1, 250, 220);
    else
        draw_sprite(spr_pizzakinsausage, -1, 250, 220);
    
    if (pineappledone == 1)
        draw_sprite(spr_donesign, -1, 300, 220);
    
    if (global.pineapplefollow == 0)
        draw_sprite(spr_pizzakinpineapple_pause, -1, 300, 220);
    else
        draw_sprite(spr_pizzakinpineapple, -1, 300, 220);
}
else
{
}