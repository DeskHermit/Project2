global.debug = true;

_af4 = false 

_wiz = instance_find(obj_wizard,0)
if (instance_exists(_wiz)){
	wiz_x=_wiz.x
	wiz_y=_wiz.y
} else {
	wiz_x = 1632;
	wiz_y = 832;
}

global.chasing = false;
silent = false;

c_room = rm_tutorial;

music_timer = irandom_range(300, 900);
music_state = "playing";

current_music = -1;
current_music = audio_play_sound(snd_horror, 10, true);

music_vol = 1;

maxInvSlots = 5;

global.first_time = true;
_tutorial = true;

window_set_fullscreen(true)

no_rooms = [
	rm_end_negative_screen,
	rm_end_positive_screen,
	rm_door_break,
	rm_title_screen,
	rm_notes,
	rm_portal,
	rm_steps,
	rm_lift_scene,
];

table_rooms = [
	rm_outside_table,
	rm_floor_table,
	rm_floor_cuboard
];

global.store_id = "outsidetable2";