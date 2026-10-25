function scr_create_camera(_x,_y,_enable_zoom,_enable_controls){
	
	var inst = instance_create_layer(_x,_y,"Instances",obj_camera)
	inst.enable_zoom = _enable_zoom
	inst.enable_controls = _enable_controls
	
}