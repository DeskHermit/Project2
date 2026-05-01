heading = "";
content = [];

video = video
vid = instance_find(obj_video,0)
if (!video)
	instance_destroy(vid)	

line_height = 30;
para_spacing = 40;
width_limit = 400;

audio_play_sound(snd_paper_rustling,40,true)