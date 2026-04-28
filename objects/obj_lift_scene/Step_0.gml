f++

if (f == 20) {
	audio_play_sound(snd_elevator_bgm,20,false)
	audio_sound_gain(snd_elevator_bgm,.12,0)
}

if (f==600) {
	audio_play_sound(snd_elevator_ding,40,false)
	audio_sound_gain(snd_elevator_ding,.7,0)
}

if (f==620){
	audio_sound_gain(snd_elevator_bgm, .5, 1000)
	audio_play_sound(snd_liftdoor,20,false)
}
if (f==700) {
	room_goto(rm_floor2)
}