var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (position_meeting(_mx, _my, id)) {
	if (mouse_check_button(mb_left)) {
        image_index = 2;
    } 
	else {
        image_index = 1;
    }
	
	if (mouse_check_button_pressed(mb_left)) {
		audio_play_sound(b_click, 10, false);
	}
    
    if (mouse_check_button_released(mb_left)) {
		if (!instance_exists(obj_transition)) {
			audio_play_sound(b_clicked, 10, false);

			global.heading = "Instructions";
			global.content = [
				"Move with WASD or the arrow keys.",
				"Click items to pick them up.",
				"Use the inventory to use or drop items.",
				"Press E near tables, doors, and other interactable objects.",
				"Press F to toggle the flashlight after finding it.",
				"Use batteries to refill the flashlight.",
				"Keys and keycards unlock doors.",
				"Chips and burgers restore health.",
				"Bats can fly through walls.",
				"Press Space to close textboxes.",
				"For the best experience, play with headphones."
			];

			// Clean up pause before leaving the room.
			instance_activate_all();

			with (obj_resume) {
				instance_destroy();
			}

			with (obj_quit_1) {
				instance_destroy();
			}

			with (obj_pause_panel) {
				instance_destroy();
			}

			with (obj_pause_instructions) {
				instance_destroy();
			}

			with (obj_pause_screen) {
				if (surface_exists(pause_surf)) {
					surface_free(pause_surf);
				}

				is_paused = false;
				instance_destroy();
			}

			room_goto(rm_notes_video);
		}
    }
} 
else {
    image_index = 0;
}