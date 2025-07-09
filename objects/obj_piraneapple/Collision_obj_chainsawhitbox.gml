vsp = -5;
hsp = other.image_xscale;
image_index = 0;
stunned = 50;
state = states.stun;
hp -= 1;
flash = 1;

if (hp == 0)
    instance_destroy();