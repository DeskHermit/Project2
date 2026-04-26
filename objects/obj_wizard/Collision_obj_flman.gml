if (h_time<=0) {
	audio_play_sound(snd_wizard_death_temp, 10, false);
	if (!global.inventory.hp_cheat){
		global.inventory.hp -= 50
	}
	h_time = 360
	if (global.inventory.hp<=0){
		if (global.debug)
			show_debug_message("hp < 0")
		room_goto(rm_end_negative_screen);
	}
}