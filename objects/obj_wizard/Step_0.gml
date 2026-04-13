moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"))
moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A"))
moveUp = keyboard_check(vk_up) or keyboard_check(ord("W"))
moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"))

if (global.inventory.torch){
	sprite_index = _characters[1]
} else if (global.inventory.staff) {
	sprite_index = _characters[2]
} else {
	sprite_index = _characters[0]
}


xspd = (moveRight - moveLeft) * my_speed;
yspd = (moveDown - moveUp) * my_speed;

if (xspd != 0 or yspd != 0) {
    image_speed = 1
    target_angle = point_direction(0, 0, xspd, yspd)
} else {
    image_speed = 0
    image_index = 1
}

move_and_collide(xspd,yspd,[obj_collision]);

