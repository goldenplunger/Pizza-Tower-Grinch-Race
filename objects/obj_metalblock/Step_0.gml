if ((place_meeting(x + 1, y, obj_player) or place_meeting(x - 1, y, obj_player)) && (obj_player.state == states.mach3 or obj_player.state == states.knightpep or obj_player.state == states.knightpepslopes or obj_player.state == states.machroll or (obj_player.state == states.knightpep && obj_player.momemtum == 1)))
    instance_destroy();

if (place_meeting(x, y - 1, obj_player) && (obj_player.state == states.knightpep or obj_player.state == states.freefallland))
{
    instance_destroy();
    tile_layer_delete_at(1, x, y);
}

if (place_meeting(x, y + 40, obj_player) && obj_player.state == states.Sjump)
    instance_destroy();