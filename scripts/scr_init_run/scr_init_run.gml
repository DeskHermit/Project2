function scr_init_run() {
    global.inventory = { 
	    items: array_create(5, noone),
	    torch: false,
	    staff: false
	};

	global.last_room = -1;
	global.first_time = true;
	global.store_id = noone;
	global.reset_to_start = false;

	global.storage = {
	    outsidetable1 : [obj_battery_3D,obj_flashlight_3D],
	    outsidetable2 : [obj_battery_3D,obj_notes_3D,obj_hammer_3D],
	};
}