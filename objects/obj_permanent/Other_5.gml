if (!array_contains(global.table_rooms, room)) {
	global.last_room = room;
}

if (room == rm_tutorial) {
	global.inventory.hp = 100
	global.inventory.battery = 100
}

if (!array_contains(global.no_rooms, room) && !array_contains(global.table_rooms, room)) {
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

if (!scr_is_gameplay_room()) {
	if (audio_is_playing(snd_bat_chirp)) {
		audio_stop_sound(snd_bat_chirp);
	}
}

global.chasing = false;