my_speed = 4;
target_angle = 0;
_characters = [spr_wizard, spr_wizard_flashlight, spr_wizard_staff];
flashlight_on = false;

if (variable_struct_exists(global.inventory, "battery")) {
    battery = global.inventory.battery;
}
else {
    battery = 100;
    global.inventory.battery = battery;
}

maxInvSlots = 5;
_no_rooms = [rm_door_break];
_rooms = [rm_tutorial];

h_time = 0
food_time = 0;
overheal_time = 0;