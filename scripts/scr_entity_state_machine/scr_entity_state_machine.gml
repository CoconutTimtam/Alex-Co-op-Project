function scr_entity_state_machine(
	_hide_src = scr_generic_hiding, 
	_investigate_src = scr_generic_investigating,
	_running_src = scr_generic_running,
	_fighting_src = scr_generic_fighting
) {
	// switch between entity state
	switch (state) 
	{
	    case entity_state.Hiding:
	        // For now, do nothing, maybe hide animation?
			_hide_src()
	        break;
		
		case entity_state.Investigating:
	        // For now, move slowly towards target
			_investigate_src()
	        break;
		
		case entity_state.Running:
	        // For now, run away from target
			_running_src()
	        break;
		
		case entity_state.Fighting:
	        // For now, run to target and engage them
			_fighting_src()
	        break;
        
	    default:
	        // Do nothing
	        break;
	}
}