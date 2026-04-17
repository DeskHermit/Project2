if (is_paused) {
    // Draw the frozen game screen
    if (surface_exists(pause_surf)) {
        draw_surface(pause_surf, 0, 0);
    }
    
    // Draw a semi-transparent black overlay to dim the background
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // Draw your Pause Title
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, 100, "PAUSED");
}