if (sprite_index == sprgot && obj_player.state != states.gottreasure)
    instance_destroy();

if (spr == 1)
{
    sprgot = spr_treasure1pick;
    spridle = spr_treasure1;
}

if (spr == 2)
{
    sprgot = spr_beantreasuregot;
    spridle = spr_beantreasure;
}

if (sprite_index != sprgot)
    sprite_index = spridle;