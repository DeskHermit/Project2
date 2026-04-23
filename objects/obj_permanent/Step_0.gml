if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M"))) {
	global.inventory.hp_cheat = !global.inventory.hp_cheat
	if (global.inventory.hp_cheat)
		scr_textbox("health cheat activated!",c_blue)
	else
		scr_textbox("health cheat disabled!",c_blue)
}


