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
        if (visible_in_light) {
            move_towards_point(_wiz.x, _wiz.y, -chase_speed);
            image_angle = point_direction(x, y, _wiz.x, _wiz.y) + 90;
        } else {
            move_towards_point(_wiz.x, _wiz.y, chase_speed);
            image_angle = point_direction(x, y, _wiz.x, _wiz.y) - 90;
        }

        if (_dist >= lose_range) {
            is_chasing = false;
            path_start(patrol_path, patrol_speed, path_action_restart, false);
        }
    } else {
        image_angle = direction - 90;
    }
}

// --- 2. LIGHT DETECTION LOGIC (Moved up so it happens BEFORE the draw check) ---
var p = instance_find(obj_wizard, 0);
visible_in_light = false; // Reset every frame

if (p != noone) {
    var _dist_to_p = point_distance(x, y, p.x, p.y);

    // Always visible if very close
    if (_dist_to_p <= 60) {
        visible_in_light = true;
    }

    // Visible in flashlight cone
    if (!visible_in_light && p.flashlight_on) {
        var _dir_to_bat = point_direction(p.x, p.y, x, y);
        var _angle_diff = angle_difference(p.target_angle, _dir_to_bat);

        if (abs(_angle_diff) <= 45 && _dist_to_p <= 1000) {
            visible_in_light = true;
        }
    }
}

// Update the persistent "seen" timer
if (visible_in_light) {
    seen_timer = seen_time_max;
} else if (seen_timer > 0) {
    seen_timer--;
}

// --- 3. DYNAMIC SOUND LOGIC ---
squeak_timer--;

if (squeak_timer <= 0) {
    var _vol = 0.1;
    if (p != noone) {
        var _dist_snd = point_distance(x, y, p.x, p.y);
        // Sound is louder the closer you are
        _vol = clamp(1 - (_dist_snd / 800), 0.1, 1.0); 
        if (is_chasing) _vol = clamp(_vol + 0.3, 0.1, 1.0);
    }

    var _snd = audio_play_sound_at(snd_bat_chirp, x, y, 0, 100, 800, 1, false, 10);
    audio_sound_gain(_snd, _vol, 0);
    audio_sound_pitch(_snd, random_range(0.8, 1.2)); // Variety!

    squeak_timer = irandom_range(squeak_min, squeak_max);
}