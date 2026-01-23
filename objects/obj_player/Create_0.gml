// Variaveis 
	// Variavies de movimentação
	movex	= noone;	// Movimentação no eixo X
	movey	= noone;	// Movimentação no eixo Y
	vel		= 5;		// Velocidade de movimentação
	
	// Variavel de vida
	vida	= 3;
	
	// Variaveis de gamePad
	gamePadDeadZone = 0.01;
	
	// Variaveis de time
	timeAtira	= 0;
	tempoAtira	= game_get_speed(gamespeed_fps) * 0.25;
	tempoDano	= game_get_speed(gamespeed_fps);
	timeDano	= 0;
	
// Funções
fct_movimentacao	= function(){
	
	show_debug_message(vida);
	
	
	if (vida < 0){
		
		global.dead = true;
		
		exit;	
	}
	
	var _keyx			= keyboard_check(vk_right) -keyboard_check(vk_left);
	var _keyy			= keyboard_check(vk_down) -keyboard_check(vk_up);
	
	var _gamePadx		= gamepad_axis_value(0, gp_axislh);
	var _gamePady		= gamepad_axis_value(0, gp_axislv);
	var _gamePadUser	= (abs(_gamePadx) > gamePadDeadZone || abs(_gamePady) > gamePadDeadZone);
	
	var _movex			= _keyx;
	var _movey			= _keyy;
	
	if (_gamePadUser){
		_movex = _gamePadx;
		_movey = _gamePady;
	}
	
	movex = _movex * vel;
	movey = _movey * vel;
	
	fct_atira();
	fct_dano();
	
	scr_ambienteObjetoFora();
	scr_colisao();
	
}

fct_atira			= function(){
	
	var _key		= keyboard_check(vk_space);
	var _gamePad	= gamepad_button_check(0, gp_shoulderrb);
	
	var _atirando   = _key + _gamePad;
	
	if (_atirando){
		timeAtira = scr_temporizador(timeAtira, tempoAtira, fct_cria_tiro);
	}
}

fct_cria_tiro		= function() { instance_create_layer(x, y, "tiro", obj_tiro0); }

fct_dano			= function(){
	var _instancia_existe = instance_exists(obj_inimigoPai);
	
	if (_instancia_existe == noone) exit;
	
	var _instancia_colidida1 = instance_place(x, y, obj_inimigoPai);
	var _instancia_colidida2 = instance_place(x, y, obj_tiro1);
	
	if (_instancia_colidida1){
		timeDano = scr_temporizador(timeDano, tempoDano, fct_perde_vida);
	}
	
	if (_instancia_colidida2){
		
		fct_perde_vida();
		
		instance_destroy(_instancia_colidida2);
	}
}

fct_perde_vida = function() { vida--; }