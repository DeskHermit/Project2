image_speed = 0

var _hover = position_meeting(mouse_x, mouse_y, id)
var _click = _hover && mouse_check_button(mb_left)

if (_hover){
	image_blend = c_white
} else {
	image_blend = c_ltgray
}

if (_hover && mouse_check_button_released(mb_left)) {
	array_push(global.inventory.items, name)
	show_debug_message("Inventory items: " + json_stringify(global.inventory.items))
	instance_destroy()
}