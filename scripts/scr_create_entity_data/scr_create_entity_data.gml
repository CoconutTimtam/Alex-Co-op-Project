function scr_create_entity_data(){
	
	entity_hp = []
	entity_move_speed = []
	
	var i = 0
	#region Player
		i = scr_add_entity_data(
		
		i,
		obj_player,
		100,
		5

		)
	#endregion
	#region Spider Bot
		i = scr_add_entity_data(
		
		i,
		obj_spider_bot,
		50,
		8

		)
	#endregion
	max_entity_data = i
	show_debug_message("MAX ENTITY DATA: "+string(max_entity_data))
	
}