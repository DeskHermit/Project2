var p = instance_find(obj_wizard, 0);

if (p != noone && global.inventory.torch) {
    var bx = 10; 
    var by = 40;
    var inv_scale = 0.5; 

    var battery_percent = p.battery / 100;
    
    var fill_x = bx + (22 * inv_scale); 
    var fill_y = by + (28 * inv_scale);
    
    var max_fill_w = 480 * inv_scale
    var fill_w = max_fill_w * battery_percent;
    var fill_h = 52 * inv_scale;

    if (p.battery > 0) {
        var col_top = c_aqua; 
        var col_bottom = make_color_rgb(0, 150, 255);
        
        draw_rectangle_colour(
            fill_x, fill_y, 
            fill_x + fill_w, fill_y + fill_h, 
            col_top, col_top, col_bottom, col_bottom, 
            false
        );
        
        draw_set_alpha(0.4);
        draw_line_width_color(fill_x, fill_y + 2, fill_x + fill_w, fill_y + 2, 2, c_white, c_white);
        draw_set_alpha(1.0);
    }
    draw_sprite_ext(spr_torchbar, 0, bx, by, inv_scale, inv_scale, 0, c_white, 1);
}