if (instance_exists(ID))
{
	if (ID.state != states.stun or ID.stunned < 40)
	{
	    ID.birdcreated = 0;
	    instance_destroy();
	}

	x = ID.x;
	y = ID.y - 40;
}