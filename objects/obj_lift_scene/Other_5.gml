if (audio_is_playing(lift_door_snd)) {
	audio_stop_sound(lift_door_snd);
}

if (audio_is_playing(elevator_bgm)) {
	audio_stop_sound(elevator_bgm);
}

if (audio_is_playing(elevator_ding)) {
	audio_stop_sound(elevator_ding);
}

instance_destroy();