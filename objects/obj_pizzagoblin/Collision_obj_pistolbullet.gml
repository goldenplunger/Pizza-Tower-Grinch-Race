vsp = -5;
hsp = other.image_xscale;
image_index = 0;
stunned = 50;
state = states.stun;
hp -= 1;
flash = 1;

if (hp == 0)
    instance_destroy();

if (other.sprite_index == spr_pistolbullet or other.sprite_index == spr_bulletup)
    instance_destroy(other.id);