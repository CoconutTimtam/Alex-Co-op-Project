function scr_add_weapon_data(_index,_object,_name,_dmg,_firerate,_proj){
	
	with(obj_game_master)
	{
		weapon_object[_index] = _object
		weapon_name[_index]  = _name
		weapon_dmg[_index] = _dmg
		weapon_firerate[_index] = _firerate
		weapon_proj[_index] = _proj
		_index += 1
		return(_index)
	}
	
}