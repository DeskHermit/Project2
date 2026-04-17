var _wiz = instance_nearest(x, y, obj_wizard);

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

        if (_dist >= lose_range) {
            is_chasing = false;
            speed = 0;
            path_start(patrol_path, patrol_speed, path_action_restart, true);
        }
    } else {
        image_angle = direction - 90;
    }
} else {
    image_angle = direction - 90;
}

squeak_timer--;

if (squeak_timer <= 0) {
    audio_play_sound_at(
        bat_chirp,
        x, y, 0, 
        400,
        100,
        1,
        false,
        0,
        1.0
    );

    squeak_timer = irandom_range(squeak_min, squeak_max);
}

var p = instance_find(obj_wizard, 0);

visible_in_light = false;

if (p != noone) {
    var _dist = point_distance(x, y, p.x, p.y);

    if (_dist <= 60) {
        visible_in_light = true;
    }

    if (!visible_in_light && p.flashlight_on) {
        var _dir_to_bat = point_direction(p.x, p.y, x, y);
        var _angle_diff = angle_difference(p.target_angle, _dir_to_bat);

        var _spread = 45;
        var _range = 1000;

        if (abs(_angle_diff) <= _spread && _dist <= _range) {
            visible_in_light = true;
        }
    }
}

if (visible_in_light) {
    has_been_seen = true;
    seen_timer = seen_time_max;
} else if (seen_timer > 0) {
    seen_timer--;
}