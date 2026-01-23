if (!instance_exists(orbita_centro)){
	instance_destroy();
	exit;
}

if (orbita_centro != noone) {
    // gira
    orbita_angulo += orbita_velocidade;

    // calcula posição baseado no centro
    x = orbita_centro.x + lengthdir_x(orbita_raio, orbita_angulo);
    y = orbita_centro.y + lengthdir_y(orbita_raio, orbita_angulo);
}


scr_ambienteObjetoFora();