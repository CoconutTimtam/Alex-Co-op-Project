function scr_create_weapon(_x,_y,_object,_creator){
	
	var _name = scr_get_weapon_name(_object)
	var _damage = scr_get_weapon_damage(_object)
	var _firerate = scr_get_weapon_firerate(_object)
	var _proj = scr_get_weapon_proj(_object)
	
	var inst = instance_create_layer(_x,_y,"Instances",_object,{
		
		creator : _creator,
		name : _name,
		damage : _damage,
		firerate : _firerate,
		proj : _proj
		
	})
	
}