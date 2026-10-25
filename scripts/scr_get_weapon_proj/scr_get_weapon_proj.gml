function scr_get_weapon_proj(_object){
	
	with(obj_game_master)
	{
		for (var i = 0; i < max_weapon_data; i ++)
		{
			if weapon_object[i] == _object
			{
				return(weapon_proj[i])
			}
		}
	}
	
}