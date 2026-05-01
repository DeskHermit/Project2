function scr_is_gameplay_room() {
	if (array_contains(global.no_rooms, room)) {
		return false;
	}

	if (array_contains(global.table_rooms, room)) {
		return false;
	}

	return true;
}