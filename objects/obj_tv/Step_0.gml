if (room == rank_room or room == timesuproom)
    visible = false;

if (room == AT_room1)
    visible = true;

if (showtext == 1)
{
    xi = 500 + random_range(1, -1);
    
    if (yi > 500)
        yi -= 5;
}

if (showtext == 0)
{
    xi = 500 + random_range(1, -1);
    
    if (yi < 600)
        yi += 1;
}

if (!(obj_player.state == states.knightpep && obj_player.state == states.knightpepattack && obj_player.state == states.knightpepslopes))
    once = 0;