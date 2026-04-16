if (!setup_done) exit

draw_set_font(font_readable)

// 1. Calculate Target Dimensions
// Use a slightly larger max_w for 1080p if needed (e.g., 600-800)
var _target_w = string_width_ext(text, line_sep, max_w) + (padding * 2) + width_buffer
var _target_h = string_height_ext(text, line_sep, max_w) + (padding * 2)

// 2. Apply Animation Scale
var _current_w = _target_w * box_scale
var _current_h = _target_h 
var _draw_x_origin = x - (_current_w / 2)

// 3. Draw Background
draw_sprite_stretched(spr_textbox, 0, _draw_x_origin, y, _current_w, _current_h)

// 4. Draw Text
if (state != "opening" && state != "closing" && box_scale > 0.8) {
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)

    var _text_x_start = x - (_target_w / 2) + padding + (width_buffer / 2)
    var _draw_y = y + padding
    
    // Track line wrapping exactly like the box does
    var _cursor_x = 0
    var _line_y_offset = 0

    for (var i = 1; i <= string_length(text); i++) {
        var _char = string_char_at(text, i)
        var _prog = char_progress[i-1]
        var _base_alpha = box_scale
        
        // --- Word Wrap Logic ---
        // Check if a SPACE or NEWLINE is coming to calculate wrapping properly
        if (_char == " ") {
            // Peek at the next word to see if it fits on the current line
            var _next_space = string_pos_ext(" ", text, i + 1)
            if (_next_space == 0) _next_space = string_length(text) + 1
            var _next_word = string_copy(text, i + 1, _next_space - (i + 1))
            
            if (_cursor_x + string_width(_char + _next_word) > max_w) {
                _cursor_x = 0
                _line_y_offset += line_sep
                continue // Skip drawing the space at the start of a new line
            }
        }

        // Ancient Rune
        if (_prog < 1.0) {
            draw_set_font(font_unreadable)
            draw_set_alpha((1.0 - _prog) * _base_alpha)
            draw_set_color(color)
            draw_text(_text_x_start + _cursor_x, _draw_y + _line_y_offset, _char)
        }
        
        // Readable Text
        if (_prog > 0.1) {
            draw_set_font(font_readable)
            draw_set_alpha(_prog * _base_alpha)
            draw_set_color(color)
            draw_text(_text_x_start + _cursor_x, _draw_y + _line_y_offset, _char)
        }
        
        // Increment cursor based on the font used for the readable text
        draw_set_font(font_readable)
        _cursor_x += string_width(_char)
        
        draw_set_alpha(1.0)
    }
}