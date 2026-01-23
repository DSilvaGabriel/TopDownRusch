vida = 1;

var _instancia_existe		= instance_exists(obj_inimigoPai);

var _cor					= c_blue;
var _sped					= 7;
var _deadZone				= 0.01;
var _directioon_mouse		= point_direction(x, y, mouse_x, mouse_y);
var _gamePadlx				= gamepad_axis_value(0, gp_axisrh);
var _gamePadly				= gamepad_axis_value(0, gp_axisrv);
var _directioon_gamePad		= point_direction(x, y, x + _gamePadlx, y + _gamePadly);
var _directioon				= _directioon_mouse;
var _gamePadUser			= (abs(_gamePadlx) > _deadZone || abs(_gamePadly) > _deadZone);

if (_gamePadUser) { _directioon = _directioon_gamePad; }

if (_instancia_existe){
	var _instancia_proximo	= instance_nearest(x, y, obj_inimigoPai);
	_directioon				= point_direction(x, y, _instancia_proximo.x, _instancia_proximo.y);
}

speed		= _sped;
direction	= _directioon;
image_blend = _cor;