f++;

if (f == 20) {
	elevator_bgm = audio_play_sound(snd_elevator_bgm, 20, false);

	if (audio_is_playing(elevator_bgm)) {
		audio_sound_gain(elevator_bgm, 0.12, 0);
	}
}

if (f == 600) {
	elevator_ding = audio_play_sound(snd_elevator_ding, 40, false);

	if (audio_is_playing(elevator_ding)) {
		audio_sound_gain(elevator_ding, 0.7, 0);
	}
}

if (f == 620) {
	if (audio_is_playing(elevator_bgm)) {
		audio_sound_gain(elevator_bgm, 0.5, 1000);
	}

	lift_door_snd = audio_play_sound(snd_liftdoor, 20, false);
}

if (f >= 700) {
	if (audio_is_playing(lift_door_snd)) {
		audio_stop_sound(lift_door_snd);
	}

	if (audio_is_playing(elevator_bgm)) {
		audio_stop_sound(elevator_bgm);
	}

	if (audio_is_playing(elevator_ding)) {
		audio_stop_sound(elevator_ding);
	}

	room_goto(rm_floor2);
}