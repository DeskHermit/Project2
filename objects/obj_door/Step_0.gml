var _contact = place_meeting(x, y, obj_wizard)

if (!is_unlocked && keyboard_check_pressed(ord("E"))) {
    _index = array_find_index(global.inventory.items,function(_val) {
		return _val == "key";
	});
	if (_index > 0){
		array_delete(global.inventory.items,_index,1)
		is_unlocked = True
		image_index = spr_door_animation
		image_speed = 1
	}
}
else {
	if (_contact) {
	    image_index = is_unlocked ? 3 : 1
	} else {
	    image_index = is_unlocked ? 2 : 0
	}
}