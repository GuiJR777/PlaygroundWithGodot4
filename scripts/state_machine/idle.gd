extends State


func on_state_update():
	if not parent.is_on_floor():
		state_manager.change_state("falling")
		
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("jump")
	
	if Input.is_action_just_pressed("crouch"):
		state_manager.change_state("crouch")
		
	if parent.is_moving:
		state_manager.change_state("walking")
		
	parent.apply_friction()
