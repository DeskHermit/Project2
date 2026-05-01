function scr_textbox(
    _text,
    _color = c_white,
    _width = 1000,
    _x = 1920 / 2,
    _y = 1080 - 100,
    _time = 120,
    _scramble = true,
    _space = false
) {
    var _tb = instance_create_depth(_x, _y, -9999, obj_textbox);
    _tb.max_w = _width;
    _tb.text = _text;
    _tb.color = _color;
    _tb.vanish_timer = _time;
    _tb.vanish_delay = _time;
    _tb.scramble = _scramble;
    _tb.space = _space;
}