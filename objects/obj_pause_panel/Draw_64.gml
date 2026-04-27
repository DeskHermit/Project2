draw_self();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(-1);

draw_text_transformed(
	display_get_gui_width() / 2,
	display_get_gui_height() / 2 - 230,
	"Score: " + string(floor(global.score)),
	1.5,
	1.5,
	0
);

draw_set_halign(fa_left);
draw_set_valign(fa_top);