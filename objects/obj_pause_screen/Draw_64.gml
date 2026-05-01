if (is_paused) {
    // 1. Draw the frozen game
    if (surface_exists(pause_surf)) {
        draw_surface(pause_surf, 0, 0);
    }
    
    // 2. Dim the background (Increased to 0.75 for a DARKER look)
    draw_set_alpha(0.75); 
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // 3. RESET ALPHA IMMEDIATELY
    // This stops the panel and buttons from being transparent
    draw_set_alpha(1.0);
    draw_set_color(c_white);
    
    // 4. Draw Pause Text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_transformed(display_get_gui_width() / 2, 150, "PAUSED", 2, 2, 0);
	
	draw_text_transformed(display_get_gui_width() / 2,260,"Score: " + string(floor(global.score)),1.5,1.5,0);
}