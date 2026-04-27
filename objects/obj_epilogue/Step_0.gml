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
			global.heading="Epilogue"
			global.content=["The moment the wizard stepped into the portal, the staff burned bright in his hands, and the darkness of the Union finally began to loosen its grip. The chirping above the path faded into the night, the splashing in the lower halls went still, and the footsteps on the upper floor disappeared into silence. The Chancellor had believed the staff could force the building, its creatures, and everyone inside to obey him, but the power he stole had only fed the nightmare he was trying to control.","As the portal closed behind the wizard, the Union groaned like it was waking from a terrible dream. The halls stopped shifting, the shadows pulled back, and the creatures that once guarded the Chancellor’s prize vanished into the dark corners they came from. The wizard had recovered what was taken from him, but the memory of the Union remained: a warning that power taken through fear can never restore order. It can only make the nightmare worse.","For now, the staff was back in its rightful hand, and the Union was quiet again."];
			room_goto(rm_notes)
		}
    }
} else {
    image_index = 0
}

if (b_key!=noone){
	if (keyboard_check_pressed(ord(b_key))){
		if (!instance_exists(obj_transition)) {
			audio_play_sound(b_clicked,10,false)
	        scr_fade(b_room)
		}
	}
}