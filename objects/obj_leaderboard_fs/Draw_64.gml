draw_set_alpha(1);
draw_set_color(c_white);

var _src_x = 185;
var _src_y = 69;
var _src_w = 769;
var _src_h = 942;

var _draw_x = (display_get_gui_width() - _src_w) / 2;
var _draw_y = (display_get_gui_height() - _src_h) / 2;

draw_sprite_part_ext(
    base_sprite,
    0,
    _src_x,
    _src_y,
    _src_w,
    _src_h,
    _draw_x,
    _draw_y,
    1,
    1,
    c_white,
    1
);

draw_set_font(fnt_body);
draw_set_color(c_white);
draw_set_valign(fa_top);

var _score_x = _draw_x + 190;
var _time_x = _draw_x + 575;
var _start_y = _draw_y + 300;

var _count = array_length(global.leaderboard);

if (_count <= 0) {
    draw_set_halign(fa_center);
    draw_text(540, _start_y, "No scores recorded yet.");
}
else {
    var _first = floor(scroll_y / row_h);
    var _offset = -(scroll_y mod row_h);

    for (var i = 0; i < visible_rows + 1; i++) {
        var _index = _first + i;

        if (_index >= 0 && _index < _count) {
            var _entry = global.leaderboard[_index];

            var _score;
            var _time_frames;

            if (is_struct(_entry)) {
                _score = _entry.score;
                _time_frames = _entry.time_frames;
            }
            else {
                _score = _entry;
                _time_frames = 0;
            }

            var _seconds_total = floor(_time_frames / room_speed);
            var _minutes = _seconds_total div 60;
            var _seconds = _seconds_total mod 60;

            var _time_text;

            if (_time_frames <= 0) {
                _time_text = "--:--";
            }
            else {
                _time_text = string(_minutes) + ":" + string_format(_seconds, 2, 0);
            }

            var _row_y = _start_y + _offset + (i * row_h);

            if (_row_y >= _start_y - row_h && _row_y <= 910) {
                draw_set_halign(fa_center);

                draw_text(_score_x, _row_y, string(_score));
                draw_text(_time_x, _row_y, _time_text);
            }
        }
    }
}

draw_set_font(fnt_body);
draw_set_color(c_ltgray);
draw_set_halign(fa_center);

var _hint_x = _draw_x + (_src_w / 2);
var _hint_y = _draw_y + _src_h + 10;

draw_text(_hint_x, _hint_y, "Scroll with mouse wheel or arrow keys. Press Space/Esc to return.");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);