if (h_time > 0 && (h_time div 4) % 2 == 0) {
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, target_angle - 90, c_white, 1)
}