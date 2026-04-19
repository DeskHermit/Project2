draw_set_alpha(1)
draw_set_color(c_white)
draw_set_font(fnt_heading)
draw_set_halign(fa_center)

var _gui_w = display_get_gui_width()
var _gui_h = display_get_gui_height()
var _center_x = _gui_w / 2
var _start_y = 170 

draw_text(_center_x, _start_y, heading)

draw_set_font(fnt_body)
draw_set_halign(fa_left)

var _left_margin = _center_x - (width_limit / 2)
var _current_y = _start_y + 80

for (var i = 0; i < array_length(content); i++) {
    draw_text_ext(_left_margin, _current_y, content[i], line_height, width_limit)
    var _p_height = string_height_ext(content[i], line_height, width_limit)
    _current_y += _p_height + para_spacing
}

draw_set_halign(fa_left)