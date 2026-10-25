function scr_add_entity_data(_index,_object,_hp,_move_speed){
	
	with(obj_game_master)
	{
		entity_object[_index] = _object
		entity_hp[_index] = _hp
		entity_move_speed[_index] = _move_speed
		_index += 1
		return(_index)
	}
	
}