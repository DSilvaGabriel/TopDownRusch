// Variaveis
	// Variaveis de movimentação
	movex	= noone;
	movey	= noone;
	vel		= 1.5;
	
	// Variaveis de vida
	vida = 1;
	
// Funções
fct_movimentacao		= function(){
	
	var _instancia_exixte = instance_exists(obj_player);
	if (_instancia_exixte == noone) exit;
	if (vida <= 0) instance_destroy();
	
	var _directioon = point_direction(x, y, obj_player.x, obj_player.y);	
	
	movex = lengthdir_x(vel, _directioon);
	movey = lengthdir_y(vel, _directioon);
	
	fct_dano();
	scr_colisao();
	scr_ambienteObjetoFora();
}


fct_dano				= function(){
	
	var _instancia_colidida = instance_place(x, y, obj_tiro0);
	
	if (_instancia_colidida){
		vida--;
		
		instance_destroy(_instancia_colidida);
	}
}