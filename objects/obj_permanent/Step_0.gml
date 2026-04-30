var _paused = false;

if (instance_exists(obj_pause_screen)) {
	_paused = obj_pause_screen.is_paused;
}

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

if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("H"))) {
	global.inventory.hp_cheat = !global.inventory.hp_cheat;

	if (global.inventory.hp_cheat) {
		var _snd = audio_play_sound(snd_fah, 50, false);

		if (audio_is_playing(_snd)) {
			audio_sound_gain(_snd, 0.5, 0);
		}
	}

	scr_textbox(global.inventory.hp_cheat ? "Health cheat activated!" : "Health cheat disabled!", c_blue);
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("B"))) {
	global.inventory.battery_cheat = !global.inventory.battery_cheat;

	if (global.inventory.battery_cheat) {
		var _snd = audio_play_sound(snd_fah, 50, false);

		if (audio_is_playing(_snd)) {
			audio_sound_gain(_snd, 0.5, 0);
		}
	}

	scr_textbox(global.inventory.battery_cheat ? "Battery cheat activated!" : "Battery cheat disabled!", c_blue);
}


if (keyboard_check(vk_alt) && keyboard_check(ord("F")) && keyboard_check_pressed(ord("4"))) {
	if (!_af4) {
		global.inventory.battery_cheat = true;
		global.inventory.hp_cheat = true;

		var _snd = audio_play_sound(snd_fah, 50, false);

		if (audio_is_playing(_snd)) {
			audio_sound_gain(_snd, 0.5, 0);
		}

		_af4 = true;
		scr_textbox("All cheats activated!", c_blue);
	} else {
		global.inventory.battery_cheat = false;
		global.inventory.hp_cheat = false;

		_af4 = false;
		scr_textbox("All cheats disabled!", c_blue);
	}
}


var _jump_room = noone;

if (keyboard_check(vk_alt) && keyboard_check_pressed(ord("T"))) {
	show_debug_message("CHEAT: force tutorial");
	_jump_room = rm_tutorial;
}

if (keyboard_check(vk_alt) && keyboard_check_pressed(ord("1"))) {
	show_debug_message("CHEAT: force floor 1");
	_jump_room = rm_floor1;
}

if (keyboard_check(vk_alt) && keyboard_check_pressed(ord("2"))) {
	show_debug_message("CHEAT: force floor 2");
	_jump_room = rm_floor2;
}

if (keyboard_check(vk_alt) && keyboard_check_pressed(ord("3"))) {
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

if (global.chasing) {
	if (!audio_is_playing(chase_music)) {
		chase_music = audio_play_sound(snd_high_chase_bg_music, 100, true);

		if (audio_is_playing(chase_music)) {
			audio_sound_gain(chase_music, 0, 0);
		}
	}

	if (audio_is_playing(chase_music)) {
		audio_sound_gain(chase_music, 0.45, 1000);
	}

	if (_music_valid) {
		audio_sound_gain(current_music, 0, 1000);
	}
}
else if (silent) {
	if (audio_is_playing(chase_music)) {
		audio_sound_gain(chase_music, 0, 1000);
	}

	if (_music_valid) {
		audio_sound_gain(current_music, 0, 1000);
	}
}
else {
	if (audio_is_playing(chase_music)) {
		audio_sound_gain(chase_music, 0, 1000);
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