extends State


func on_state_update():
	if not parent.is_on_floor():
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("crouch"):
		state_manager.change_state("walking")
	
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		state_manager.change_state("walking")

	if not parent.is_moving:
		state_manager.change_state("crouch")
	
	parent.apply_movement()
