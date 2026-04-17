my_speed = 4
target_angle = 0
_characters = [spr_wizard,spr_wizard_flashlight,spr_wizard_staff]
flashlight_on = false;
battery = 100;
maxInvSlots = 5;
_no_rooms = [rm_door_break]
_rooms = [rm_tutorial]
audio_falloff_set_model(audio_falloff_linear_distance_clamped);
audio_listener_orientation(0, 0, 1, 0, -1, 0);