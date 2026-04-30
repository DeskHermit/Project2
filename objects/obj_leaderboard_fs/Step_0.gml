// Close leaderboard
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_right)) {
    room_goto(rm_title_screen);
}

// Mouse wheel scrolling
if (mouse_wheel_up()) {
    scroll_y -= scroll_speed;
}

if (mouse_wheel_down()) {
    scroll_y += scroll_speed;
}

// Keyboard scrolling
if (keyboard_check(vk_up)) {
    scroll_y -= scroll_speed;
}

if (keyboard_check(vk_down)) {
    scroll_y += scroll_speed;
}

// Clamp scroll
var _count = array_length(global.leaderboard);
var _content_h = _count * row_h;
var _visible_h = visible_rows * row_h;
var _max_scroll = max(0, _content_h - _visible_h);

scroll_y = clamp(scroll_y, 0, _max_scroll);