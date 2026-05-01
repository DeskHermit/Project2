var _effect_amount = 0;
var _effect_col_r = 1;
var _effect_col_g = 1;
var _effect_col_b = 1;

if (h_time > 0) {
	_effect_amount = 0.45 + 0.35 * abs(sin(h_time * 0.25));
	_effect_col_r = 1;
	_effect_col_g = 0.1;
	_effect_col_b = 0.1;
}
else if (overheal_time > 0) {
	_effect_amount = 0.55 + 0.35 * abs(sin(overheal_time * 0.35));
	_effect_col_r = 1;
	_effect_col_g = 0.9;
	_effect_col_b = 0.15;
}
else if (food_time > 0) {
	_effect_amount = 0.35 + 0.25 * abs(sin(food_time * 0.25));
	_effect_col_r = 0.2;
	_effect_col_g = 1;
	_effect_col_b = 0.25;
}

if (_effect_amount > 0) {
	shader_set(shd_wizard_effect);

	var _u_amount = shader_get_uniform(shd_wizard_effect, "u_amount");
	var _u_effect_col = shader_get_uniform(shd_wizard_effect, "u_effect_col");

	shader_set_uniform_f(_u_amount, _effect_amount);
	shader_set_uniform_f(_u_effect_col, _effect_col_r, _effect_col_g, _effect_col_b);

	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		xscale,
		yscale,
		target_angle - 90,
		c_white,
		1
	);

	shader_reset();
}
else {
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		xscale,
		yscale,
		target_angle - 90,
		c_white,
		1
	);
}