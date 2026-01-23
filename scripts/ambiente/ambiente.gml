function scr_ambienteObjetoFora(){
	if (x < 0 - sprite_width) vida --;
	if (y < 0 - sprite_height) vida --;
	
	if (x > room_width + sprite_width) vida --;
	if (y > room_height + sprite_height) vida --;
}