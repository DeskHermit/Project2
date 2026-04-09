moveRight = keyboard_check(vk_right) or keyboard_check(ord("D"))
moveLeft = keyboard_check(vk_left) or keyboard_check(ord("A"))
moveUp = keyboard_check(vk_up) or keyboard_check(ord("W"))
moveDown = keyboard_check(vk_down) or keyboard_check(ord("S"))

xspd = (moveRight - moveLeft) * my_speed;
yspd = (moveDown - moveUp) * my_speed;

move_and_collide(xspd,yspd,obj_pillar);

