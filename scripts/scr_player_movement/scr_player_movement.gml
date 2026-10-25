function scr_player_movement(_up_key, _down_key, _left_key, _right_key, _speed) {

	// TODO: Move into custom controls later
	var up_pressed = keyboard_check(_up_key) || keyboard_check(ord("W"));
	var down_pressed = keyboard_check(_down_key) || keyboard_check(ord("S"));
	var left_pressed = keyboard_check(_left_key) || keyboard_check(ord("A"));
	var right_pressed = keyboard_check(_right_key) || keyboard_check(ord("D"));
	
	var _x_input = right_pressed - left_pressed;
	var _y_input = down_pressed - up_pressed;
	
	var final_speed = _speed;
	
	if (abs(_x_input) + abs(_y_input) >= 2) {
		final_speed = final_speed / sqrt(2)
	}
	
	x += (_x_input * final_speed);
	y += (_y_input * final_speed);
}