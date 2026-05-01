if (is_paused) {
	// Draw the frozen game.
	if (surface_exists(pause_surf)) {
		draw_surface(pause_surf, 0, 0);
	}

	// Dim the background.
	draw_set_alpha(0.75);
	draw_set_color(c_black);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

	draw_set_alpha(1);
	draw_set_color(c_white);

	// Pause title.
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(display_get_gui_width() / 2, 150, "PAUSED", 2, 2, 0);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_alpha(1);
}