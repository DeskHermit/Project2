function scr_can_bat_audio() {
	if (!scr_is_gameplay_room()) {
		return false;
	}

	if (instance_exists(obj_pause_screen)) {
		if (obj_pause_screen.is_paused) {
			return false;
		}
	}

	var _perm = instance_find(obj_permanent, 0);

	if (instance_exists(_perm)) {
		if (_perm.silent) {
			return false;
		}
	}

	if (!instance_exists(obj_wizard)) {
		return false;
	}

	return true;
}