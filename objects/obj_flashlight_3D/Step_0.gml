
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var _hover = position_meeting(mx, my, id);

if (_hover) {
    image_blend = c_white;
    if (mouse_check_button_pressed(mb_left)) {
        global.inventory.torch = true;
        
        scr_textbox("Press F to toggle Flashlight", c_lime, , , 50, 300);
        scr_textbox("You can collect battery and use them to continue fill charge.", c_lime, , , 100, 300);
        
        instance_destroy();
    }
} else {
    image_blend = c_ltgray;
}