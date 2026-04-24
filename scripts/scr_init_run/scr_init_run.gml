function scr_init_run() {
    global.inventory = { 
	    items: array_create(5, noone),
	    torch: false,
	    staff: false,
		hp: 100,
		hp_cheat: false
	};

	global.last_room = -1;
	global.first_time = true;
	global.store_id = noone;
	global.reset_to_start = false;

	global.storage = {
	    outsidetable1 : [obj_battery_3D,obj_flashlight_3D,obj_chips_3D],
	    outsidetable2 : [obj_battery_3D,obj_notes_3D,obj_hammer_3D,obj_burger_3D],
		floor3table2 : [obj_staff_3D],
		floor3table3 : [obj_battery_3D,obj_chips_3D],
		floor3table4 : [obj_key_3D, obj_chips_3D],
		floor3cuboard1 : [obj_battery_3D,obj_burger_3D],
		floor3cuboard2 : [obj_id_card_3D,obj_battery_3D],
		
	};
	
	global.notes = {
		"outsidetable2" : ["The Wizard","The wizard came searching for a staff that the dean is currently in posession of.","The wizard who has no powers because of this is searching for this staff and has made his way to this union."]
	}
	
	global.heading = "Instructions"
	global.content = ["Press wsad or arrow keys to control the character","Press F to toggle flashlight after obtaining flashlight"]
}

