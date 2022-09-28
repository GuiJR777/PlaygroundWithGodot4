extends State


func on_state_update():
	if parent.in_air:
		state_manager.change_state("falling")
	
	if Input.is_action_just_pressed("crouch"):
		state_manager.change_state("idle")
	
	if Input.is_action_just_pressed("jump"):
		state_manager.change_state("idle")
		
	if parent.is_moving:
		state_manager.change_state("crouch_walk")
	
	parent.apply_friction()
