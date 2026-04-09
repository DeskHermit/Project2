if (moveRight){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 270, c_white, 1);
}
else if (moveLeft){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 90, c_white, 1);
}
else if (moveUp){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 0, c_white, 1);
}
else if (moveDown){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 180, c_white, 1);
}
else{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, 0, c_white, 1);
}
