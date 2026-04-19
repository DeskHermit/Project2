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
			scr_textbox("Use WASD to move around", c_yellow,,,,300,,true)
			_tutorial = !_tutorial
		}
		break
	case rm_first_playable_end:
		if (global.first_time) {
			scr_textbox("TO BE CONTINUTED", c_white,,,300,300)
		}
		break
	case rm_notes:
		scr_note(global.heading, global.content)
}

if (!array_contains(no_rooms,room) && !array_contains(table_rooms,room)) {
	_wiz = instance_find(obj_wizard,0)
	_wiz.x=wiz_x
	_wiz.y=wiz_y
}