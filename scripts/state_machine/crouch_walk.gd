extends State


func on_state_update():
	if parent.in_air:
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("crouch"):
		state_manager.change_state("walking")
	
	if Input.is_action_pressed("run"):
		state_manager.change_state("running")
	
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("walking")

	if not parent.is_moving:
		state_manager.change_state("crouch")
	
	parent.apply_movement()
