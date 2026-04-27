// --------------------
// Pause check
// --------------------
var _paused = false;

if (instance_exists(obj_pause_screen)) {
	_paused = obj_pause_screen.is_paused;
}


// --------------------
// Score countdown
// --------------------
var _score_room = true;

if (array_contains(no_rooms, room)) {
	_score_room = false;
}

if (array_contains(table_rooms, room)) {
	_score_room = false;
}

if (global.score_started && !global.score_stopped && !_paused && _score_room) {
	global.score -= global.score_loss_per_second / room_speed;
	global.score = max(global.score, 0);
}


// --------------------
// Cheats
// --------------------
if (keyboard_check(vk_control) && keyboard_check_pressed(ord("H"))) {
	global.inventory.hp_cheat = !global.inventory.hp_cheat;
	scr_textbox(global.inventory.hp_cheat ? "Health cheat activated!" : "Health cheat disabled!", c_blue);
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("B"))) {
	global.inventory.battery_cheat = !global.inventory.battery_cheat;
	scr_textbox(global.inventory.battery_cheat ? "Battery cheat activated!" : "Battery cheat disabled!", c_blue);
}


// --------------------
// Room jump cheat cleanup
// --------------------
var _jump_room = noone;

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("T"))) {
	show_debug_message("CHEAT: force tutorial");
	_jump_room = rm_tutorial;
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("1"))) {
	show_debug_message("CHEAT: force floor 1");
	_jump_room = rm_floor1;
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("2"))) {
	show_debug_message("CHEAT: force floor 2");
	_jump_room = rm_floor2;
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("3"))) {
	show_debug_message("CHEAT: force floor 3");
	_jump_room = rm_floor3;
}

if (_jump_room != noone) {
	instance_activate_all();

	with (obj_pause_screen) {
		instance_destroy();
	}

	with (obj_pause_panel) {
		instance_destroy();
	}

	with (obj_resume) {
		instance_destroy();
	}

	with (obj_quit_1) {
		instance_destroy();
	}

	with (obj_transition) {
		instance_destroy();
	}

	with (obj_lift_scene) {
		instance_destroy();
	}

	global.chasing = false;
	global.from_lift_scene = false;
	silent = false;

	room_goto(_jump_room);
	exit;
}


// --------------------
// Music safety
// --------------------
// Important:
// Do not call audio_sound_gain(current_music, ...) unless current_music is confirmed playing.
// This prevents crashes after audio_stop_all(), portal scenes, lift scenes, or cutscenes.

var _music_valid = false;

if (is_real(current_music)) {
	if (audio_is_playing(current_music)) {
		_music_valid = true;
	}
}

if (!silent && !_music_valid) {
	current_music = audio_play_sound(snd_horror, 10, true);

	if (is_real(current_music) && audio_is_playing(current_music)) {
		_music_valid = true;
	}
}


// --------------------
// Chase / silent / ambient music
// --------------------
if (global.chasing) {
	if (!audio_is_playing(snd_high_chase_bg_music)) {
		audio_play_sound(snd_high_chase_bg_music, 100, true);
	}

	if (audio_is_playing(snd_high_chase_bg_music)) {
		audio_sound_gain(snd_high_chase_bg_music, 0.6, 1000);
	}

	if (_music_valid) {
		audio_sound_gain(current_music, 0, 1000);
	}
}
else if (silent) {
	if (audio_is_playing(snd_high_chase_bg_music)) {
		audio_sound_gain(snd_high_chase_bg_music, 0, 1000);
	}

	if (_music_valid) {
		audio_sound_gain(current_music, 0, 1000);
	}
}
else {
	if (audio_is_playing(snd_high_chase_bg_music)) {
		audio_sound_gain(snd_high_chase_bg_music, 0, 1000);
	}

	if (_music_valid) {
		switch (music_state) {
			case "playing":
				music_timer--;

				if (audio_sound_get_gain(current_music) < 0.6) {
					audio_sound_gain(current_music, 0.6, 1000);
				}

				if (music_timer <= 0) {
					music_state = "fading_out";
					audio_sound_gain(current_music, 0, 3000);
				}
			break;

			case "fading_out":
				if (audio_sound_get_gain(current_music) <= 0.01) {
					music_state = "silent";
					music_timer = irandom_range(1200, 1800);
				}
			break;

			case "silent":
				music_timer--;

				audio_sound_gain(current_music, 0, 1000);

				if (music_timer <= 0) {
					music_state = "fading_in";
					audio_sound_gain(current_music, 0.6, 3000);
				}
			break;

			case "fading_in":
				if (audio_sound_get_gain(current_music) >= 0.59) {
					music_state = "playing";
					music_timer = irandom_range(3000, 4800);
				}
			break;
		}
	}
}