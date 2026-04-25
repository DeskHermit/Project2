var _contact = place_meeting(x+1, y-1, obj_wizard)
var _contact1 = place_meeting(x-1, y+1, obj_wizard)

if (_contact || _contact1) {
	draw_sprite_ext(spr_E, 0, x, y-60, 0.1, 0.1, 0, c_white, 1)
}