function scr_generic_running() {
	var target = obj_player;
	move_towards_point(target.x, target.y, move_speed);

	if (point_distance(x,y,target.x,target.y) < sight_range) {
		move_towards_point(x + 10, y - 10, move_speed);
	}
	
	if (point_distance(x,y,target.x,target.y) < (sight_range / 2)) {
		move_towards_point(x + 10, y - 10, 0);
		state = entity_state.Fighting;
	}
}