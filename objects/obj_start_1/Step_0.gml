var _mx = device_mouse_x_to_gui(0)
var _my = device_mouse_y_to_gui(0)

if (position_meeting(_mx, _my, id)) {
	if (mouse_check_button(mb_left)) {
        image_index = 2
    } else {
        image_index = 1
    }
	
	if (mouse_check_button_pressed(mb_left)) {
		audio_play_sound(b_click,10,false)
	}
    
    if (mouse_check_button_released(mb_left)) {
		if (!instance_exists(obj_transition)) {
			audio_play_sound(b_clicked,10,false)
			
			global.score_started = true;
			global.score_stopped = false;
			global.score = global.score_max;
			
	        room_goto(rm_tutorial)
		}
    }
} else {
    image_index = 0
}
if (b_key!=noone){
	if (keyboard_check_pressed(ord(b_key))){
		if (!instance_exists(obj_transition)) {
			audio_play_sound(b_clicked,10,false)
			
			global.score_started = true;
			global.score_stopped = false;
			global.score = global.score_max;
			
	        room_goto(rm_tutorial)
		}
	}
}