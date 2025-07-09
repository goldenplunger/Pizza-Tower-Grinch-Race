if (instance_exists(ID))
{
	if (image_angle == 0)
	    x = ID.x + (image_xscale * 15);
	else
	    x = ID.x;

	y = ID.y;
}
else
    instance_destroy();