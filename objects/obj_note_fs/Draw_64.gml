draw_set_alpha(1);
draw_set_color(c_white);

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();
var _center_x = _gui_w / 2;

// Default note layout
var _start_y = 170;
var _draw_width = width_limit;
var _line_height = line_height;
var _spacing = para_spacing;

if (heading == "Epilogue") {
    _start_y = 110;
    _draw_width = 850;
    _line_height = 32;
    _spacing = 28;
}

if (heading == "Leaderboard") {
    _start_y = 130;
    _draw_width = 500;
    _line_height = 34;
    _spacing = 18;
}

draw_set_font(fnt_heading);
draw_set_halign(fa_center);
draw_text(_center_x, _start_y, heading);

draw_set_font(fnt_body);
draw_set_halign(fa_left);

var _left_margin = _center_x - (_draw_width / 2);
var _current_y = _start_y + 80;

for (var i = 0; i < array_length(content); i++) {
    draw_text_ext(_left_margin, _current_y, content[i], _line_height, _draw_width);

    var _p_height = string_height_ext(content[i], _line_height, _draw_width);
    _current_y += _p_height + _spacing;
}

draw_set_halign(fa_left);
draw_set_alpha(1);