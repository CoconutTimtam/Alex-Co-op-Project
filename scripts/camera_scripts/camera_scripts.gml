function scr_camera_create_event(){
//Resolution
#macro RES_W 960
#macro RES_H 540
RES_SCALE = 2.667

//Variables
cam_speed = 10
resoul_w = floor(RES_W * RES_SCALE)
resoul_h = floor(RES_H * RES_SCALE)
enable_controls = true
enable_zoom = true

//Enable views
view_enabled = true;
view_visible[0] = true;

//Create camera
camera = camera_create_view(0,0,RES_W,RES_H);
view_set_camera(0,camera)
add_h = 0
add_w = 0

//Resize window and application surface
window_set_size(resoul_w, resoul_h);
surface_resize(application_surface, resoul_w, resoul_h);
display_set_gui_size(resoul_w, resoul_h)

//Center window
var display_width = display_get_width()
var display_height = display_get_height()

var window_width = resoul_w
var window_height = resoul_h

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);
//Camera Target
//Screen Shake
shake_power = 5
shake_value = 0
//Track object
track_object = noone
target_x = camera_get_view_x(camera)
target_y = camera_get_view_y(camera)
new_cam_w = camera_get_view_width(camera)
new_cam_h = camera_get_view_height(camera)
}

function scr_camera_end_step_event() {
//Get current camera position
cam_x = camera_get_view_x(camera);
cam_y = camera_get_view_y(camera);
cam_w = camera_get_view_width(camera);
cam_h = camera_get_view_height(camera);

//Move Camera
if enable_controls == true
{
	if keyboard_check(ord("W"))
	{
		target_y -= cam_speed
		track_object = noone
	}
	if keyboard_check(ord("S"))
	{
		target_y += cam_speed
		track_object = noone
	}
	if keyboard_check(ord("A"))
	{
		target_x -= cam_speed
		track_object = noone
	}
	if keyboard_check(ord("D"))
	{
		target_x += cam_speed
		track_object = noone
	}
}

//Track object instead
if track_object != noone
{
	if instance_exists(track_object)
	{
		target_x = track_object.x - new_cam_w/2
		target_y = track_object.y - new_cam_h/2
	}
}

//Clamp the target to room bounds

//Add shake
var shake = (power(shake_value,2) * shake_power)
cam_x += random_range(-shake,shake)
cam_y += random_range(-shake,shake)

//Lerp to new cam pos
if enable_controls == true && enable_zoom == true
{
	//Zooming
	var wheel = mouse_wheel_down() - mouse_wheel_up()
	if wheel != 0
	{
		wheel *= 0.1;
		//Add size
		var add_w = new_cam_w * wheel
		var add_h = new_cam_h * wheel
		new_cam_w += add_w
		new_cam_h += add_h
	
		//Position
		target_x -= add_w/2
		target_y -= add_h/2
		
	}
}
//Parallax Background
if layer_exists("Planet")
{
	layer_x("Planet",(cam_x*0.35)/0.8)
	layer_y("Planet",(cam_y*0.35)/0.8)
}
if layer_exists("Stars")
{
	layer_x("Stars",(cam_x*0.35)/0.5)
	layer_y("Stars",(cam_y*0.35)/0.5)
}
if layer_exists("Assets_3")
{
	layer_x("Assets_3",(cam_x*0.35)/1.2)
	layer_y("Assets_3",(cam_y*0.35)/1.2)
}
if layer_exists("Stars_1")
{
	layer_x("Stars_1",(cam_x*0.35)/0.8)
	layer_y("Stars_1",(cam_y*0.35)/0.8)
}
if layer_exists("Stars_2")
{
	layer_x("Stars_2",(cam_x*0.35)/0.6)
	layer_y("Stars_2",(cam_y*0.35)/0.6)
}
if layer_exists("ParallaxStars1")
{
	layer_x("ParallaxStars1",(cam_x*0.35)/1.2)
	layer_y("ParallaxStars1",(cam_y*0.35)/1.2)
}
if layer_exists("ParallaxStars2")
{
	layer_x("ParallaxStars2",(cam_x*0.35)/1.8)
	layer_y("ParallaxStars2",(cam_y*0.35)/1.8)
}
if layer_exists("ParallaxStars3")
{
	layer_x("ParallaxStars3",(cam_x*0.35)/2.2)
	layer_y("ParallaxStars3",(cam_y*0.35)/2.2)
}
//Apply camera position

	target_x = clamp(target_x, 0, room_width - new_cam_w)
	target_y = clamp(target_y, 0, room_height - new_cam_h)
	
	new_cam_w = clamp(new_cam_w, RES_W*0.5, RES_W*4)
	new_cam_h = clamp(new_cam_h, RES_H*0.5, RES_H*4)

	cam_w = lerp(cam_w,new_cam_w,0.2)
	cam_h = lerp(cam_h,new_cam_h,0.2)
	
	cam_x = lerp(cam_x, target_x, 0.2)
	cam_y = lerp(cam_y, target_y, 0.2)
	
	var new_speed = (new_cam_w/(RES_W*4)) * 100
	new_speed = new_speed * 0.25
	cam_speed = lerp(cam_speed,new_speed,0.1)
	cam_speed = clamp(cam_speed,1,15)
	
camera_set_view_pos(camera, cam_x, cam_y)
if cam_w >= 480 && cam_h <= (room_width - RES_W)
{
	camera_set_view_size(camera, cam_w, cam_h)
}
//Reduce Shake
if (shake_value > 0)
{
	shake_value -= 0.1
}

}