if (other.image_index == 0 && state == states.normal && place_meeting(x, y + 1, obj_collisionparent))
{
    scr_sound(sound_slapswipe1);
    momentum = 0;
    movespeed = 0;
    other.image_index = 1;
    image_index = 0;
    sprite_index = spr_knightpep_start;
    state = states.knightpep;
    hsp = 0;
}