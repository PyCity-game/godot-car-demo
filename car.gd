extends VehicleBody


var horse_power = 200
var accel_speed = 20
var steer_angle = deg2rad(30)
var steer_speed = 3
var brake_power = 40
var brake_speed = 40
func _physics_process(delta):
	var throt_input=-Input.get_action_strength("W")+Input.get_action_strength("S")
	engine_force=lerp(engine_force,throt_input*horse_power,accel_speed*delta)
		
	var steer_input=-Input.get_action_strength("D")+Input.get_action_strength("A")
	steering=lerp(steering,steer_input*steer_angle,steer_speed*delta)
		
	var brake_input=Input.get_action_strength("SPACE")
	brake=lerp(brake,brake_input*brake_power,brake_speed*delta)

func _input(event):
	if Input.is_action_just_released("cam") and get_viewport().get_camera().get_name()=="Camera1":
		$Camera1.current=false
		$Camera2.current=true
	elif Input.is_action_just_released("cam") and get_viewport().get_camera().get_name()=="Camera2":
		$Camera2.current=false
		$Camera1.current=true
		
