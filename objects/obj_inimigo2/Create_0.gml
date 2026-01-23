// Variaveis
	// Variaveis de movimentação
	movex	= noone;
	movey	= noone;
	vel		= 1.5;
	
	// Variaveis de vida
	vida = 2;
	
	// Variaveis de estado
	estados		= ["walk", "idle"];
	estado		= estados[0];
	
	// Variaveis de time
	timeShot	= 0;
	tempoShot	= game_get_speed(gamespeed_fps) * 0.35;
	
// Funções
fct_movimentacao		= function(){
	
	var _instancia_exixte = instance_exists(obj_player);
	if (_instancia_exixte == noone) exit;
	if (vida <= 0) instance_destroy();
	
	var _directioon = point_direction(x, y, obj_player.x, obj_player.y);	
	
	if (estado == estados[0]){
		movex = lengthdir_x(vel, _directioon);
		movey = lengthdir_y(vel, _directioon);
	}
	
	image_angle = lerp(image_angle, point_direction(x, y, obj_player.x, obj_player.y), 0.1);
	
	
	fct_estados();
	fct_dano();
	scr_colisao();
}

fct_dano				= function(){
	
	var _instancia_colidida = instance_place(x, y, obj_tiro0);
	
	if (_instancia_colidida){
		vida--;
		instance_destroy(_instancia_colidida);
	}
}

fct_estados				= function(){
	var _instancia_proxima = instance_nearest(x, y, obj_player);
	
	if (_instancia_proxima == noone) exit;
	
	var _instancia_distance = point_distance(x, y, _instancia_proxima.x, _instancia_proxima.y);
	
	if (_instancia_distance <= 100){
		movex = 0;
		movey = 0;
		estado = estados[1]; // Muda para o estado de parado
	}
	else{
		estado		= estados[0]; // Muda para o estado de andando
		timeShot	= 0;
	}
	
	if (estado == estados[1]){
		timeShot = scr_temporizador(timeShot, tempoShot, fct_tiro);
	}
}

fct_tiro				= function() { instance_create_layer(x, y, "tiro", obj_tiro1); }
