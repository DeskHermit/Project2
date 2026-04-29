if (!array_contains(table_rooms, room)) {
	global.last_room = room;
}

if (!array_contains(no_rooms, room) && !array_contains(table_rooms, room)) {
	var _wiz = instance_find(obj_wizard, 0);

	if (instance_exists(_wiz)) {
		wiz_x = _wiz.x;
		wiz_y = _wiz.y;
		c_room = room;
	} else {
		wiz_x = noone;
		wiz_y = noone;
	}
}

if (audio_is_playing(snd_night)) {
    audio_stop_sound(snd_night);
}

if (audio_is_playing(snd_airvents)) {
    audio_stop_sound(snd_airvents);
}

global.chasing = false;