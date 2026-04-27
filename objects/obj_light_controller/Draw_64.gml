var p = instance_find(obj_wizard, 0);
if (global.inventory.hp_cheat)
	hp = 100
else
	hp = global.inventory.hp

if (p != noone) {
    var inv_scale = 0.5; 
    
    var lx = 10;
    var ly = 20;
	var hp_percent;
	hp_percent = hp / 100;
    var l_fill_x = lx + (8 * inv_scale);
    var l_fill_y = ly + (6 * inv_scale);
    var l_max_w  = 580 * inv_scale;
    var l_fill_w = l_max_w * hp_percent;
    var l_fill_h = 52 * inv_scale;

    if (hp > 0) {
		if (global.inventory.hp_cheat) {
			shader_set(shd_cheat_bar);

			var _u_time = shader_get_uniform(shd_cheat_bar, "u_time");
			var _u_col1 = shader_get_uniform(shd_cheat_bar, "u_col1");
			var _u_col2 = shader_get_uniform(shd_cheat_bar, "u_col2");

			shader_set_uniform_f(_u_time, current_time / 200);
			shader_set_uniform_f(_u_col1, 0.0, 0.4, 1.0);
			shader_set_uniform_f(_u_col2, 0.0, 1.0, 0.35);

			draw_rectangle_colour(
				l_fill_x,
				l_fill_y,
				l_fill_x + l_fill_w,
				l_fill_y + l_fill_h,
				c_white,
				c_white,
				c_white,
				c_white,
				false
			);

			shader_reset();
		}
		else {
			var l_col_top = c_red;
			var l_col_bot = make_color_rgb(150, 0, 0);

			draw_rectangle_colour(
				l_fill_x,
				l_fill_y,
				l_fill_x + l_fill_w,
				l_fill_y + l_fill_h,
				l_col_top,
				l_col_top,
				l_col_bot,
				l_col_bot,
				false
			);
		}

		draw_set_alpha(0.3);
		draw_line_width_color(l_fill_x, l_fill_y + 2, l_fill_x + l_fill_w, l_fill_y + 2, 2, c_white, c_white);
		draw_set_alpha(1.0);
	}
    draw_sprite_ext(spr_healthbar, 0, lx, ly, inv_scale, inv_scale, 0, c_white, 1);

    if (global.inventory.torch) {
        var bx = 10; 
        var by = 80;
        var battery_percent = p.battery / 100;
        
        var b_fill_x = bx + (22 * inv_scale); 
        var b_fill_y = by + (32 * inv_scale);
        var b_max_w  = 460 * inv_scale;
        var b_fill_w = b_max_w * battery_percent;
        var b_fill_h = 38 * inv_scale;

        if (p.battery > 0) {
			if (global.inventory.battery_cheat) {
				shader_set(shd_cheat_bar);

				var _u_time = shader_get_uniform(shd_cheat_bar, "u_time");
				var _u_col1 = shader_get_uniform(shd_cheat_bar, "u_col1");
				var _u_col2 = shader_get_uniform(shd_cheat_bar, "u_col2");

				shader_set_uniform_f(_u_time, current_time / 180);
				shader_set_uniform_f(_u_col1, 1.0, 0.0, 1.0);
				shader_set_uniform_f(_u_col2, 0.35, 0.0, 1.0);

				draw_rectangle_colour(
					b_fill_x,
					b_fill_y,
					b_fill_x + b_fill_w,
					b_fill_y + b_fill_h,
					c_white,
					c_white,
					c_white,
					c_white,
					false
				);

				shader_reset();
			}
			else {
				var b_col_top = c_aqua; 
				var b_col_bot = make_color_rgb(0, 150, 255);

				draw_rectangle_colour(
					b_fill_x,
					b_fill_y,
					b_fill_x + b_fill_w,
					b_fill_y + b_fill_h,
					b_col_top,
					b_col_top,
					b_col_bot,
					b_col_bot,
					false
				);
			}

			draw_set_alpha(0.4);
			draw_line_width_color(b_fill_x, b_fill_y + 2, b_fill_x + b_fill_w, b_fill_y + 2, 2, c_white, c_white);
			draw_set_alpha(1.0);
		}
        draw_sprite_ext(spr_torchbar, 0, bx, by, inv_scale, inv_scale, 0, c_white, 1);
    }
}