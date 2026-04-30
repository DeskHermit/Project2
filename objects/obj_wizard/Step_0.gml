moveRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
moveLeft  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
moveUp    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
moveDown  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var _moving = moveRight || moveLeft || moveUp || moveDown;


// ----------------------------------------------------
// Walking sound
// ----------------------------------------------------
if (_moving) {
    if (!audio_is_playing(walk_snd)) {
        walk_snd = audio_play_sound(snd_walking, 30, true);

        if (audio_is_playing(walk_snd)) {
            audio_sound_gain(walk_snd, 0, 0);
        }
    }

    if (audio_is_playing(walk_snd)) {
        audio_sound_gain(walk_snd, 1, 150);
    }
}
else {
    if (audio_is_playing(walk_snd)) {
        audio_sound_gain(walk_snd, 0, 150);

        if (audio_sound_get_gain(walk_snd) <= 0.01) {
            audio_stop_sound(walk_snd);
        }
    }
}


// ----------------------------------------------------
// Spatial audio listener
// ----------------------------------------------------
// Top-down listener.
// This assumes the wizard is always "facing upward" for audio purposes.
// Do not use target_angle here.
audio_listener_position(x, y, 0);
audio_listener_orientation(0, 1, 0, 0, 0, 1);


// ----------------------------------------------------
// Sprite state
// Staff overrides flashlight.
// ----------------------------------------------------
if (global.inventory.staff) {
    sprite_index = _characters[2];
}
else if (global.inventory.torch) {
    sprite_index = _characters[1];
}
else {
    sprite_index = _characters[0];
}


// ----------------------------------------------------
// Effect timers
// ----------------------------------------------------
if (h_time > 0) {
    h_time -= 1;
}

if (food_time > 0) {
    food_time -= 1;
}

if (overheal_time > 0) {
    overheal_time -= 1;
}


// ----------------------------------------------------
// Movement
// ----------------------------------------------------
xspd = (moveRight - moveLeft) * my_speed;
yspd = (moveDown - moveUp) * my_speed;

if (xspd != 0 || yspd != 0) {
    image_speed = 1;
    target_angle = point_direction(0, 0, xspd, yspd);
}
else {
    image_speed = 0;
    image_index = 1;
}

move_and_collide(xspd, yspd, [obj_collision, obj_door]);


// ----------------------------------------------------
// Toggle flashlight
// ----------------------------------------------------
if (keyboard_check_pressed(ord("F")) && global.inventory.torch) {
    flashlight_on = !flashlight_on;
}

// Flashlight toggle cheat: Shift + F
if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_shift)) {
    flashlight_on = !flashlight_on;
}


// ----------------------------------------------------
// Battery drain
// ----------------------------------------------------
if (flashlight_on) {
    if (!global.inventory.battery_cheat) {
        battery -= 0.05;

        if (battery <= 10 && !battery_warning_given) {
            battery_warning_given = true;
            scr_textbox("Flashlight Battery Low !!", #FF1921, , , 50, 300, false);
        }
    }
    else {
        battery = 100;
        battery_warning_given = false;
    }

    if (battery <= 0) {
        battery = 0;
        flashlight_on = false;
    }
}

if (battery > 10) {
    battery_warning_given = false;
}