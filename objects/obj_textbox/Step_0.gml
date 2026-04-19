if (!setup_done && text != "") {
    char_progress = array_create(string_length(text), 0)
    setup_done = true
}

if (!setup_done) exit

switch (state) {
    case "opening":
        box_scale = lerp(box_scale, 1, anim_speed)
        if (box_scale > 0.99) {
            box_scale = 1
			state = "translating"
        }
    break

    case "translating":
        var _all_done = true
        var _len = string_length(text)
        
        for (var i = 0; i < _len; i++) {
            // A character starts translating only if the previous one is 40% done
            var _can_start = (i == 0) || (char_progress[i-1] > 0.4)
            
            if (_can_start) {
                if (char_progress[i] < 1) {
                    char_progress[i] += translation_speed
                    _all_done = false
                }
            } else {
                _all_done = false
            }
        }
    
        if (_all_done) {
            state = "waiting"
            vanish_timer = vanish_delay 
        }
    break

    case "waiting":
		if (!space){
	        if (vanish_timer > 0) {
	            vanish_timer -= 1
	        } else {
	            state = "closing"
	        }
		} else {
			if (keyboard_check_pressed(vk_space)){
				state = "closing"
			}
		}
			
    break

    case "closing":
        box_scale = lerp(box_scale, 0, anim_speed)
        if (box_scale < 0.01) {
            instance_destroy()
        }
    break
}
