function scr_init_run() {
    global.inventory = { 
	    items: array_create(5, noone),
	    torch: false,
	    staff: false,
		hp: 100,
		hp_cheat: false,
		battery_cheat: false,
	};

	global.last_room = -1;
	global.first_time = true;
	global.store_id = noone;
	global.reset_to_start = false;

	global.storage = {
	    outsidetable1 : [obj_battery_3D,obj_flashlight_3D,obj_chips_3D, obj_notes_3D],
	    outsidetable2 : [obj_battery_3D,obj_notes_3D,obj_hammer_3D,obj_burger_3D],
		floor1table1 : [obj_battery_3D],
		floor1table2 : [obj_chips_3D,obj_notes_3D],
		floor1table3 : [obj_key_3D],
		floor1table4 : [obj_notes_3D, obj_chips_3D],
		floor1cuboard1 : [obj_burger_3D],
		floor1cuboard2 : [obj_fuse_3D],
		floor2table1 : [obj_battery_3D],
		floor2table2 : [obj_chips_3D,obj_notes_3D],
		floor2table3 : [obj_chips_3D],
		floor2cuboard1 : [obj_chips_3D],
		floor2cuboard2 : [obj_id_card_3D],
		floor2cuboard3 : [obj_key_3D, obj_notes_3D],
		floor3table2 : [obj_staff_3D],
		floor3table3 : [obj_battery_3D,obj_chips_3D],
		floor3table4 : [obj_key_3D, obj_chips_3D],
		floor3cuboard1 : [obj_battery_3D,obj_burger_3D],
		floor3cuboard2 : [obj_battery_3D],
		
	};
	
	global.notes = {
		outsidetable1 : ["Note", "The chirping is getting closer.", "I thought I saw something moving above the path, but every time I looked into the dark, it vanished.","It does not show itself unless light hits it. Keep the flashlight ready. If you hear it nearby, shine the beam into the darkness before you move."],
		outsidetable2 : ["Note","The Chancellor has sealed the Union.","They say he took the wizard’s staff himself and carried it to the upper floors, where no student dares to go after dark.","Without the staff, the wizard’s magic is weak. If he wants it back, he will have to enter the Union and climb floor by floor."],
		floor1table2 : ["Maintenance Report","Debris from the damaged ceiling has spread across the lower hallway. Broken tiles, wood scraps, and loose furniture are blocking several paths.","Clear what you can, but move carefully. Some obstacles may slow you down or force you into the open.","Until the area is cleaned, avoid running blindly through the ground floor."],
		floor1table4 : ["Cafeteria Notice","Stop leaving open bags of chips around the ground floor.","Someone keeps using them as emergency food, and now crumbs are all over the tables.","If you are hurt, eat what you can find and keep moving. Just do not stand around snacking for too long.","Something down here can smell food."],
		floor1cuboard1 : ["Note","I went behind the table and ran as fast as I can.","It splashed through the hallway like it already knew where I was.","I do not think it saw me, but it heard every sound I made.","If you are discovered RUN as fast as you can."],
		floor2table2 : ["Security Memo","Reports of an unknown man wandering the top floor after closing have increased.","He does not appear on the cameras for long. He moves between rooms, knocks things over, and talks to himself about 'protecting the Chancellor’s prize.',","Do not approach him. Do not argue with him. Leave the area immediately. He does not seem the type to chat"],
		floor2cuboard3: ["Faculty Memo","The Chancellor believes the wizard’s staff is the only thing strong enough to restore order to the Union.","He says the building has become too chaotic, too unpredictable, and too difficult to control. With the staff, he thinks he can force every hallway, room, and creature inside to obey him.","But power taken by fear does not fix anything. It only makes the nightmare worse."],
		floor3cuboard2 : ["Note","The staff is no longer yours.","You carried power through these halls and wasted it on tricks, light, and childish heroics. I have seen what it can do. I have seen what this Union can become with the right hand guiding it.","The creatures below were not accidents. They were warnings.","If you have reached this floor, then you are more persistent than I expected. But persistence is not power.","Turn back, wizard.","Or come take what you lost.","                 -  Chancellor"],
		
	}
	
	global.heading = "Instructions"
	global.content = ["Press wsad or arrow keys to control the character","Press F to toggle flashlight after obtaining flashlight"]

}



