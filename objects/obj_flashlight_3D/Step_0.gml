
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var _hover = position_meeting(mx, my, id);

if (_hover) {
    image_blend = c_white;
    if (mouse_check_button_pressed(mb_left)) {
        global.inventory.torch = true;
        
        scr_textbox("Torch acquired! Toggle F and aim your light.", c_lime, , , 50, 300,,true);
        scr_textbox("Careful: The light scares bats but drains your battery! Use battery to refill the bar", c_lime, , , 100, 300,,true);
        
        instance_destroy();
    }
} else {
    image_blend = c_ltgray;
}