if (place_meeting(x, y + 1, obj_collisionparent) && state == states.normal && !instance_exists(obj_uparrow))
{
    with (other.id)
    {
        if (visited == 1)
            instance_create(other.x, other.y, obj_uparrow);
    }
}