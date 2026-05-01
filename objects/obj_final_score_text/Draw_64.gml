display_set_gui_size(1920, 1080);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_text_transformed(960, 350, "You recovered the staff.", 1.5, 1.5, 0);
draw_text_transformed(960, 470, "Final Score: " + string(global.final_score), 2, 2, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);