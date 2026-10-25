function scr_all_weapon_data(){
	
	weapon_object = []
	weapon_name = []
	weapon_dmg = []
	weapon_firerate = []
	weapon_proj = []
	
	var i = 0
	#region Scrap Gun
		i = scr_add_weapon_data(
		
		i,
		obj_scrap_gun,
		"Scrap Gun",
		10,
		20,
		obj_bullet

		)
	#endregion
	#region Energy Pistol
		i = scr_add_weapon_data(
		
		i,
		obj_energy_pistol,
		"Energy Pistol",
		10,
		5,
		obj_bullet

		)
	#endregion
	max_weapon_data = i
	show_debug_message("MAX WEAPON DATA: "+string(max_weapon_data))
	
}