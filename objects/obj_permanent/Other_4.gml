switch (room) {
    case rm_title_screen:
        scr_textbox("Welocme player", c_orange, 300,,50,300)
		if (global.first_time){
			scr_textbox("You can also press the First letter of buttons to press them", c_lime,,,100,300)
		}
		break
	case rm_tutorial:
		if (global.first_time && _tutorial) {
			scr_textbox("You can also press the First letter of buttons to press them", c_white,,,50,300)
			_tutorial = !_tutorial
		}
		break
	case rm_first_playable_end:
		if (global.first_time) {
			scr_textbox("TO BE CONTINUTED", c_white,,,300,300)
		}
		break
	case rm_outside_table:
		_store = instance_create_layer(0,0,layer,obj_storage_manager)
	case rm_notes:
		scr_note(global.heading, global.content)
}