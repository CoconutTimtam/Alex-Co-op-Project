function scr_camera_change_zoom(_camera = global.main_camera,_width,_height){
	with(_camera)
	{
		camera_set_view_size(camera,_width,_height)
		cam_w = _width
		cam_h = _height
		new_cam_w = _width
		new_cam_h = _height
	}
}