global.debug = true;

_af4 = false;
_tutorial_over = true;

var _wiz = instance_find(obj_wizard, 0);

if (instance_exists(_wiz)) {
	wiz_x = _wiz.x;
	wiz_y = _wiz.y;
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

rooms = {
_tutorial : true,
_floor1 : true,
_floor2 : true,
_floor3 : true
}

window_set_fullscreen(true);

global.no_rooms = [
	rm_end_negative_screen,
	rm_end_positive_screen,
	rm_door_break,
	rm_title_screen,
	rm_notes,
	rm_portal,
	rm_steps,
	rm_lift_scene,
	rm_notes_video,
	rm_notes_leaderboard,
	rm_first_playable_end
];

global.table_rooms = [
	rm_outside_table,
	rm_floor_table,
	rm_floor_cuboard
];

global.store_id = "outsidetable2";

display_set_gui_size(1920, 1080);