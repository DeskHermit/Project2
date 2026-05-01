function scr_bat_in_flashlight(_wiz, _bat_x, _bat_y) {
	if (_wiz == noone) {
		return false;
	}

	var _dist = point_distance(_wiz.x, _wiz.y, _bat_x, _bat_y);

	if (_dist <= 90) {
		return true;
	}

	if (!_wiz.flashlight_on) {
		return false;
	}

	var _dir_to_bat = point_direction(_wiz.x, _wiz.y, _bat_x, _bat_y);
	var _angle_diff = abs(angle_difference(_wiz.target_angle, _dir_to_bat));

	var _range = 1000;

	var _spread;

	if (_dist <= 180) {
		_spread = 110;
	}
	else if (_dist <= 320) {
		_spread = 75;
	}
	else {
		_spread = 45;
	}

	return (_angle_diff <= _spread && _dist <= _range);
}