function scr_entity_vars (){

	generic_hiding = scr_generic_hiding
	generic_investigating = scr_generic_investigating
	generic_running = scr_generic_running
	generic_fighting = scr_generic_fighting
	
	// TODO: Refine how enum works here
	state = entity_state.Running
	// TODO: get this property from a data script on object init
	entity_move_speed = 5
	// TODO: get this property from a data script on object init
	entity_team = 2
}