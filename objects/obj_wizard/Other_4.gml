if ((room == rm_tutorial || room == rm_floor3) && global.reset_to_start) {
    x = 1856;
    y = 832;
	flashlight_on = false;
	battery = 100;
	global.inventory.battery = 100;
    global.reset_to_start = false;
}