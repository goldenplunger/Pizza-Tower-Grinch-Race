function scr_getinput()
{
	ini_open("saveData.ini");
	global.key_up = ini_read_string("ControlsKeys", "up", vk_up);
	global.key_right = ini_read_string("ControlsKeys", "right", vk_right);
	global.key_left = ini_read_string("ControlsKeys", "left", vk_left);
	global.key_down = ini_read_string("ControlsKeys", "down", vk_down);
	global.key_jump = ini_read_string("ControlsKeys", "jump", 90);
	global.key_slap = ini_read_string("ControlsKeys", "slap", 88);
	global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift);
	global.key_start = vk_escape;
	ini_close();
	global.key_upC = gp_padu;
	global.key_rightC = gp_padr;
	global.key_leftC = gp_padl;
	global.key_downC = gp_padd;
	global.key_jumpC = gp_face1;
	global.key_slapC = gp_face3;
	global.key_attackC = gp_shoulderr;
	global.key_startC = gp_start;
	key_up = keyboard_check(global.key_up) or gamepad_button_check(0, global.key_upC) or gamepad_axis_value(0, gp_axislv) < 0;
	key_up2 = keyboard_check_pressed(global.key_up) or gamepad_button_check_pressed(0, global.key_upC) or gamepad_axis_value(0, gp_axislv) < 0;
	key_right = keyboard_check(global.key_right) or gamepad_button_check(0, global.key_rightC) or gamepad_axis_value(0, gp_axislh) > 0;
	key_right2 = keyboard_check_pressed(global.key_right) or gamepad_button_check_pressed(0, global.key_rightC) or gamepad_axis_value(0, gp_axislh) > 0;
	key_left = -(keyboard_check(global.key_left) or gamepad_button_check(0, global.key_leftC) or gamepad_axis_value(0, gp_axislh) < 0);
	key_left2 = -(keyboard_check_pressed(global.key_left) or gamepad_button_check_pressed(0, global.key_leftC) or gamepad_axis_value(0, gp_axislh) < 0);
	key_down = keyboard_check(global.key_down) or gamepad_button_check(0, global.key_downC) or gamepad_axis_value(0, gp_axislv) > 0;
	key_down2 = keyboard_check_pressed(global.key_down) or gamepad_button_check_pressed(0, global.key_downC) or gamepad_axis_value(0, gp_axislv) > 0;
	key_jump = keyboard_check_pressed(global.key_jump) or gamepad_button_check_pressed(0, global.key_jumpC);
	key_jump2 = keyboard_check(global.key_jump) or gamepad_button_check(0, global.key_jumpC);
	key_slap = keyboard_check(global.key_slap) or gamepad_button_check(0, global.key_slapC);
	key_slap2 = keyboard_check_pressed(global.key_slap) or gamepad_button_check_pressed(0, global.key_slapC);
	key_attack = keyboard_check(global.key_attack) or gamepad_button_check(0, global.key_attackC) or gamepad_button_check(0, gp_face2) or gamepad_button_check(0, gp_shoulderl) or gamepad_button_check(0, gp_shoulderr) or gamepad_button_check(0, gp_shoulderl);
	key_attack2 = keyboard_check_pressed(global.key_attack) or gamepad_button_check_pressed(0, global.key_attackC) or gamepad_button_check_pressed(0, gp_face2) or gamepad_button_check_pressed(0, gp_shoulderl) or gamepad_button_check_pressed(0, gp_shoulderr) or gamepad_button_check_pressed(0, gp_shoulderl);
	key_start = keyboard_check_pressed(global.key_start) or gamepad_button_check_pressed(0, global.key_startC);
	key_escape = keyboard_check_pressed(vk_escape) or gamepad_button_check(0, gp_select);
	gamepad_set_axis_deadzone(0, 0.5);
}