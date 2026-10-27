//Initialise game data
scr_create_global_vars()
scr_create_entity_data()
scr_all_weapon_data()

//Create camera
scr_create_camera(x,y,false,false)

// TODO: fix clamps
scr_change_camera_target(obj_camera, obj_player)

scr_create_weapon(x+32,y+32,obj_scrap_gun,id)