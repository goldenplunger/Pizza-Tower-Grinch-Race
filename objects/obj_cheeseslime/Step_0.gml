switch (state)
{
	case states.idle: scr_enemy_idle(); break;
	case states.turn: scr_enemy_turn(); break;
	case states.walk: scr_enemy_walk(); break;
	case states.land: scr_enemy_land(); break;
	case states.hit: scr_enemy_hit(); break;
	case states.stun: scr_enemy_stun(); break;
	case states.grabbed: scr_enemy_grabbed(); break;
}

if (state == states.stun && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.stun)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (!instance_exists(obj_slaphitbox2))
    slapped = 0;

if (hp <= 0)
    instance_destroy();

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = 0;