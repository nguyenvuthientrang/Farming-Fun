rand = random(400)
if not cd_chicken{
	if (rand < 10 and obj_chicken.sleep = false){
		audio_play_sound(sound_chicken,1000, false)
		cd_chicken = 100
	} 
} else {
		cd_chicken -= 1
}

if not cd_cow{
	if (rand > 100 and rand < 102 and obj_cow.sleep = false){
		audio_play_sound(sound_cow,1000, false)
		cd_cow = 500
	} 
} else {
		cd_cow -= 1
}

if not cd_sheep{
	if (rand > 200 and rand < 202 and obj_sheep.sleep = false){
		audio_play_sound(sound_sheep,1000, false)
		cd_sheep = 300
	} 
} else {
		cd_sheep -= 1
}