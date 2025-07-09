function action_kill_object()
{
	/// @description (Old DnD) - destroy the self object
	instance_destroy();
}

function draw_background_tiled(argument0, argument1, argument2)
{
	/// @description Draws a background at a given position, and tiles it to fill the entire view.
	/// @param back The index of the background to draw.
	/// @param x The x coordinate of where to draw the background.
	/// @param y The y coordinate of where to draw the background.
	/// @returns 

	draw_sprite_tiled(argument0, 0, argument1, argument2);
}
function instance_create(argument0, argument1, argument2)
{
	/// @description Creates an instance of a given object at a given position.
	/// @param x The x position the object will be created at.
	/// @param y The y position the object will be created at.
	/// @param obj The object to create an instance of.
	return instance_create_depth( argument0, argument1, 0, argument2 );
}

function draw_set_blend_mode(argument0)
{
	/// @description Sets the blend mode for drawing.
	/// @param mode The blend mode constant to set to 
	gpu_set_blendmode( argument0 );
}

function draw_background_stretched(argument0, argument1, argument2, argument3, argument4)
{
	/// @description Draws a background at a given position, stretched.
	/// @param back The index of the background to draw.
	/// @param x The x coordinate of where to draw the background.
	/// @param y The y coordinate of where to draw the background.
	/// @param w The width of the area the stretched background will occupy.
	/// @param h The height of the area the stretched background will occupy.
	/// @returns 

	draw_sprite_stretched(argument0, 0, argument1, argument2, argument3, argument4);
}

function texture_set_interpolation_ext(argument0, argument1)
{
	gpu_set_texfilter_ext(argument0, argument1);
}

function tile_layer_delete_at(argument0, argument1, argument2)
{
	var lay_id, map_id, data;
	
    lay_id = layer_get_id("Tiles_1");
	if (layer_exists("Tiles_1"))
	{
	    map_id = layer_tilemap_get_id(lay_id);
	    data = tilemap_get_at_pixel(map_id, argument1, argument2);
	    data = tile_set_empty(data);
	    tilemap_set_at_pixel(map_id, data, argument1, argument2);
	}
}

function tile_layer_hide(argument0)
{
	if (argument0 == 2)
		layer_set_visible(layer_get_id("Tiles_2"), false);
	if (argument0 == 1)
		layer_set_visible(layer_get_id("Tiles_1"), false);
}

function tile_layer_show(argument0)
{
	layer_set_visible(layer_get_id("Tiles_2"), true);
}

function __init_global()
{
	gml_pragma( "global", "__init_global();");

	// set any global defaults
	layer_force_draw_depth(true,0);		// force all layers to draw at depth 0
	draw_set_colour( c_black );
}