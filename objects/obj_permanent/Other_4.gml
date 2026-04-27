if (instance_exists(obj_pause_screen)) {
    with (obj_pause_screen) {
        instance_destroy();
    }
}

if (instance_exists(obj_pause_panel)) {
    with (obj_pause_panel) {
        instance_destroy();
    }
}

if (instance_exists(obj_resume)) {
    with (obj_resume) {
        instance_destroy();
    }
}

if (instance_exists(obj_quit_1)) {
    with (obj_quit_1) {
        instance_destroy();
    }
}

instance_activate_all();

if (room == rm_floor2 && global.from_lift_scene) {
	global.from_lift_scene = false;

	with (obj_lift_scene) {
		instance_destroy();
	}

	with (obj_transition) {
		instance_destroy();
	}

	if (instance_exists(obj_pause_screen)) {
		with (obj_pause_screen) instance_destroy();
	}

	if (instance_exists(obj_pause_panel)) {
		with (obj_pause_panel) instance_destroy();
	}

	if (instance_exists(obj_resume)) {
		with (obj_resume) instance_destroy();
	}

	if (instance_exists(obj_quit_1)) {
		with (obj_quit_1) instance_destroy();
	}

	instance_activate_all();
}

switch (room) {
    case rm_title_screen:
        scr_textbox("Welcome player", c_orange, 300,,50,300);

        if (global.first_time) {
            scr_textbox("You can also press the first letter of buttons to press them", c_lime,,,100,300);
        }
    break;

    case rm_tutorial:
        if (global.first_time && _tutorial) {	
            scr_textbox("It is dark! Find the table and acquire the torch!", c_lime,,,100,300,,true);
            scr_textbox("Use WASD to move around. Press space to close.", c_yellow,,,,300,,true);
            _tutorial = !_tutorial;
        }

        if (!audio_is_playing(snd_night)) {
            audio_play_sound(snd_night, 30, true);
        }
    break;

    case rm_first_playable_end:
        if (global.first_time) {
            scr_textbox("TO BE CONTINUED", c_white,,,300,300);
        }
    break;

    case rm_notes:
        scr_note(global.heading, global.content);
    break;

    case rm_floor1:
        if (!audio_is_playing(snd_airvents)) {
            audio_play_sound(snd_airvents, 30, true);
        }
    break;
}

if (!array_contains(no_rooms, room) && !array_contains(table_rooms, room) && c_room == room) {
    _wiz = instance_find(obj_wizard, 0);

    if (instance_exists(_wiz)) {
        _wiz.x = wiz_x;
        _wiz.y = wiz_y;
    }
}

if (room == rm_portal || room == rm_lift_scene || room == rm_steps || room == rm_door_break) {
    silent = true;
} else {
    silent = false;
}