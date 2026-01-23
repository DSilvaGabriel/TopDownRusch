image_blend = c_red;

// Caso seja criado manualmente sem parâmetros
if (!variable_instance_exists(id, "orbita_raio")) {
    orbita_raio = 50;            // distância padrão do centro
}
if (!variable_instance_exists(id, "orbita_angulo")) {
    orbita_angulo = 0;           // ângulo inicial
}
if (!variable_instance_exists(id, "orbita_velocidade")) {
    orbita_velocidade = 2;       // velocidade angular padrão
}
if (!variable_instance_exists(id, "orbita_centro")) {
    orbita_centro = noone;       // ainda sem centro definido
}
