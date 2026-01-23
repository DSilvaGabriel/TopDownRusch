
vida = 1;

var _instance_exist = instance_exists(obj_player);
if (_instance_exist == noone) exit;

var _directioon = point_direction(x, y, obj_player.x, obj_player.y);
var _sped		= 1.7;

direction	= _directioon;
speed		= _sped;

image_blend = c_red;