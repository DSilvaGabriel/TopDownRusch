// Inherit the parent event
event_inherited();

vida = 3;

// Quantidade aleatória de orbitantes
var qtd = irandom_range(4,8);
var raio = sprite_width * 1.05; // distância do objeto central
var velocidade_angular = 2; // graus por step

for (var i = 0; i < qtd; i++) {
    var angle_inicial = (360 / qtd) * i; // distribui uniformemente
    var obj = instance_create_layer(x, y, "tiro", obj_tiro2);
    
    obj.orbita_raio = raio;
    obj.orbita_angulo = angle_inicial;
    obj.orbita_velocidade = velocidade_angular;
    obj.orbita_centro = id; // referência pro objeto central
}
