var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (position_meeting(_mx, _my, id)) {
    if (mouse_check_button(mb_left)) {
        image_index = 2;
    } else {
        image_index = 1;
    }

    if (mouse_check_button_released(mb_left)) {
        if (!instance_exists(obj_transition)) {
            scr_init_run();
            global.reset_to_start = true;
            scr_fade(rm_title_screen);
        }
    }
} else {
    image_index = 0;
}

if (keyboard_check_pressed(ord("R"))) {
    if (!instance_exists(obj_transition)) {
        scr_init_run();
        global.reset_to_start = true;
        scr_fade(rm_title_screen);
    }
}