function scr_add_entity_data(_index,_hp,_move_speed){
	
	with(obj_game_master)
	{
		entity_hp[_index] = _hp
		entity_move_speed[_index] = _move_speed
		_index += 1
		return(_index)
	}
	
}