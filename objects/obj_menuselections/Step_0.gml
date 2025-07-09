if (instance_exists(obj_keyconfig))
    visible = false;
else
    visible = true;

if (keyboard_check(vk_f1))
{
    ini_open("saveData.ini");
    global.key_up = ini_write_string("ControlsKeys", "up", vk_up);
    global.key_right = ini_write_string("ControlsKeys", "right", vk_right);
    global.key_left = ini_write_string("ControlsKeys", "left", vk_left);
    global.key_down = ini_write_string("ControlsKeys", "down", vk_down);
    global.key_jump = ini_write_string("ControlsKeys", "jump", 90);
    global.key_slap = ini_write_string("ControlsKeys", "slap", 88);
    global.key_attack = ini_write_string("ControlsKeys", "attack", vk_shift);
    ini_close();
}

ini_open("saveData.ini");
global.key_up = ini_read_string("ControlsKeys", "up", vk_up);
global.key_right = ini_read_string("ControlsKeys", "right", vk_right);
global.key_left = ini_read_string("ControlsKeys", "left", vk_left);
global.key_down = ini_read_string("ControlsKeys", "down", vk_down);
global.key_jump = ini_read_string("ControlsKeys", "jump", 90);
global.key_slap = ini_read_string("ControlsKeys", "slap", 88);
global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift);
global.key_start = 27;
ini_close();
global.key_upC = gp_padu;
global.key_rightC = gp_padr;
global.key_leftC = gp_padl;
global.key_downC = gp_padd;
global.key_jumpC = gp_face1;
global.key_slapC = gp_face3;
global.key_attackC = gp_shoulderr;
global.key_startC = gp_start;

if (!instance_exists(obj_keyconfig))
    scr_getinput();

if (key_up && !instance_exists(obj_keyconfig) && optionselect == 1)
{
    optionselect = 0;
    scr_sound(sound_points);
}
else if (key_down && !instance_exists(obj_keyconfig) && optionselect == 0)
{
    optionselect = 1;
    scr_sound(sound_points);
}

if (optionselect == 0)
    obj_cursor.y = y - 24;
else if (optionselect == 1)
    obj_cursor.y = y + 18;

if (optionselect == 0 && key_jump && !instance_exists(obj_keyconfig))
{
    obj_rockcutscene.hspeed = -15;
    scr_sound(sound_pizzagot);
    instance_destroy();
    instance_destroy(obj_cursor);
    instance_destroy(obj_title);
}

if (optionselect == 1 && key_jump && !instance_exists(obj_keyconfig))
{
    scr_sound(sound_pizzagot);
    instance_create(x, y, obj_keyconfig);
}