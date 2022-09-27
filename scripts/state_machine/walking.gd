extends State



func on_state_update():
	if not parent.is_on_floor():
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("jump")
	
	if Input.is_action_just_pressed("run"):
		state_manager.change_state("running")
	
	if Input.is_action_just_pressed("crouch"):
		state_manager.change_state("crouch_walk")
		
	if not parent.is_moving:
		state_manager.change_state("idle")
	
	parent.apply_movement()
