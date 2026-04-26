if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M"))) {
	global.inventory.hp_cheat = !global.inventory.hp_cheat
	if (global.inventory.hp_cheat)
		scr_textbox("health cheat activated!",c_blue)
	else
		scr_textbox("health cheat disabled!",c_blue)
}

switch (music_state) {
    case "playing":
        music_timer--
        if (music_timer <= 0) {
            music_state = "fading_out"
            audio_sound_gain(current_music, 0, 3000) 
        }
    break

    case "fading_out":
        if (audio_sound_get_gain(current_music) <= 0) {
            music_state = "silent"
            music_timer = irandom_range(1200, 1800)
        }
    break

    case "silent":
        music_timer--
        if (music_timer <= 0) {
            music_state = "fading_in"
            audio_sound_gain(current_music, .6, 3000)
        }
    break

    case "fading_in":
        if (audio_sound_get_gain(current_music) >= 1) {
            music_state = "playing"
            music_timer = irandom_range(3000, 4800)
        }
    break
}