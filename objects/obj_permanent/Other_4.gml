switch (room) {
    case rm_title_screen:
        scr_textbox("Welocme player", c_orange, 300)
		if (global.first_time){
			scr_textbox("You can also press the First letter of buttons to press them", c_white,,,50,300)
		}
		break
	case rm_tutorial:
		if (global.first_time) {
			scr_textbox("You can also press the First letter of buttons to press them", c_white,,,50,300)
		}
		break
}