function scr_bat_in_flashlight(_wiz, _bat_x, _bat_y) {
	if (_wiz == noone) {
		return false;
	}

	if (!_wiz.flashlight_on) {
		return false;
	}

	var _dist = point_distance(_wiz.x, _wiz.y, _bat_x, _bat_y);
	var _range = 1000;

	if (_dist > _range) {
		return false;
	}

	var _dir_to_bat = point_direction(_wiz.x, _wiz.y, _bat_x, _bat_y);
	var _angle_diff = abs(angle_difference(_wiz.target_angle, _dir_to_bat));

	var _spread = 45;

	return (_angle_diff <= _spread);
}