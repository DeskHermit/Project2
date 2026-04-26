var _wiz = instance_nearest(x, y, obj_wizard);

// --- 1. MOVEMENT & CHASING LOGIC ---
if (_wiz != noone) {
    var _dist = point_distance(x, y, _wiz.x, _wiz.y);

    if (!is_chasing && _dist <= detect_range) {
        is_chasing = true;
        path_end();
        speed = 0;
    }

    if (is_chasing) {
        move_towards_point(_wiz.x, _wiz.y, chase_speed);
        image_angle = point_direction(x, y, _wiz.x, _wiz.y) - 90;
		audio_sound_gain(snd_high_chase_bg_music, .6, 1000)
		audio_sound_gain(snd_bg_music, 0, 1000)

        if (_dist >= lose_range) {
            is_chasing = false;
            path_start(patrol_path, patrol_speed, path_action_restart, false);
        }
    } else {
        image_angle = direction - 90;
		audio_sound_gain(snd_high_chase_bg_music, 0, 1000)
		audio_sound_gain(snd_bg_music, .6, 1000)
    }
}